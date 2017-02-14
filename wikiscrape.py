from bs4 import BeautifulSoup
import urllib
import time
import os
import mysql.connector

city_count = 0
limit = 1000
wait_time = 1

first_iter = True
skip_clim_row = 2
skip_clim_count = 0
city_col_count = 0
clim_col_count = 0
clim_row_count = 0

# City data
city = ""
state = ""
pop_est = 0
pop_off = 0
area = 0
pop_dens = 0
latitude = 0
longitude = 0

# City climate data
rec_hi = []
mean_max = []
avg_hi = []
avg_lo = []
mean_min = []
rec_lo = []
avg_precip = []
avg_snow = []
avg_precip_days = []
avg_snow_days = []
avg_humid = []
mean_sun = []
pct_sun = []

table_list = ["record_high", "mean_max", "average_high", "average_low", "mean_min",
			  "record_low", "average_rain", "average_snow", "average_rain_days", 
			  "average_snow_days", "average_humidity", "mean_sunshine_hours",
			  "percent_possible_sunshine"]

unknown_data = []

city_link = ""

# Initialize database then connect
os.system("mysql -u dylan --password=dylan123 < db_init.sql 2>&1")
cnx = mysql.connector.connect(user='dylan', password='dylan123',
                              host='127.0.0.1',
                              database='wikicity')
cursor = cnx.cursor()

# Get the top US cities wiki page
response = urllib.request.urlopen('https://en.wikipedia.org/wiki/List_of_United_States_cities_by_population')
time.sleep(wait_time)
top_cities = response.read()

# Open initialize beautiful soup
city_parse = BeautifulSoup(top_cities, 'lxml')

# Navigate to the table in the web page
city_parse = city_parse.find("table", class_="wikitable sortable")

# Loop through the cities in the table
for city_row in city_parse.find_all("tr", Recursive=False):
	if first_iter:
		first_iter = False
		continue

	if limit == city_count:
		break

# Loop through the columns, scraping data for each city
	city_col_count = 0
	for city_col in city_row.find_all("td", Recursive=False):
		if city_col_count == 1:
			city = city_col.a.get_text().strip()
			city_link = "https://en.wikipedia.org" + city_col.a["href"]
		elif city_col_count == 2:
			state = city_col.a.get_text().strip()
		elif city_col_count == 3:
			pop_est = int(city_col.string.replace(',',''))
		elif city_col_count == 4:
			pop_off = int(city_col.string.replace(',',''))
		elif city_col_count == 6:
			area = float(city_col.get_text().split("\u2660")[1].split()[0].replace(',',''))
		elif city_col_count == 7:
			pop_dens = float(city_col.get_text().split("\u2660")[1].split()[0].replace(',',''))
		elif city_col_count == 8:
			coords = city_col.get_text().split("/")[2].split(";")
			latitude = float(coords[0].strip())
			longitude = float(coords[1].split("\ufeff")[0].strip())

		city_col_count = city_col_count + 1

	city_count = city_count + 1

# Get the city's page using the link found while scraping
	response = urllib.request.urlopen(city_link)
	time.sleep(wait_time)
	city_climate = response.read()

# Collect climate data for the city
	rec_hi.clear()
	mean_max.clear()
	avg_hi.clear()
	avg_lo.clear()
	mean_min.clear()
	rec_lo.clear()
	avg_precip.clear()
	avg_snow.clear()
	avg_precip_days.clear()
	avg_snow_days.clear()
	avg_humid.clear()
	mean_sun.clear()
	pct_sun.clear()

	print("Processing " + city)

	climate_data = BeautifulSoup(city_climate, 'lxml')

	# TODO: check that the table header includes 'climate data'.
	#       otherwise keep looking for a table that does.
	#       handle the case where a city doesn't have climate data
	climate_parse = climate_data.find("table", class_="wikitable collapsible")
	if climate_parse == None:
		climate_parse = climate_data.find("table", class_="wikitable collapsible collapsed")

	if climate_parse != None:
		skip_clim_count = 0
		clim_row_count = 0
		for climate_row in climate_parse.find_all("tr", Recursive=False):
			if skip_clim_count < skip_clim_row:
				skip_clim_count = skip_clim_count + 1
				continue

			# Not all cities have the same rows. For example, Honolulu doesn't have
			# snow statistics. So we need to parse the header on each of the rows
			# to figure out what data we're looking at. If it comes back None, then 
			# we are out of rows to process.
			clim_header = climate_row.find("th")
			if clim_header == None:
				break
			else:
				header_text = clim_header.get_text().lower()

			clim_col_count = 0
			for climate_col in climate_row.find_all("td", Recursive=False):
				# No need to collect the sum column
				if clim_col_count == 12:
					break

				# Change how we get our value if the row is metric
				if ((header_text.find("c)") == -1
					and header_text.find("f)") != -1)
					or 
					(header_text.find("(mm)") == -1
					and (header_text.find("(inches)") != -1 
					or header_text.find("(in)") != -1))):
					num_value = climate_col.get_text().split("\n")[1].strip().replace(",", "").replace("−","-").replace("(","").replace(")","")
				else:
					num_value = climate_col.get_text().split("\n")[0].strip().replace(",", "").replace("−","-")

				if num_value.lower() == "trace":
					num_value = "0"

				if header_text.find("record high") != -1:
					rec_hi.append(float(num_value))
				elif ((header_text.find("mean maximum") != -1
					or header_text.find("daily mean") != -1)
					and len(mean_max) != 12):
					mean_max.append(float(num_value))
				elif header_text.find("average high") != -1:
					avg_hi.append(float(num_value))
				elif header_text.find("average low") != -1:
					avg_lo.append(float(num_value))
				elif ((header_text.find("mean minimum") != -1
					or header_text.find("daily mean") != -1)
					and len(mean_min) != 12):
					mean_min.append(float(num_value))
				elif header_text.find("record low") != -1:
					rec_lo.append(float(num_value))
				elif (header_text.find("average precipitation inches") != -1
					or header_text.find("average precipitation mm") != -1
					or header_text.find("average rainfall inches") != -1
					or header_text.find("average rainfall mm") != -1):
					avg_precip.append(float(num_value))
				elif header_text.find("average snowfall") != -1:
					avg_snow.append(float(num_value))
				elif (header_text.find("average precipitation days") != -1
					or header_text.find("average rainy days") != -1):
					avg_precip_days.append(float(num_value))
				elif header_text.find("average snowy days") != -1:
					avg_snow_days.append(float(num_value))
				elif header_text.find("relative humidity") != -1:
					avg_humid.append(float(num_value))
				elif header_text.find("sunshine hours") != -1:
					mean_sun.append(float(num_value))
				elif header_text.find("possible sunshine") != -1:
					pct_sun.append(float(num_value))
				else:
					unknown_data.append([num_value,city])

				clim_col_count = clim_col_count + 1
	else:
		unknown_data.append(["No climate data", city])
		clim_row_count = clim_row_count + 1


# Insert new row into the database
	insert_sql = ("insert into city "
				"(city, state, population_estimate, population_census, "
				" area_sq_mi, population_density_per_sq_mi, latitude, longitude) "
				"values (%s, %s, %s, %s, %s, %s, %s, %s)")
	insert_data = [city, state, pop_est, pop_off, area, pop_dens, latitude, longitude]
	cursor.execute(insert_sql, insert_data)
	cnx.commit()

	city_id = cursor.lastrowid

	# Let's make a list containing all the climate data so we can more easil
	# insert it into the database
	climate_data_list = [rec_hi, mean_max, avg_hi, avg_lo, mean_min, rec_lo,
						 avg_precip, avg_snow, avg_precip_days, avg_snow_days, 
						 avg_humid, mean_sun, pct_sun]

	for list_num in range(0, 13):
		if not climate_data_list[list_num]:
			continue
		insert_sql = ("insert into " + table_list[list_num] +
					  " (cityid, january, february, march, april, may, june, "
					  "  july, august, september, october, november, december)"
					  " values ('" + str(city_id) + "', %s, %s, %s, %s, %s, %s, %s, "
					  "%s, %s, %s, %s, %s)")
		print(table_list[list_num])
		print(climate_data_list[list_num])
		cursor.execute(insert_sql, climate_data_list[list_num])
		cnx.commit()

cnx.close()

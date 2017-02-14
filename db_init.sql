
-- Create database
DROP DATABASE IF EXISTS wikicity;

CREATE DATABASE IF NOT EXISTS `wikicity` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `wikicity`;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(10) UNSIGNED NOT NULL,
  `city` varchar(60) NOT NULL,
  `state` varchar(30) NOT NULL,
  `population_estimate` int(11) DEFAULT NULL,
  `population_census` int(11) DEFAULT NULL,
  `area_sq_mi` decimal(16,6) NOT NULL,
  `population_density_per_sq_mi` decimal(16,6) NOT NULL,
  `latitude` decimal(8,4) NOT NULL,
  `longitude` decimal(8,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `record_high`
--

CREATE TABLE `record_high` (
  `cityid` int(11) NOT NULL,
  `january` decimal(6,3) DEFAULT NULL,
  `february` decimal(6,3) DEFAULT NULL,
  `march` decimal(6,3) DEFAULT NULL,
  `april` decimal(6,3) DEFAULT NULL,
  `may` decimal(6,3) DEFAULT NULL,
  `june` decimal(6,3) DEFAULT NULL,
  `july` decimal(6,3) DEFAULT NULL,
  `august` decimal(6,3) DEFAULT NULL,
  `september` decimal(6,3) DEFAULT NULL,
  `october` decimal(6,3) DEFAULT NULL,
  `november` decimal(6,3) DEFAULT NULL,
  `december` decimal(6,3) DEFAULT NULL,
  `time_written` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `mean_max`
--

CREATE TABLE `mean_max` (
  `cityid` int(11) NOT NULL,
  `january` decimal(6,3) DEFAULT NULL,
  `february` decimal(6,3) DEFAULT NULL,
  `march` decimal(6,3) DEFAULT NULL,
  `april` decimal(6,3) DEFAULT NULL,
  `may` decimal(6,3) DEFAULT NULL,
  `june` decimal(6,3) DEFAULT NULL,
  `july` decimal(6,3) DEFAULT NULL,
  `august` decimal(6,3) DEFAULT NULL,
  `september` decimal(6,3) DEFAULT NULL,
  `october` decimal(6,3) DEFAULT NULL,
  `november` decimal(6,3) DEFAULT NULL,
  `december` decimal(6,3) DEFAULT NULL,
  `time_written` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `average_high`
--

CREATE TABLE `average_high` (
  `cityid` int(11) NOT NULL,
  `january` decimal(6,3) DEFAULT NULL,
  `february` decimal(6,3) DEFAULT NULL,
  `march` decimal(6,3) DEFAULT NULL,
  `april` decimal(6,3) DEFAULT NULL,
  `may` decimal(6,3) DEFAULT NULL,
  `june` decimal(6,3) DEFAULT NULL,
  `july` decimal(6,3) DEFAULT NULL,
  `august` decimal(6,3) DEFAULT NULL,
  `september` decimal(6,3) DEFAULT NULL,
  `october` decimal(6,3) DEFAULT NULL,
  `november` decimal(6,3) DEFAULT NULL,
  `december` decimal(6,3) DEFAULT NULL,
  `time_written` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `average_low`
--

CREATE TABLE `average_low` (
  `cityid` int(11) NOT NULL,
  `january` decimal(6,3) DEFAULT NULL,
  `february` decimal(6,3) DEFAULT NULL,
  `march` decimal(6,3) DEFAULT NULL,
  `april` decimal(6,3) DEFAULT NULL,
  `may` decimal(6,3) DEFAULT NULL,
  `june` decimal(6,3) DEFAULT NULL,
  `july` decimal(6,3) DEFAULT NULL,
  `august` decimal(6,3) DEFAULT NULL,
  `september` decimal(6,3) DEFAULT NULL,
  `october` decimal(6,3) DEFAULT NULL,
  `november` decimal(6,3) DEFAULT NULL,
  `december` decimal(6,3) DEFAULT NULL,
  `time_written` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `mean_min`
--

CREATE TABLE `mean_min` (
  `cityid` int(11) NOT NULL,
  `january` decimal(6,3) DEFAULT NULL,
  `february` decimal(6,3) DEFAULT NULL,
  `march` decimal(6,3) DEFAULT NULL,
  `april` decimal(6,3) DEFAULT NULL,
  `may` decimal(6,3) DEFAULT NULL,
  `june` decimal(6,3) DEFAULT NULL,
  `july` decimal(6,3) DEFAULT NULL,
  `august` decimal(6,3) DEFAULT NULL,
  `september` decimal(6,3) DEFAULT NULL,
  `october` decimal(6,3) DEFAULT NULL,
  `november` decimal(6,3) DEFAULT NULL,
  `december` decimal(6,3) DEFAULT NULL,
  `time_written` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `record_low`
--

CREATE TABLE `record_low` (
  `cityid` int(11) NOT NULL,
  `january` decimal(6,3) DEFAULT NULL,
  `february` decimal(6,3) DEFAULT NULL,
  `march` decimal(6,3) DEFAULT NULL,
  `april` decimal(6,3) DEFAULT NULL,
  `may` decimal(6,3) DEFAULT NULL,
  `june` decimal(6,3) DEFAULT NULL,
  `july` decimal(6,3) DEFAULT NULL,
  `august` decimal(6,3) DEFAULT NULL,
  `september` decimal(6,3) DEFAULT NULL,
  `october` decimal(6,3) DEFAULT NULL,
  `november` decimal(6,3) DEFAULT NULL,
  `december` decimal(6,3) DEFAULT NULL,
  `time_written` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `average_rain`
--

CREATE TABLE `average_rain` (
  `cityid` int(11) NOT NULL,
  `january` decimal(6,3) DEFAULT NULL,
  `february` decimal(6,3) DEFAULT NULL,
  `march` decimal(6,3) DEFAULT NULL,
  `april` decimal(6,3) DEFAULT NULL,
  `may` decimal(6,3) DEFAULT NULL,
  `june` decimal(6,3) DEFAULT NULL,
  `july` decimal(6,3) DEFAULT NULL,
  `august` decimal(6,3) DEFAULT NULL,
  `september` decimal(6,3) DEFAULT NULL,
  `october` decimal(6,3) DEFAULT NULL,
  `november` decimal(6,3) DEFAULT NULL,
  `december` decimal(6,3) DEFAULT NULL,
  `time_written` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `average_snow`
--

CREATE TABLE `average_snow` (
  `cityid` int(11) NOT NULL,
  `january` decimal(6,3) DEFAULT NULL,
  `february` decimal(6,3) DEFAULT NULL,
  `march` decimal(6,3) DEFAULT NULL,
  `april` decimal(6,3) DEFAULT NULL,
  `may` decimal(6,3) DEFAULT NULL,
  `june` decimal(6,3) DEFAULT NULL,
  `july` decimal(6,3) DEFAULT NULL,
  `august` decimal(6,3) DEFAULT NULL,
  `september` decimal(6,3) DEFAULT NULL,
  `october` decimal(6,3) DEFAULT NULL,
  `november` decimal(6,3) DEFAULT NULL,
  `december` decimal(6,3) DEFAULT NULL,
  `time_written` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `average_rain_days`
--

CREATE TABLE `average_rain_days` (
  `cityid` int(11) NOT NULL,
  `january` decimal(6,3) DEFAULT NULL,
  `february` decimal(6,3) DEFAULT NULL,
  `march` decimal(6,3) DEFAULT NULL,
  `april` decimal(6,3) DEFAULT NULL,
  `may` decimal(6,3) DEFAULT NULL,
  `june` decimal(6,3) DEFAULT NULL,
  `july` decimal(6,3) DEFAULT NULL,
  `august` decimal(6,3) DEFAULT NULL,
  `september` decimal(6,3) DEFAULT NULL,
  `october` decimal(6,3) DEFAULT NULL,
  `november` decimal(6,3) DEFAULT NULL,
  `december` decimal(6,3) DEFAULT NULL,
  `time_written` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `average_snow_days`
--

CREATE TABLE `average_snow_days` (
  `cityid` int(11) NOT NULL,
  `january` decimal(6,3) DEFAULT NULL,
  `february` decimal(6,3) DEFAULT NULL,
  `march` decimal(6,3) DEFAULT NULL,
  `april` decimal(6,3) DEFAULT NULL,
  `may` decimal(6,3) DEFAULT NULL,
  `june` decimal(6,3) DEFAULT NULL,
  `july` decimal(6,3) DEFAULT NULL,
  `august` decimal(6,3) DEFAULT NULL,
  `september` decimal(6,3) DEFAULT NULL,
  `october` decimal(6,3) DEFAULT NULL,
  `november` decimal(6,3) DEFAULT NULL,
  `december` decimal(6,3) DEFAULT NULL,
  `time_written` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `average_humidity`
--

CREATE TABLE `average_humidity` (
  `cityid` int(11) NOT NULL,
  `january` decimal(4,2) DEFAULT NULL,
  `february` decimal(4,2) DEFAULT NULL,
  `march` decimal(4,2) DEFAULT NULL,
  `april` decimal(4,2) DEFAULT NULL,
  `may` decimal(4,2) DEFAULT NULL,
  `june` decimal(4,2) DEFAULT NULL,
  `july` decimal(4,2) DEFAULT NULL,
  `august` decimal(4,2) DEFAULT NULL,
  `september` decimal(4,2) DEFAULT NULL,
  `october` decimal(4,2) DEFAULT NULL,
  `november` decimal(4,2) DEFAULT NULL,
  `december` decimal(4,2) DEFAULT NULL,
  `time_written` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `mean_sunshine_hours`
--

CREATE TABLE `mean_sunshine_hours` (
  `cityid` int(11) NOT NULL,
  `january` decimal(6,3) DEFAULT NULL,
  `february` decimal(6,3) DEFAULT NULL,
  `march` decimal(6,3) DEFAULT NULL,
  `april` decimal(6,3) DEFAULT NULL,
  `may` decimal(6,3) DEFAULT NULL,
  `june` decimal(6,3) DEFAULT NULL,
  `july` decimal(6,3) DEFAULT NULL,
  `august` decimal(6,3) DEFAULT NULL,
  `september` decimal(6,3) DEFAULT NULL,
  `october` decimal(6,3) DEFAULT NULL,
  `november` decimal(6,3) DEFAULT NULL,
  `december` decimal(6,3) DEFAULT NULL,
  `time_written` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `percent_possible_sunshine`
--

CREATE TABLE `percent_possible_sunshine` (
  `cityid` int(11) NOT NULL,
  `january` decimal(4,2) DEFAULT NULL,
  `february` decimal(4,2) DEFAULT NULL,
  `march` decimal(4,2) DEFAULT NULL,
  `april` decimal(4,2) DEFAULT NULL,
  `may` decimal(4,2) DEFAULT NULL,
  `june` decimal(4,2) DEFAULT NULL,
  `july` decimal(4,2) DEFAULT NULL,
  `august` decimal(4,2) DEFAULT NULL,
  `september` decimal(4,2) DEFAULT NULL,
  `october` decimal(4,2) DEFAULT NULL,
  `november` decimal(4,2) DEFAULT NULL,
  `december` decimal(4,2) DEFAULT NULL,
  `time_written` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_idx` (`city`),
  ADD KEY `state_idx` (`state`);

--
-- Indexes for table `record_high`
--
ALTER TABLE `record_high`
  ADD PRIMARY KEY (`cityid`);

--
-- Indexes for table `mean_max`
--
ALTER TABLE `mean_max`
  ADD PRIMARY KEY (`cityid`);

--
-- Indexes for table `average_high`
--
ALTER TABLE `average_high`
  ADD PRIMARY KEY (`cityid`);

--
-- Indexes for table `average_low`
--
ALTER TABLE `average_low`
  ADD PRIMARY KEY (`cityid`);

--
-- Indexes for table `mean_min`
--
ALTER TABLE `mean_min`
  ADD PRIMARY KEY (`cityid`);

--
-- Indexes for table `record_low`
--
ALTER TABLE `record_low`
  ADD PRIMARY KEY (`cityid`);

--
-- Indexes for table `average_rain`
--
ALTER TABLE `average_rain`
  ADD PRIMARY KEY (`cityid`);

--
-- Indexes for table `average_snow`
--
ALTER TABLE `average_snow`
  ADD PRIMARY KEY (`cityid`);

--
-- Indexes for table `average_rain_days`
--
ALTER TABLE `average_rain_days`
  ADD PRIMARY KEY (`cityid`);

--
-- Indexes for table `average_snow_days`
--
ALTER TABLE `average_snow_days`
  ADD PRIMARY KEY (`cityid`);

--
-- Indexes for table `average_humidity`
--
ALTER TABLE `average_humidity`
  ADD PRIMARY KEY (`cityid`);

--
-- Indexes for table `mean_sunshine_hours`
--
ALTER TABLE `mean_sunshine_hours`
  ADD PRIMARY KEY (`cityid`);

--
-- Indexes for table `percent_possible_sunshine`
--
ALTER TABLE `percent_possible_sunshine`
  ADD PRIMARY KEY (`cityid`);

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;


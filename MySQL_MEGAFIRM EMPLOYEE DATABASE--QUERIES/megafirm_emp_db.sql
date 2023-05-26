-- Drop the tables in case they already exist
DROP DATABASE IF EXISTS `megafirm_emo_db`;
CREATE DATABASE `megafirm_emo_db`;
USE `megafirm_emo_db`;

SET NAMES utf8;
SET character_set_client = utf8mb4;

-- Create the locations table
CREATE TABLE `locations` (
    `location_id` INT(3),
    `street_address` VARCHAR(50) NOT NULL,
    `postal_code` VARCHAR(10) NOT NULL,
    `city` VARCHAR(50) NOT NULL,
    `state_province` VARCHAR(50) NOT NULL,
    `country` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`location_id`)
);

-- Create the jobs table
CREATE TABLE `jobs` (
    `job_id` INT(3),
    `job_title` VARCHAR(50) NOT NULL,
    `min_salary` DECIMAL(8, 2) NOT NULL,
    `max_salary` DECIMAL(8, 2) NOT NULL,
    PRIMARY KEY (`job_id`)
);

-- Create the departments table
CREATE TABLE `departments` (
    `department_id` INT(4),
    `department_name` VARCHAR(20) NOT NULL,
    `location_id` INT(3) NOT NULL,
    PRIMARY KEY (`department_id`),
    FOREIGN KEY (`location_id`) REFERENCES `locations`(`location_id`)
);

-- Create the employees table
CREATE TABLE `employees` (
    `employee_id` INT(4),
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `email` VARCHAR(50) NOT NULL UNIQUE,
    `phone_number` VARCHAR(15) NOT NULL,
    `hire_date` DATE NOT NULL,
    `salary` DECIMAL(8, 2),
    `commission_pct` DECIMAL(4, 2),
    `manager_id` INT(4),
    `department_id` INT(4),
    `job_id` INT(3),
    PRIMARY KEY (`employee_id`),
    FOREIGN KEY (`manager_id`) REFERENCES `employees`(`employee_id`),
    FOREIGN KEY (`department_id`) REFERENCES `departments`(`department_id`),
    FOREIGN KEY (`job_id`) REFERENCES `jobs`(`job_id`)
);

-- Populate the locations table
INSERT INTO `locations` VALUES (100, '2 Nice Road', 'N2 7TH', 'London', 'Greater London', 'UK');
INSERT INTO `locations` VALUES (200, '23 Pretty Road', 'BS1 8FD', 'Bristol', 'Bristol County', 'UK');
INSERT INTO `locations` VALUES (300, '26 Great Street', 'BN1 4BF', 'Brighton', 'Sussex', 'UK');
INSERT INTO `locations` VALUES (400, '143 Lovely Road', 'CB1 2NV', 'Cambridge', 'Cambridgeshire', 'UK');

-- Populate the jobs table
INSERT INTO `jobs` VALUES (901, 'Managing Director', 75000, 125000);
INSERT INTO `jobs` VALUES (902, 'Programmer', 35000, 80000);
INSERT INTO `jobs` VALUES (903, 'Sales Rep', 25000, 45000);
INSERT INTO `jobs` VALUES (904, 'Project Manager', 45000, 95000);
INSERT INTO `jobs` VALUES (905, 'Marketing Manager', 37000, 68000);
INSERT INTO `jobs` VALUES (906, 'Marketing Producer', 34000, 70000);
INSERT INTO `jobs` VALUES (907, 'Operations Manager', 28000, 41000);
INSERT INTO `jobs` VALUES (908, 'Sales Administrator', 38000, 65000);
INSERT INTO `jobs` VALUES (909, 'Database Architect', 44000, 73000);
INSERT INTO `jobs` VALUES (910, 'Operations Officer', 32000, 61000);
INSERT INTO `jobs` VALUES (911, 'IT Tester', 38000, 55000);
INSERT INTO `jobs` VALUES (912, 'Finance Director', 72000, 115000);

-- Populate the departments table
INSERT INTO `departments` VALUES (10, 'IT', 100);
INSERT INTO `departments` VALUES (20, 'Operations', 200);
INSERT INTO `departments` VALUES (30, 'Sales', 300);
INSERT INTO `departments` VALUES (40, 'Marketing', 400);
INSERT INTO `departments` VALUES (50, 'Management', 100);
INSERT INTO `departments` VALUES (60, 'Security', 200);

-- Populate the employees table
INSERT INTO `employees` VALUES (1001, 'Jim', 'King', 'jk@firm.com', '02079111001', STR_TO_DATE('21-01-2011', '%d-%m-%Y'), 98000, NULL, NULL, 50, 901);
INSERT INTO `employees` VALUES (1002, 'Jane', 'Queen', 'jq@firm.com', '02079111002', STR_TO_DATE('05-02-2012', '%d-%m-%Y'), 99000, NULL, NULL, 50, 901);
INSERT INTO `employees` VALUES (1003, 'Jen', 'Probert', 'jp@firm.com', '02079111003', STR_TO_DATE('23-11-2014', '%d-%m-%Y'), 79000, NULL, 1001, 10, 904);
INSERT INTO `employees` VALUES (1004, 'Mike', 'Brent', 'mb@firm.com', '02079111004', STR_TO_DATE('06-10-2013', '%d-%m-%Y'), 51000, NULL, 1003, 10, 902);
INSERT INTO `employees` VALUES (1005, 'Nadia', 'Tamsa', 'nt@firm.com', '02079111005', STR_TO_DATE('08-10-2013', '%d-%m-%Y'), 62000, NULL, 1003, 10, 902);
INSERT INTO `employees` VALUES (1006, 'Mo', 'Ali', 'ma@firm.com', '02079111006', STR_TO_DATE('24-11-2015', '%d-%m-%Y'), 41000, 0.15, 1002, 30, 903);
INSERT INTO `employees` VALUES (1007, 'Dania', 'Kolova', 'dk@firm.com', '02079111007', STR_TO_DATE('15-05-2016', '%d-%m-%Y'), 38000, 0.25, 1006, 30, 903);
INSERT INTO `employees` VALUES (1008, 'Manu', 'Ogoda', 'mo@firm.com', '02079111008', STR_TO_DATE('12-08-2017', '%d-%m-%Y'), 33000, 0.35, 1007, 30, 903);
INSERT INTO `employees` VALUES (1009, 'Marc', 'Daniel', 'md@firm.com', '02079111009', STR_TO_DATE('02-01-2014', '%d-%m-%Y'), 35000, 0.35, 1007, 30, NULL);
INSERT INTO `employees` VALUES (1010, 'Louise', 'Matos', 'lm@firm.com', '0207911110', STR_TO_DATE('05-11-2017', '%d-%m-%Y'), 53000, NULL, 1002, 40, 905);
INSERT INTO `employees` VALUES (1011, 'Ram', 'Binghi', 'rb@firm.com', '0207911111', STR_TO_DATE('30-03-2012', '%d-%m-%Y'), 35000, NULL, 1010, 40, 906);
INSERT INTO `employees` VALUES (1012, 'Tim', 'Norm', 'tn@firm.com', '0207911112', STR_TO_DATE('31-03-2018', '%d-%m-%Y'), 48000, NULL, 1010, 40, 906);
INSERT INTO `employees` VALUES (1013, 'Alex', 'Smart', 'as@firm.com', '0207911113', STR_TO_DATE('30-03-2012', '%d-%m-%Y'), 39000, NULL, 1001, NULL, 907);
INSERT INTO `employees` VALUES (1014, 'Bruno', 'Silba', 'bs@firm.com', '0207911114', STR_TO_DATE('08-05-2014', '%d-%m-%Y'), 37000, NULL, 1013, 20, 910);
INSERT INTO `employees` VALUES (1015, 'Laurie', 'Kaldav', 'lk@firm.com', '0207911115', STR_TO_DATE('11-08-2017', '%d-%m-%Y'), 34000, NULL, 1013, 20, 910);
INSERT INTO `employees` VALUES (1016, 'Sophie', 'Lanou', 'sl@firm.com', '0207911116', STR_TO_DATE('19-08-2017', '%d-%m-%Y'), 34000, 0.10, 1007, 30, 908);
INSERT INTO `employees` VALUES (1017, 'Yann', 'Taylor', 'yt@firm.com', '0207911117', STR_TO_DATE('03-09-2018', '%d-%m-%Y'), 44000, NULL, 1002, 10, 909);
INSERT INTO `employees` VALUES (1018, 'Sam', 'Tring', 'st@firm.com', '0207911118', STR_TO_DATE('05-09-2018', '%d-%m-%Y'), 47000, NULL, 1003, 10, 909);
INSERT INTO `employees` VALUES (1019, 'Don', 'Matos', 'dm@firm.com', '0207911119', STR_TO_DATE('04-10-2017', '%d-%m-%Y'), 49000, NULL, 1003, NULL, 909);
INSERT INTO `employees` VALUES (1020, 'Dan', 'Ritch', 'dr@firm.com', '0207911120', STR_TO_DATE('14-01-2019', '%d-%m-%Y'), 35000, NULL, 1013, 20, 910);
INSERT INTO `employees` VALUES (1021, 'Jenna', 'Novski', 'jn@firm.com', '0207911121', STR_TO_DATE('13-02-2019', '%d-%m-%Y'), 39000, NULL, 1014, 40, 905);
INSERT INTO `employees` VALUES (1022, 'Elaine', 'Rainer', 'er@firm.com', '0207911122', STR_TO_DATE('11-04-2019', '%d-%m-%Y'), 39000, NULL, 1014, 40, 905);
INSERT INTO `employees` VALUES (1023, 'Raul', 'Desma', 'rd@firm.com', '0207911123', STR_TO_DATE('03-07-2019', '%d-%m-%Y'), 34000, NULL, 1017, 40, 907);
INSERT INTO `employees` VALUES (1024, 'Oliver', 'Lopez', 'ol@firm.com', '0207911124', STR_TO_DATE('22-09-2019', '%d-%m-%Y'), 33000, NULL, 1017, 40, 907);
INSERT INTO `employees` VALUES (1025, 'Emily', 'Woods', 'ew@firm.com', '0207911125', STR_TO_DATE('19-01-2020', '%d-%m-%Y'), 42000, NULL, 1017, 40, 907);

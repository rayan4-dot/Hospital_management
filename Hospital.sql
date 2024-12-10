-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 10, 2024 at 10:40 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `HospitalManagements`
--

-- --------------------------------------------------------

--
-- Table structure for table `admissions`
--

CREATE TABLE `admissions` (
  `admission_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `discharge_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admissions`
--

INSERT INTO `admissions` (`admission_id`, `patient_id`, `room_id`, `admission_date`, `discharge_date`) VALUES
(1, 1, 1, '2024-12-03', '2024-03-05'),
(2, 2, 2, '2024-12-05', '2024-03-12');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(15) NOT NULL,
  `reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `appointment_date`, `appointment_time`, `doctor_id`, `patient_id`, `reason`) VALUES
(1, '2024-03-10', '10:00:00', 1, 1, 'Annual Checkup'),
(2, '2024-03-15', '14:30:00', 2, 2, 'Follow-up Appointment'),
(3, '2022-03-20', '09:00:00', 3, 3, 'Consultation');

-- --------------------------------------------------------

--
-- Table structure for table `departements`
--

CREATE TABLE `departements` (
  `departement_id` int(11) NOT NULL,
  `departement_name` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departements`
--

INSERT INTO `departements` (`departement_id`, `departement_name`, `location`) VALUES
(1, 'Cardiology', 'Building A, Floor 3'),
(2, 'Neurology', 'Building B, Floor 2'),
(3, 'Oncology', 'Building C, Floor 1'),
(4, 'Emergency', 'Building A, Ground Floor'),
(5, 'Pediatrics', 'Building D, Floor 4'),
(6, 'Surgery', 'Building B, Floor 3');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `specialization` varchar(50) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `departement_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctor_id`, `first_name`, `last_name`, `specialization`, `phone_number`, `email`, `departement_id`) VALUES
(1, 'John', 'Smith', 'Cardiology', '555-123-4567', 'john.smith@example.com', 1),
(2, 'Jane', 'Doe', 'Neurology', '555-987-6543', 'jane.doe@example.com', 2),
(3, 'David', 'Lee', 'Oncology', '555-246-8013', 'david.lee@example.com', 3);

-- --------------------------------------------------------

--
-- Table structure for table `medications`
--

CREATE TABLE `medications` (
  `medication_id` int(11) NOT NULL,
  `medication_name` varchar(100) DEFAULT NULL,
  `dosage` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medications`
--

INSERT INTO `medications` (`medication_id`, `medication_name`, `dosage`) VALUES
(1, 'Aspirin', '81mg'),
(2, 'Ibuprofen', '200mg'),
(3, 'Paracetamol', '500mg'),
(4, 'Amoxicillin', '500mg'),
(5, 'Metformin', '500mg'),
(6, 'Lipitor', '10mg'),
(7, 'Omeprazole', '20mg');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `phone_number`, `email`, `address`) VALUES
(1, 'John', 'Doe', 'Male', '2018-06-15', '123-456-7890', 'john.doe@example.com', '123 Elm St'),
(2, 'Jane', 'Smith', 'Female', '1990-09-21', '987-654-3210', 'jane.smith@example.com', '456 Oak St'),
(3, 'Alice', 'Johnson', 'Female', '2011-03-12', '555-234-5678', 'alice.johnson@example.com', '789 Pine St'),
(4, 'Michael', 'Brown', 'Male', '2005-11-05', '444-123-6789', 'michael.brown@example.com', '101 Maple Ave'),
(5, 'Emily', 'Davis', 'Female', '2009-01-30', '222-987-6543', 'emily.davis@example.com', '202 Birch Rd'),
(6, 'Robert', 'Garcia', 'Male', '1983-07-18', '333-456-7891', 'robert.garcia@example.com', '303 Cedar Ln'),
(7, 'Jessica', 'Martinez', 'Female', '1992-10-02', '777-888-9999', 'jessica.martinez@example.com', '404 Spruce Blvd');

-- --------------------------------------------------------

--
-- Table structure for table `presprections`
--

CREATE TABLE `presprections` (
  `presprection_id` int(11) NOT NULL,
  `patient_id` int(15) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `medication_id` int(11) DEFAULT NULL,
  `presprection_date` date DEFAULT NULL,
  `dosage_instructions` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `presprections`
--

INSERT INTO `presprections` (`presprection_id`, `patient_id`, `doctor_id`, `medication_id`, `presprection_date`, `dosage_instructions`) VALUES
(1, 1, 1, 1, '2024-03-08', 'Take one tablet daily'),
(2, 2, 2, 2, '2024-03-15', 'Take two tablets every 6 hours as needed for pain'),
(3, 3, 3, 3, '2024-03-22', 'Take one capsule twice daily with food');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `patient_id` varchar(10) DEFAULT NULL,
  `room_number` varchar(50) DEFAULT NULL,
  `room_type` enum('General','Private','ICU') DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `patient_id`, `room_number`, `room_type`, `availability`) VALUES
(1, NULL, '101', 'General', 1),
(2, NULL, '102', 'Private', 1),
(3, NULL, '103', 'ICU', 0),
(4, NULL, '201', 'General', 1),
(5, NULL, '202', 'Private', 0),
(6, NULL, '203', 'ICU', 1),
(7, NULL, '301', 'General', 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `departement_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `first_name`, `last_name`, `job_title`, `phone_number`, `email`, `departement_id`) VALUES
(1, 'Anna', 'Smith', 'Receptionist', '123-456-7890', 'anna.smith@hospital.com', 1),
(2, 'Brian', 'Jones', 'Administrative Assistant', '234-567-8901', 'brian.jones@hospital.com', 2),
(3, 'Catherine', 'Brown', 'Nurse', '345-678-9012', 'catherine.brown@hospital.com', 3),
(4, 'Daniel', 'Johnson', 'Lab Technician', '456-789-0123', 'daniel.johnson@hospital.com', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admissions`
--
ALTER TABLE `admissions`
  ADD PRIMARY KEY (`admission_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `departements`
--
ALTER TABLE `departements`
  ADD PRIMARY KEY (`departement_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`),
  ADD KEY `departement_id` (`departement_id`);

--
-- Indexes for table `medications`
--
ALTER TABLE `medications`
  ADD PRIMARY KEY (`medication_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `presprections`
--
ALTER TABLE `presprections`
  ADD PRIMARY KEY (`presprection_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `medication_id` (`medication_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `departement_id` (`departement_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admissions`
--
ALTER TABLE `admissions`
  MODIFY `admission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `departements`
--
ALTER TABLE `departements`
  MODIFY `departement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `medications`
--
ALTER TABLE `medications`
  MODIFY `medication_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `presprections`
--
ALTER TABLE `presprections`
  MODIFY `presprection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admissions`
--
ALTER TABLE `admissions`
  ADD CONSTRAINT `admissions_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `admissions_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`);

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`);

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`departement_id`) REFERENCES `departements` (`departement_id`);

--
-- Constraints for table `presprections`
--
ALTER TABLE `presprections`
  ADD CONSTRAINT `presprections_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `presprections_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`),
  ADD CONSTRAINT `presprections_ibfk_3` FOREIGN KEY (`medication_id`) REFERENCES `medications` (`medication_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`departement_id`) REFERENCES `departements` (`departement_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

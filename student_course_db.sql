-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2026 at 04:46 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_course_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_ID` int(30) NOT NULL,
  `course_name` varchar(30) NOT NULL,
  `credit_Hours` int(13) NOT NULL,
  `Department` varchar(20) NOT NULL
) ;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_ID`, `course_name`, `credit_Hours`, `Department`) VALUES
(201, 'oop', 3, 'CS'),
(202, 'DB', 3, 'CS'),
(203, 'DLD', 3, 'CS'),
(204, 'datastructures', 3, 'CS'),
(205, 'web development', 4, 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `Enrollment_ID` int(20) NOT NULL,
  `student_ID` int(10) NOT NULL,
  `course_ID` int(30) NOT NULL,
  `Enrollment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`Enrollment_ID`, `student_ID`, `course_ID`, `Enrollment_date`) VALUES
(1, 101, 201, '2026-08-01'),
(2, 101, 202, '2026-08-01'),
(3, 102, 201, '2026-08-02'),
(4, 102, 203, '2026-08-03'),
(5, 103, 204, '2026-08-03'),
(6, 104, 202, '2026-08-04'),
(7, 104, 203, '2026-08-04'),
(8, 105, 205, '2026-08-05'),
(9, 106, 205, '2026-08-03');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_ID` int(10) NOT NULL,
  `student_name` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Department` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_ID`, `student_name`, `Email`, `Department`) VALUES
(101, 'Ali', 'ali@gmail.com', 'CS'),
(102, 'Sara', 'sara@gmail.com', 'CS'),
(103, 'Hamza', 'hamza@gmail.com', 'CS'),
(104, 'Ayesha', 'aysha@gmail.com', 'CS'),
(105, 'Usman', 'usman@gmail.com', 'IT'),
(106, 'Alia', 'alia@gmail.com', 'IT');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_ID`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`Enrollment_ID`),
  ADD KEY `fk_course` (`course_ID`),
  ADD KEY `fk_student` (`student_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_ID`),
  ADD UNIQUE KEY `unique_email` (`Email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `fk_course` FOREIGN KEY (`course_ID`) REFERENCES `course` (`course_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_student` FOREIGN KEY (`student_ID`) REFERENCES `student` (`student_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

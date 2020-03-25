-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 01, 2020 at 07:21 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Faculty`
--

-- --------------------------------------------------------

--
-- Table structure for table `Answers`
--

CREATE TABLE `Answers` (
  `examID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `QuestionID` int(11) NOT NULL,
  `Time` int(11) NOT NULL,
  `Answer` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Book`
--

CREATE TABLE `Book` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `noChapters` int(11) NOT NULL,
  `SubjectID` int(11) NOT NULL,
  `ProfID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE `Department` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `head` int(11) NOT NULL,
  `noEmp` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Dep_Subject`
--

CREATE TABLE `Dep_Subject` (
  `SubjectID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `StudentsCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Exam`
--

CREATE TABLE `Exam` (
  `id` int(11) NOT NULL,
  `ProfID` int(11) NOT NULL,
  `FullDegree` float NOT NULL,
  `Time` float NOT NULL,
  `SubjectID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `state` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ExamSettings`
--

CREATE TABLE `ExamSettings` (
  `ExamID` int(11) NOT NULL,
  `QuestionType` int(11) NOT NULL,
  `Chapter` int(11) NOT NULL,
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  `C` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `requestedHours` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Level_Subject`
--

CREATE TABLE `Level_Subject` (
  `LevelID` int(11) NOT NULL,
  `SubjectID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Prof`
--

CREATE TABLE `Prof` (
  `id` int(11) NOT NULL,
  `DepId` int(11) NOT NULL,
  `Specialization` text NOT NULL,
  `Degree` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Questions`
--

CREATE TABLE `Questions` (
  `id` int(11) NOT NULL,
  `examID` int(11) NOT NULL,
  `SubjectID` int(11) NOT NULL,
  `Question` text NOT NULL,
  `Answers` text NOT NULL,
  `Correct` varchar(200) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `id` int(11) NOT NULL,
  `Degree` float NOT NULL,
  `totalHours` float NOT NULL,
  `Dep` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Student_Subject`
--

CREATE TABLE `Student_Subject` (
  `SubjectID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `Degree` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Subject`
--

CREATE TABLE `Subject` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `ProfID` int(11) NOT NULL,
  `DeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `DoB` date NOT NULL,
  `role` int(11) NOT NULL,
  `approvel` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Answers`
--
ALTER TABLE `Answers`
  ADD KEY `examID` (`examID`),
  ADD KEY `QuestionID` (`QuestionID`),
  ADD KEY `StudentID` (`StudentID`);

--
-- Indexes for table `Book`
--
ALTER TABLE `Book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ProfID` (`ProfID`),
  ADD KEY `SubjectID` (`SubjectID`);

--
-- Indexes for table `Department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `head` (`head`);

--
-- Indexes for table `Dep_Subject`
--
ALTER TABLE `Dep_Subject`
  ADD PRIMARY KEY (`SubjectID`,`DepartmentID`),
  ADD KEY `DepartmentID` (`DepartmentID`);

--
-- Indexes for table `Exam`
--
ALTER TABLE `Exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ProfID` (`ProfID`),
  ADD KEY `SubjectID` (`SubjectID`);

--
-- Indexes for table `ExamSettings`
--
ALTER TABLE `ExamSettings`
  ADD PRIMARY KEY (`ExamID`,`QuestionType`,`Chapter`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Level_Subject`
--
ALTER TABLE `Level_Subject`
  ADD KEY `LevelID` (`LevelID`),
  ADD KEY `SubjectID` (`SubjectID`);

--
-- Indexes for table `Prof`
--
ALTER TABLE `Prof`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Questions`
--
ALTER TABLE `Questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `examID` (`examID`),
  ADD KEY `SubjectID` (`SubjectID`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `Student_Subject`
--
ALTER TABLE `Student_Subject`
  ADD PRIMARY KEY (`SubjectID`,`StudentID`),
  ADD KEY `StudentID` (`StudentID`);

--
-- Indexes for table `Subject`
--
ALTER TABLE `Subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `DeID` (`DeID`),
  ADD KEY `ProfID` (`ProfID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Book`
--
ALTER TABLE `Book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Department`
--
ALTER TABLE `Department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Exam`
--
ALTER TABLE `Exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Prof`
--
ALTER TABLE `Prof`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Questions`
--
ALTER TABLE `Questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Student`
--
ALTER TABLE `Student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Subject`
--
ALTER TABLE `Subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Answers`
--
ALTER TABLE `Answers`
  ADD CONSTRAINT `Answers_ibfk_1` FOREIGN KEY (`examID`) REFERENCES `Exam` (`id`),
  ADD CONSTRAINT `Answers_ibfk_2` FOREIGN KEY (`QuestionID`) REFERENCES `Questions` (`id`),
  ADD CONSTRAINT `Answers_ibfk_3` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`id`);

--
-- Constraints for table `Book`
--
ALTER TABLE `Book`
  ADD CONSTRAINT `Book_ibfk_1` FOREIGN KEY (`ProfID`) REFERENCES `Prof` (`id`),
  ADD CONSTRAINT `Book_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `Subject` (`id`);

--
-- Constraints for table `Department`
--
ALTER TABLE `Department`
  ADD CONSTRAINT `Department_ibfk_1` FOREIGN KEY (`head`) REFERENCES `Prof` (`id`);

--
-- Constraints for table `Dep_Subject`
--
ALTER TABLE `Dep_Subject`
  ADD CONSTRAINT `Dep_Subject_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `Department` (`id`),
  ADD CONSTRAINT `Dep_Subject_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `Subject` (`id`);

--
-- Constraints for table `Exam`
--
ALTER TABLE `Exam`
  ADD CONSTRAINT `Exam_ibfk_2` FOREIGN KEY (`ProfID`) REFERENCES `Prof` (`id`),
  ADD CONSTRAINT `Exam_ibfk_3` FOREIGN KEY (`SubjectID`) REFERENCES `Subject` (`id`);

--
-- Constraints for table `ExamSettings`
--
ALTER TABLE `ExamSettings`
  ADD CONSTRAINT `ExamSettings_ibfk_1` FOREIGN KEY (`ExamID`) REFERENCES `Exam` (`id`);

--
-- Constraints for table `Level_Subject`
--
ALTER TABLE `Level_Subject`
  ADD CONSTRAINT `Level_Subject_ibfk_1` FOREIGN KEY (`LevelID`) REFERENCES `levels` (`id`),
  ADD CONSTRAINT `Level_Subject_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `Subject` (`id`);

--
-- Constraints for table `Prof`
--
ALTER TABLE `Prof`
  ADD CONSTRAINT `Prof_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Constraints for table `Questions`
--
ALTER TABLE `Questions`
  ADD CONSTRAINT `Questions_ibfk_1` FOREIGN KEY (`examID`) REFERENCES `Exam` (`id`),
  ADD CONSTRAINT `Questions_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `Subject` (`id`);

--
-- Constraints for table `Student`
--
ALTER TABLE `Student`
  ADD CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `Student_ibfk_2` FOREIGN KEY (`level`) REFERENCES `levels` (`id`);

--
-- Constraints for table `Student_Subject`
--
ALTER TABLE `Student_Subject`
  ADD CONSTRAINT `Student_Subject_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`id`),
  ADD CONSTRAINT `Student_Subject_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `Subject` (`id`);

--
-- Constraints for table `Subject`
--
ALTER TABLE `Subject`
  ADD CONSTRAINT `Subject_ibfk_1` FOREIGN KEY (`DeID`) REFERENCES `Department` (`id`),
  ADD CONSTRAINT `Subject_ibfk_2` FOREIGN KEY (`ProfID`) REFERENCES `Prof` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

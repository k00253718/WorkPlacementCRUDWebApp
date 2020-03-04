-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema fypdatabase
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fypdatabase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fypdatabase` DEFAULT CHARACTER SET latin1 ;
-- -----------------------------------------------------
-- Schema workplacement
-- -----------------------------------------------------
USE `fypdatabase` ;

-- -----------------------------------------------------
-- Table `fypdatabase`.`placement_officer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fypdatabase`.`placement_officer` (
  `Id` INT(11) NOT NULL,
  `First_Name` VARCHAR(15) NULL DEFAULT NULL,
  `Last_Name` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `fypdatabase`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fypdatabase`.`student` (
  `Id` INT(11) NOT NULL,
  `First_Name` VARCHAR(45) NULL DEFAULT NULL,
  `Last_Name` VARCHAR(45) NULL DEFAULT NULL,
  `Password` VARCHAR(45) NULL DEFAULT NULL,
  `Country` VARCHAR(45) NULL DEFAULT NULL,
  `Gender` VARCHAR(45) NULL DEFAULT NULL,
  `Date_Of_Birth` VARCHAR(45) NULL DEFAULT NULL,
  `BestFriendName` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` VARCHAR(45) NULL DEFAULT NULL,
  `Cv` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `fypdatabase`.`applicant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fypdatabase`.`applicant` (
  `Id` INT(11) NOT NULL,
  `Placement_Officer_Id` INT(11) NOT NULL,
  `Student_Id` INT(11) NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Applicant_Placement_Officer1_idx` (`Placement_Officer_Id` ASC),
  INDEX `fk_Applicant_Student1_idx` (`Student_Id` ASC),
  CONSTRAINT `fk_Applicant_Placement_Officer1`
    FOREIGN KEY (`Placement_Officer_Id`)
    REFERENCES `fypdatabase`.`placement_officer` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Applicant_Student1`
    FOREIGN KEY (`Student_Id`)
    REFERENCES `fypdatabase`.`student` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `fypdatabase`.`chat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fypdatabase`.`chat` (
  `Time` INT(11) NOT NULL,
  `Timestamp` DATETIME NULL DEFAULT NULL,
  `Content` VARCHAR(45) NULL DEFAULT NULL,
  `Student_Id` INT(11) NOT NULL,
  `Placement_Officer_Id` INT(11) NOT NULL,
  PRIMARY KEY (`Time`),
  INDEX `fk_Chat_Student_idx` (`Student_Id` ASC),
  INDEX `fk_Chat_Placement_Officer1_idx` (`Placement_Officer_Id` ASC),
  CONSTRAINT `fk_Chat_Placement_Officer1`
    FOREIGN KEY (`Placement_Officer_Id`)
    REFERENCES `fypdatabase`.`placement_officer` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Chat_Student`
    FOREIGN KEY (`Student_Id`)
    REFERENCES `fypdatabase`.`student` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `fypdatabase`.`job`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fypdatabase`.`job` (
  `Id` INT(11) NOT NULL,
  `Title` VARCHAR(15) NULL DEFAULT NULL,
  `Company_Name` VARCHAR(45) NULL DEFAULT NULL,
  `Description` VARCHAR(100) NULL DEFAULT NULL,
  `Location` VARCHAR(15) NULL DEFAULT NULL,
  `Overview` VARCHAR(1000) NULL DEFAULT NULL,
  `Salary` VARCHAR(15) NULL DEFAULT NULL,
  `Prefered_Skills` VARCHAR(100) NULL DEFAULT NULL,
  `Duration` VARCHAR(15) NULL DEFAULT NULL,
  `Duties_And_Responsibilities` VARCHAR(100) NULL DEFAULT NULL,
  `Qualifications` VARCHAR(100) NULL DEFAULT NULL,
  `Benefits` VARCHAR(100) NULL DEFAULT NULL,
  `Types` VARCHAR(15) NULL DEFAULT NULL,
  `Experience` VARCHAR(200) NULL DEFAULT NULL,
  `Upload_Date` DATE NULL DEFAULT NULL,
  `Expiry_Date` DATE NULL DEFAULT NULL,
  `Student_Id` INT(11) NOT NULL,
  `Placement_Officer_Id` INT(11) NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Job_Student1_idx` (`Student_Id` ASC),
  INDEX `fk_Job_Placement_Officer1_idx` (`Placement_Officer_Id` ASC),
  CONSTRAINT `fk_Job_Placement_Officer1`
    FOREIGN KEY (`Placement_Officer_Id`)
    REFERENCES `fypdatabase`.`placement_officer` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Job_Student1`
    FOREIGN KEY (`Student_Id`)
    REFERENCES `fypdatabase`.`student` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `fypdatabase`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fypdatabase`.`login` (
  `Email` VARCHAR(20) NOT NULL,
  `Password` VARCHAR(45) NULL,
  PRIMARY KEY (`Email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fypdatabase`.`student_has_login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fypdatabase`.`student_has_login` (
  `student_Id` INT(11) NOT NULL,
  `login_Email` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`student_Id`, `login_Email`),
  INDEX `fk_student_has_login_login1_idx` (`login_Email` ASC),
  INDEX `fk_student_has_login_student1_idx` (`student_Id` ASC),
  CONSTRAINT `fk_student_has_login_student1`
    FOREIGN KEY (`student_Id`)
    REFERENCES `fypdatabase`.`student` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_login_login1`
    FOREIGN KEY (`login_Email`)
    REFERENCES `fypdatabase`.`login` (`Email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `fypdatabase`.`placement_officer_has_login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fypdatabase`.`placement_officer_has_login` (
  `placement_officer_Id` INT(11) NOT NULL,
  `login_Email` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`placement_officer_Id`, `login_Email`),
  INDEX `fk_placement_officer_has_login_login1_idx` (`login_Email` ASC),
  INDEX `fk_placement_officer_has_login_placement_officer1_idx` (`placement_officer_Id` ASC),
  CONSTRAINT `fk_placement_officer_has_login_placement_officer1`
    FOREIGN KEY (`placement_officer_Id`)
    REFERENCES `fypdatabase`.`placement_officer` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_placement_officer_has_login_login1`
    FOREIGN KEY (`login_Email`)
    REFERENCES `fypdatabase`.`login` (`Email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `fypdatabase`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fypdatabase`.`user` (
  `Id` INT NOT NULL,
  `Firstname` VARCHAR(45) NULL,
  `Lastname` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  `SecurityQuestionAnswer` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Gender` VARCHAR(45) NULL,
  `Phone` VARCHAR(45) NULL,
  `usercol` VARCHAR(45) NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

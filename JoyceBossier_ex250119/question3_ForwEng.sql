-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `Patient_id` INT NOT NULL,
  `Patient_name` VARCHAR(45) NULL,
  `Patient_name` ENUM("M", "F") NULL,
  `Age_diagnosis` VARCHAR(45) NULL,
  PRIMARY KEY (`Patient_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Syndrome` (
  `Syndrome_id` INT NOT NULL,
  `Syndrome_name` VARCHAR(45) NULL,
  PRIMARY KEY (`Syndrome_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Chromosome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Chromosome` (
  `ID` INT NOT NULL,
  `Chromosome_name` VARCHAR(45) NULL,
  `Position` VARCHAR(45) NULL,
  `Start` INT NULL,
  `End` INT NULL,
  `Syndrome_Syndrome_id` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Chromosome_Syndrome1_idx` (`Syndrome_Syndrome_id` ASC) VISIBLE,
  CONSTRAINT `fk_Chromosome_Syndrome1`
    FOREIGN KEY (`Syndrome_Syndrome_id`)
    REFERENCES `mydb`.`Syndrome` (`Syndrome_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene` (
  `Gene_id` INT NOT NULL,
  `Gene_name` VARCHAR(45) NULL,
  `Start` VARCHAR(45) NULL,
  `Chromosome_ID` INT NOT NULL,
  PRIMARY KEY (`Gene_id`),
  INDEX `fk_Gene_Chromosome1_idx` (`Chromosome_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Gene_Chromosome1`
    FOREIGN KEY (`Chromosome_ID`)
    REFERENCES `mydb`.`Chromosome` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient_syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient_syndrome` (
  `ID` INT NOT NULL,
  `Patient_Patient_id` INT NOT NULL,
  `Syndrome_Syndrome_id` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Patient_syndrome_Patient_idx` (`Patient_Patient_id` ASC) VISIBLE,
  INDEX `fk_Patient_syndrome_Syndrome1_idx` (`Syndrome_Syndrome_id` ASC) VISIBLE,
  CONSTRAINT `fk_Patient_syndrome_Patient`
    FOREIGN KEY (`Patient_Patient_id`)
    REFERENCES `mydb`.`Patient` (`Patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_syndrome_Syndrome1`
    FOREIGN KEY (`Syndrome_Syndrome_id`)
    REFERENCES `mydb`.`Syndrome` (`Syndrome_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

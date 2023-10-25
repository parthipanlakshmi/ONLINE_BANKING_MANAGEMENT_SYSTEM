-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema online_bank_management_system
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema online_bank_management_system
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `online_bank_management_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `online_bank_management_system` ;

-- -----------------------------------------------------
-- Table `online_bank_management_system`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_bank_management_system`.`account` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `balance` DOUBLE NOT NULL,
  `card_no` VARCHAR(255) NULL DEFAULT NULL,
  `customer_id` INT NOT NULL,
  `date` VARCHAR(255) NULL DEFAULT NULL,
  `pin` INT NOT NULL,
  `status` VARCHAR(255) NULL DEFAULT NULL,
  `type` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `online_bank_management_system`.`account_transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_bank_management_system`.`account_transaction` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `account_id` INT NOT NULL,
  `amount` DOUBLE NOT NULL,
  `date` VARCHAR(255) NULL DEFAULT NULL,
  `to_account_id` INT NOT NULL,
  `type` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `online_bank_management_system`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_bank_management_system`.`admin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `user_id` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `online_bank_management_system`.`branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_bank_management_system`.`branch` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `state` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `online_bank_management_system`.`checkbook`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_bank_management_system`.`checkbook` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `applied_date` VARCHAR(255) NULL DEFAULT NULL,
  `approval_status` VARCHAR(255) NULL DEFAULT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `online_bank_management_system`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_bank_management_system`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `branch_id` INT NOT NULL,
  `date` VARCHAR(255) NULL DEFAULT NULL,
  `dob` VARCHAR(255) NULL DEFAULT NULL,
  `email_id` VARCHAR(255) NULL DEFAULT NULL,
  `first_name` VARCHAR(255) NULL DEFAULT NULL,
  `gender` VARCHAR(255) NULL DEFAULT NULL,
  `last_name` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `perment_address` VARCHAR(255) NULL DEFAULT NULL,
  `phone_number` VARCHAR(255) NULL DEFAULT NULL,
  `present_address` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

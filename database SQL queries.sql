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
-- -----------------------------------------------------
-- Schema online_bank_management_system
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema online_bank_management_system
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `online_bank_management_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `online_bank_management_system`.`Manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_bank_management_system`.`Manager` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(255) NOT NULL,
  `user_id` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UK_hawikyhwwfvbnog5byokutpff` (`user_id` ASC) VISIBLE)
ENGINE = InnoDB
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
  `email_id` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `gender` VARCHAR(255) NULL DEFAULT NULL,
  `last_name` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NOT NULL,
  `permanent_address` VARCHAR(255) NULL DEFAULT NULL,
  `phone_number` VARCHAR(255) NOT NULL,
  `present_address` VARCHAR(255) NULL DEFAULT NULL,
  `Manager_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Manager_id`),
  INDEX `fk_customer_Manager1_idx` (`Manager_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_Manager1`
    FOREIGN KEY (`Manager_id`)
    REFERENCES `online_bank_management_system`.`Manager` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`foreign_exchange`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`foreign_exchange` (
  `id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `date` VARCHAR(255) NOT NULL,
  `amount` DOUBLE NOT NULL,
  `exchange_amount` INT NOT NULL,
  `customer_id1` INT NOT NULL,
  PRIMARY KEY (`id`, `customer_id1`),
  INDEX `fk_foreign_exchange_customer_idx` (`customer_id1` ASC) VISIBLE,
  CONSTRAINT `fk_foreign_exchange_customer`
    FOREIGN KEY (`customer_id1`)
    REFERENCES `online_bank_management_system`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

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
  `customer_id1` INT NOT NULL,
  PRIMARY KEY (`id`, `customer_id1`),
  INDEX `fk_account_customer1_idx` (`customer_id1` ASC) VISIBLE,
  CONSTRAINT `fk_account_customer1`
    FOREIGN KEY (`customer_id1`)
    REFERENCES `online_bank_management_system`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
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
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`id`, `customer_id`),
  INDEX `fk_account_transaction_customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_account_transaction_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `online_bank_management_system`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
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
  `customer_id1` INT NOT NULL,
  PRIMARY KEY (`id`, `customer_id1`),
  UNIQUE INDEX `UK_hcfasrp4btpxixpjbmgl8u0wb` (`customer_id` ASC) VISIBLE,
  INDEX `fk_checkbook_customer1_idx` (`customer_id1` ASC) VISIBLE,
  CONSTRAINT `fk_checkbook_customer1`
    FOREIGN KEY (`customer_id1`)
    REFERENCES `online_bank_management_system`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema intermediaryservices
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `intermediaryservices` ;

-- -----------------------------------------------------
-- Schema intermediaryservices
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `intermediaryservices` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `intermediaryservices` ;

-- -----------------------------------------------------
-- Table `intermediaryservices`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `intermediaryservices`.`person` (
  `person_id` INT NOT NULL AUTO_INCREMENT,
  `person_name` VARCHAR(45) NOT NULL,
  `person_surname` VARCHAR(45) NOT NULL,
  `person_phone` VARCHAR(45) NOT NULL,
  `person_address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE INDEX `person_address_UNIQUE` (`person_address` ASC) VISIBLE,
  UNIQUE INDEX `person_phone_UNIQUE` (`person_phone` ASC) VISIBLE,
  UNIQUE INDEX `person_id_UNIQUE` (`person_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `intermediaryservices`.`agent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `intermediaryservices`.`agent` (
  `agent_id` INT NOT NULL AUTO_INCREMENT,
  `agent_passport` VARCHAR(8) NOT NULL,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`agent_id`),
  UNIQUE INDEX `agent_passport_UNIQUE` (`agent_passport` ASC) VISIBLE,
  UNIQUE INDEX `agent_id_UNIQUE` (`agent_id` ASC) VISIBLE,
  INDEX `person_agent_fk_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `person_agent_fk`
    FOREIGN KEY (`person_id`)
    REFERENCES `intermediaryservices`.`person` (`person_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `intermediaryservices`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `intermediaryservices`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC) VISIBLE,
  INDEX `customer_person_fk_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `person_cutomer_fk`
    FOREIGN KEY (`person_id`)
    REFERENCES `intermediaryservices`.`person` (`person_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `intermediaryservices`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `intermediaryservices`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATE NOT NULL,
  `agent_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC) VISIBLE,
  INDEX `order_customer_idx` (`customer_id` ASC) VISIBLE,
  INDEX `order_agent_fk_idx` (`agent_id` ASC) VISIBLE,
  CONSTRAINT `order_agent_fk`
    FOREIGN KEY (`agent_id`)
    REFERENCES `intermediaryservices`.`agent` (`agent_id`),
  CONSTRAINT `order_customer_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `intermediaryservices`.`customer` (`customer_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `intermediaryservices`.`provider`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `intermediaryservices`.`provider` (
  `provider_id` INT NOT NULL AUTO_INCREMENT,
  `provider_company` VARCHAR(45) NOT NULL,
  `checking_account` VARCHAR(16) NOT NULL,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`provider_id`),
  UNIQUE INDEX `provider_id_UNIQUE` (`provider_id` ASC) VISIBLE,
  INDEX `person_provider_fk_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `person_provider_fk`
    FOREIGN KEY (`person_id`)
    REFERENCES `intermediaryservices`.`person` (`person_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `intermediaryservices`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `intermediaryservices`.`product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `product_price` DECIMAL(10,2) NOT NULL,
  `provider_id` INT NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `product_name_UNIQUE` (`product_name` ASC) VISIBLE,
  UNIQUE INDEX `product_id_UNIQUE` (`product_id` ASC) VISIBLE,
  INDEX `product_provider_fk_idx` (`provider_id` ASC) VISIBLE,
  CONSTRAINT `product_provider_fk`
    FOREIGN KEY (`provider_id`)
    REFERENCES `intermediaryservices`.`provider` (`provider_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `intermediaryservices`.`order_has_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `intermediaryservices`.`order_has_product` (
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `product_amount` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`order_id`, `product_id`),
  INDEX `product_fk_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `order_fk`
    FOREIGN KEY (`order_id`)
    REFERENCES `intermediaryservices`.`orders` (`order_id`),
  CONSTRAINT `product_fk`
    FOREIGN KEY (`product_id`)
    REFERENCES `intermediaryservices`.`product` (`product_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

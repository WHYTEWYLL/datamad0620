-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_mysql` DEFAULT CHARACTER SET utf8 ;
USE `lab_mysql` ;

-- -----------------------------------------------------
-- Table `lab_mysql`.`Car`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab_mysql`.`Car` ;

CREATE TABLE IF NOT EXISTS `lab_mysql`.`Car` (
  `idCar` INT NOT NULL,
  `vin` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `year` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCar`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab_mysql`.`Customers` ;

CREATE TABLE IF NOT EXISTS `lab_mysql`.`Customers` (
  `idCustomers` INT NOT NULL,
  `customer_id` VARCHAR(45) NOT NULL,
  `p_number` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(2) NULL DEFAULT NULL,
  `country` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCustomers`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lab_mysql`.`salespersons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab_mysql`.`salespersons` ;

CREATE TABLE IF NOT EXISTS `lab_mysql`.`salespersons` (
  `idsalespersons` INT NOT NULL,
  `staff_id` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idsalespersons`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Invocies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab_mysql`.`Invocies` ;

CREATE TABLE IF NOT EXISTS `lab_mysql`.`Invocies` (
  `idInvocies` INT NOT NULL,
  `salesperson` VARCHAR(45) NOT NULL,
  `customer` VARCHAR(45) NOT NULL,
  `car` VARCHAR(45) NOT NULL,
  `date` DATETIME NOT NULL,
  `salespersons_idsalespersons` INT NULL,
  `Customers_idCustomers` INT NOT NULL,
  `Car_idCar` INT NULL,
  PRIMARY KEY (`idInvocies`),
  INDEX `fk_Invocies_salespersons1_idx` (`salespersons_idsalespersons` ASC) VISIBLE,
  INDEX `fk_Invocies_Customers1_idx` (`Customers_idCustomers` ASC) VISIBLE,
  INDEX `fk_Invocies_Car1_idx` (`Car_idCar` ASC) VISIBLE,
  CONSTRAINT `fk_Invocies_salespersons1`
    FOREIGN KEY (`salespersons_idsalespersons`)
    REFERENCES `lab_mysql`.`salespersons` (`idsalespersons`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invocies_Customers1`
    FOREIGN KEY (`Customers_idCustomers`)
    REFERENCES `lab_mysql`.`Customers` (`idCustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invocies_Car1`
    FOREIGN KEY (`Car_idCar`)
    REFERENCES `lab_mysql`.`Car` (`idCar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

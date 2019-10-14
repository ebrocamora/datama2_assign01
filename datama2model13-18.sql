-- MySQL Script generated by MySQL Workbench
-- Mon Oct 14 08:56:19 2019
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer` (
  `id` INT NOT NULL,
  `custfirstname` VARCHAR(45) NOT NULL,
  `custlastname` VARCHAR(45) NOT NULL,
  `custtype` VARCHAR(45) NOT NULL,
  `custbday` VARCHAR(45) NOT NULL,
  `cinema_id` INT NOT NULL,
  `account_id` INT NOT NULL,
  `branch_id` INT NOT NULL,
  PRIMARY KEY (`id`, `cinema_id`, `account_id`, `branch_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cashier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cashier` (
  `id` INT NOT NULL,
  `cashier_firstname` VARCHAR(45) NOT NULL,
  `cashier_lastname` VARCHAR(45) NOT NULL,
  `cashier_age` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`id`, `customer_id`),
  INDEX `fk_cashier_customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_cashier_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `mydb`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ticket` (
  `id` INT NOT NULL,
  `custid` INT NOT NULL,
  `movietitle` VARCHAR(45) NOT NULL,
  `moviesched` VARCHAR(45) NOT NULL,
  `movieduration` INT NOT NULL,
  `dateofpurchase` DATE NOT NULL,
  `cashier_id` INT NOT NULL,
  `cashier_customer_id` INT NOT NULL,
  `porter_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `customer_cinema_id` INT NOT NULL,
  `customer_account_id` INT NOT NULL,
  `customer_branch_id` INT NOT NULL,
  PRIMARY KEY (`id`, `cashier_id`, `cashier_customer_id`, `porter_id`, `customer_id`, `customer_cinema_id`, `customer_account_id`, `customer_branch_id`),
  INDEX `fk_ticket_cashier1_idx` (`cashier_id` ASC, `cashier_customer_id` ASC) VISIBLE,
  INDEX `fk_ticket_customer1_idx` (`customer_id` ASC, `customer_cinema_id` ASC, `customer_account_id` ASC, `customer_branch_id` ASC) VISIBLE,
  CONSTRAINT `fk_ticket_cashier1`
    FOREIGN KEY (`cashier_id` , `cashier_customer_id`)
    REFERENCES `mydb`.`cashier` (`id` , `customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_customer1`
    FOREIGN KEY (`customer_id` , `customer_cinema_id` , `customer_account_id` , `customer_branch_id`)
    REFERENCES `mydb`.`customer` (`id` , `cinema_id` , `account_id` , `branch_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`payment` (
  `id` INT NOT NULL,
  `payment_amnt` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_payment_customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_payment_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `mydb`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`food`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`food` (
  `id` INT NOT NULL,
  `foodtype` VARCHAR(45) NOT NULL,
  `porter_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `customer_cinema_id` INT NOT NULL,
  `customer_account_id` INT NOT NULL,
  `customer_branch_id` INT NOT NULL,
  PRIMARY KEY (`id`, `porter_id`, `customer_id`, `customer_cinema_id`, `customer_account_id`, `customer_branch_id`),
  INDEX `fk_food_customer1_idx` (`customer_id` ASC, `customer_cinema_id` ASC, `customer_account_id` ASC, `customer_branch_id` ASC) VISIBLE,
  CONSTRAINT `fk_food_customer1`
    FOREIGN KEY (`customer_id` , `customer_cinema_id` , `customer_account_id` , `customer_branch_id`)
    REFERENCES `mydb`.`customer` (`id` , `cinema_id` , `account_id` , `branch_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employee` (
  `id` INT NOT NULL,
  `employeetype` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`inventory` (
  `id` INT NOT NULL,
  `foodstockitems` INT NULL,
  `drinkstockitems` INT NULL,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`id`, `employee_id`),
  INDEX `fk_inventory_employee1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `mydb`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
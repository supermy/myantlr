SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `exp` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `exp` ;

-- -----------------------------------------------------
-- Table `exp`.`Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exp`.`Category` ;

CREATE  TABLE IF NOT EXISTS `exp`.`Category` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'primary key' ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) )
ENGINE = InnoDB
COMMENT = 'Product Category';


-- -----------------------------------------------------
-- Table `exp`.`License`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exp`.`License` ;

CREATE  TABLE IF NOT EXISTS `exp`.`License` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exp`.`Certified`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exp`.`Certified` ;

CREATE  TABLE IF NOT EXISTS `exp`.`Certified` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `licenseid` INT NOT NULL ,
  `categoryid` INT NOT NULL ,
  `isDefault` TINYINT(1)  NOT NULL DEFAULT 1 ,
  INDEX `fk_Cetified_License` (`licenseid` ASC) ,
  INDEX `fk_Cetified_Category` (`categoryid` ASC) ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_Cetified_License`
    FOREIGN KEY (`licenseid` )
    REFERENCES `exp`.`License` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cetified_Category`
    FOREIGN KEY (`categoryid` )
    REFERENCES `exp`.`Category` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exp`.`LogMessage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exp`.`LogMessage` ;

CREATE  TABLE IF NOT EXISTS `exp`.`LogMessage` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `content` VARCHAR(100) NOT NULL ,
  `createDate` DATETIME NOT NULL DEFAULT now() ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

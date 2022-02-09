-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Social_Media_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Social_Media_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Social_Media_DB` DEFAULT CHARACTER SET utf8 ;
USE `Social_Media_DB` ;

-- -----------------------------------------------------
-- Table `Social_Media_DB`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Social_Media_DB`.`Users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NULL,
  `last_name` VARCHAR(50) NULL,
  `username` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NULL,
  `password` VARCHAR(255) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Social_Media_DB`.`Posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Social_Media_DB`.`Posts` (
  `post_id` INT NOT NULL AUTO_INCREMENT,
  `post_content` VARCHAR(255) NOT NULL,
  `post_time` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`post_id`),
  INDEX `fk_Posts_Users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_Posts_Users`
    FOREIGN KEY (`user_id`)
    REFERENCES `Social_Media_DB`.`Users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Social_Media_DB`.`Comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Social_Media_DB`.`Comments` (
  `comment_id` INT NOT NULL AUTO_INCREMENT,
  `comment_content` VARCHAR(255) NOT NULL,
  `comment_time` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  `post_id` INT NOT NULL,
  PRIMARY KEY (`comment_id`),
  INDEX `fk_Comments_Users1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_Comments_Posts1_idx` (`post_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comments_Users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `Social_Media_DB`.`Users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comments_Posts1`
    FOREIGN KEY (`post_id`)
    REFERENCES `Social_Media_DB`.`Posts` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Poly
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Poly
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Poly` DEFAULT CHARACTER SET utf8 ;
USE `Poly` ;

-- -----------------------------------------------------
-- Table `Poly`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Poly`.`user` (
  `UserID` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `graduationYear` INT NULL,
  `type` VARCHAR(45) NOT NULL,
  `work` VARCHAR(45) NULL,
  `username` VARCHAR(45) NOT NULL,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `middleName` VARCHAR(45) NULL,
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Poly`.`hobby`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Poly`.`hobby` (
  `hobbyID` INT NOT NULL,
  `hobbyInfo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`hobbyID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Poly`.`area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Poly`.`area` (
  `areaID` INT NOT NULL,
  `areaInfo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`areaID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Poly`.`postInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Poly`.`postInfo` (
  `postInfoID` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `estimates` TINYINT NOT NULL,
  `user` INT NOT NULL,
  `photo` BLOB NULL,
  `description` LONGTEXT NULL,
  PRIMARY KEY (`postInfoID`),
  INDEX `fk_postinfo_user1_idx` (`user` ASC) VISIBLE,
  CONSTRAINT `fk_postinfo_user1`
    FOREIGN KEY (`user`)
    REFERENCES `Poly`.`user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Poly`.`postchat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Poly`.`postchat` (
  `postChatID` INT NOT NULL,
  `comment` VARCHAR(45) NULL,
  `like` TINYINT NULL,
  `postinfo` INT NOT NULL,
  `user` INT NOT NULL,
  PRIMARY KEY (`postChatID`),
  INDEX `fk_portfolio_postinfo1_idx` (`postinfo` ASC) VISIBLE,
  INDEX `fk_postchat_user1_idx` (`user` ASC) VISIBLE,
  CONSTRAINT `fk_portfolio_postinfo1`
    FOREIGN KEY (`postinfo`)
    REFERENCES `Poly`.`postInfo` (`postInfoID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_postchat_user1`
    FOREIGN KEY (`user`)
    REFERENCES `Poly`.`user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Poly`.`group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Poly`.`group` (
  `groupID` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `user` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  PRIMARY KEY (`groupID`),
  INDEX `fk_group_user1_idx` (`user` ASC) VISIBLE,
  CONSTRAINT `fk_group_user1`
    FOREIGN KEY (`user`)
    REFERENCES `Poly`.`user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Poly`.`chat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Poly`.`chat` (
  `chatID` INT NOT NULL,
  `chatInfo` VARCHAR(45) NOT NULL,
  `messageDate` DATETIME NOT NULL,
  `file` VARCHAR(45) NULL,
  `status` VARCHAR(45) NOT NULL,
  `user` INT NOT NULL,
  `group` INT NOT NULL,
  PRIMARY KEY (`chatID`),
  INDEX `fk_chat_user1_idx` (`user` ASC) VISIBLE,
  INDEX `fk_chat_group1_idx` (`group` ASC) VISIBLE,
  CONSTRAINT `fk_chat_user1`
    FOREIGN KEY (`user`)
    REFERENCES `Poly`.`user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_chat_group1`
    FOREIGN KEY (`group`)
    REFERENCES `Poly`.`group` (`groupID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Poly`.`areaHasUser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Poly`.`areaHasUser` (
  `area` INT NOT NULL,
  `user` INT NOT NULL,
  PRIMARY KEY (`area`, `user`),
  INDEX `fk_areas_has_user_user1_idx` (`user` ASC) VISIBLE,
  INDEX `fk_areas_has_user_areas1_idx` (`area` ASC) VISIBLE,
  CONSTRAINT `fk_areas_has_user_areas1`
    FOREIGN KEY (`area`)
    REFERENCES `Poly`.`area` (`areaID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_areas_has_user_user1`
    FOREIGN KEY (`user`)
    REFERENCES `Poly`.`user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Poly`.`userHasHobby`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Poly`.`userHasHobby` (
  `user` INT NOT NULL,
  `hobby` INT NOT NULL,
  PRIMARY KEY (`user`, `hobby`),
  INDEX `fk_user_has_hobbie_user1_idx` (`user` ASC) VISIBLE,
  INDEX `fk_user_has_hobby_hobby_idx` (`hobby` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_hobby_user`
    FOREIGN KEY (`user`)
    REFERENCES `Poly`.`user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_hobby_hobby`
    FOREIGN KEY (`hobby`)
    REFERENCES `Poly`.`hobby` (`hobbyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Poly`.`areasHasPostinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Poly`.`areasHasPostinfo` (
  `area` INT NOT NULL,
  `postinfo` INT NOT NULL,
  PRIMARY KEY (`area`, `postinfo`),
  INDEX `fk_areas_has_postinfo_postinfo1_idx` (`postinfo` ASC) VISIBLE,
  INDEX `fk_areas_has_postinfo_areas1_idx` (`area` ASC) VISIBLE,
  CONSTRAINT `fk_areas_has_postinfo_areas1`
    FOREIGN KEY (`area`)
    REFERENCES `Poly`.`area` (`areaID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_areas_has_postinfo_postinfo1`
    FOREIGN KEY (`postinfo`)
    REFERENCES `Poly`.`postInfo` (`postInfoID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Poly`.`hobbyHasPostinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Poly`.`hobbyHasPostinfo` (
  `hobby` INT NOT NULL,
  `postinfo` INT NOT NULL,
  PRIMARY KEY (`hobby`, `postinfo`),
  INDEX `fk_hobbie_has_postinfo_postinfo1_idx` (`postinfo` ASC) VISIBLE,
  INDEX `fk_hobbie_has_postinfo_hobbie1_idx` (`hobby` ASC) VISIBLE,
  CONSTRAINT `fk_hobby_has_postinfo_hobby`
    FOREIGN KEY (`hobby`)
    REFERENCES `Poly`.`hobby` (`hobbyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hobby_has_postinfo_postinfo1`
    FOREIGN KEY (`postinfo`)
    REFERENCES `Poly`.`postInfo` (`postInfoID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Poly`.`file`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Poly`.`file` (
  `fileID` INT NOT NULL,
  `document` JSON NULL,
  `chat` INT NOT NULL,
  `postChat` INT NOT NULL,
  PRIMARY KEY (`fileID`),
  INDEX `fk_files_chat1_idx` (`chat` ASC) VISIBLE,
  INDEX `fk_files_postchat1_idx` (`postChat` ASC) VISIBLE,
  CONSTRAINT `fk_files_chat1`
    FOREIGN KEY (`chat`)
    REFERENCES `Poly`.`chat` (`chatID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_files_postchat1`
    FOREIGN KEY (`postChat`)
    REFERENCES `Poly`.`postchat` (`postChatID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

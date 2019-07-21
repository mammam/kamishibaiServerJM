-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Control
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Control` ;

-- -----------------------------------------------------
-- Schema Control
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Control` DEFAULT CHARACTER SET utf8 ;
USE `Control` ;

-- -----------------------------------------------------
-- Table `Control`.`Empleados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Control`.`Empleados` ;

CREATE TABLE IF NOT EXISTS `Control`.`Empleados` (
  `idEmpleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `primerApellido` VARCHAR(45) NULL,
  `segundoApellido` VARCHAR(45) NULL,
  `userName` VARCHAR(45) NULL,
  `password` VARCHAR(12) NULL,
  `createdAt` datetime DEFAULT NULL COMMENT 'created time',
  `updatedAt` datetime DEFAULT NULL COMMENT 'updated time',
  PRIMARY KEY (`idEmpleado`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idUsuarios_UNIQUE` ON `Control`.`Empleados` (`idEmpleado` ASC) ;


-- -----------------------------------------------------
-- Table `Control`.`lineasEnvasado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Control`.`lineasEnvasado` ;

CREATE TABLE IF NOT EXISTS `Control`.`lineasEnvasado` (
  `idLineaEnvasado` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL,
  `createdAt` datetime DEFAULT NULL COMMENT 'created time',
  `updatedAt` datetime DEFAULT NULL COMMENT 'updated time',
  PRIMARY KEY (`idLineaEnvasado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Control`.`Controles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Control`.`Controles` ;

CREATE TABLE IF NOT EXISTS `Control`.`Controles` (
  `idControl` INT NOT NULL AUTO_INCREMENT,
  `controlNombre` VARCHAR(45) NULL,
  `idLineaEnvasado` INT NULL,
  `createdAt` datetime DEFAULT NULL COMMENT 'created time',
  `updatedAt` datetime DEFAULT NULL COMMENT 'updated time',
  PRIMARY KEY (`idControl`),
  CONSTRAINT `fk_Controles_lineasEnvasado1`
    FOREIGN KEY (`idLineaEnvasado`)
    REFERENCES `Control`.`lineasEnvasado` (`idLineaEnvasado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `controlID_UNIQUE` ON `Control`.`Controles` (`idControl` ASC) ;

CREATE INDEX `fk_Controles_lineasEnvasado1_idx` ON `Control`.`Controles` (`idLineaEnvasado` ASC) ;


-- -----------------------------------------------------
-- Table `Control`.`controlesDiarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Control`.`controlesDiarios` ;

CREATE TABLE IF NOT EXISTS `Control`.`controlesDiarios` (
  `idControlDiario` INT NOT NULL AUTO_INCREMENT,
  `idControl` INT NULL,
  `turno` INT NULL,
  `fecha` DATE NULL,
  `idEmpleado` INT NULL,
  `createdAt` datetime DEFAULT NULL COMMENT 'created time',
  `updatedAt` datetime DEFAULT NULL COMMENT 'updated time',
  PRIMARY KEY (`idControlDiario`),
  CONSTRAINT `fk_controlesDiarios_Controles1`
    FOREIGN KEY (`idControl`)
    REFERENCES `Control`.`Controles` (`idControl`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_controlesDiarios_Empleados1`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `Control`.`Empleados` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_controlesDiarios_Controles1_idx` ON `Control`.`controlesDiarios` (`idControl` ASC) ;

CREATE INDEX `fk_controlesDiarios_Empleados1_idx` ON `Control`.`controlesDiarios` (`idEmpleado` ASC) ;


-- -----------------------------------------------------
-- Table `Control`.`tarjetasControles`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `Control`.`tarjetasControles` ; 

CREATE TABLE IF NOT EXISTS `Control`.`tarjetasControles` (
  `idTarjetaControl` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL,
  `horaTarea` VARCHAR(45) NULL,
  `hora` INT NULL,
  `resultado` VARCHAR(12) NULL,
  `observaciones` VARCHAR(45) NULL,
  `idControlDiario` INT NULL,
  `enHora` BIT(1) NULL,
  `fechaHoraControl` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL COMMENT 'created time',
  `updatedAt` datetime DEFAULT NULL COMMENT 'updated time',
  PRIMARY KEY (`idTarjetaControl`),
  CONSTRAINT `fk_tarjetasControles_controlesDiarios1`
    FOREIGN KEY (`idControlDiario`)
    REFERENCES `Control`.`controlesDiarios` (`idControlDiario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_tarjetasControles_controlesDiarios1_idx` ON `Control`.`tarjetasControles` (`idControlDiario` ASC) ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `BoostWear` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `BoostWear` ;

-- -----------------------------------------------------
-- Table `BoostWear`.`Cliente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `BoostWear`.`Cliente` (
  `idCliente` INT NULL ,
  `nome_cliente` VARCHAR(90) NOT NULL ,
  `telefone_cliente` VARCHAR(45) NULL ,
  `senha_cliente` VARCHAR(45) NOT NULL ,
  `email_cliente` VARCHAR(45) NULL ,
  `user_cliente` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idCliente`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BoostWear`.`Vendedor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `BoostWear`.`Vendedor` (
  `idVendedor` INT NOT NULL ,
  `nome_vendedor` VARCHAR(90) NOT NULL ,
  `telefone_vendedor` VARCHAR(45) NULL ,
  `senha_vendedor` VARCHAR(45) NOT NULL ,
  `email_vendedor` VARCHAR(45) NULL ,
  `cnpj` INT NOT NULL ,
  `endereco` VARCHAR(45) NULL ,
  `user_vendedor` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idVendedor`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BoostWear`.`Produto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `BoostWear`.`Produto` (
  `idProduto` INT NOT NULL ,
  `nome_produto` VARCHAR(45) NOT NULL ,
  `descricao` VARCHAR(250) NOT NULL ,
  `quantidade` INT NULL ,
  `genero` VARCHAR(45) NULL ,
  `tamanho` VARCHAR(45) NOT NULL ,
  `preco` DECIMAL(10,2) NOT NULL ,
  `Vendedor_id` INT NOT NULL ,
  PRIMARY KEY (`idProduto`) ,
  INDEX `fk_Produto_Vendedor2_idx` (`Vendedor_id` ASC) ,
  CONSTRAINT `fk_Produto_Vendedor2`
    FOREIGN KEY (`Vendedor_id` )
    REFERENCES `BoostWear`.`Vendedor` (`idVendedor` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BoostWear`.`Cor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `BoostWear`.`Cor` (
  `idCor` INT NOT NULL ,
  `nome_cor` VARCHAR(45) NULL ,
  `Produto_id` INT NOT NULL ,
  PRIMARY KEY (`idCor`) ,
  INDEX `fk_Cor_Produto1_idx` (`Produto_id` ASC) ,
  CONSTRAINT `fk_Cor_Produto1`
    FOREIGN KEY (`Produto_id` )
    REFERENCES `BoostWear`.`Produto` (`idProduto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BoostWear`.`Estacao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `BoostWear`.`Estacao` (
  `idEstacao` INT NOT NULL ,
  `nome_estacao` VARCHAR(45) NULL ,
  `Produto_id` INT NOT NULL ,
  PRIMARY KEY (`idEstacao`) ,
  INDEX `fk_Estacao_Produto1_idx` (`Produto_id` ASC) ,
  CONSTRAINT `fk_Estacao_Produto1`
    FOREIGN KEY (`Produto_id` )
    REFERENCES `BoostWear`.`Produto` (`idProduto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BoostWear`.`Material`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `BoostWear`.`Material` (
  `idMaterial` INT NOT NULL ,
  `nome_material` VARCHAR(45) NULL ,
  `Produto_id` INT NOT NULL ,
  PRIMARY KEY (`idMaterial`) ,
  INDEX `fk_Material_Produto1_idx` (`Produto_id` ASC) ,
  CONSTRAINT `fk_Material_Produto1`
    FOREIGN KEY (`Produto_id` )
    REFERENCES `BoostWear`.`Produto` (`idProduto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BoostWear`.`Tipo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `BoostWear`.`Tipo` (
  `idTipo` INT NOT NULL ,
  `tipo_roupa` VARCHAR(45) NULL ,
  `Produto_id` INT NOT NULL ,
  PRIMARY KEY (`idTipo`) ,
  INDEX `fk_Tipo_Produto1_idx` (`Produto_id` ASC) ,
  CONSTRAINT `fk_Tipo_Produto1`
    FOREIGN KEY (`Produto_id` )
    REFERENCES `BoostWear`.`Produto` (`idProduto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BoostWear`.`Img`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `BoostWear`.`Img` (
  `idImg` INT NOT NULL ,
  `img_local` VARCHAR(90) NULL ,
  `Produto_id` INT NOT NULL ,
  PRIMARY KEY (`idImg`) ,
  INDEX `fk_Img_Produto1_idx` (`Produto_id` ASC) ,
  CONSTRAINT `fk_Img_Produto1`
    FOREIGN KEY (`Produto_id` )
    REFERENCES `BoostWear`.`Produto` (`idProduto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BoostWear`.`Avaliacao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `BoostWear`.`Avaliacao` (
  `idAvaliacao` INT NOT NULL ,
  `avaliação_p` VARCHAR(45) NULL ,
  `avaliacao_v` INT NULL ,
  `Produto_id` INT NOT NULL ,
  `Vendedor_id` INT NOT NULL ,
  `Cliente_id` INT NOT NULL ,
  PRIMARY KEY (`idAvaliacao`) ,
  INDEX `fk_Avaliacao_Produto1_idx` (`Produto_id` ASC) ,
  INDEX `fk_Avaliacao_Vendedor1_idx` (`Vendedor_id` ASC) ,
  INDEX `fk_Avaliacao_Cliente1_idx` (`Cliente_id` ASC) ,
  CONSTRAINT `fk_Avaliacao_Produto1`
    FOREIGN KEY (`Produto_id` )
    REFERENCES `BoostWear`.`Produto` (`idProduto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Avaliacao_Vendedor1`
    FOREIGN KEY (`Vendedor_id` )
    REFERENCES `BoostWear`.`Vendedor` (`idVendedor` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Avaliacao_Cliente1`
    FOREIGN KEY (`Cliente_id` )
    REFERENCES `BoostWear`.`Cliente` (`idCliente` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `BoostWear` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema alumnos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema alumnos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `alumnos` DEFAULT CHARACTER SET utf8mb3 ;
USE `alumnos` ;

-- -----------------------------------------------------
-- Table `alumnos`.`alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alumnos`.`alumnos` (
  `idAlumno` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Telefono` INT NOT NULL,
  `FechaNacimiento` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `idCuotas` INT NULL DEFAULT NULL,
  `Materias_idMaterias` INT NOT NULL,
  `Contrasena` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAlumno`, `Materias_idMaterias`),
  UNIQUE INDEX `idAlumno` (`idAlumno` ASC) VISIBLE,
  INDEX `fk_Alumnos_Materias1_idx` (`Materias_idMaterias` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `alumnos`.`tutores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alumnos`.`tutores` (
  `idTutores` INT NOT NULL,
  `RelAlumno` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTutores`),
  UNIQUE INDEX `idTutores_UNIQUE` (`idTutores` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `alumnos`.`alumnos_has_tutores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alumnos`.`alumnos_has_tutores` (
  `alumnos_idAlumno` INT NOT NULL,
  `alumnos_Materias_idMaterias` INT NOT NULL,
  `tutores_idTutores` INT NOT NULL,
  PRIMARY KEY (`alumnos_idAlumno`, `alumnos_Materias_idMaterias`, `tutores_idTutores`),
  INDEX `fk_alumnos_has_tutores_tutores1_idx` (`tutores_idTutores` ASC) VISIBLE,
  INDEX `fk_alumnos_has_tutores_alumnos1_idx` (`alumnos_idAlumno` ASC, `alumnos_Materias_idMaterias` ASC) VISIBLE,
  CONSTRAINT `fk_alumnos_has_tutores_alumnos1`
    FOREIGN KEY (`alumnos_idAlumno` , `alumnos_Materias_idMaterias`)
    REFERENCES `alumnos`.`alumnos` (`idAlumno` , `Materias_idMaterias`),
  CONSTRAINT `fk_alumnos_has_tutores_tutores1`
    FOREIGN KEY (`tutores_idTutores`)
    REFERENCES `alumnos`.`tutores` (`idTutores`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `alumnos`.`sesion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alumnos`.`sesion` (
  `idSesion` INT NOT NULL,
  `idCurso` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSesion`),
  UNIQUE INDEX `idAsistencia_UNIQUE` (`idSesion` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `alumnos`.`asistencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alumnos`.`asistencia` (
  `idAsistencia` INT NOT NULL,
  `idSesion` INT NOT NULL,
  `alumnos_idAlumno` INT NOT NULL,
  `alumnos_Materias_idMaterias` INT NOT NULL,
  `sesion_idSesion` INT NOT NULL,
  PRIMARY KEY (`idAsistencia`, `alumnos_idAlumno`, `alumnos_Materias_idMaterias`, `sesion_idSesion`),
  UNIQUE INDEX `idAsistencia_UNIQUE` (`idAsistencia` ASC) VISIBLE,
  INDEX `fk_asistencia_alumnos1_idx` (`alumnos_idAlumno` ASC, `alumnos_Materias_idMaterias` ASC) VISIBLE,
  INDEX `fk_asistencia_sesion1_idx` (`sesion_idSesion` ASC) VISIBLE,
  CONSTRAINT `fk_asistencia_alumnos1`
    FOREIGN KEY (`alumnos_idAlumno` , `alumnos_Materias_idMaterias`)
    REFERENCES `alumnos`.`alumnos` (`idAlumno` , `Materias_idMaterias`),
  CONSTRAINT `fk_asistencia_sesion1`
    FOREIGN KEY (`sesion_idSesion`)
    REFERENCES `alumnos`.`sesion` (`idSesion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `alumnos`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alumnos`.`curso` (
  `idCurso` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `idMaterias` INT NOT NULL,
  `CupoMax` INT NOT NULL,
  `Alumnos_idAlumno` INT NOT NULL,
  `Alumnos_Materias_idMaterias` INT NOT NULL,
  PRIMARY KEY (`idCurso`, `Alumnos_idAlumno`, `Alumnos_Materias_idMaterias`),
  UNIQUE INDEX `idCurso_UNIQUE` (`idCurso` ASC) VISIBLE,
  INDEX `fk_Curso_Alumnos1_idx` (`Alumnos_idAlumno` ASC, `Alumnos_Materias_idMaterias` ASC) VISIBLE,
  CONSTRAINT `fk_Curso_Alumnos1`
    FOREIGN KEY (`Alumnos_idAlumno` , `Alumnos_Materias_idMaterias`)
    REFERENCES `alumnos`.`alumnos` (`idAlumno` , `Materias_idMaterias`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `alumnos`.`profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alumnos`.`profesores` (
  `idProfesores` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `idMateria` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `FechaAlta` DATE NOT NULL,
  `Sueldo` DOUBLE NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProfesores`),
  UNIQUE INDEX `idProfesores_UNIQUE` (`idProfesores` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `alumnos`.`curso_has_profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alumnos`.`curso_has_profesores` (
  `Curso_idCurso` INT NOT NULL,
  `Curso_Alumnos_idAlumno` INT NOT NULL,
  `Curso_Alumnos_Materias_idMaterias` INT NOT NULL,
  `Profesores_idProfesores` INT NOT NULL,
  PRIMARY KEY (`Curso_idCurso`, `Curso_Alumnos_idAlumno`, `Curso_Alumnos_Materias_idMaterias`, `Profesores_idProfesores`),
  INDEX `fk_Curso_has_Profesores_Profesores1_idx` (`Profesores_idProfesores` ASC) VISIBLE,
  INDEX `fk_Curso_has_Profesores_Curso1_idx` (`Curso_idCurso` ASC, `Curso_Alumnos_idAlumno` ASC, `Curso_Alumnos_Materias_idMaterias` ASC) VISIBLE,
  CONSTRAINT `fk_Curso_has_Profesores_Curso1`
    FOREIGN KEY (`Curso_idCurso` , `Curso_Alumnos_idAlumno` , `Curso_Alumnos_Materias_idMaterias`)
    REFERENCES `alumnos`.`curso` (`idCurso` , `Alumnos_idAlumno` , `Alumnos_Materias_idMaterias`),
  CONSTRAINT `fk_Curso_has_Profesores_Profesores1`
    FOREIGN KEY (`Profesores_idProfesores`)
    REFERENCES `alumnos`.`profesores` (`idProfesores`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `alumnos`.`detallefactura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alumnos`.`detallefactura` (
  `idDetalleFactura` INT NOT NULL,
  `Descripcion` VARCHAR(45) NULL DEFAULT NULL,
  `PrecioUnitario` VARCHAR(45) NULL DEFAULT NULL,
  `Subtotal` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idDetalleFactura`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `alumnos`.`tipofactura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alumnos`.`tipofactura` (
  `idTipoFactura` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoFactura`),
  UNIQUE INDEX `Tipo_UNIQUE` (`idTipoFactura` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `alumnos`.`facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alumnos`.`facturas` (
  `idFactura` INT NOT NULL,
  `Fecha` DATE NOT NULL,
  `idNroFactura` INT NOT NULL,
  `TipoFactura_idTipoFactura` VARCHAR(45) NOT NULL,
  `Alumnos_idAlumno` INT NOT NULL,
  `Alumnos_Materias_idMaterias` INT NOT NULL,
  PRIMARY KEY (`idFactura`, `TipoFactura_idTipoFactura`, `Alumnos_idAlumno`, `Alumnos_Materias_idMaterias`),
  UNIQUE INDEX `idCuotas_UNIQUE` (`idFactura` ASC) VISIBLE,
  INDEX `fk_Facturas_TipoFactura1_idx` (`TipoFactura_idTipoFactura` ASC) VISIBLE,
  INDEX `fk_Facturas_Alumnos1_idx` (`Alumnos_idAlumno` ASC, `Alumnos_Materias_idMaterias` ASC) VISIBLE,
  CONSTRAINT `fk_Facturas_Alumnos1`
    FOREIGN KEY (`Alumnos_idAlumno` , `Alumnos_Materias_idMaterias`)
    REFERENCES `alumnos`.`alumnos` (`idAlumno` , `Materias_idMaterias`),
  CONSTRAINT `fk_Facturas_TipoFactura1`
    FOREIGN KEY (`TipoFactura_idTipoFactura`)
    REFERENCES `alumnos`.`tipofactura` (`idTipoFactura`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `alumnos`.`facturas_has_detallefactura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alumnos`.`facturas_has_detallefactura` (
  `Facturas_idFactura` INT NOT NULL,
  `DetalleFactura_idDetalleFactura` INT NOT NULL,
  PRIMARY KEY (`Facturas_idFactura`, `DetalleFactura_idDetalleFactura`),
  INDEX `fk_Facturas_has_DetalleFactura_DetalleFactura1_idx` (`DetalleFactura_idDetalleFactura` ASC) VISIBLE,
  INDEX `fk_Facturas_has_DetalleFactura_Facturas1_idx` (`Facturas_idFactura` ASC) VISIBLE,
  CONSTRAINT `fk_Facturas_has_DetalleFactura_DetalleFactura1`
    FOREIGN KEY (`DetalleFactura_idDetalleFactura`)
    REFERENCES `alumnos`.`detallefactura` (`idDetalleFactura`),
  CONSTRAINT `fk_Facturas_has_DetalleFactura_Facturas1`
    FOREIGN KEY (`Facturas_idFactura`)
    REFERENCES `alumnos`.`facturas` (`idFactura`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `alumnos`.`materias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alumnos`.`materias` (
  `idMaterias` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `idProfesor` VARCHAR(45) NOT NULL,
  `idCurso` VARCHAR(45) NOT NULL,
  `url` VARCHAR(45) NOT NULL,
  `profesores_idProfesores` INT NOT NULL,
  PRIMARY KEY (`idMaterias`, `profesores_idProfesores`),
  UNIQUE INDEX `idMaterias_UNIQUE` (`idMaterias` ASC) VISIBLE,
  INDEX `fk_materias_profesores1_idx` (`profesores_idProfesores` ASC) VISIBLE,
  CONSTRAINT `fk_materias_profesores1`
    FOREIGN KEY (`profesores_idProfesores`)
    REFERENCES `alumnos`.`profesores` (`idProfesores`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `alumnos`.`notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alumnos`.`notas` (
  `idNota` INT NOT NULL,
  `idAlumno` VARCHAR(45) NOT NULL,
  `idMateria` VARCHAR(45) NOT NULL,
  `Nota` INT NOT NULL,
  `Alumnos_idAlumno` INT NOT NULL,
  PRIMARY KEY (`idNota`, `Alumnos_idAlumno`),
  UNIQUE INDEX `idNotas_UNIQUE` (`idNota` ASC) VISIBLE,
  INDEX `idAlumno_idx` (`idAlumno` ASC) VISIBLE,
  INDEX `idMateria_idx` (`idMateria` ASC) VISIBLE,
  INDEX `fk_Notas_Alumnos1_idx` (`Alumnos_idAlumno` ASC) VISIBLE,
  CONSTRAINT `fk_Notas_Alumnos1`
    FOREIGN KEY (`Alumnos_idAlumno`)
    REFERENCES `alumnos`.`alumnos` (`idAlumno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- Insertar datos de ejemplo en la tabla "alumnos"
INSERT INTO `alumnos`.`alumnos` (`idAlumno`, `Nombre`, `Apellido`, `Telefono`, `FechaNacimiento`, `Direccion`, `idCuotas`, `Materias_idMaterias`, `Contrasena`) VALUES
(1, 'Juan', 'Pérez', 123456789, '1995-06-10', 'Calle Principal 123', 1, 101, 'contraseña123'),
(2, 'María', 'López', 987654321, '1998-03-25', 'Avenida Secundaria 456', 2, 102, 'claveSegura456'),
(3, 'Carlos', 'González', 555123456, '2000-12-15', 'Camino Terciario 789', NULL, 101, 'miClaveSegura');

-- Puedes agregar más registros según sea necesario

-- Insertar datos de ejemplo en la tabla "tutores"
INSERT INTO `alumnos`.`tutores` (`idTutores`, `RelAlumno`, `Nombre`, `Telefono`) VALUES
(1, 'Padre', 'Juan Pérez', '123-456-7890'),
(2, 'Madre', 'María López', '987-654-3210'),
(3, 'Tutor Legal', 'Carlos González', '555-123-4567');

-- Puedes agregar más registros según sea necesario

-- Insertar datos de ejemplo en la tabla "alumnos_has_tutores"
INSERT INTO `alumnos`.`alumnos_has_tutores` (`alumnos_idAlumno`, `alumnos_Materias_idMaterias`, `tutores_idTutores`) VALUES
(1, 101, 1), -- Juan Pérez (alumno) tiene como tutor al Padre Juan Pérez
(1, 101, 2), -- Juan Pérez (alumno) tiene como tutor a la Madre María López
(2, 102, 2), -- María López (alumna) tiene como tutor a la Madre María López
(3, 101, 3); -- Carlos González (alumno) tiene como tutor al Tutor Legal Carlos González

-- Puedes agregar más relaciones alumno-tutor según sea necesario

-- Insertar datos de ejemplo en la tabla "sesion"
INSERT INTO `alumnos`.`sesion` (`idSesion`, `idCurso`, `Estado`) VALUES
(1, 'Curso1', 'Activa'),
(2, 'Curso2', 'Inactiva'),
(3, 'Curso1', 'Activa'),
(4, 'Curso3', 'Inactiva');

-- Puedes agregar más sesiones con datos de ejemplo según sea necesario

-- Insertar datos de ejemplo en la tabla "asistencia"
INSERT INTO `alumnos`.`asistencia` (`idAsistencia`, `idSesion`, `alumnos_idAlumno`, `alumnos_Materias_idMaterias`, `sesion_idSesion`) VALUES
(1, 1, 1, 101, 1), -- Juan Pérez (alumno) asistió a la sesión 1 del Curso1
(2, 2, 2, 102, 2), -- María López (alumna) asistió a la sesión 2 del Curso2
(3, 1, 3, 101, 1), -- Carlos González (alumno) asistió a la sesión 1 del Curso1
(4, 3, 1, 101, 4); -- Juan Pérez (alumno) asistió a la sesión 4 del Curso3

-- Puedes agregar más registros de asistencia según sea necesario

-- Insert sample data into the materias table
INSERT INTO `alumnos`.`materias` (`idMaterias`, `Nombre`, `idProfesor`, `idCurso`, `url`, `profesores_idProfesores`)
VALUES
    (1, 'Matematica', 'P001', 'C101', 'https://example.com/math', 1),
    (2, 'Lengua', 'P002', 'C102', 'https://example.com/science', 2),
    (3, 'Sociales', 'P003', 'C103', 'https://example.com/history', 3),
    (4, 'Historia', 'P004', 'C104', 'https://example.com/english', 4);

-- You can add more records by following the same pattern

-- Insert sample data into the profesores table
INSERT INTO `alumnos`.`profesores` (`idProfesores`, `Nombre`, `idMateria`, `Telefono`, `FechaAlta`, `Sueldo`, `Direccion`, `Contraseña`)
VALUES
    (1, 'John Smith', 'M001', '123-456-7890', '2023-10-26', 50000.00, '123 Main St', 'password1'),
    (2, 'Alice Johnson', 'M002', '987-654-3210', '2023-10-26', 55000.00, '456 Elm St', 'password2'),
    (3, 'Bob Davis', 'M003', '555-123-7890', '2023-10-26', 48000.00, '789 Oak St', 'password3'),
    (4, 'Eve Wilson', 'M004', '111-222-3333', '2023-10-26', 60000.00, '101 Pine St', 'password4');

-- You can add more records by following the same pattern

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

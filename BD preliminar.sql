-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.7.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para reu_db
CREATE DATABASE IF NOT EXISTS `reu_db` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci */;
USE `reu_db`;

-- Volcando estructura para tabla reu_db.asignaturas
CREATE TABLE IF NOT EXISTS `asignaturas` (
  `Codigo_Asignatura` varchar(13) NOT NULL COMMENT 'Formato: FFF000 o FFFIII000 o FFF-FFFIII000',
  `Nombre_Asignatura` varchar(20) NOT NULL,
  `Carrera` varchar(13) NOT NULL COMMENT 'Formato: FFF000',
  `Trayecto` int(1) NOT NULL,
  `Sem/Trim` int(1) NOT NULL,
  `Valor_UC` int(2) NOT NULL COMMENT 'Valor de Unidades de Credito',
  PRIMARY KEY (`Codigo_Asignatura`),
  KEY `Carrera` (`Carrera`),
  CONSTRAINT `Carrera` FOREIGN KEY (`Carrera`) REFERENCES `carreras` (`Codigo_Carrera`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Volcando datos para la tabla reu_db.asignaturas: ~3 rows (aproximadamente)
REPLACE INTO `asignaturas` (`Codigo_Asignatura`, `Nombre_Asignatura`, `Carrera`, `Trayecto`, `Sem/Trim`, `Valor_UC`) VALUES
	('ACRE-001', 'Acreditables I', 'P-INF-2025', 1, 1, 25),
	('ING-001', 'Ingles 1', 'P-INF-2025', 1, 2, 30),
	('ING-002', 'Ingles II', 'P-INF-2025', 1, 2, 25);

-- Volcando estructura para tabla reu_db.aulas
CREATE TABLE IF NOT EXISTS `aulas` (
  `Nombre_Aula` varchar(12) NOT NULL COMMENT 'Ejemplo: Aula-01, Virtual-01 etc..',
  `Capacidad` int(2) NOT NULL,
  PRIMARY KEY (`Nombre_Aula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Volcando datos para la tabla reu_db.aulas: ~2 rows (aproximadamente)
REPLACE INTO `aulas` (`Nombre_Aula`, `Capacidad`) VALUES
	('Aula 05', 30),
	('Aula 08', 30),
	('Aula 11', 25),
	('Aula 12', 35);

-- Volcando estructura para tabla reu_db.calificaciones
CREATE TABLE IF NOT EXISTS `calificaciones` (
  `ID` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Cedula_Estudiante` varchar(8) NOT NULL,
  `Nombre_Estudiante` varchar(50) NOT NULL COMMENT 'Concatenacion de Nombres y Apellidos',
  `Carrera` varchar(13) NOT NULL,
  `Trayecto` int(1) NOT NULL,
  `Sem/Trim` int(1) NOT NULL,
  `Seccion` int(5) unsigned NOT NULL,
  `Unidad_Curricular` varchar(13) NOT NULL,
  `Cedula_Docente` varchar(8) NOT NULL,
  `Nombre_Docente` varchar(50) NOT NULL COMMENT 'Concatenacion de Nombres y Apellidos',
  `Estado` varchar(15) NOT NULL COMMENT 'Asistente, Cargando Notas, Inasistente',
  `Calificacion_Numerica` int(2) NOT NULL,
  `Calificacion_Cualitativa` varchar(9) NOT NULL COMMENT 'Aprobado o Reprobado',
  `Periodo_Academico` char(6) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_calificaciones_estudiantes` (`Cedula_Estudiante`),
  KEY `FK_calificaciones_carreras` (`Carrera`),
  KEY `FK_calificaciones_secciones` (`Seccion`),
  KEY `FK_calificaciones_asignaturas` (`Unidad_Curricular`),
  KEY `FK_calificaciones_docentes` (`Cedula_Docente`),
  KEY `FK_calificaciones_periodo_academico` (`Periodo_Academico`),
  CONSTRAINT `FK_calificaciones_asignaturas` FOREIGN KEY (`Unidad_Curricular`) REFERENCES `asignaturas` (`Codigo_Asignatura`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calificaciones_carreras` FOREIGN KEY (`Carrera`) REFERENCES `carreras` (`Codigo_Carrera`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calificaciones_docentes` FOREIGN KEY (`Cedula_Docente`) REFERENCES `docentes` (`Cedula`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calificaciones_estudiantes` FOREIGN KEY (`Cedula_Estudiante`) REFERENCES `estudiantes` (`Cedula`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calificaciones_periodo_academico` FOREIGN KEY (`Periodo_Academico`) REFERENCES `periodo_academico` (`Periodo_Academico`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calificaciones_secciones` FOREIGN KEY (`Seccion`) REFERENCES `secciones` (`Codigo_Seccion`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Volcando datos para la tabla reu_db.calificaciones: ~0 rows (aproximadamente)

-- Volcando estructura para tabla reu_db.carreras
CREATE TABLE IF NOT EXISTS `carreras` (
  `Codigo_Carrera` varchar(13) NOT NULL COMMENT 'Primera letra de Pensum y un guion. Primeras 3 letras de cada palabra en mayusculas seguido del año de registro. Formato P-FFF-0000 o tambien P-FFF-FFF-0000',
  `Nombre_Carrera` varchar(25) NOT NULL,
  `Tipo` varchar(10) NOT NULL COMMENT 'Semestral, Trimestral',
  `Estado` varchar(8) NOT NULL COMMENT 'Activa o Inactiva',
  `Total_UC` int(3) NOT NULL COMMENT 'Formato 000',
  PRIMARY KEY (`Codigo_Carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Volcando datos para la tabla reu_db.carreras: ~0 rows (aproximadamente)
REPLACE INTO `carreras` (`Codigo_Carrera`, `Nombre_Carrera`, `Tipo`, `Estado`, `Total_UC`) VALUES
	('P-INF-2025', 'Informatica', 'Semestral', 'Activa', 145);

-- Volcando estructura para tabla reu_db.docentes
CREATE TABLE IF NOT EXISTS `docentes` (
  `Cedula` varchar(8) NOT NULL,
  `Usuario` varchar(20) NOT NULL,
  `Nombres` varchar(25) NOT NULL,
  `Apellidos` varchar(25) NOT NULL,
  `Perfil_Profesional` varchar(50) DEFAULT NULL,
  `Tipo` varchar(15) DEFAULT NULL COMMENT 'Regular, Virtual',
  `Fecha_Registro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`Cedula`),
  KEY `FK_docentes_usuarios` (`Usuario`),
  CONSTRAINT `FK_docentes_usuarios` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`ID_Usuario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Volcando datos para la tabla reu_db.docentes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla reu_db.docente_asignatura
CREATE TABLE IF NOT EXISTS `docente_asignatura` (
  `ID` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Docente_Cedula` varchar(8) NOT NULL,
  `Docente_Nombre` varchar(50) NOT NULL,
  `Asignatura` varchar(13) NOT NULL,
  `Carrera` varchar(13) NOT NULL,
  `Trayecto` int(1) NOT NULL,
  `Sem/Trim` int(1) NOT NULL,
  `Seccion` int(5) unsigned NOT NULL,
  `Clases_Semana` int(11) NOT NULL,
  `Estado` varchar(25) NOT NULL COMMENT 'Cargado Correctamente, Cargado Incorrectamente',
  `Periodo_Academico` char(6) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_docente_asignatura_docentes` (`Docente_Cedula`),
  KEY `FK_docente_asignatura_asignaturas` (`Asignatura`),
  KEY `FK_docente_asignatura_carreras` (`Carrera`),
  KEY `FK_docente_asignatura_secciones` (`Seccion`),
  KEY `FK_docente_asignatura_periodo_academico` (`Periodo_Academico`),
  CONSTRAINT `FK_docente_asignatura_asignaturas` FOREIGN KEY (`Asignatura`) REFERENCES `asignaturas` (`Codigo_Asignatura`) ON UPDATE CASCADE,
  CONSTRAINT `FK_docente_asignatura_carreras` FOREIGN KEY (`Carrera`) REFERENCES `carreras` (`Codigo_Carrera`) ON UPDATE CASCADE,
  CONSTRAINT `FK_docente_asignatura_docentes` FOREIGN KEY (`Docente_Cedula`) REFERENCES `docentes` (`Cedula`) ON UPDATE CASCADE,
  CONSTRAINT `FK_docente_asignatura_periodo_academico` FOREIGN KEY (`Periodo_Academico`) REFERENCES `periodo_academico` (`Periodo_Academico`) ON UPDATE CASCADE,
  CONSTRAINT `FK_docente_asignatura_secciones` FOREIGN KEY (`Seccion`) REFERENCES `secciones` (`Codigo_Seccion`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='En esta tabla se asigna la asignatura que un docente registrado debera impartir en un periodo academico.';

-- Volcando datos para la tabla reu_db.docente_asignatura: ~0 rows (aproximadamente)

-- Volcando estructura para tabla reu_db.estudiantes
CREATE TABLE IF NOT EXISTS `estudiantes` (
  `Cedula` varchar(8) NOT NULL,
  `Usuario` varchar(20) NOT NULL,
  `Nombres` varchar(25) NOT NULL,
  `Apellidos` varchar(25) NOT NULL,
  `Carrera` varchar(13) DEFAULT NULL COMMENT 'Primeras 3 letras de cada palabra en mayusculas seguido de un numero secuencial entero de 3 en este formato FFF000 o tambien FFF-FFF000',
  `Estado_Pensum` varchar(17) DEFAULT NULL COMMENT 'Pensum Asignado, Pensum Pendiente',
  `Estado` varchar(15) DEFAULT NULL COMMENT 'Regular, Nuevo Ingreso',
  `Fecha_Registro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`Cedula`),
  KEY `FK_estudiantes_carreras` (`Carrera`),
  KEY `FK_estudiantes_usuarios` (`Usuario`),
  CONSTRAINT `FK_estudiantes_carreras` FOREIGN KEY (`Carrera`) REFERENCES `carreras` (`Codigo_Carrera`) ON UPDATE CASCADE,
  CONSTRAINT `FK_estudiantes_usuarios` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Volcando datos para la tabla reu_db.estudiantes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla reu_db.estudiante_periodo_academico
CREATE TABLE IF NOT EXISTS `estudiante_periodo_academico` (
  `ID` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Cedula_Estudiante` varchar(8) NOT NULL,
  `Estado` varchar(8) NOT NULL COMMENT 'Activo, Inactivo (Se añade automaticamente dependiendo del pago)',
  `Periodo_Academico` char(6) NOT NULL,
  `Carrera` varchar(13) NOT NULL,
  `Pago` varchar(16) NOT NULL COMMENT 'Pago Realizado, Pago Pendiente',
  `Monto_Pago` decimal(10,2) NOT NULL,
  `Moneda` varchar(4) NOT NULL DEFAULT 'Bs.' COMMENT 'Bs. o USD.',
  `Modalidad_Pago` varchar(50) NOT NULL COMMENT 'PagoMovil o Transferencia',
  `Entidad_Bancaria` varchar(50) NOT NULL,
  `Numero_Transferencia` bigint(12) NOT NULL,
  `Fecha_Pago` date NOT NULL,
  `Fecha_Registro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `FK_estudiante_periodo_academico_estudiantes` (`Cedula_Estudiante`),
  KEY `FK_estudiante_periodo_academico_periodo_academico` (`Periodo_Academico`),
  KEY `FK_estudiante_periodo_academico_carreras` (`Carrera`),
  CONSTRAINT `FK_estudiante_periodo_academico_carreras` FOREIGN KEY (`Carrera`) REFERENCES `carreras` (`Codigo_Carrera`) ON UPDATE CASCADE,
  CONSTRAINT `FK_estudiante_periodo_academico_estudiantes` FOREIGN KEY (`Cedula_Estudiante`) REFERENCES `estudiantes` (`Cedula`) ON UPDATE CASCADE,
  CONSTRAINT `FK_estudiante_periodo_academico_periodo_academico` FOREIGN KEY (`Periodo_Academico`) REFERENCES `periodo_academico` (`Periodo_Academico`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Volcando datos para la tabla reu_db.estudiante_periodo_academico: ~0 rows (aproximadamente)

-- Volcando estructura para tabla reu_db.horas
CREATE TABLE IF NOT EXISTS `horas` (
  `Desde` time NOT NULL,
  `Hasta` time NOT NULL,
  PRIMARY KEY (`Desde`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Volcando datos para la tabla reu_db.horas: ~3 rows (aproximadamente)
REPLACE INTO `horas` (`Desde`, `Hasta`) VALUES
	('11:00:00', '16:00:00'),
	('14:00:00', '15:00:00'),
	('16:00:00', '21:00:00'),
	('18:00:00', '20:00:00');

-- Volcando estructura para tabla reu_db.periodo_academico
CREATE TABLE IF NOT EXISTS `periodo_academico` (
  `Periodo_Academico` char(6) NOT NULL COMMENT 'Año actual seguido de un guion y el semestre 1, o el 2 de esta forma: 0000-1',
  `Estado` varchar(8) NOT NULL DEFAULT 'Cursando' COMMENT 'Cursando o Cerrado. El valor se agrea automaticamente.',
  `Inicio` date NOT NULL,
  `Final` date NOT NULL,
  `Limite_UC` int(2) NOT NULL COMMENT 'Limite de creditos que los estudiantes pueden inscribir.',
  PRIMARY KEY (`Periodo_Academico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Volcando datos para la tabla reu_db.periodo_academico: ~0 rows (aproximadamente)

-- Volcando estructura para tabla reu_db.secciones
CREATE TABLE IF NOT EXISTS `secciones` (
  `Codigo_Seccion` int(5) unsigned NOT NULL COMMENT 'Formato: 00000. Seccion (000) trayecto (0) y semestre (0)',
  PRIMARY KEY (`Codigo_Seccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Volcando datos para la tabla reu_db.secciones: ~0 rows (aproximadamente)

-- Volcando estructura para tabla reu_db.solicitudes_tutor_externo
CREATE TABLE IF NOT EXISTS `solicitudes_tutor_externo` (
  `ID` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Cedula_Tutor` varchar(8) NOT NULL,
  `Nombre_Tutor` varchar(50) NOT NULL COMMENT 'Nombre Completo del Tutor',
  `Cedula_Solicitante` varchar(8) NOT NULL,
  `Nombre_Estudiante` varchar(50) NOT NULL,
  `Estado` varchar(12) NOT NULL DEFAULT 'Por Aprobar' COMMENT 'Por Aprobar, Aprobado, Rechazado',
  `Fecha_Solicitud` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `FK_solicitudes_tutor_externo_estudiantes` (`Cedula_Solicitante`),
  CONSTRAINT `FK_solicitudes_tutor_externo_estudiantes` FOREIGN KEY (`Cedula_Solicitante`) REFERENCES `estudiantes` (`Cedula`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Volcando datos para la tabla reu_db.solicitudes_tutor_externo: ~0 rows (aproximadamente)

-- Volcando estructura para tabla reu_db.solicitudes_tutor_interno
CREATE TABLE IF NOT EXISTS `solicitudes_tutor_interno` (
  `ID` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Cedula_Docente` varchar(8) NOT NULL,
  `Nombre_Docente` varchar(50) NOT NULL,
  `Cedula_Solicitante` varchar(8) NOT NULL,
  `Nombre_Estudiante` varchar(50) NOT NULL,
  `Estado` varchar(12) NOT NULL DEFAULT 'Por Aprobar' COMMENT 'Por Aprobar, Aprobado, Rechazado',
  `Fecha_Solicitud` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `FK_solicitudes_tutor_interno_estudiantes` (`Cedula_Solicitante`),
  KEY `Docentee` (`Cedula_Docente`),
  CONSTRAINT `Docentee` FOREIGN KEY (`Cedula_Docente`) REFERENCES `docentes` (`Cedula`) ON UPDATE CASCADE,
  CONSTRAINT `FK_solicitudes_tutor_interno_estudiantes` FOREIGN KEY (`Cedula_Solicitante`) REFERENCES `estudiantes` (`Cedula`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Volcando datos para la tabla reu_db.solicitudes_tutor_interno: ~0 rows (aproximadamente)

-- Volcando estructura para tabla reu_db.trabajo_investiacion
CREATE TABLE IF NOT EXISTS `trabajo_investiacion` (
  `ID` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Nombre_Investiacion` varchar(50) NOT NULL,
  `Carrera` varchar(13) NOT NULL,
  `Cedula_Estudiante` varchar(8) NOT NULL,
  `Nombre_Estudiante` varchar(50) NOT NULL,
  `Tutor_Cedula` varchar(8) NOT NULL,
  `Tutor_Nombre` varchar(50) NOT NULL,
  `Area_Interes` varchar(25) NOT NULL,
  `Periodo_Academico` char(6) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Periodo Academico` (`Periodo_Academico`),
  KEY `Estudiante` (`Cedula_Estudiante`),
  KEY `Relacion carreras` (`Carrera`),
  CONSTRAINT `Estudiante` FOREIGN KEY (`Cedula_Estudiante`) REFERENCES `estudiantes` (`Cedula`) ON UPDATE CASCADE,
  CONSTRAINT `Periodo Academico` FOREIGN KEY (`Periodo_Academico`) REFERENCES `periodo_academico` (`Periodo_Academico`) ON UPDATE CASCADE,
  CONSTRAINT `Relacion carreras` FOREIGN KEY (`Carrera`) REFERENCES `carreras` (`Codigo_Carrera`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Volcando datos para la tabla reu_db.trabajo_investiacion: ~0 rows (aproximadamente)

-- Volcando estructura para tabla reu_db.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `ID_Usuario` varchar(20) NOT NULL COMMENT 'Nombre de Usuario',
  `Password` varchar(300) NOT NULL,
  `Rol` varchar(20) NOT NULL COMMENT 'Administrador, Docente, Estudiante, Control_Estudios, Tutor_Externo, Administrativo',
  `Estado` varchar(13) NOT NULL COMMENT 'Habilitado o Deshabilitado',
  `Nombres` varchar(25) NOT NULL,
  `Apellidos` varchar(25) NOT NULL,
  `Genero` varchar(9) NOT NULL COMMENT 'Masculino o Femenino',
  `Residente` varchar(10) NOT NULL COMMENT 'Venezolano o Extranjero',
  `Cedula` varchar(8) NOT NULL COMMENT 'Numero de cedula sin signos',
  `Telefono_1` char(11) NOT NULL COMMENT 'Numero de contacto obliatorio',
  `Telefono_2` char(11) DEFAULT NULL COMMENT 'Opcional',
  `Correo` varchar(50) NOT NULL COMMENT 'Email obligatorio',
  `Direccion_Residencial` varchar(100) NOT NULL,
  `Codigo_Carnet` char(12) DEFAULT NULL COMMENT 'Se crea automaticamente',
  `Fecha_Registro` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Se inserta automaticamente',
  PRIMARY KEY (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Volcando datos para la tabla reu_db.usuarios: ~5 rows (aproximadamente)
REPLACE INTO `usuarios` (`ID_Usuario`, `Password`, `Rol`, `Estado`, `Nombres`, `Apellidos`, `Genero`, `Residente`, `Cedula`, `Telefono_1`, `Telefono_2`, `Correo`, `Direccion_Residencial`, `Codigo_Carnet`, `Fecha_Registro`) VALUES
	('DIRIARTE', 'ingdangelo2025', 'Administrador', 'Habilitado', 'Dangelo', 'Iriarte', '', '', '00000000', '00000000000', NULL, 'dangelo.iriarte@gmail.com', 'Caracas', NULL, '2025-02-28 06:28:38'),
	('DNLB1072', 'ingdaniel2025', 'Administrador', 'Habilitado', 'Jose', 'Betancourt', '', '', '30031724', '04125767988', NULL, 'josedanielbetancourt65@gmail.com', 'Caracas', NULL, '2025-02-28 06:13:25'),
	('GENESYSP718', 'inggenesis2025', 'Administrador', 'Habilitado', 'Genesis', 'Barrios', '', '', '00000000', '00000000000', NULL, 'genesysp718@gmail.com', 'Caracas', NULL, '2025-02-28 06:37:58'),
	('JONATHAV', 'ingjonathan2025', 'Administrador', 'Habilitado', 'Jonathan', 'Vargas', '', '', '00000000', '04268216907', NULL, 'jonathanalexvargas@gmail.com', 'Caracas', NULL, '2025-02-28 06:19:09'),
	('JUNIOR09', 'ingjunior2025', 'Administrador', 'Habilitado', 'Junior', 'Araque', '', '', '00000000', '00000000000', NULL, 'junioraraque09@gmail.com', 'Caracas', NULL, '2025-02-28 06:28:38');

-- Volcando estructura para disparador reu_db.codigo_carnet
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `codigo_carnet` BEFORE INSERT ON `usuarios` FOR EACH ROW BEGIN
  DECLARE nuevo_codigo VARCHAR(12);
  
    IF NEW.Rol = 'Estudiante' THEN
        SET nuevo_codigo = CONCAT('EST', LPAD(FLOOR(RAND() * 1000000000), 9, '0'));
        WHILE EXISTS (SELECT 1 FROM usuarios WHERE Codigo = nuevo_codigo) DO
            SET nuevo_codigo = CONCAT('EST', LPAD(FLOOR(RAND() * 1000000000), 9, '0'));
        END WHILE;
        SET NEW.Codigo_Carnet = nuevo_codigo;
        
    ELSEIF NEW.Rol = 'Docente' THEN
        SET nuevo_codigo = CONCAT('DTE', LPAD(FLOOR(RAND() * 1000000000), 9, '0'));
        WHILE EXISTS (SELECT 1 FROM usuarios WHERE Codigo = nuevo_codigo) DO
            SET nuevo_codigo = CONCAT('DTE', LPAD(FLOOR(RAND() * 1000000000), 9, '0'));
        END WHILE;
        SET NEW.Codigo_Carnet = nuevo_codigo;
        
    ELSE
        SET NEW.Codigo_Carnet = NULL; -- Dejar vacío si no es Estudiante ni Docente
    END IF;
    
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador reu_db.registro_estudiante_profesor
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `registro_estudiante_profesor` AFTER INSERT ON `usuarios` FOR EACH ROW BEGIN
IF NEW.Rol = 'Estudiante' THEN
INSERT INTO estudiantes (Usuario, Cedula, Nombres, Apellidos)
VALUES (NEW.ID_Usuario, NEW.Cedula, NEW.Nombres, NEW.Apellidos);
ELSEIF NEW.Rol = 'Docente' THEN
INSERT INTO docentes (Usuario, Cedula, Nombres, Apellidos)
VALUES (NEW.ID_Usuario, NEW.Cedula, NEW.Nombres, NEW.Apellidos);
END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

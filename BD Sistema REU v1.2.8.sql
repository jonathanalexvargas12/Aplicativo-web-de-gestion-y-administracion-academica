-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.7.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping data for table reu_db.asignaturas: ~0 rows (approximately)
REPLACE INTO `asignaturas` (`Codigo_Asignatura`, `Nombre_Asignatura`, `Carrera`, `Trayecto`, `Sem/Trim`, `Valor_UC`) VALUES
	('RED-001', 'Redes', 'P-INF-2025', 1, 3, 10);

-- Dumping data for table reu_db.aulas: ~6 rows (approximately)
REPLACE INTO `aulas` (`Nombre_Aula`, `Capacidad`) VALUES
	('Aula 04', 30),
	('Aula 05', 21),
	('Aula 08', 30),
	('Aula 11', 30),
	('Aula 111', 30),
	('Aula 12', 35);

-- Dumping data for table reu_db.calificaciones: ~0 rows (approximately)

-- Dumping data for table reu_db.carreras: ~0 rows (approximately)
REPLACE INTO `carreras` (`Codigo_Carrera`, `Nombre_Carrera`, `Tipo`, `Estado`, `Total_UC`) VALUES
	('P-INF-2025', 'Informatica', 'Semestral', 'Activa', 30);

-- Dumping data for table reu_db.docentes: ~0 rows (approximately)
REPLACE INTO `docentes` (`Cedula`, `Usuario`, `Nombres`, `Apellidos`, `Estado_Docente`, `Tipo`, `Fecha_Registro`) VALUES
	('12000111', 'DNLB1072', 'Daniel', 'Betancourt', 'activo', 'virtual', '2025-04-05 20:22:24');

-- Dumping data for table reu_db.docente_asignatura: ~0 rows (approximately)

-- Dumping data for table reu_db.estudiantes: ~2 rows (approximately)
REPLACE INTO `estudiantes` (`Cedula`, `Usuario`, `Nombres`, `Apellidos`, `Carrera`, `Estado_Pensum`, `Estado`, `Fecha_Registro`) VALUES
	('00000000', 'DNLB1072', 'Daniel', 'Betancourt', 'P-INF-2025', 'pendiente', 'nuevo-ingreso', '2025-04-05 15:53:38'),
	('11111111', 'JONATHAV', 'Jonathan', 'Vargas', 'P-INF-2025', 'asignado', 'regular', '2025-04-05 17:53:47');

-- Dumping data for table reu_db.estudiante_periodo_academico: ~0 rows (approximately)

-- Dumping data for table reu_db.horas: ~4 rows (approximately)
REPLACE INTO `horas` (`Desde`, `Hasta`) VALUES
	('11:00:00', '16:00:00'),
	('14:00:00', '15:00:00'),
	('16:00:00', '21:00:00'),
	('17:00:00', '20:00:00');

-- Dumping data for table reu_db.nivel_pensum: ~5 rows (approximately)
REPLACE INTO `nivel_pensum` (`Nombre_Nivel`, `Orden_Nivel`) VALUES
	('Cuarto Trimestre', 4),
	('Primer Trimestre', 1),
	('Quinto Trimestre', 5),
	('Segundo Trimestre', 2),
	('Tercer Trimestre', 3);

-- Dumping data for table reu_db.pensum: ~0 rows (approximately)

-- Dumping data for table reu_db.periodo_academico: ~6 rows (approximately)
REPLACE INTO `periodo_academico` (`Periodo_Academico`, `Estado`, `Inicio`, `Final`, `Limite_UC`) VALUES
	('2026-1', 'cursando', '2026-04-01', '2026-05-01', 25),
	('2027-1', 'cursando', '2027-04-12', '2027-09-12', 25),
	('2028-1', 'cerrado', '2025-04-16', '2025-08-20', 25),
	('2029-2', 'cursando', '2029-02-12', '2030-02-12', 25),
	('2030-1', 'cursando', '2030-03-22', '2030-03-30', 25),
	('2040-1', 'cursando', '2061-02-12', '2040-02-12', 30);

-- Dumping data for table reu_db.secciones: ~0 rows (approximately)
REPLACE INTO `secciones` (`Codigo_Seccion`) VALUES
	(30231);

-- Dumping data for table reu_db.solicitudes_tutor_externo: ~0 rows (approximately)

-- Dumping data for table reu_db.solicitudes_tutor_interno: ~0 rows (approximately)

-- Dumping data for table reu_db.trabajo_investigacion: ~0 rows (approximately)

-- Dumping data for table reu_db.usuarios: ~5 rows (approximately)
REPLACE INTO `usuarios` (`ID_Usuario`, `Password`, `Rol`, `Estado`, `Nombres`, `Apellidos`, `Genero`, `Residente`, `Cedula`, `Telefono_1`, `Telefono_2`, `Correo`, `Direccion_Residencial`, `Codigo_Carnet`, `Fecha_Registro`) VALUES
	('DIRIARTE', 'ingdangelo2025', 'Administrador', 'Habilitado', 'Dangelo', 'Iriarte', '', '', '00000000', '00000000000', NULL, 'dangelo.iriarte@gmail.com', 'Caracas', NULL, '2025-02-28 06:28:38'),
	('DNLB1072', 'ingdaniel2025', 'Administrador', 'Habilitado', 'Jose', 'Betancourt', '', '', '30031724', '04125767988', NULL, 'josedanielbetancourt65@gmail.com', 'Caracas', NULL, '2025-02-28 06:13:25'),
	('GENESYSP718', 'inggenesis2025', 'Administrador', 'Habilitado', 'Genesis', 'Barrios', '', '', '00000000', '00000000000', NULL, 'genesysp718@gmail.com', 'Caracas', NULL, '2025-02-28 06:37:58'),
	('JONATHAV', 'ingjonathan2025', 'Administrador', 'Habilitado', 'Jonathan', 'Vargas', '', '', '00000000', '04268216907', NULL, 'jonathanalexvargas@gmail.com', 'Caracas', NULL, '2025-02-28 06:19:09'),
	('JUNIOR09', 'ingjunior2025', 'Administrador', 'Habilitado', 'Junior', 'Araque', '', '', '00000000', '00000000000', NULL, 'junioraraque09@gmail.com', 'Caracas', NULL, '2025-02-28 06:28:38');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

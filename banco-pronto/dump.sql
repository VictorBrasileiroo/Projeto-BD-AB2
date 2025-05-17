-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: gestao_de_cuidados_idosos
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agendamento`
--

DROP TABLE IF EXISTS `agendamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_hora_inicio` datetime NOT NULL,
  `data_hora_fim` datetime NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `status_consulta` varchar(20) DEFAULT NULL,
  `id_cuidador` int DEFAULT NULL,
  `id_idoso` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cuidador` (`id_cuidador`),
  KEY `id_idoso` (`id_idoso`),
  CONSTRAINT `agendamento_ibfk_1` FOREIGN KEY (`id_cuidador`) REFERENCES `cuidador` (`id`),
  CONSTRAINT `agendamento_ibfk_2` FOREIGN KEY (`id_idoso`) REFERENCES `idoso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamento`
--

LOCK TABLES `agendamento` WRITE;
/*!40000 ALTER TABLE `agendamento` DISABLE KEYS */;
INSERT INTO `agendamento` VALUES (1,'2025-05-18 09:00:00','2025-05-19 09:00:00','Diária Completa','Pendente',1,1),(3,'2025-04-28 09:00:00','2025-04-29 09:00:00','Diária Completa','Concluido',1,5);
/*!40000 ALTER TABLE `agendamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `nota` int NOT NULL,
  `comentario` varchar(256) DEFAULT NULL,
  `id_cuidador` int DEFAULT NULL,
  `id_responsavel` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cuidador` (`id_cuidador`),
  KEY `id_responsavel` (`id_responsavel`),
  CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`id_cuidador`) REFERENCES `cuidador` (`id`),
  CONSTRAINT `avaliacao_ibfk_2` FOREIGN KEY (`id_responsavel`) REFERENCES `responsavel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` VALUES (1,'2025-04-18 09:00:00',5,'Ótima profissional',1,3),(2,'2025-06-01 19:00:00',4,'Muito atenciosa',3,4);
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato_cuidador`
--

DROP TABLE IF EXISTS `contato_cuidador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contato_cuidador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `telefone` varchar(20) DEFAULT NULL,
  `id_cuidador` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cuidador` (`id_cuidador`),
  CONSTRAINT `contato_cuidador_ibfk_1` FOREIGN KEY (`id_cuidador`) REFERENCES `cuidador` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato_cuidador`
--

LOCK TABLES `contato_cuidador` WRITE;
/*!40000 ALTER TABLE `contato_cuidador` DISABLE KEYS */;
INSERT INTO `contato_cuidador` VALUES (1,'82222293211',1),(2,'82988884444',3);
/*!40000 ALTER TABLE `contato_cuidador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato_responsavel`
--

DROP TABLE IF EXISTS `contato_responsavel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contato_responsavel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `telefone` varchar(20) DEFAULT NULL,
  `id_responsavel` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_responsavel` (`id_responsavel`),
  CONSTRAINT `contato_responsavel_ibfk_1` FOREIGN KEY (`id_responsavel`) REFERENCES `responsavel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato_responsavel`
--

LOCK TABLES `contato_responsavel` WRITE;
/*!40000 ALTER TABLE `contato_responsavel` DISABLE KEYS */;
INSERT INTO `contato_responsavel` VALUES (1,'82999993231',1),(2,'82223321311',3),(3,'82988887777',4),(5,'82988887777',4),(7,'82999991111',3),(8,'82999991111',4);
/*!40000 ALTER TABLE `contato_responsavel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuidador`
--

DROP TABLE IF EXISTS `cuidador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuidador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(256) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `registro_profissional` varchar(256) NOT NULL,
  `email` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuidador`
--

LOCK TABLES `cuidador` WRITE;
/*!40000 ALTER TABLE `cuidador` DISABLE KEYS */;
INSERT INTO `cuidador` VALUES (1,'Matheus Cabral','000.000.000-00','1231422-12','matheus@gmail.com'),(3,'Eliana Ramos','123.456.789-10','3221561-15','elina@eliana.com');
/*!40000 ALTER TABLE `cuidador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibilidade_cuidador`
--

DROP TABLE IF EXISTS `disponibilidade_cuidador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibilidade_cuidador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dia_semana` varchar(15) DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fim` time DEFAULT NULL,
  `id_cuidador` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cuidador` (`id_cuidador`),
  CONSTRAINT `disponibilidade_cuidador_ibfk_1` FOREIGN KEY (`id_cuidador`) REFERENCES `cuidador` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilidade_cuidador`
--

LOCK TABLES `disponibilidade_cuidador` WRITE;
/*!40000 ALTER TABLE `disponibilidade_cuidador` DISABLE KEYS */;
INSERT INTO `disponibilidade_cuidador` VALUES (1,'Segunda-feira','07:30:00','20:30:00',1),(2,'Quarta-feira','07:30:00','20:30:00',1),(3,'Sexta-feira','09:30:00','17:00:00',1),(4,'Terça-feira','08:00:00','18:00:00',3);
/*!40000 ALTER TABLE `disponibilidade_cuidador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_cuidador`
--

DROP TABLE IF EXISTS `endereco_cuidador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_cuidador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cep` varchar(9) DEFAULT NULL,
  `cidade` varchar(256) DEFAULT NULL,
  `bairro` varchar(256) DEFAULT NULL,
  `id_cuidador` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cuidador` (`id_cuidador`),
  CONSTRAINT `endereco_cuidador_ibfk_1` FOREIGN KEY (`id_cuidador`) REFERENCES `cuidador` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_cuidador`
--

LOCK TABLES `endereco_cuidador` WRITE;
/*!40000 ALTER TABLE `endereco_cuidador` DISABLE KEYS */;
INSERT INTO `endereco_cuidador` VALUES (1,'19864-821','Murici','Ouro Branco',1),(2,'57038-111','Maceió','Jatiúca',3);
/*!40000 ALTER TABLE `endereco_cuidador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_idoso`
--

DROP TABLE IF EXISTS `endereco_idoso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_idoso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cep` varchar(9) DEFAULT NULL,
  `cidade` varchar(256) DEFAULT NULL,
  `bairro` varchar(256) DEFAULT NULL,
  `id_idoso` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idoso` (`id_idoso`),
  CONSTRAINT `endereco_idoso_ibfk_1` FOREIGN KEY (`id_idoso`) REFERENCES `idoso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_idoso`
--

LOCK TABLES `endereco_idoso` WRITE;
/*!40000 ALTER TABLE `endereco_idoso` DISABLE KEYS */;
INSERT INTO `endereco_idoso` VALUES (1,'57044-878','Maceió','Barro Duro',1),(3,'17224-878','Recife','Nova Hortalândia',5);
/*!40000 ALTER TABLE `endereco_idoso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_responsavel`
--

DROP TABLE IF EXISTS `endereco_responsavel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_responsavel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cep` varchar(9) DEFAULT NULL,
  `cidade` varchar(256) DEFAULT NULL,
  `bairro` varchar(256) DEFAULT NULL,
  `id_responsavel` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_responsavel` (`id_responsavel`),
  CONSTRAINT `endereco_responsavel_ibfk_1` FOREIGN KEY (`id_responsavel`) REFERENCES `responsavel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_responsavel`
--

LOCK TABLES `endereco_responsavel` WRITE;
/*!40000 ALTER TABLE `endereco_responsavel` DISABLE KEYS */;
INSERT INTO `endereco_responsavel` VALUES (1,'57044-878','Maceió','Barro Duro',1),(2,'17224-878','Recife','Nova Hortalândia',3),(3,'57030-000','Maceió','Ponta Verde',5),(4,'57025-070','Maceió','Pajuçara',4);
/*!40000 ALTER TABLE `endereco_responsavel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidade_cuidador`
--

DROP TABLE IF EXISTS `especialidade_cuidador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidade_cuidador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `especialidade` varchar(256) DEFAULT NULL,
  `id_cuidador` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cuidador` (`id_cuidador`),
  CONSTRAINT `especialidade_cuidador_ibfk_1` FOREIGN KEY (`id_cuidador`) REFERENCES `cuidador` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidade_cuidador`
--

LOCK TABLES `especialidade_cuidador` WRITE;
/*!40000 ALTER TABLE `especialidade_cuidador` DISABLE KEYS */;
INSERT INTO `especialidade_cuidador` VALUES (1,'Enfermagem Dermatológica',1),(2,'Enfermagem em Assistência Domiciliária',1),(3,'Fisioterapia',3);
/*!40000 ALTER TABLE `especialidade_cuidador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idoso`
--

DROP TABLE IF EXISTS `idoso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idoso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(256) NOT NULL,
  `data_nascimento` date NOT NULL,
  `sexo` varchar(256) NOT NULL,
  `telefone_emergencia` varchar(20) DEFAULT NULL,
  `id_responsavel` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_responsavel` (`id_responsavel`),
  CONSTRAINT `idoso_ibfk_1` FOREIGN KEY (`id_responsavel`) REFERENCES `responsavel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idoso`
--

LOCK TABLES `idoso` WRITE;
/*!40000 ALTER TABLE `idoso` DISABLE KEYS */;
INSERT INTO `idoso` VALUES (1,'Aldo Alvez','1969-12-02','Masculino','82998213221',1),(5,'Marcio Luiz','1932-11-22','Masculino','82933213221',3);
/*!40000 ALTER TABLE `idoso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsavel`
--

DROP TABLE IF EXISTS `responsavel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsavel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(256) NOT NULL,
  `parentesco` varchar(256) NOT NULL,
  `email` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsavel`
--

LOCK TABLES `responsavel` WRITE;
/*!40000 ALTER TABLE `responsavel` DISABLE KEYS */;
INSERT INTO `responsavel` VALUES (1,'João Marques','Filho','joao@joao.com'),(3,'Maria José','Esposa','maria@maria.com'),(4,'Pedro Silva','Neto','pedro@familia.com'),(5,'Carla Teles','Filha','carla@teles.com'),(6,'Pedro Silva','Neto','pedro@familia.com'),(7,'Carla Teles','Sobrinha','carla@teles.com');
/*!40000 ALTER TABLE `responsavel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-17 17:27:52

/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: gest_sec
-- ------------------------------------------------------
-- Server version	11.8.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `DISPOSITIVO_MEDICO`
--

DROP TABLE IF EXISTS `DISPOSITIVO_MEDICO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DISPOSITIVO_MEDICO` (
  `id_dispositivo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  `fabricante` varchar(100) DEFAULT NULL,
  `versao_firmware` varchar(50) DEFAULT NULL,
  `status_seguranca` varchar(50) DEFAULT NULL,
  `id_fornecedor` int(11) NOT NULL,
  PRIMARY KEY (`id_dispositivo`),
  KEY `id_fornecedor` (`id_fornecedor`),
  CONSTRAINT `DISPOSITIVO_MEDICO_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `FORNECEDOR` (`id_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DISPOSITIVO_MEDICO`
--

LOCK TABLES `DISPOSITIVO_MEDICO` WRITE;
/*!40000 ALTER TABLE `DISPOSITIVO_MEDICO` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `DISPOSITIVO_MEDICO` VALUES
(1,'Bomba de Infusão','MediTech','v1.2.3','Em conformidade',1),
(2,'Monitor Cardíaco','HealthSecure','v2.1.0','Atualização pendente',2),
(3,'Ventilador Pulmonar','BioSafe','v1.0.5','Vulnerável',3),
(4,'Seringa Automática','VidaTech','v3.3.2','Em conformidade',4),
(5,'Monitor de Pressão','SafeMedical','v1.5.1','Atualização pendente',5);
/*!40000 ALTER TABLE `DISPOSITIVO_MEDICO` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `FORNECEDOR`
--

DROP TABLE IF EXISTS `FORNECEDOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FORNECEDOR` (
  `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `nivel_risco` varchar(50) DEFAULT NULL,
  `data_ultima_auditoria` date DEFAULT NULL,
  PRIMARY KEY (`id_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FORNECEDOR`
--

LOCK TABLES `FORNECEDOR` WRITE;
/*!40000 ALTER TABLE `FORNECEDOR` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `FORNECEDOR` VALUES
(1,'MediTech Solutions','Alto','2025-01-15'),
(2,'HealthSecure','Médio','2025-02-10'),
(3,'BioSafe Equipamentos','Baixo','2025-03-20'),
(4,'VidaTech','Alto','2024-12-05'),
(5,'SafeMedical','Médio','2025-01-30');
/*!40000 ALTER TABLE `FORNECEDOR` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `INCIDENTE`
--

DROP TABLE IF EXISTS `INCIDENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `INCIDENTE` (
  `id_incidente` int(11) NOT NULL AUTO_INCREMENT,
  `data_hora` timestamp NULL DEFAULT NULL,
  `severidade` varchar(50) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `dados_pessoais_afetados` tinyint(1) DEFAULT NULL,
  `id_dispositivo` int(11) NOT NULL,
  PRIMARY KEY (`id_incidente`),
  KEY `id_dispositivo` (`id_dispositivo`),
  CONSTRAINT `INCIDENTE_ibfk_1` FOREIGN KEY (`id_dispositivo`) REFERENCES `DISPOSITIVO_MEDICO` (`id_dispositivo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INCIDENTE`
--

LOCK TABLES `INCIDENTE` WRITE;
/*!40000 ALTER TABLE `INCIDENTE` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `INCIDENTE` VALUES
(1,'2025-07-03 01:37:20','Alta','Ransomware','Em andamento',1,1),
(2,'2025-07-03 01:37:20','Média','Acesso não autorizado','Resolvido',0,2),
(3,'2025-07-03 01:37:20','Alta','Falha de segurança','Em análise',1,3),
(4,'2025-07-03 01:37:20','Baixa','Tentativa de intrusão','Resolvido',0,4),
(5,'2025-07-03 01:37:20','Alta','Ransomware','Em andamento',1,5);
/*!40000 ALTER TABLE `INCIDENTE` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `LOG`
--

DROP TABLE IF EXISTS `LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOG` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `data_hora` timestamp NULL DEFAULT NULL,
  `origem` varchar(100) DEFAULT NULL,
  `tipo_evento` varchar(50) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `hash_criptografico` varchar(100) DEFAULT NULL,
  `id_dispositivo` int(11) NOT NULL,
  PRIMARY KEY (`id_log`),
  KEY `id_dispositivo` (`id_dispositivo`),
  CONSTRAINT `LOG_ibfk_1` FOREIGN KEY (`id_dispositivo`) REFERENCES `DISPOSITIVO_MEDICO` (`id_dispositivo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOG`
--

LOCK TABLES `LOG` WRITE;
/*!40000 ALTER TABLE `LOG` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `LOG` VALUES
(1,'2025-07-03 01:37:20','192.168.0.10','Acesso','Acesso autorizado ao dispositivo','abc123hash',1),
(2,'2025-07-03 01:37:20','192.168.0.11','Falha','Falha de autenticação','def456hash',2),
(3,'2025-07-03 01:37:20','192.168.0.12','Acesso','Acesso autorizado ao dispositivo','ghi789hash',3),
(4,'2025-07-03 01:37:20','192.168.0.13','Alerta','Tentativa de acesso não autorizado','jkl012hash',4),
(5,'2025-07-03 01:37:20','192.168.0.14','Falha','Erro no sistema de segurança','mno345hash',5);
/*!40000 ALTER TABLE `LOG` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `RESPOSTA_INCIDENTE`
--

DROP TABLE IF EXISTS `RESPOSTA_INCIDENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESPOSTA_INCIDENTE` (
  `id_resposta` int(11) NOT NULL AUTO_INCREMENT,
  `acao` varchar(100) DEFAULT NULL,
  `data_hora` timestamp NULL DEFAULT NULL,
  `responsavel` varchar(100) DEFAULT NULL,
  `tempo_resposta` time DEFAULT NULL,
  `id_incidente` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_resposta`),
  KEY `id_incidente` (`id_incidente`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `RESPOSTA_INCIDENTE_ibfk_1` FOREIGN KEY (`id_incidente`) REFERENCES `INCIDENTE` (`id_incidente`),
  CONSTRAINT `RESPOSTA_INCIDENTE_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `USUARIO` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESPOSTA_INCIDENTE`
--

LOCK TABLES `RESPOSTA_INCIDENTE` WRITE;
/*!40000 ALTER TABLE `RESPOSTA_INCIDENTE` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `RESPOSTA_INCIDENTE` VALUES
(1,'Isolamento do dispositivo','2025-07-03 01:37:20','Ana Souza','00:30:00',1,1),
(2,'Reset de credenciais','2025-07-03 01:37:20','Bruno Lima','00:15:00',2,2),
(3,'Atualização de firmware','2025-07-03 01:37:20','Carla Mendes','01:00:00',3,3),
(4,'Monitoramento contínuo','2025-07-03 01:37:20','Diego Alves','00:45:00',4,4),
(5,'Isolamento do dispositivo','2025-07-03 01:37:20','Eduarda Reis','00:35:00',5,5);
/*!40000 ALTER TABLE `RESPOSTA_INCIDENTE` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `USUARIO`
--

DROP TABLE IF EXISTS `USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USUARIO` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nivel_acesso` varchar(50) DEFAULT NULL,
  `departamento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO`
--

LOCK TABLES `USUARIO` WRITE;
/*!40000 ALTER TABLE `USUARIO` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `USUARIO` VALUES
(1,'Ana Souza','ana.souza@hospital.com','Administrador','TI'),
(2,'Bruno Lima','bruno.lima@hospital.com','Analista','Segurança'),
(3,'Carla Mendes','carla.mendes@hospital.com','Técnico','Suporte'),
(4,'Diego Alves','diego.alves@hospital.com','Supervisor','TI'),
(5,'Eduarda Reis','eduarda.reis@hospital.com','Analista','Segurança');
/*!40000 ALTER TABLE `USUARIO` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `USUARIO_INCIDENTE`
--

DROP TABLE IF EXISTS `USUARIO_INCIDENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USUARIO_INCIDENTE` (
  `id_usuario` int(11) NOT NULL,
  `id_incidente` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_incidente`),
  KEY `id_incidente` (`id_incidente`),
  CONSTRAINT `USUARIO_INCIDENTE_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `USUARIO` (`id_usuario`),
  CONSTRAINT `USUARIO_INCIDENTE_ibfk_2` FOREIGN KEY (`id_incidente`) REFERENCES `INCIDENTE` (`id_incidente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO_INCIDENTE`
--

LOCK TABLES `USUARIO_INCIDENTE` WRITE;
/*!40000 ALTER TABLE `USUARIO_INCIDENTE` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `USUARIO_INCIDENTE` VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);
/*!40000 ALTER TABLE `USUARIO_INCIDENTE` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-07-02 23:48:16

-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: Istituto
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `associa`
--

DROP TABLE IF EXISTS `associa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `associa` (
  `nomeScuola` varchar(20) NOT NULL,
  `gradoScuola` varchar(20) NOT NULL,
  `nomeIstituto` varchar(100) NOT NULL,
  `indirizzoPlesso` varchar(50) NOT NULL,
  PRIMARY KEY (`nomeScuola`,`gradoScuola`,`nomeIstituto`,`indirizzoPlesso`),
  KEY `scuola.istituo_idx` (`nomeIstituto`),
  KEY `scuola.grado_idx` (`gradoScuola`),
  KEY `plesso.indirizzo_idx` (`indirizzoPlesso`),
  CONSTRAINT `plesso.indirizzo` FOREIGN KEY (`indirizzoPlesso`) REFERENCES `plesso` (`indirizzo`),
  CONSTRAINT `scuola.grado` FOREIGN KEY (`gradoScuola`) REFERENCES `scuola` (`grado`),
  CONSTRAINT `scuola.istituto` FOREIGN KEY (`nomeIstituto`) REFERENCES `scuola` (`istituto`),
  CONSTRAINT `scuola.nome` FOREIGN KEY (`nomeScuola`) REFERENCES `scuola` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabella che associa le scuole ai plessi';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associa`
--

LOCK TABLES `associa` WRITE;
/*!40000 ALTER TABLE `associa` DISABLE KEYS */;
/*!40000 ALTER TABLE `associa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aula` (
  `codice_aula` varchar(10) NOT NULL COMMENT 'Codice identificativo dell''aula.',
  `indirizzo` varchar(50) NOT NULL,
  `fascia_di_età_iniziale` int unsigned NOT NULL COMMENT 'Età minima degli studenti che possono stare in una determinata aula.',
  `fascia_di_età_finale` int unsigned NOT NULL COMMENT 'Età massima degli studenti che possono stare in una determinata aula.',
  `metri_quadrati` double unsigned NOT NULL COMMENT 'Unità di misura che indica la grandezza dell''aula.',
  `studentiOspitabili` int unsigned NOT NULL,
  PRIMARY KEY (`codice_aula`),
  KEY `aula.IndirizzoPlesso_idx` (`indirizzo`),
  CONSTRAINT `aula.IndirizzoPlesso` FOREIGN KEY (`indirizzo`) REFERENCES `plesso` (`indirizzo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Locale in cui si tengono le lezioni scolastiche';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula`
--

LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
INSERT INTO `aula` VALUES ('A000','indirizzo0',3,5,40,4),('A001','indirizzo0',3,5,40,4),('A002','indirizzo2',3,5,40,4),('B000','indirizzo1',6,10,45,5),('B001','indirizzo1',6,10,45,5),('B002','indirizzo1',6,10,45,5),('B003','indirizzo1',6,10,45,5),('B004','indirizzo1',6,10,45,5),('C000','indirizzo2',11,14,50,5),('C001','indirizzo2',11,14,50,6),('C002','indirizzo2',11,14,50,5);
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classe`
--

DROP TABLE IF EXISTS `classe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classe` (
  `codice` varchar(20) NOT NULL,
  `nomeIstituto` varchar(100) NOT NULL,
  `gradoScuola` varchar(20) NOT NULL,
  `nomeScuola` varchar(20) NOT NULL,
  `annoScolastico` int NOT NULL,
  `aula` varchar(45) NOT NULL,
  `totStudenti` int NOT NULL,
  PRIMARY KEY (`codice`,`nomeIstituto`,`gradoScuola`,`nomeScuola`,`annoScolastico`),
  KEY `nomeScuola` (`nomeScuola`),
  KEY `gradoScuola` (`gradoScuola`),
  KEY `nomeIstituto` (`nomeIstituto`),
  KEY `aula` (`aula`),
  KEY `annoScolastico` (`annoScolastico`),
  CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`nomeScuola`) REFERENCES `scuola` (`nome`),
  CONSTRAINT `classe_ibfk_2` FOREIGN KEY (`gradoScuola`) REFERENCES `scuola` (`grado`),
  CONSTRAINT `classe_ibfk_3` FOREIGN KEY (`nomeIstituto`) REFERENCES `istituto_comprensivo` (`nome_istituto`),
  CONSTRAINT `classe_ibfk_4` FOREIGN KEY (`aula`) REFERENCES `aula` (`codice_aula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classe`
--

LOCK TABLES `classe` WRITE;
/*!40000 ALTER TABLE `classe` DISABLE KEYS */;
INSERT INTO `classe` VALUES ('1-A','Unical','infanzia','Scuola0',2012,'A000',1),('1-A','Unical','infanzia','Scuola0',2020,'A000',1),('1-B','Unical','primaria','Scuola1',2015,'B000',5),('1-C','Unical','secondaria','Scuola2',2020,'C000',2),('2-A','Unical','infanzia','Scuola0',2020,'A001',0),('3-A','Unical','infanzia','Scuola0',2020,'A002',0);
/*!40000 ALTER TABLE `classe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genitore`
--

DROP TABLE IF EXISTS `genitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genitore` (
  `codiceFiscale` varchar(20) NOT NULL,
  PRIMARY KEY (`codiceFiscale`),
  CONSTRAINT `g.codiceFiscale` FOREIGN KEY (`codiceFiscale`) REFERENCES `persona` (`codiceFiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genitore`
--

LOCK TABLES `genitore` WRITE;
/*!40000 ALTER TABLE `genitore` DISABLE KEYS */;
INSERT INTO `genitore` VALUES ('G000'),('G001'),('G002');
/*!40000 ALTER TABLE `genitore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `infoplesso`
--

DROP TABLE IF EXISTS `infoplesso`;
/*!50001 DROP VIEW IF EXISTS `infoplesso`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `infoplesso` AS SELECT 
 1 AS `indirizzoPlesso`,
 1 AS `nomePlesso`,
 1 AS `numStudenti`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `infoscuola`
--

DROP TABLE IF EXISTS `infoscuola`;
/*!50001 DROP VIEW IF EXISTS `infoscuola`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `infoscuola` AS SELECT 
 1 AS `nomeScuola`,
 1 AS `annoScolastico`,
 1 AS `numStudenti`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `insegna`
--

DROP TABLE IF EXISTS `insegna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insegna` (
  `cfInsegnante` varchar(20) NOT NULL,
  `istitutoClasse` varchar(100) NOT NULL,
  `nomeScuola` varchar(20) NOT NULL,
  `gradoScuola` varchar(20) NOT NULL,
  `codiceClasse` varchar(45) NOT NULL,
  `oreSettimanali` int NOT NULL,
  `annoS` int NOT NULL,
  PRIMARY KEY (`cfInsegnante`,`istitutoClasse`,`nomeScuola`,`gradoScuola`,`annoS`,`codiceClasse`),
  KEY `insegna.istituto_idx` (`istitutoClasse`),
  KEY `insegna.grado_idx` (`gradoScuola`),
  KEY `insegna.codiceClasse_idx` (`codiceClasse`),
  KEY `insegna.codiceFiscale_idx` (`cfInsegnante`),
  KEY `insegna.annoScolastico_idx` (`annoS`),
  KEY `insegna.scuola_idx` (`nomeScuola`),
  CONSTRAINT `insegna.anno` FOREIGN KEY (`annoS`) REFERENCES `classe` (`annoScolastico`),
  CONSTRAINT `insegna.codiceClasse` FOREIGN KEY (`codiceClasse`) REFERENCES `classe` (`codice`),
  CONSTRAINT `insegna.codiceFiscale` FOREIGN KEY (`cfInsegnante`) REFERENCES `insegnante` (`codiceFiscale`),
  CONSTRAINT `insegna.grado` FOREIGN KEY (`gradoScuola`) REFERENCES `classe` (`gradoScuola`),
  CONSTRAINT `insegna.istituto` FOREIGN KEY (`istitutoClasse`) REFERENCES `istituto_comprensivo` (`nome_istituto`),
  CONSTRAINT `insegna.scuola` FOREIGN KEY (`nomeScuola`) REFERENCES `classe` (`nomeScuola`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insegna`
--

LOCK TABLES `insegna` WRITE;
/*!40000 ALTER TABLE `insegna` DISABLE KEYS */;
INSERT INTO `insegna` VALUES ('P000','Unical','Scuola0','infanzia','1-A',5,2020),('P000','Unical','Scuola0','infanzia','2-A',15,2020);
/*!40000 ALTER TABLE `insegna` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insegna_BEFORE_INSERT` BEFORE INSERT ON `insegna` FOR EACH ROW BEGIN

DECLARE MESSAGE_TEXT varchar(200);
DECLARE somma  int;
 declare oreTotali int;
 Set somma = (Select SUM(oreSettimanali) From Insegna Where cfInsegnante=new.cfInsegnante);
 Set oreTotali = (Select oreTotaliSettimanali From insegnante where codiceFiscale = new.cfInsegnante);
 if (somma + new.oreSettimanali > oreTotali) then
	 SIGNAL SQLSTATE '44000' SET MESSAGE_TEXT = 'Ore totali superate';	
	end if;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `insegnante`
--

DROP TABLE IF EXISTS `insegnante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insegnante` (
  `codiceFiscale` varchar(20) NOT NULL,
  `oreTotaliSettimanali` int unsigned NOT NULL,
  PRIMARY KEY (`codiceFiscale`),
  CONSTRAINT `i.codiceFiscale` FOREIGN KEY (`codiceFiscale`) REFERENCES `persona` (`codiceFiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insegnante`
--

LOCK TABLES `insegnante` WRITE;
/*!40000 ALTER TABLE `insegnante` DISABLE KEYS */;
INSERT INTO `insegnante` VALUES ('P000',20),('P001',20),('P002',30);
/*!40000 ALTER TABLE `insegnante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iscrizione`
--

DROP TABLE IF EXISTS `iscrizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iscrizione` (
  `codiceFiscaleGenitore` varchar(20) NOT NULL,
  `codiceFiscaleStudente` varchar(20) NOT NULL,
  `codiceClasse` varchar(3) NOT NULL,
  `gradoScuola` varchar(20) NOT NULL,
  `nomeScuola` varchar(20) NOT NULL,
  `nomeIstituto` varchar(100) NOT NULL,
  `dataIscrizione` datetime NOT NULL,
  `etàStudente` int NOT NULL,
  `aScolastico` int NOT NULL,
  PRIMARY KEY (`codiceFiscaleGenitore`,`codiceFiscaleStudente`,`codiceClasse`,`nomeScuola`,`gradoScuola`,`nomeIstituto`,`dataIscrizione`,`etàStudente`,`aScolastico`),
  KEY `studente.codicefiscale_idx` (`codiceFiscaleStudente`),
  KEY `classe.codice_idx` (`codiceClasse`),
  KEY `classe.scuola_idx` (`nomeScuola`),
  KEY `classe.as_idx` (`aScolastico`),
  KEY `classe.grado_idx` (`gradoScuola`),
  KEY `classe.istituto_idx` (`nomeIstituto`),
  CONSTRAINT `classe.aScolastico` FOREIGN KEY (`aScolastico`) REFERENCES `classe` (`annoScolastico`),
  CONSTRAINT `classe.codice` FOREIGN KEY (`codiceClasse`) REFERENCES `classe` (`codice`),
  CONSTRAINT `classe.grado` FOREIGN KEY (`gradoScuola`) REFERENCES `classe` (`gradoScuola`),
  CONSTRAINT `classe.istituto` FOREIGN KEY (`nomeIstituto`) REFERENCES `classe` (`nomeIstituto`),
  CONSTRAINT `classe.scuola` FOREIGN KEY (`nomeScuola`) REFERENCES `classe` (`nomeScuola`),
  CONSTRAINT `genitore.codicefiscale` FOREIGN KEY (`codiceFiscaleGenitore`) REFERENCES `genitore` (`codiceFiscale`),
  CONSTRAINT `studente.codicefiscale` FOREIGN KEY (`codiceFiscaleStudente`) REFERENCES `studente` (`codiceFiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabella rappresentante l''iscrizione che un genitore effettua del proprio figlio ad una classe';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iscrizione`
--

LOCK TABLES `iscrizione` WRITE;
/*!40000 ALTER TABLE `iscrizione` DISABLE KEYS */;
INSERT INTO `iscrizione` VALUES ('G000','S010','1-A','infanzia','Scuola0','Unical','2012-01-01 00:00:00',3,2012),('G000','S000','1-B','primaria','Scuola1','Unical','2015-01-01 00:00:00',6,2015),('G000','S010','1-B','primaria','Scuola1','Unical','2015-01-01 00:00:00',6,2015),('G001','S007','1-B','primaria','Scuola1','Unical','2015-01-01 00:00:00',7,2015),('G001','S011','1-B','primaria','Scuola1','Unical','2015-01-01 00:00:00',7,2015),('G001','S013','1-B','primaria','Scuola1','Unical','2015-01-01 00:00:00',8,2015),('G000','S000','1-C','secondaria','Scuola2','Unical','2020-01-01 00:00:00',11,2020),('G000','S001','1-A','infanzia','Scuola0','Unical','2020-01-01 00:00:00',3,2020),('G000','S005','1-C','secondaria','Scuola2','Unical','2020-01-15 00:00:00',11,2020);
/*!40000 ALTER TABLE `iscrizione` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `iscrizione_BEFORE_INSERT` BEFORE INSERT ON `iscrizione` FOR EACH ROW BEGIN
	
/*  trigger che evita le iscrizioni in mese diverso da gennaio */
    DECLARE MESSAGE_TEXT varchar(200);
    if (extract(MONTH from new.dataIscrizione) <>01) then
	 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mese non valido';	
	end if; 
    
/*  trigger che evita le iscrizioni duplicate nello stesso anno */
    if (EXISTS (Select * 
				from iscrizione as i 
				Where i.codiceFiscaleStudente=new.codiceFiscaleStudente and extract(year from i.dataIscrizione)=extract(year from new.dataIscrizione)))
        then SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'iscrizione già presente';
    end if;
    
/*  trigger che evita le iscrizioni errate per classe */
    if (NOT EXISTS (Select * 
				from classe as c
				Where c.codice=new.codiceClasse and extract(year from new.dataIscrizione)=c.annoScolastico))
        then SIGNAL SQLSTATE '41000' SET MESSAGE_TEXT = 'classe non presente';
    end if;
    
    /*  trigger che evita le iscrizioni errate per anno */
    if (year(new.dataIscrizione)<>new.aScolastico)
        then SIGNAL SQLSTATE '41000' SET MESSAGE_TEXT = 'annoScolastico non valido';
    end if;
    
    
    
/*  trigger che verifichi che lo studente rispetti la fascia d'età nella classe */     
if(exists(	select *
			from aula, classe
			where classe.aula = aula.codice_aula  and new.codiceClasse=classe.codice and (aula.fascia_di_età_iniziale > new.etàStudente or aula.fascia_di_età_finale < new.etàStudente) ))
        then SIGNAL SQLSTATE '50000' SET MESSAGE_TEXT = 'fascia di età errata per la classe';
    end if; 
  
/*  trigger che limita l'iscrizione degli studenti nell'aula (capizena massima) */
    if (exists (Select *
			From classe,aula
			Where new.codiceClasse=classe.codice and classe.aula=aula.codice_aula and classe.totStudenti>=aula.studentiOspitabili))
        then SIGNAL SQLSTATE '60000' SET MESSAGE_TEXT = 'capienza massima aula superata';
	else
		UPDATE Istituto.classe SET totStudenti = totStudenti+1 WHERE (codice = new.codiceClasse and classe.annoScolastico=extract(year from new.dataIscrizione));
    end if; 
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `iscrizione_AFTER_DELETE` AFTER DELETE ON `iscrizione` FOR EACH ROW BEGIN
	UPDATE Istituto.classe SET classe.totStudenti = classe.totStudenti-1 WHERE (classe.codice = old.codiceClasse);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `istituto_comprensivo`
--

DROP TABLE IF EXISTS `istituto_comprensivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `istituto_comprensivo` (
  `nome_istituto` varchar(100) NOT NULL,
  PRIMARY KEY (`nome_istituto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Un complesso scolastico al cui interno sono presenti scuole di più ordini e gradi.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istituto_comprensivo`
--

LOCK TABLES `istituto_comprensivo` WRITE;
/*!40000 ALTER TABLE `istituto_comprensivo` DISABLE KEYS */;
INSERT INTO `istituto_comprensivo` VALUES ('Unical');
/*!40000 ALTER TABLE `istituto_comprensivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `codiceFiscale` varchar(20) NOT NULL COMMENT 'Codice univoco personale identificativo.',
  `nome` varchar(50) NOT NULL COMMENT 'Nome della persona.',
  `cognome` varchar(50) NOT NULL COMMENT 'Cognome della persona.',
  PRIMARY KEY (`codiceFiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Individuo della specie umana.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES ('G000','Giorgio','Guagliardi'),('G001','Davide','Ragona'),('G002','Caterina','Gerace'),('P000','Pasquale','Rullo'),('P001','Giovanni','La Boccetta'),('P002','Angilica','Denise'),('S000','Salvatore','Gatto'),('S001','Valeria','Quattrone'),('S002','Debora','Ippolito'),('S003','Willy','Wonka'),('S004','Luce','Scala'),('S005','Remo','Felice'),('S006','Bianco','Cioccolato'),('S007','Massimo','Forte'),('S008','Guido','Male'),('S009','Dina','Lampa'),('S010','Capra','Campa'),('S011','Dario','Lampa'),('S012','Lino','Faggio'),('S013','Angelo','Stanco'),('S014','Bianca','Farina'),('S015','Felice ','Cupo');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plesso`
--

DROP TABLE IF EXISTS `plesso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plesso` (
  `indirizzo` varchar(50) NOT NULL COMMENT 'Indirizzo di locazione del plesso scolastico',
  `nome_plesso` varchar(50) NOT NULL COMMENT 'Nome del plesso scolastico',
  PRIMARY KEY (`indirizzo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Costruzione edile al cui interno si svolgono le attività scolastiche e amministrative della scuola e dell’istituto comprensivo.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plesso`
--

LOCK TABLES `plesso` WRITE;
/*!40000 ALTER TABLE `plesso` DISABLE KEYS */;
INSERT INTO `plesso` VALUES ('indirizzo0','plesso0'),('indirizzo1','plesso1'),('indirizzo2','plesso2');
/*!40000 ALTER TABLE `plesso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resocontoannuale`
--

DROP TABLE IF EXISTS `resocontoannuale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resocontoannuale` (
  `classe` varchar(3) NOT NULL,
  `grado` varchar(20) NOT NULL,
  `anno` int NOT NULL,
  `data` date NOT NULL,
  `numeroIscritti` int NOT NULL,
  PRIMARY KEY (`anno`,`grado`,`classe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resocontoannuale`
--

LOCK TABLES `resocontoannuale` WRITE;
/*!40000 ALTER TABLE `resocontoannuale` DISABLE KEYS */;
INSERT INTO `resocontoannuale` VALUES ('1-A','infanzia',2020,'2020-08-02',1),('1-C','secondaria',2020,'2020-08-02',2);
/*!40000 ALTER TABLE `resocontoannuale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scuola`
--

DROP TABLE IF EXISTS `scuola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scuola` (
  `nome` varchar(20) NOT NULL COMMENT 'Nome della scuola',
  `grado` varchar(20) NOT NULL COMMENT 'Grado scolastic della scuola.',
  `istituto` varchar(100) NOT NULL,
  PRIMARY KEY (`grado`,`nome`,`istituto`),
  UNIQUE KEY `grado_UNIQUE` (`grado`),
  KEY `nome_istituto_idx` (`nome`),
  KEY `istituto_idx` (`istituto`),
  CONSTRAINT `istituto` FOREIGN KEY (`istituto`) REFERENCES `istituto_comprensivo` (`nome_istituto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Istituzione avente un ordine ed un grado specifico organizzata per l''istruzione collettiva appartenente all’istituto comprensivo.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scuola`
--

LOCK TABLES `scuola` WRITE;
/*!40000 ALTER TABLE `scuola` DISABLE KEYS */;
INSERT INTO `scuola` VALUES ('Scuola0','infanzia','Unical'),('Scuola1','primaria','Unical'),('Scuola2','secondaria','Unical');
/*!40000 ALTER TABLE `scuola` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `scuola_BEFORE_INSERT` BEFORE INSERT ON `scuola` FOR EACH ROW BEGIN

    if (EXISTS (Select nome
                from Scuola as s
                Where s.nome=new.nome ))
        then SIGNAL SQLSTATE '10000' SET MESSAGE_TEXT = 'Scuola già presente';
    end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `studente`
--

DROP TABLE IF EXISTS `studente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studente` (
  `codiceFiscale` varchar(20) NOT NULL,
  PRIMARY KEY (`codiceFiscale`),
  CONSTRAINT `s.codiceFiscale` FOREIGN KEY (`codiceFiscale`) REFERENCES `persona` (`codiceFiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studente`
--

LOCK TABLES `studente` WRITE;
/*!40000 ALTER TABLE `studente` DISABLE KEYS */;
INSERT INTO `studente` VALUES ('S000'),('S001'),('S002'),('S003'),('S004'),('S005'),('S006'),('S007'),('S008'),('S009'),('S010'),('S011'),('S012'),('S013'),('S014'),('S015');
/*!40000 ALTER TABLE `studente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Istituto'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `EventoIscrizioni` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `EventoIscrizioni` ON SCHEDULE EVERY 1 YEAR STARTS '2020-02-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
	call resocontoIscritti();
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'Istituto'
--
/*!50003 DROP PROCEDURE IF EXISTS `resocontoIscritti` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `resocontoIscritti`()
BEGIN
    Declare classe varchar(3);
    Declare grado varchar (20);
    Declare anno int;
    Declare numIscritti int;
    
    DECLARE cursore CURSOR FOR  SELECT count(codiceFiscaleStudente),codiceClasse,gradoScuola,extract(Year from dataIscrizione) 
            From iscrizione 
            Where extract(YEAR from dataIscrizione)=extract(Year from curdate())
            Group by codiceClasse, gradoScuola, extract(Year From dataIscrizione);
    open cursore;
    
    Loop
    Fetch cursore INTO numIscritti,classe,grado,anno;
   
    INSERT INTO resocontoannuale VALUES (classe,grado,anno,curdate(),numIscritti);
    END LOOP;
    Close cursore; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `infoplesso`
--

/*!50001 DROP VIEW IF EXISTS `infoplesso`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `infoplesso` (`indirizzoPlesso`,`nomePlesso`,`numStudenti`) AS select `plesso`.`indirizzo` AS `indirizzo`,`plesso`.`nome_plesso` AS `nome_plesso`,sum(`aula`.`studentiOspitabili`) AS `sum(aula.studentiOspitabili)` from (`aula` join `plesso`) where (`aula`.`indirizzo` = `plesso`.`indirizzo`) group by `plesso`.`indirizzo`,`plesso`.`nome_plesso` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `infoscuola`
--

/*!50001 DROP VIEW IF EXISTS `infoscuola`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `infoscuola` (`nomeScuola`,`annoScolastico`,`numStudenti`) AS select `scuola`.`nome` AS `nome`,`classe`.`annoScolastico` AS `annoScolastico`,sum(`classe`.`totStudenti`) AS `sum(classe.totStudenti)` from (`scuola` join `classe`) where (`classe`.`nomeScuola` = `scuola`.`nome`) group by `classe`.`nomeScuola`,`classe`.`annoScolastico` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-02 16:55:09

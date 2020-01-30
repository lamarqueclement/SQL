-- CTRL + = zoom +
-- CTRL C = arret de l'opération

DROP DATABASE IF EXISTS dataia_Nancy;
CREATE DATABASE dataia_Nancy;
USE dataia_Nancy;

CREATE TABLE dataia_Nancy(
    resilies INT,
    parcours INT,
    anciennete INT,
    demenagement INT,
    sinistre INT,
    devis INT,
    desequip INT,
    revision INT,
    satisfaction INT);


-- Importer un fichier texte dans la table data
LOAD DATA LOCAL INFILE "C:/Users/Utilisateur/Desktop/Formation Data IA/Connaissances/SQL/Seance4/BASE1.txt"
    INTO TABLE dataia_Nancy
    FIELDS TERMINATED BY ","
    LINES TERMINATED BY "\n"
    IGNORE 1 LINES ;

-- Selectionner les 10 premières lignes de la table
SELECT * FROM dataia_nancy limit 10;

-- Nombre d'individus dans la table
select count(*) from dataia_Nancy;

-- Nombre d'individus distincts dans la table
select distinct(count(*)) from dataia_Nancy;

-- Modifier la variable resilies dans la table (0= non résilié, 1= resilié)
ALTER TABLE dataia_Nancy
MODIFY resilies VARCHAR(100);  -- ADD = modifier; ADD= ajouter

UPDATE dataia_Nancy
SET resilies = (
    CASE
    WHEN resilies = 0 THEN 'non resilies'
    ELSE 'resilies'
    END);
SELECT * FROM dataia_Nancy LIMIT 10;

-- Nombre de 'resilies' existants
-- possibilité 1
SELECT resilies, COUNT(resilies)
FROM dataia_Nancy
GROUP BY resilies;

-- possibilite 2
SELECT COUNT(*) 
FROM dataia_Nancy 
WHERE resilies='resilies';

-- Ancienneté moyenne des individus
SELECT ROUND(AVG(anciennete),2) FROM dataia_Nancy; 

-- nombre d'individus = f(ancienneté, sinistre)
SELECT anciennete, sinistre , COUNT(*) as nombre
FROM dataia_Nancy
GROUP BY anciennete, sinistre;

-- nombre d'individus = f(ancienneté, sinistre) en pourcentage
SELECT anciennete, sinistre , COUNT(*), COUNT(*)/(SELECT count(*) FROM dataia_Nancy)
FROM dataia_Nancy
GROUP BY anciennete, sinistre;

-- Nombre de sinistrés tq sinistre>moygénérale
SELECT 
    COUNT(*) AS sinistres_total
FROM dataia_Nancy
WHERE resilies = 0 AND 
    sinistre > (SELECT AVG(sinistre) FROM dataia_Nancy);

-- Création projetA = {resilies, parcours, anciennete, demenagement}
CREATE TABLE projetA AS (SELECT resilies, parcours, anciennete, demenagement FROM dataia_Nancy);
SELECT * FROM projetA LIMIT 10;
-- Création porjetB = {resilies, parcours, sinistre, devis, revision, satisfaction}
CREATE TABLE projetB AS (SELECT resilies, parcours, sinistre, devis, revision, satisfaction FROM dataia_Nancy);
SELECT * FROM projetB LIMIT 10;

-- Création projetC = projetA et projetB
-- possibilitéS 1: ! Cela n'affiche pas le résultat envisagé, mais un tableau de (nb lignes)²    
CREATE TABLE projetC1 AS 
    (SELECT 
    projetA.resilies, 
    projetA.parcours, 
    projetA.anciennete,
    projetA.demenagement,
    projetB.sinistre, 
    projetB.devis, 
    projetB.revision, 
    projetB.satisfaction
    FROM projetA, projetB
    LIMIT 100);
SELECT count(*) from projetC1;

CREATE TABLE projetC2 AS 
    (SELECT *
    FROM projetA
    NATURAL JOIN projetB
    LIMIT 100);
SELECT * FROM projetC2 LIMIT 100;

-- possibilité 2: Affiche le résultat cherché avec un tableau de hauteur (nb lignes)
ALTER TABLE projetA ADD id INT PRIMARY KEY NOT NULL AUTO_INCREMENT;
ALTER TABLE projetB ADD id INT PRIMARY KEY NOT NULL AUTO_INCREMENT;
CREATE TABLE projetC(SELECT * FROM projetB NATURAL JOIN projetA);
SELECT * FROM projetC LIMIT 10;







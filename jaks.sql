-- +----------+----------+------------+--------------+----------+-------+----------+----------+--------------+
-- | resilies | parcours | anciennete | demenagement | sinistre | devis | desequip | revision | satisfaction |
-- +----------+----------+------------+--------------+----------+-------+----------+----------+--------------+
-- |        0 |        4 |          4 |            2 |        2 |     3 |        2 |        4 |            3 |
-- |        0 |        4 |          4 |            2 |        2 |     3 |        2 |        1 |            3 |
-- |        0 |        2 |          4 |            2 |        2 |     4 |        2 |        4 |            3 |
-- |        0 |        4 |          4 |            2 |        2 |     1 |        2 |        3 |            3 |
-- |        0 |        4 |          4 |            2 |        2 |     3 |        2 |        3 |            3 |
-- |        0 |        2 |          4 |            2 |        2 |     4 |        2 |        3 |            3 |
-- |        0 |        4 |          4 |            2 |        2 |     3 |        2 |        1 |            3 |
-- |        0 |        2 |          4 |            2 |        2 |     3 |        2 |        4 |            3 |
-- |        0 |        2 |          4 |            2 |        1 |     3 |        2 |        4 |            3 |
-- +----------+----------+------------+--------------+----------+-------+----------+----------+--------------+


-- USE dataia_Nancy;

-- SI NOUVELLE TABLE
-- ALTER TABLE 
-- ADD resiliation VARCHAR(55);
-- UPDATE dataia_Nancy2 
-- SET resiliation = (
--   CASE 
--     WHEN resilies = 1 THEN 'Résilié'
--     ELSE 'Non résilié'
--   END
-- );
-- SELECT * FROM dataia_Nancy2 LIMIT 10;

-- -- SANS MODIFIER LA TABLE
-- SELECT 
--     *, 
--     CASE resilies 
--         WHEN 0 THEN 'Non résilié' 
--         ELSE 'Résilié' 
--     END AS resiliation 
-- FROM dataia_Nancy 
-- LIMIT 10;



-- -- Nb de non résiliés
-- SELECT COUNT(*) AS nb_non_resilies FROM dataia_Nancy WHERE resilies = 0;  

-- -- Moyenne
-- SELECT ROUND(SUM(anciennete)/COUNT(*), 0) AS moyenne_anciennete FROM dataia_Nancy;
-- SELECT ROUND(AVG(anciennete), 0) AS moyenne_anciennete FROM dataia_Nancy;
 
-- -- Nb d'individus par anciennete & sinistre
-- SELECT anciennete, sinistre, COUNT(*) AS nb_individus FROM dataia_Nancy GROUP BY anciennete, sinistre;

-- SELECT 
-- anciennete, 
-- sinistre, 
-- COUNT(*) AS nb_individus, 
-- ROUND(COUNT(*)/(SELECT COUNT(*) FROM dataia_Nancy)*100, 0) AS pourcentage
-- FROM dataia_Nancy 
-- GROUP BY anciennete, sinistre;

-- SELECT
-- COUNT(*) AS nb_non_resilies
-- FROM dataia_Nancy
-- WHERE resilies = 0;

-- SELECT 
-- COUNT(*) AS nb_non_resilies_avec_sinistre_superieur_a_la_moyenne
-- FROM dataia_Nancy
-- WHERE resilies = 0 AND sinistre >= (SELECT ROUND(AVG(sinistre), 0) FROM dataia_Nancy);

-- Créer en une seule req la table projetA 
-- contenant resilies, parcours, anciennete, demenagement

-- CREATE TABLE projetA AS
-- SELECT resilies, parcours, anciennete, demenagement
-- FROM dataia_Nancy;


-- -- Créer en une seule req la table projetB 
-- -- contenant resilies, parcours, sinistre, devis, revision, statisfaction
-- CREATE TABLE projetB AS
-- SELECT resilies, parcours, sinistre, devis, revision, satisfaction
-- FROM dataia_Nancy;



-- CREATE TABLE projetC AS
-- WITH data AS
-- SELECT 
-- projetA.resilies, projetA.parcours, projetA.anciennete, projetA.demenagement,
-- projetB.sinistre, projetB.devis, projetB.revision, projetB.satisfaction
-- FROM projetA 
-- JOIN projetB;

-- CREATE TABLE projetC AS
-- SELECT 
-- projetA.resilies, projetA.parcours, projetA.anciennete, projetA.demenagement,
-- projetB.sinistre, projetB.devis, projetB.revision, projetB.satisfaction
-- FROM projetA JOIN projetB LIMIT 10;



  --Mostrare tutti i dati dei partecipanti di Roma

SELECT *
FROM Indirizzo

SELECT *
FROM Partecipante

SELECT *
FROM Indirizzo ind
INNER JOIN Partecipante pa
ON ind.ID = pa.IndirizzoID
WHERE ind.citta ='Roma'

-- --Mostrare i dati degli itinerari con prezzo superiore ai 500 euro o durata superiore ai 7 giorni

SELECT *
FROM Itinerario

SELECT *
FROM Itinerario it
WHERE it.Durata>7 OR it.Prezzo>500

-- --Selezionare la data di partenza delle gite il cui itinerario ha un prezzo superiore ai 100 euro
SELECT *
FROM Itinerario

SELECT *
FROM GitaTuristica

SELECT g.DataPartenza
FROM Itinerario it
INNER JOIN GitaTuristica g
ON it.ID = g.ID
WHERE it.Prezzo>100

-- --Mostrare nome, cognome e numero di telefono dei responsabili delle gite in partenza il 3 Aprile 2022
SELECT *
FROM Responsabile

SELECT *
FROM GitaTuristica

SELECT *
FROM Responsabile r
INNER JOIN GitaTuristica g
ON r.ID = g.ResponsabileID
WHERE g.DataPartenza = '2022-04-03'

-- -- Mostrare i dati degli itinerari ordinati per prezzo e per durata
SELECT *
FROM Itinerario i
Order by i.Prezzo, i.Durata

-- --Mostrare i dati degli itinerari con durata massima e minima
--SELECT 
--	max(i.Durata) as [Durata Massima], 
--	min(i.Durata) as [Durata Minima]
--FROM Itinerario i


SELECT 
	i.ID,
	i.Prezzo,
	i.Destinazione,
	i.Durata
FROM Itinerario i
where i.Durata = (select max(i.Durata) from itinerario i) 
		or 
	  i.Durata = (select min(i.Durata) from itinerario i)


-- -- Mostrare le gite in partenza tra il 1 Gennaio 2021 ed il 31 Dicembre 2021
SELECT *
FROM GitaTuristica

SELECT *
FROM GitaTuristica g
where g.DataPartenza>='2021-01-01' AND g.DataPartenza<='2021-12-31'














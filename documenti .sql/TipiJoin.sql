-- tipi di Join


Select * from Classi
SELECT * FROM Studenti

--SELECT *
--FROM classi c -- c è un alias di tabella (altrimenti avrei dovuto scrivere Classi.Codice 
--INNER JOIN Studenti s
--ON c.Codice=s.CodiceClasse

--SELECT *
--FROM classi c -- c è un alias di tabella (altrimenti avrei dovuto scrivere Classi.Codice 
--RIGHT JOIN Studenti s -- mostra tutti gli studenti anche se non associati a nessuna classe
--ON c.Codice=s.CodiceClasse

--SELECT *
--FROM classi c -- c è un alias di tabella (altrimenti avrei dovuto scrivere Classi.Codice 
--LEFT JOIN Studenti s -- mostra tutte le classi anche se non associati a nessuno studente (se una classe ha più studenti, compare più volte)
--ON c.Codice=s.CodiceClasse

SELECT *
FROM classi c -- c è un alias di tabella (altrimenti avrei dovuto scrivere Classi.Codice 
FULL OUTER JOIN Studenti s -- mostra tutte le classi e tutti gli studenti (se una classe ha più studenti, compare più volte)
ON c.Codice=s.CodiceClasse
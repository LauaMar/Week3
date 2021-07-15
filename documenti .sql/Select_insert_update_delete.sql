-- select, insert, update, delete

--/* commento
--su 
--più
--righe */


--SELECT 
--ID as codiceAttore, -- commento singola riga
--cognome
--from Attori

--select distinct -- restituisce solo gli elementi distinti su una colonna (cognome in questo caso)
--Cognome
--from Attori

--select distinct -- se gli passo più colonne, lui cerca la toupla (cioè tutto il record deve essere diverso)
---- "1 stallone" è diverso da "3 stallone", quindi me li restituisce entrambi
--ID,
--Cognome
--from Attori


--INSERT

--INSERT INTO Attori -- (Nome, Cognome, Cachet, Nazionalita)
----VALUES('Ralph', 'Fiennes', 30, 'UK')
--VALUES
--	('Warren', 'Beatty', 'USA', 2),
--	('Roberto', 'Benigni', 'ITA', 10)


--SELECT * FROM attori



-- UPDATE

--SELECT * FROM attori

--UPDATE attori
--Set Cachet = 100
--WHERE cognome = 'Fiennes' -- statement boolean (predicate)
---- modifica il cachet solo dei fratelli fiennes 
----DANGER!!! senza la WHERE condition applica la modifica a tutti i record

--SELECT * FROM attori
--WHERE cognome = 'Fiennes'

SELECT * FROM attori

DELETE FROM Attori WHERE ID = 7

SELECT * FROM attori

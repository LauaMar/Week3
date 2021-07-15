-- UNION

Select * from Segnalazione

Select * from Attivita

Select 
	ID, 'SEGNALAZIONE' as tipo, TitoloSegnalazione as [Titolo], DataSegnalazione as [Data]
from Segnalazione
UNION
Select 
	ID, 'ATTIVITA' as tipo, TitoloAzione as [Titolo], DataAzione as [Data]
from Attivita
ORDER BY [Data]

--Select into
--clona la tabella segnalazione in segnalazione_BK
Select * into Segnalazione_BK
from Segnalazione
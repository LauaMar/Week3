
--crea una nuova tabella 
CREATE TABLE Ticket (
	ID int IDENTITY(1,1),
	CodiceTicket char(16) UNIQUE, --non posso avere due ticket con lo stesso valore qui dentro
	Titolo nvarchar(50) NOT NULL,
	Descrizione nvarchar(max) NULL, --massima lunghezza del tipo nvarchar
	AbbonatoID int,
	Prezzo int CHECK(Prezzo < 2000), --il prezzo dei ticket deve essere minore di 2000
	OrderDate date default getdate(),
	CONSTRAINT PK_Ticket PRIMARY KEY (ID),
	CONSTRAINT FK_Abbonato FOREIGN KEY (AbbonatoID) REFERENCES Abbonato(ID)
	)

--aggiunge alla tabella una colonna di interi definita status
--alter table ticket
--ADD Status int

--elimina la tabella
--DROP table Ticket

--svuota la tabella
--TRUNCATE TABLE Ticket 

--aggiunge una colonna di interi autogenerati
--alter table Ticket
--Add ID int IDENTITY(1,1)



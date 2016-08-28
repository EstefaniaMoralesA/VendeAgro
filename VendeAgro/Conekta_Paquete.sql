﻿CREATE TABLE [dbo].[Conekta_Paquete]
(
	[id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[idPaquete] INT NOT NULL FOREIGN KEY REFERENCES Paquete(id) ON DELETE CASCADE ON UPDATE CASCADE, 
	[idUsuario] INT NOT NULL FOREIGN KEY REFERENCES Usuario(id) ON DELETE CASCADE ON UPDATE CASCADE, 
	[idConekta] INT NOT NULL,
	[fechaRenovacion] DATE NOT NULL, 
	[folio] VARCHAR(20) NOT NULL
)
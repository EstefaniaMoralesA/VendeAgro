﻿CREATE TABLE [dbo].[Pago]
(
	[id] INT NOT NULL PRIMARY KEY, 
	[idUsuario] INT NOT NULL FOREIGN KEY REFERENCES Usuario(id) ON DELETE NO ACTION ON UPDATE CASCADE, 
	[tipoTarjeta] INT NOT NULL, 
	[digitosTarjeta] INT NOT NULL,
	[total] FLOAT NOT NULL, 
	[fecha] DATE NOT NULL, 
	[tipo] INT NOT NULL, 
	[Referencia] VARCHAR(40) NOT NULL
)

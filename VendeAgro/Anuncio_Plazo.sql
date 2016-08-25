﻿CREATE TABLE [dbo].[Anuncio_Plazo]
(
	[id] INT NOT NULL PRIMARY KEY, 
	[idAnuncio] INT NOT NULL FOREIGN KEY REFERENCES Anuncio(id) ON DELETE CASCADE ON UPDATE CASCADE, 
	[idPlazo] INT NOT NULL FOREIGN KEY REFERENCES Plazo(id) ON DELETE NO ACTION ON UPDATE CASCADE, 
	[fechaInicio] DATE NOT NULL, 
	[fechaFin] DATE NOT NULL, 
	[activo] BIT NOT NULL
)
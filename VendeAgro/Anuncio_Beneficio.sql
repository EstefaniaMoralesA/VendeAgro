﻿CREATE TABLE [dbo].[Anuncio_Beneficio]
(
	[id] INT NOT NULL PRIMARY KEY, 
	[idAnuncio] INT NOT NULL REFERENCES Anuncio(id) ON DELETE CASCADE ON UPDATE CASCADE, 
	[idBeneficio] INT NOT NULL REFERENCES Beneficio(id) ON DELETE NO ACTION ON UPDATE CASCADE
)
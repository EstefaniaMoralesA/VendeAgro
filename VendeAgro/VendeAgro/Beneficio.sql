CREATE TABLE [dbo].[Beneficio]
(
	[id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[descripcion] VARCHAR(250) NOT NULL,
	[precio] FLOAT NOT NULL, 
	[tipo] INT NOT NULL, 
	[numero] INT 
)

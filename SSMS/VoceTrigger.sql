USE [HladnjacaDB]
GO
/****** Object:  Trigger [dbo].[VoceTrigger]    Script Date: 6/2/2021 10:58:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[VoceTrigger]
ON [dbo].[Voces]
instead of update
AS
BEGIN
	if 1=1
		RAISERROR ('no update on table projekattttttttttttttttttttt', -- Message text.
		16, -- Severity.
		1);
	else
		RAISERROR ('Neka error greskaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', -- Message text.
		16, -- Severity.
		1);
END/*UPDATE Voces
SET Vrsta = 'Tresnja'
WHERE Vrsta = 'Musmula';
*/

/*
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
*/
ALTER FUNCTION f_naziv_organizacione_jedinice
() RETURNS VARCHAR(30)
AS
BEGIN
DECLARE
	@return_value AS VARCHAR(30);
	SELECT @return_value = Naziv 
	from OrganizacionaJedinicas inner join Hladnjacas on OrganizacionaJedinicas.Id = Hladnjacas.Id  
	inner join Komoras on Hladnjacas.Id = Komoras.HladnjacaId;
RETURN @return_value;
END;

DECLARE @naz_oj varchar(30);
BEGIN
	EXEC @naz_oj = f_naziv_organizacione_jedinice;
	SELECT @naz_oj;
END;
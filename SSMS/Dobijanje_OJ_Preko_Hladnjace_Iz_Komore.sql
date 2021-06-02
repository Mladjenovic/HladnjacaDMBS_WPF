alter procedure Dobijanje_Oj_Preko_Hladnjace_Iz_Komore
as
declare dobavljac cursor
for select OrganizacionaJedinicas.Naziv, OrganizacionaJedinicas.Id
from OrganizacionaJedinicas inner join Hladnjacas on OrganizacionaJedinicas.Id = Hladnjacas.Id  
inner join Komoras on Hladnjacas.Id = Komoras.HladnjacaId  

declare @temp varchar(30)
declare @temp2 int
begin
	open dobavljac
	while @@FETCH_STATUS = 0
		begin
			fetch next from dobavljac
			into @temp, @temp2;
			print ' Naziv OJ: ' + @temp + ' ID: ' + cast(@temp2 as varchar);
		
	end
		close dobavljac
		deallocate dobavljac
end

execute Dobijanje_Oj_Preko_Hladnjace_Iz_Komore

select * from OrganizacionaJedinicas
select * from Hladnjacas
select * from Komoras
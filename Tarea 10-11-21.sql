--EJERCICIO 1
if object_id('SP_MostarLista') is not null
    begin
    drop procedure SP_MostarLista
    end
go

create procedure SP_MostarLista
as begin
select c.[CÓDIGO CLIENTE], c.RESPONSABLE, p.[FECHA DE PEDIDO]
from CLIENTES as c
join PEDIDOS as p on c.[CÓDIGO CLIENTE]=p.[CÓDIGO CLIENTE]
end

exec SP_MostarLista

--EJERCICIO 2
drop procedure if exists SP_Actualizar
create procedure SP_Actualizar
@codigo char(10),
@empresa varchar(50),
@direccion varchar(50),
@poblacion varchar(50),
@telefono char(10),
@responsable varchar(50)
as
begin
update  CLIENTES set EMPRESA=@empresa,[DIRECCIÓN]=@direccion,[POBLACIÓN]=@poblacion,TELÉFONO=@telefono,RESPONSABLE=@responsable where [CÓDIGO CLIENTE]=@codigo
select * from CLIENTES
end 
go
exec SP_Actualizar'CT01','IMPACTO','CARABAYLLO','EL ESTABLO',923679637,'ALEXANDER ROJAS'

--EJERCICO 3
drop procedure if exists SP_Intsertar1
create proc SP_Intsertar1
@codigo char(10),
@empresa varchar(50),
@direccion varchar(50),
@poblacion varchar(50),
@telefono char(10),
@responsable varchar(50)
as
begin
	if exists (select*from CLIENTES where [CÓDIGO CLIENTE]=@codigo)
		begin
			print 'Este codigo ya exite'
		end
	else
		begin 
			insert into CLIENTES values(@codigo,@empresa,@direccion,@poblacion,@telefono,@responsable,null)
			print 'Se inserto correctamente' 
		end
end 
go
exec SP_Intsertar1'CT40','MAMADEDE','CARABAYLLO','EL ESTABLO',922465877,'ALEXANDER ROJAS'
select * from CLIENTES

--EJERCICIO 4
drop procedure if exists SP_Delate1
create proc SP_Delate1
@codigo char(10)
as
begin
	if not exists (select*from CLIENTES where [CÓDIGO CLIENTE]=@codigo)
		begin
			print 'NO EXITE'
		end
	else
		begin 
			delete from CLIENTES where [CÓDIGO CLIENTE]=@codigo
			print 'Eliminado exitosamente' 
			select * from CLIENTES
		end
end 
go
exec SP_Delate1 'CT40'

select * from CLIENTES
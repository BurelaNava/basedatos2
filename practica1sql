--Crearemos una tabla muy simple para probar el poder de PL SQL.

create table dance(id_dance integer, nombre varchar2(40), edad integer);
--Prendemos el servidor en modo de desarrollador.
set serveroutput on;
--Vamos a empezar con un bloque PL SQL.
declare
--Aquí se declaran las variables.
edad integer;
years integer;
begin
--Aquí va la lógica de tu programita.
years:=26;
edad:=years*365;

dbms_output.put_line('Tu edad en días es: '||edad);
end;
/

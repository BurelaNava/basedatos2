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

--Crear un PL SQL que genere 200,000 registros es secuencia ascendente en la tabla "dance".

begin

  for i in 1..200000 loop
     insert into dance values(i,'Burela',26);
  end loop;
  
  end;
  /
--Hacemos un "select * from dance" para comprobar que eb reakidad hizo los registros.
select * from dance;

--Sistema de películas(la de sala de tarea).
create table pelicula(id_pelicula integer,
                      titulo varchar2(120),
                      sinopsis varchar2(500),
                      clasificacion varchar2(5),
                      constraint pk_id_pelicula primary key(id_pelicula));--por lo regular se pone en "constrain" el nombre de la tabla por la integridad de datos.
                      
create table horario(id_horario integer,
                    id_pelicula integer,
                    hora varchar2(8),
                    constraint pk_id_horario primary key(id_horario),
                    constraint fk1_id_pelicula foreign key(id_pelicula) references pelicula(id_pelicula));
     
create table sala(id_sala integer,
                    id_pelicula integer,
                    num_sala integer,
                    constraint pk_id_sala primary key(id_sala),
                    constraint fk2_id_pelicula foreign key(id_pelicula) references pelicula(id_pelicula));
                    
                    create sequence sec_pelicula
start with 1
increment by 1
nomaxvalue;   

--El siguiente paso es ENLAZAR  la recién creado la secuencia con la tabla pelicula.
--NOTA: S+olamente se necesita un nuevo objeto de base de datos, éste objeto va a ser
--el que se insertará el o los nuevos registros en la tabla pelicula. En resumen:
--JAMÁS se una un "insert into" en Oracle cuando tienen un primery key auto-generado.

set serveroutput on;
create or replace procedure hola_mundo(nombre in varchar2)
as
begin

--Aquí va la lógica.

dbms_output.put_line('Hola, ¿cómo estás '||nombre);
end;
/

  begin
  hola_mundo('Burela?');
  end;
  /

--"||"=Concatenación.

declare 
valor number;
begin
suma(12,8,valor);
dbms_output.put_line('La suma es ' ||valor);
end;
/



          

--realizar una consulta para saber los vendedores, en que sucursal han laborado, para ello utilizar cursores
--contrasta el resultado con la siguiente consulta de joins 

declare 
cursor cur_sucu is select * from sucursal;
cursor cur_emp is select * from empleado_ventas;
begin
for rec_emp in cur_emp loop
for rec_sucu in cur_sucu loop
if rec_sucu.id_cliente=rec_emp.id_cliente then
dbms_output.put_line ('nombre: '||rec_emp.nombre_cliente|| ' en la sucursal: ' || rec_sucu.nombre);
end if;
end loop;
end loop;
end;
/

CREATE TABLE libros
  (
    book_id           INTEGER,
    isbn              VARCHAR2(13),
    titulo            VARCHAR2(200),
    resumen           VARCHAR2(2000),
    autor             VARCHAR2(200),
    fecha_publicacion DATE,
    num_pag           NUMBER,
    CONSTRAINT pk_book_id PRIMARY KEY (book_id)
  );
  
SET serveroutput ON;

CREATE sequence sec_libros start with 1 increment BY 1 nomaxvalue;


CREATE OR REPLACE PROCEDURE guardarlibros
  (
    my_id OUT INTEGER,
    my_isbn    IN VARCHAR2,
    my_titulo  IN VARCHAR2,
    my_resumen IN VARCHAR2,
    my_autor   IN VARCHAR2,
    dia        IN INTEGER,
    mes        IN VARCHAR2,
    anio       IN INTEGER,
    my_paginas IN INTEGER
  )
AS
  my_fecha DATE;
BEGIN
  my_fecha:=to_date(''||dia||'-'||mes||'-'||anio);
  SELECT sec_libros.nextval INTO my_id FROM dual;
  INSERT
  INTO libros VALUES
    (
      my_id,
      my_isbn,
      my_titulo,
      my_resumen,
      my_autor,
      my_fecha,
      my_paginas
    );
END;
/




DECLARE
  valor_id INTEGER;
BEGIN
  guardarlibros(valor_id, '1234','Abrupt climate change', 'Trata de que todos vamos a morir por contaminadores','John Wallace',27,'jan',2010,455);
END;
/


SELECT * FROM libros;


--ejemplo de creacion de llave foranea
create table horario(id_horario integer,
                    id_pelicula integer,
                    hora varchar2(8),
                    constraint pk_id_horario primary key(id_horario),
                    constraint fk1_id_pelicula foreign key(id_pelicula) references pelicula(id_pelicula));

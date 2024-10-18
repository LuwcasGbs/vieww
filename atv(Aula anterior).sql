CREATE DATABASE empresa_JOINS_1e;
USE empresa_JOINS_1e;

CREATE TABLE departamento (
	id_dep int auto_increment primary key,
    nome_dep varchar(255) not null 
	);
    
CREATE TABLE funcionario (
	id_fun int auto_increment primary key,
    salario decimal (10,2) not null,
    nome_fun varchar(100) not null,
    id_dep int not null,
    foreign key (id_dep) REFERENCES departamento (id_dep)
	);
    
CREATE TABLE dependentes (
	id_depend int auto_increment primary key,
    nome_depend varchar(255) not null,
    id_fun int not null,
    foreign key (id_fun) references funcionario (id_fun) 
	);
    

insert into departamento (nome_dep)
	values
		("Marketing"),
        ("RH"),
        ("Jurídico"),
        ("Administrativo"),
        ("Comercial");
        

insert into funcionario (salario, nome_fun, id_dep)
	values
		(1300.00,"Maria",1),
        (1500.00,"Bernadette",2),
        (1203.40,"Naveen",3),
        (1350.00,"Maia",4),
        (1600.00,"Jorge",5);
        

insert into dependentes (nome_depend, id_fun)
	values
		("Lídia",2),
        ("Pedro",2),
        ("Alice",1),
        ("Luis",5),
        ("Luisa",2);
        
SELECT * FROM funcionario;
SELECT * FROM departamento;
SELECT * FROM dependentes;

SELECT FUNC.nome_fun, DEP.id_fun, COUNT(DEP.nome_depend)
FROM funcionario FUNC
inner join dependentes DEP
on FUNC.cod_fun = DEP.id_fun;
CREATE DATABASE GER_JOIN_1e;
use GER_JOIN_1e;

CREATE TABLE funcionarios(
COD int auto_increment primary key not null,
NOME varchar(255) not null,
ESPECIALIDADE varchar(255) not null
);

CREATE TABLE dependentes(
COD int auto_increment primary key not null,
NOME varchar(255) not null,
COD_FUNC int,
foreign key(COD_FUNC) references funcionarios(COD)
);

insert into funcionarios (NOME, ESPECIALIDADE)
values
	("JOSÉ","ENGENHEIRO"),
    ("JOÃO","MESTRE DE OBRAS"),
    ("MARIA","CONTABILISTA");
    
insert into dependentes (NOME, COD_FUNC)
values
	("PEDRO",1),
    ("ALICE",1),
    ("LUANA",3);
    
    insert into dependentes (NOME)
values
	("PAULO");
    
#-------------------------------------------------------------------------------------------------------------------------------#
															#VIEWS
       
       #CRIANDO VIEW PARA FUNCIONARIOS
CREATE VIEW vw_lista_de_funcionarios AS 
SELECT NOME, ESPECIALIDADE
FROM funcionarios;

		#UTILIZANDO VIEW CRIADA
SELECT * FROM vw_lista_de_funcionarios;

		#CRIANDO VIEW DE FUNCIONARIOS
CREATE VIEW vw_lista_de_dependentes AS
SELECT NOME
FROM dependentes;
		
        #UTILIZANDO A VIEW-
SELECT * FROM vw_lista_de_dependentes;


CREATE VIEW vw_funcionario_com_dependente AS
SELECT funcionarios.NOME AS FUN_NOME, dependentes.NOME AS DEP_NOME
FROM funcionarios
INNER JOIN dependentes
ON funcionarios.COD = dependentes.COD_FUNC;

SELECT * FROM vw_funcionario_com_dependente;

CREATE VIEW vw_funcionario_com_dependente_LEFT AS
SELECT funcionarios.NOME AS FUN_NOME, dependentes.NOME AS DEP_NOME
FROM funcionarios
LEFT JOIN dependentes
ON funcionarios.COD = dependentes.COD_FUNC;

SELECT * FROM vw_funcionario_com_dependente_LEFT;

CREATE VIEW vw_funcionario_com_dependente_LEFT_EXCLUDING AS
SELECT funcionarios.NOME AS FUN_NOME, dependentes.NOME AS DEP_NOME
FROM funcionarios
LEFT JOIN dependentes
ON funcionarios.COD = dependentes.COD_FUNC
WHERE dependentes.NOME is null;

SELECT * FROM vw_funcionario_com_dependente_LEFT_EXCLUDING;

CREATE VIEW vw_funcionario_com_dependente_RIGHT AS
SELECT funcionarios.NOME AS FUN_NOME, dependentes.NOME AS DEP_NOME
FROM funcionarios
RIGHT JOIN dependentes
ON funcionarios.COD = dependentes.COD_FUNC;

SELECT * FROM vw_funcionario_com_dependente_RIGHT;

CREATE VIEW vw_funcionario_com_dependente_RIGHT_EXCLUDING AS
SELECT funcionarios.NOME AS FUN_NOME, dependentes.NOME AS DEP_NOME
FROM funcionarios
RIGHT JOIN dependentes
ON funcionarios.COD = dependentes.COD_FUNC
WHERE dependentes.NOME is null;

SELECT * FROM vw_funcionario_com_dependente_RIGHT_EXCLUDING;
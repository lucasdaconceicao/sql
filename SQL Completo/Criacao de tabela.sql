CREATE DATABASE SOFTBLUE DEFAULT CHARSET=latin1;
USE SOFTBLUE;

--
-- Cria a tabela TIPO
--
-------UNSIGNED O VALOR NAO PODE SER NEGATIVO
------- AUTO_INCREMENT SE NENHUM VALR FOR INSERIDO ELE VAI AUTO INCREMENTAR UM VALOR
CREATE TABLE TIPO (
	CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	-- Código interno (PK)
	TIPO VARCHAR(32) NOT NULL,							-- Descrição
    PRIMARY KEY(CODIGO)									-- Define o campo CODIGO como PK (Primary Key)
);

--
-- Cria a tabela INSTRUTOR
--
CREATE TABLE INSTRUTOR (
	CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	-- Código interno (PK)
	INSTRUTOR VARCHAR(64) NOT NULL,			        	-- Nome com até 64 caracteres
	TELEFONE VARCHAR(9) NULL,							-- Telefone, podendo ser nulo caso não tenha
	PRIMARY KEY(CODIGO)									-- Define o campo CODIGO como PK (Primary Key)
);

--
-- Cria a tabela CURSO
--
------------- TIPO_FK e INSTRUTOR_FK sâo nomes da constraint

CREATE TABLE CURSO (
	CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	-- Código interno (PK)
	CURSO VARCHAR(64) NOT NULL,							-- Título com até 64 caracteres
	TIPO INTEGER UNSIGNED NOT NULL,						-- Código do tipo de curso (idêntico a PK em CURSO)
	INSTRUTOR INTEGER UNSIGNED NOT NULL,				-- Código do instrutor (idêntico a PK em INSTRUTOR)
	VALOR DOUBLE NOT NULL,								-- Valor do curso
	PRIMARY KEY(CODIGO),								-- Define o campo CODIGO como PK (Primary Key)
	INDEX FK_TIPO(TIPO),								-- Define o campo TIPO como um índice
	INDEX FK_INSTRUTOR(INSTRUTOR),						-- Define o campo INSTRUTOR como um índice
	CONSTRAINT TIPO_FK FOREIGN KEY(TIPO) REFERENCES TIPO(CODIGO),		    -- Cria o relacionamento (FK) com a tabela TIPO
	CONSTRAINT INSTRUTOR_FK FOREIGN KEY(INSTRUTOR) REFERENCES INSTRUTOR(CODIGO)	-- Cria o relacionamento (FK) com a tabela INSTRUTOR
                                                              -- INSTRUTOR o nome da tabela e CODIGO o campo dela 
	);								                       


--
-- Cria a tabela ALUNO
--
CREATE TABLE ALUNO (
	CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	-- Código interno (PK)
	ALUNO VARCHAR(64) NOT NULL,							-- Nome com até 64 caracteres
	ENDERECO VARCHAR(230) NOT NULL,						-- Endereço com até 230 caracteres
	EMAIL VARCHAR(128) NOT NULL,						-- E-mail com até 128 caracteres
	PRIMARY KEY(CODIGO)				 					-- Define o campo CODIGO como PK (Primary Key)
);

--
-- Cria a tabela PEDIDO
--
CREATE TABLE PEDIDO (
	CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	-- Código interno (PK)
	ALUNO INTEGER UNSIGNED NOT NULL,					-- Código do aluno (idêntico a PK em ALUNO)
	DATAHORA DATETIME NOT NULL,							-- Armazena data e hora em uma única coluna
	PRIMARY KEY(CODIGO),								-- Define o campo CODIGO como PK (Primary Key)
	INDEX FK_ALUNO(ALUNO),								-- Define o campo ALUNO como um índice
	CONSTRAINT ALUNO_FK FOREIGN KEY(ALUNO) REFERENCES ALUNO(CODIGO)			-- Cria o relacionamento (FK) com a tabela ALUNO
);

--
-- Cria a tabela PEDIDO_DETALHE
--
CREATE TABLE PEDIDO_DETALHE (
	PEDIDO INTEGER UNSIGNED NOT NULL,					-- Código do pedido (idêntico a PK em PEDIDO)
	CURSO INTEGER UNSIGNED NOT NULL,					-- Código do curso (idêntico a PK em CURSO)
	VALOR DOUBLE NOT NULL,								-- Valor do curso
	INDEX FK_PEDIDO(PEDIDO),							-- Define o campo ALUNO como um índice
	INDEX FK_CURSO(CURSO),								-- Define o campo ALUNO como um índice
	PRIMARY KEY(PEDIDO, CURSO),							-- Define a chave primária composta
	CONSTRAINT PEDIDO_FK FOREIGN KEY(PEDIDO) REFERENCES PEDIDO(CODIGO),		-- Cria o relacionamento (FK) com a tabela PEDIDO
	CONSTRAINT CURSO_FK FOREIGN KEY(CURSO) REFERENCES CURSO(CODIGO)			-- Cria o relacionamento (FK) com a tabela CURSO
);
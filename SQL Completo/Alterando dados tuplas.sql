--
-- Altere o endereço do aluno JOSÉ para 'Av. Brasil 778'
--
-------- ALUNO é TABELA, ENDERECO é o CAMPO
UPDATE ALUNO SET ENDERECO = 'Av. Brasil 778' WHERE CODIGO = 1;

--
-- Altere o e-mail do aluno CRIS para 'cristiano@softblue.com.br'
--
UPDATE ALUNO SET EMAIL = 'cristiano@softblue.com.br' WHERE CODIGO = 4;

--
-- Aumente em 10% o valor dos cursos abaixo de 300
--
UPDATE CURSO SET VALOR = VALOR * 1.1 WHERE VALOR < 300;

--
-- Altere o nome do curso de Php Básico para Php Fundamentos
--
UPDATE CURSO SET CURSO = 'Php Fundamentos' WHERE CURSO = 'Php Básico';

------ DELETAR UM DADO
DELETE FROM PESSOAS WHERE CPF = '222.222.222-22';
DELETE FROM PESSOAS WHERE NOME = 'Mario';

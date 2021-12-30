--
-- Crie uma visão que traga o título e preço somente dos cursos de programação da Softblue

------------ CURSOS_PROGRAMACAO o nome da visão, CURSO e VALOR são campo, 
CREATE VIEW CURSOS_PROGRAMACAO AS SELECT CURSO, VALOR FROM CURSO INNER JOIN TIPO ON CURSO.TIPO = TIPO.CODIGO WHERE TIPO.TIPO = 'Programação';

--
-- Crie uma visão que traga os títulos dos cursos, tipo do curso e nome do instrutor
CREATE VIEW CURSOS_PROGRAMACAO_COMPLETO AS SELECT CURSO, VALOR, INSTRUTOR.INSTRUTOR FROM CURSO INNER JOIN TIPO ON CURSO.TIPO = TIPO.CODIGO INNER JOIN INSTRUTOR ON CURSO.INSTRUTOR = INSTRUTOR.CODIGO;
--
-- Crie uma visão que exiba os pedidos realizados, informando o nome do aluno, data e código do pedido

CREATE VIEW PEDIDOS_REALIZADOS AS SELECT PEDIDO.CODIGO, PEDIDO.DATAHORA, ALUNO.ALUNO FROM PEDIDO INNER JOIN ALUNO ON PEDIDO.ALUNO = ALUNO.CODIGO;

-- EXCLUSÃO DE VISAO
DROP VIEW PEDIDOS_REALIZADOS;



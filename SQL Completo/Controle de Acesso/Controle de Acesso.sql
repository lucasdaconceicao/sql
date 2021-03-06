

START TRANSACTION; -- TRANSACAO EM ANDAMENTO

ROLLBACK  -- RETORNA PARA O VALOR INICIAL

COMMIT --  AS ALTERÇOES FORAM FEITAS COM SUCESSO 
       -- FIM DA TRANSACAO 
       -- SALVA AS ALTERACOES FEITAS NO BANCO       

CREATE USER LUCAS -- Cria um usuário
DROP USER LUCAS   -- Exclui um usuário
	   
--HABILITANDO ACESSOS
GRANT Ação ON Estrutura TO Usuário

-- REVOGANDO ACESSOS
REVOKE Ação ON Estrutura FROM Usuário
	-- AÇÕES
	ALL, SELECT, INSERT, UPDATE, DELETE

	-- ESTRUTURAS
	TABLE, VIEW, SEQUENCE

# Construa um Projeto Lógico de Banco de Dados do Zero

O objetivo desse desafio foi criar queries SQL para criar o banco e tabelas, inserir dados, e consultar dados específicos.

Foi utilizado como base, o modelo criado no desafio [Construindo um Esquema Conceitual para Banco De dados](https://github.com/DionnyZ/DIO--Construindo-um-Esquema-Conceitual-para-Banco-De-dados).

**As queries foram dividas em três arquivos:**
- [OficinaMecanica_Create.sql](https://github.com/DionnyZ/DIO--Construa-um-Projeto-Logico-de-Banco-de-Dados-do-Zero/blob/main/OficinaMecanica_Create.sql) com os comandos para criação das tabelas.
- [OficinaMecanica_Insert.sql](https://github.com/DionnyZ/DIO--Construa-um-Projeto-Logico-de-Banco-de-Dados-do-Zero/blob/main/OficinaMecanica_Insert.sql) com os comandos para inserção de dados.
- [OficinaMecanica_Select.sql](https://github.com/DionnyZ/DIO--Construa-um-Projeto-Logico-de-Banco-de-Dados-do-Zero/blob/main/OficinaMecanica_Select.sql) com os comandos para consultas.

## Queries de Consulta
``` SQL
-- Quantos pessoas estão cadastradas?
SELECT COUNT(*) AS Total_de_pessoas FROM pessoa;

-- Qual o serviço mais requisitado?
SELECT s.descricao AS servico, MAX(requisicoes) AS maior_requisicao FROM
	(SELECT idServico, COUNT(*) AS requisicoes FROM servicosOS GROUP BY idServico) AS sos
INNER JOIN servico AS s
ON s.idServico = sos.idServico;

-- Quais as peças cadastradas (em ordem alfabética)?
SELECT * FROM servico ORDER BY descricao ASC;

-- Quais as peças com quantidade abaixo de 10?
SELECT descricao, quantidade
FROM peca
HAVING quantidade < 10;

-- Qual o valor total de cada serviço?
SELECT sos.idOrdemServico, total_servico + total_peca AS total FROM
	(SELECT idOrdemServico, SUM(s.valor) AS total_servico FROM servicosOS AS sos
    INNER JOIN servico AS s
    ON s.idServico = sos.idServico
    GROUP BY idOrdemServico) AS sos
INNER JOIN
	(SELECT idOrdemServico, SUM(p.valor) AS total_peca FROM pecasOS AS pos
    INNER JOIN peca AS p
    ON p.idPeca = pos.idPeca
    GROUP BY idOrdemServico) AS pos
ON sos.idOrdemServico = pos.idOrdemServico;

-- Qual a equipe com mais membros?
SELECT idEquipe, MAX(membros) AS quantidade_membros FROM
	(SELECT idEquipe, COUNT(*) AS membros FROM membrosEquipe GROUP BY idEquipe) AS me;

-- Quais pessoas possuem "Jo" no nome?
select * from pessoa where nome like "%Jo%";
```

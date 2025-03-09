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
insert into pessoa values
	(1, "Dionny Bravo", "12345678901", "12345678904", "Rua das Malandragens, 10"),
    (2, "José Jonas", "12345678902", "12345678905", "Rua das Hortas, 11"),
    (3, "Giovanni Giorges", "12345678903", "12345678906", "Av. das Mortadelas, 12"),
    (4, "Diogo Brindo", "12345678904", "12345678907", "Rua das Cores, 13"),
    (5, "Jonathan Jow", "12345678905", "12345678908", "Av. Cheia de Carros, 14");
    
insert into cliente values
	(1, 1),
    (2, 2);
    
insert into mecanico values
	(1, 3),
    (2, 4),
    (3, 5);
    
insert into especialidade values
	(1, "Eletrônica Automotiva"),
    (2, "Alinhamento e Balanceamento"),
    (3, "Pintura e Funilaria");
    
insert into especialidadesMecanico values
	(1, 1, 1),
    (2, 1, 2),
    (3, 2, 2),
    (4, 2, 3),
    (5, 3, 3);
    
insert into equipe values
	(1),
    (2);
    
insert into membrosEquipe values
	(1, 1),
    (1, 2),
    (2, 2),
    (2, 3);
    
insert into veiculo values
	(1, 1, "ABC190", "Flink"),
    (2, 1, "ABC180", "Tonk"),
    (3, 2, "ABC170", "Marno");
    
insert into consulta values
	(1, 1, 1),
    (2, 2, 1),
    (3, 3, 2);
    
insert into ordemServico values
	(1, 1, "Finalizado", "2024-11-01", "2024-11-11"),
    (2, 2, "Em andamento", "2024-11-03", ""),
    (3, 3, "Cancelado", "2024-11-07", "");
    
insert into servico values
	(1, "Conserto do carburador", 90.50),
    (2, "Pintura", 80.10),
    (3, "Limpeza", 30.20),
    (4, "Troca de janela", 60.50);
    
insert into servicosOS values
	(1, 1),
    (2, 2),
    (3, 2),
    (3, 3),
    (4, 3);
    
insert into peca values
	(1, "Parafuso", 50, 0.80),
    (2, "Tinta", 8, 12.00),
    (3, "Janela", 30, 20.10),
    (4, "Aquela peça", 12, 10.80);
    
insert into pecasOS values
	(1, 1, 12),
    (2, 2, 1),
    (4, 2, 1),
    (3, 3, 4);
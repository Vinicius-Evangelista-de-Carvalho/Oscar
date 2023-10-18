-- 1) Quantas vezes Natalie Portman foi indicada ao Oscar?
SELECT * from movies where name like '%Natalie Portman%';
-- 2)Quantos Oscars Natalie Portman ganhou?
SELECT * from movies where name = '%Natalie Portman%' and winner like 'True%';
-- 3) Amy Adams já ganhou algum Oscar?
SELECT * from movies where name like '%Amy Adams%' and winner like 'True%';
-- 4) A série de filmes Toy Story ganhou um Oscar em quais anos?
SELECT * from movies where film like '%Toy Story%' and winner like 'True%';
-- 5)Quem tem mais Oscars: a categoria "Melhor  Ator" ou "Melhor Filme"?
    Select
    SUM(CASE WHEN category like '%ACTOR%' and winner like 'True%' THEN 1 ELSE 0 END) AS Melhor_Ator ,
    SUM(CASE WHEN category like '%BEST PICTURE%' and winner like 'True%' THEN 1 ELSE 0 END)  AS Melhor_Filme
   from movies;
-- 6)O primeiro Oscar para melhor Atriz foi para quem? Em que ano?
SELECT * from movies where category like '%ACTRESS%' and ceremony = '1' and winner like 'true%';
-- 7) Na coluna/campo Winner, altere todos os valores com "True" para 1 e todos os valores "False" para 0.
UPDATE movies
SET winner = CASE
    WHEN winner = 'true' THEN '1'
    WHEN winner = 'false' THEN '0'
    ELSE winner
END;
-- 8 Em qual edição do Oscar "Crash" ganhou o prêmio principal?
SELECT * FROM movies WHERE film = 'Crash' AND CATEGORY = 'FILM EDITING' AND winner LIKE '1%';
-- 9 Bom... dê um Oscar para um filme que merece muito, mas não ganhou.
UPDATE movies SET winner = '1' WHERE id_movie = '8595';
-- 10 O filme Central do Brasil aparece no Oscar?
SELECT * FROM movies WHERE film LIKE '%Central Station%';
-- 11 Inclua no banco 3 filmes que nunca nem foram nomeados ao Oscar, mas que na sua opinião, merecem. 
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2019', '2020', '93', '', 'Robert Rodriguez', 'Alita: Anjo de Combate', '0');
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2021', '2022', '93', '', 'Jon Watts', 'Homem-Aranha: Sem Volta para Casa', '0');
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2018', '2019', '93', '', 'Steven Spielberg', 'Jogador N° 1', '0');
-- 12  Crie uma nova categoria de premiação. Qualquer prêmio que você queira dar. Agora vamos dar esses prêmios aos filmes que você cadastrou na questão acima.'
UPDATE movies set category = 'Melhor Filme de Dragões' where ceremony = '93';
-- 13 Qual foi o primeiro ano a ter um prêmio do Oscar?
SELECT * from movies where ceremony = '1';
-- 14 - Pensando no ano em que você nasceu: Qual foi o Oscar de melhor filme, Melhor Atriz e Melhor Diretor?
SELECT year_ceremony, category, film, name from movies where category in ('BEST PICTURE','ACTRESS','DIRECTING') and year_ceremony ='1994' and winner like '1';
-- 15 Agora procure 7 atrizes que não sejam americanas, europeias ou brasileiras.  Vamos cadastrá-los no nosso banco, mas eles ainda não ganharam o Oscar. Só foram nomeados.
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2020', '2021', '92', 'ACTRESS', 'Gal Gadot', 'Mulher Maravilha', '0');
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2023', '2023', '93', 'ACTRESS', 'Margot Robbie', 'Barbie', '0');
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2020', '2021', '92', 'ACTRESS', 'Charlize Theron', 'The Old Guard', '0');
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2011', '2012', '84', 'ACTRESS', 'Natalie Portman', 'Sexo sem compromisso', '0');
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2021', '2022', '93', 'ACTRESS', 'Yvonne Strahovski', 'A guerra do amanhã', '0');
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2019', '2020', '91', 'ACTRESS', 'Gina Rodriguez', 'Miss Bala', '0');
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2015', '2016', '87', 'ACTRESS', 'Yael Grobglas', 'Jeruzalem', '0');
-- 16- Agora vamos falar da sua vida. Me diga o nome de uma pessoa que você admira e o que ela fez na sua vida. Agora me diz: Quê prêmio essa pessoa merece? 
-- Minha Vó e tudo que ela conquistou sozinha e com muitos filhos pra criar.
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2022', '2023', '94', 'BEST GRANDMOTHER', 'Maria Bezerra da Conceição', 'A mulher do ano', '0');
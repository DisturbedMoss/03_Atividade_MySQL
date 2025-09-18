CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes(
	id_classes BIGINT AUTO_INCREMENT PRIMARY KEY,
    nomeClasse VARCHAR(255),
    passiva VARCHAR(1000)
);

CREATE TABLE tb_personagens(
	id_personagens BIGINT AUTO_INCREMENT PRIMARY KEY,
    nomePersonagem VARCHAR(255),
    ataque INT,
    defesa INT,
    nivel INT,
    id_classes BIGINT,
    FOREIGN KEY (id_classes) REFERENCES tb_classes(id_classes)
);

INSERT INTO tb_classes(nomeClasse, passiva)
VALUES("Arqueiro", "Bonus de precisão ao usar Arco"),
("Guerreiro", "Aumento de resistência física"),
("Mago", "Regeneração de mana ao longo do tempo"),
("Assassino", "Chance de ataque crítico aumentado"),
("Paladino", "Aura de cura que regenera aliados próximos");

INSERT INTO tb_personagens(nomePersonagem, ataque, defesa, nivel, id_classes)
VALUES("Eldrin", 2200, 900, 5, 1),
("Cael", 2500, 1500, 6, 2),
("Lyra", 4000, 1000, 4, 3),
("Thorgar", 1800, 3500, 7, 5),
("Selene", 5100, 800, 8, 4),
("Baldur", 2000, 1000, 5, 2),
("Arwen", 3000, 1000, 6, 1),
("Darius", 2800, 2000, 7, 2);

SELECT * FROM tb_personagens WHERE ataque > 2000;

SELECT * FROM tb_personagens WHERE defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nomePersonagem LIKE "%C%";

SELECT *
FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.id_classes = tb_classes.id_classes;

SELECT *
FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.id_classes = tb_classes.id_classes
WHERE tb_personagens.id_classes = 1;
CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

CREATE TABLE tb_categorias(
	id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255) NOT NULL,
    origem VARCHAR(255) NOT NULL
);

CREATE TABLE tb_produtos(
	id_produtos BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    peso DECIMAL(6,2) NOT NULL,
    validade DATE NOT NULL,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias(tipo, origem)
VALUES("Ave", "Nacional"),
("Bovino", "Nacional"),
("Suíno", "Importado"),
("Peixe", "Nacional"),
("Carne Orgânica", "Orgânico");

INSERT INTO tb_produtos(nome, valor, peso, validade, id_categoria)
VALUES("Peito de Frango Congelado", 22.90, 1.00, "2025-09-30", 1),
("Coxa e Sobrecoxa", 18.50, 1.00, "2025-09-28", 1),
("Filé Mignon Bovino", 79.90, 0.50, "2025-10-05", 2),
("Picanha Bovino", 89.90, 0.50, "2025-10-03", 2),
("Costelinha Suína", 39.90, 1.00, "2025-09-25", 3),
("Salsicha Suína", 14.90, 0.50, "2025-09-27", 3),
("Salmão Filé", 59.90, 0.50, "2025-09-29", 4),
("Hambúrguer Orgânico de Carne", 24.90, 0.25, "2025-10-10", 5);

SELECT * FROM tb_produtos WHERE valor > 50.00;

SELECT * FROM tb_produtos WHERE valor BETWEEN 50.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

SELECT *
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.id_categoria = tb_categorias.id_categoria;

SELECT *
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.id_categoria = tb_categorias.id_categoria
WHERE tb_produtos.id_categoria = 1;
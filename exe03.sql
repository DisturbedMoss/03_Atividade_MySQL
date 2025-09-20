/*
Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os produtos.
Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia.

Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.

Insira 5 registros na tabela tb_categorias.
Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.

Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.
Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00.

Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.

Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica
(Exemplo: Todes os produtos que pertencem a categoria cosméticos).

Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.
*/

CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias(
	id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255) NOT NULL,
    descricao VARCHAR(400) NOT NULL
);

CREATE TABLE tb_produtos(
	id_produtos BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    validade DATE NOT NULL,
    fabricante VARCHAR(255) NOT NULL,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias(tipo, descricao)
VALUES("Cosmético", "Produtos de beleza e cuidados pessoais"),
("Medicamento", "Remédios de venda livre e controlada"),
("Higiene", "Produtos de higiene pessoal e limpeza"),
("Suplemento", "Vitaminas, minerais e complementos alimentares"),
("Infantil", "Produtos voltados para bebês e crianças");

INSERT INTO tb_produtos(nome, valor, validade, fabricante, id_categoria)
VALUES("Shampoo Revitalizante", 29.90, "2026-05-01", "Natura", 1),
("Creme Hidratante Facial", 45.50, "2027-02-15", "Avon", 1),
("Paracetamol 750mg", 12.00, "2026-11-10", "Medley", 2),
("Dipirona Sódica 1g", 9.50, "2026-08-30", "EMS", 2),
("Sabonete Antibacteriano", 5.90, "2027-03-20", "Protex", 3),
("Vitamina C 1000mg", 39.90, "2027-09-05", "Sundown", 4),
("Leite em Pó Infantil", 79.00, "2026-12-12", "Nestlé", 5),
("Lenços Umedecidos", 14.90, "2027-01-25", "Huggies", 5);

SELECT * FROM tb_produtos WHERE valor > 50.00;

SELECT * FROM tb_produtos WHERE valor BETWEEN 5.00 AND 60.00;

SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

SELECT *
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.id_categoria = tb_categorias.id_categoria;

SELECT *
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.id_categoria = tb_categorias.id_categoria
WHERE tb_produtos.id_categoria = 1;
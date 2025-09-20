/*
Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar as pizzas.
Crie a tabela tb_pizzas e determine 4 atributos, além da Chave Primária, relevantes aos produtos da pizzaria.

Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_pizzas.

Insira 5 registros na tabela tb_categorias.
Insira 8 registros na tabela tb_pizzas, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.
pizza nome, valor

Faça um SELECT que retorne todas as pizzas cujo valor seja maior do que R$ 45,00.
Faça um SELECT que retorne todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00.

Faça um SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome.

Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias, onde traga apenas as pizzas que pertençam a uma categoria específica
(Exemplo: Todas as pizzas que são doce).

Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.

*/

CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias(
	id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255) NOT NULL,
    descricao VARCHAR(400) NOT NULL
);

CREATE TABLE tb_pizzas(
	id_pizza BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    valor DECIMAL(10,2),
    tamanho VARCHAR(255),
    tempo_preparo INT NOT NULL,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias(tipo, descricao)
VALUES("Tradicional", "Pizzas clássicas com sabores populares e tradicionais"),
("Vegetariana", "Pizzas feitas sem carne, com foco em vegetais frescos"),
("Doce", "Pizzas doces para sobremesa, com chocolate e frutas"),
("Frutos do Mar", "Pizzas com camarão, atum, lula e outros frutos do mar"),
("Vegana", "Pizzas 100% livres de produtos de origem animal");


INSERT INTO tb_pizzas(nome, valor, tamanho, tempo_preparo, id_categoria)
VALUES("Mussarela", 39.90, "Média", 20, 1),
("Marguerita", 42.50, "Grande", 25, 1),
("Vegetariana", 49.90, "Grande", 22, 2),
("Brigadeiro", 35.00, "Média", 18, 3),
("Camarão", 69.90, "Família", 30, 4),
("Vegana", 52.00, "Grande", 24, 5),
("Calabresa", 45.90, "Grande", 20, 1),
("Romeu e Julieta", 75.00, "Família", 28, 3);

SELECT * FROM tb_pizzas WHERE valor > 45.00;

SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas WHERE nome LIKE "%M%";

SELECT *
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.id_categoria = tb_categorias.id_categoria;

SELECT *
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.id_categoria = tb_categorias.id_categoria
WHERE tb_pizzas.id_categoria = 3;
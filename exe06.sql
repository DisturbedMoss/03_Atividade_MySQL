/*
4
db_cidade_das_carnes, tb_produtos e tb_categorias
Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os produtos.
Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia.

Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.

Insira 5 registros na tabela tb_categorias.
Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias

Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.
Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 50,00 e R$ 150,00.

Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.

Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica
(Exemplo: Todes os produtos que pertencem a categoria aves ou frutas).

Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.

5------------------------------------------------------------------
db_construindo_vidas, tb_produtos e tb_categorias
Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os produtos.
Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia.

Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.

Insira 5 registros na tabela tb_categorias.
Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.

Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 100,00.
Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 70,00 e R$ 150,00.

Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.

Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica
(Exemplo: Todes os produtos que pertencem a categoria hidráulica).

Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.
*/

CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias(
	id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255) NOT NULL,
    nivel VARCHAR(255) NOT NULL
);

CREATE TABLE tb_cursos(
	id_produtos BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    duracao INT,
    instrutor VARCHAR(255) NOT NULL,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias(tipo, nivel)
VALUES("Java", "Intermediário"),
("C", "Iniciante"),
("Python", "Avançado"),
("JavaScript", "Intermediário"),
("SQL", "Iniciante");

INSERT INTO tb_cursos(nome, valor, duracao, instrutor, id_categoria)
VALUES("Java para Web", 499.90, 60, "Carlos Silva", 1),
("Estrutura de Dados em C", 299.90, 40, "Ana Souza", 2),
("Machine Learning com Python", 799.90, 80, "Roberto Lima", 3),
("JavaScript para Frontend", 399.90, 50, "Fernanda Castro", 4),
("Banco de Dados com SQL", 199.90, 30, "Marcos Oliveira", 5),
("APIs REST com Java Spring", 599.90, 70, "Patrícia Gomes", 1),
("Programação de Jogos em C", 349.90, 45, "Ricardo Mendes", 2),
("Automação de Tarefas com Python", 449.90, 55, "Juliana Ferreira", 3);

SELECT * FROM tb_cursos WHERE valor > 500.00;

SELECT * FROM tb_cursos WHERE valor BETWEEN 600.00 AND 1000.00;

SELECT * FROM tb_cursos WHERE nome LIKE "%J%";

SELECT *
FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.id_categoria = tb_categorias.id_categoria;

SELECT *
FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.id_categoria = tb_categorias.id_categoria
WHERE tb_cursos.id_categoria = 1;
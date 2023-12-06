-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_generation_game_online;

-- Seleção do banco de dados
USE db_generation_game_online;

-- Criação da tabela tb_classes
CREATE TABLE IF NOT EXISTS tb_classes (
    id_classe INT PRIMARY KEY,
    nome_classe VARCHAR(50) NOT NULL,
    descricao_classe VARCHAR(255)
);

-- Inserção de registros na tabela tb_classes
INSERT INTO tb_classes (id_classe, nome_classe, descricao_classe) VALUES
(1, 'Guerreiro', 'Classe de combate corpo a corpo'),
(2, 'Arqueiro', 'Classe de ataque à distância'),
(3, 'Mago', 'Classe de magias poderosas'),
(4, 'Ladrão', 'Classe furtiva'),
(5, 'Cavaleiro', 'Classe montada');

-- Criação da tabela tb_personagens
CREATE TABLE IF NOT EXISTS tb_personagens (
    id_personagem INT PRIMARY KEY,
    nome_personagem VARCHAR(50) NOT NULL,
    poder_ataque INT,
    poder_defesa INT,
    id_classe INT,
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id_classe)
);

-- Inserção de registros na tabela tb_personagens
INSERT INTO tb_personagens (id_personagem, nome_personagem, poder_ataque, poder_defesa, id_classe) VALUES
(1, 'Personagem1', 2500, 1200, 2),
(2, 'Personagem2', 1800, 1600, 1),
(3, 'Personagem3', 2100, 1800, 3),
(4, 'Personagem4', 1900, 1100, 4),
(5, 'Personagem5', 2200, 2000, 5),
(6, 'Personagem6', 2300, 1300, 2),
(7, 'Personagem7', 1900, 1500, 1),
(8, 'Personagem8', 2000, 1700, 3);

-- SELECT que retorne todos os personagens cujo poder de ataque seja maior do que 2000
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

-- SELECT que retorne todos os personagens cujo poder de defesa esteja no intervalo 1000 e 2000
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- SELECT utilizando o operador LIKE, buscando todos os personagens que possuam a letra C no atributo nome
SELECT * FROM tb_personagens WHERE nome_personagem LIKE '%C%';

-- SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes
SELECT * FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id_classe;

-- SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes,
-- onde traga apenas os personagens que pertençam a uma classe específica (Exemplo: Todos os personagens da classe dos arqueiros)
SELECT * FROM tb_personagens 
INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id_classe 
WHERE tb_classes.nome_classe = 'Arqueiro';

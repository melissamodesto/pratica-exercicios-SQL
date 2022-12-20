/* -- Pergunta 01 */
SELECT * FROM produtos LIMIT 5;

/* -- Pergunta 02 */
SELECT * FROM clientes LIMIT 3;

/* -- Pergunta 03 */
SELECT * FROM produtos WHERE nome = 'televisão 43"';

/* -- Pergunta 04 */
INSERT INTO produtos (nome, preco) VALUES ('Macbook Pro 13"', 1700000);

/* -- Pergunta 05 */
DELETE * FROM clientes WHERE nome = 'Orlando Pequeno Jesus';

/* -- Pergunta 06 */
UPDATE produtos SET preco = 8000 WHERE nome = 'Pelúcia Strange Planet com Gatinho';

/* -- Pergunta 07 */
UPDATE produtos SET preco = 8000 WHERE nome = 'Violão Lava ME 2';

/* -- Pergunta 08 */
UPDATE clientes SET cpf = 04652651298 WHERE id = 9;

/* -- Pergunta 09 */
INSERT INTO compras (id_cliente, id_produto) VALUES (8, 10);

/* -- Pergunta 10 */
INSERT INTO compras (id_cliente, id_produto) VALUES (4, 8) (4, 8);

/* -- Pergunta 11 */
DELETE FROM compras WHERE id_cliente = 5 AND id_produto = 14;

/* -- Pergunta 12 */
SELECT * FROM produtos ORDER BY preco;

/* -- Pergunta 13 */
SELECT * FROM produtos ORDER BY preco LIMIT 3;

/* -- Pergunta 14 */
SELECT * FROM produtos ORDER BY preco DESC LIMIT 1;

/* -- Pergunta 15 */
SELECT * FROM produtos ORDER BY preco LIMIT 1 OFFSET 1;

/* --Desafios
-- Pergunta 01 */
SELECT * FROM produtos WHERE nome LIKE 'Televi%';

/* -- Pergunta 02 */
SELECT * FROM produtos WHERE preco < 100000;

/* -- Pergunta 03 */
SELECT * FROM produtos WHERE nome LIKE 'Celular%' AND preco < 200000;

/* -- Pergunta 04 */
SELECT * FROM clientes WHERE id NOT IN (SELECT id_cliente FROM compras);

/* -- Pergunta 05 */
SELECT * FROM produtos WHERE id IN (SELECT id_produto FROM compras WHERE id_cliente IN(SELECT id FROM clientes WHERE nome LIKE 'Ben%'));
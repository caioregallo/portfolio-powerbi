-- Visualizar os dados de vendas--
SELECT *
FROM tb_dsa_vendas
LIMIT 10;


-- Visualizar os pedidos--
SELECT *
FROM tb_dsa_pedidos
LIMIT 10;


-- Visualizar os produtos--
SELECT *
FROM tb_dsa_produtos
LIMIT 10;


-- Visualizar os clientes--
SELECT *
FROM tb_dsa_clientes
LIMIT 10;


-- Quantidade de registros de vendas--
SELECT COUNT(*)
FROM tb_dsa_vendas;


-- Quantidade de clientes cadastrados--
SELECT COUNT(DISTINCT id_cliente)
FROM tb_dsa_clientes;


-- Quantidade de clientes que realizaram compras--
SELECT COUNT(DISTINCT cliente)
FROM tb_dsa_vendas;


-- Verificar clientes sem correspondência--
SELECT
    tb_dsa_vendas.cliente,
    tb_dsa_clientes.id_cliente,
    tb_dsa_clientes.nome_cliente
FROM tb_dsa_vendas
LEFT JOIN tb_dsa_clientes
    ON tb_dsa_vendas.cliente = tb_dsa_clientes.id_cliente
WHERE tb_dsa_clientes.id_cliente IS NULL;

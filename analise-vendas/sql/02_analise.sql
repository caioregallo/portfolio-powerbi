-- Faturamento por categoria--
SELECT
    tb_dsa_produtos.categoria,
    SUM(tb_dsa_vendas.valor_venda) AS faturamento
FROM tb_dsa_vendas
JOIN tb_dsa_produtos
    ON tb_dsa_vendas.produto = tb_dsa_produtos.id_produto
GROUP BY tb_dsa_produtos.categoria
ORDER BY faturamento DESC;

-- Faturamento por categoria e percentual do faturamento total--
SELECT
    tb_dsa_produtos.categoria,
    SUM(tb_dsa_vendas.valor_venda) AS faturamento,
    SUM(tb_dsa_vendas.valor_venda) /
        (
            SELECT SUM(valor_venda)
            FROM tb_dsa_vendas
        ) * 100 AS percentual_faturamento
FROM tb_dsa_vendas
JOIN tb_dsa_produtos
    ON tb_dsa_vendas.produto = tb_dsa_produtos.id_produto
GROUP BY tb_dsa_produtos.categoria
ORDER BY faturamento DESC;

-- Top 5 clientes por faturamento--
SELECT
    tb_dsa_clientes.id_cliente,
    tb_dsa_clientes.nome_cliente,
    SUM(tb_dsa_vendas.valor_venda) AS faturamento
FROM tb_dsa_vendas
JOIN tb_dsa_clientes
    ON tb_dsa_vendas.cliente = tb_dsa_clientes.id_cliente
GROUP BY
    tb_dsa_clientes.id_cliente,
    tb_dsa_clientes.nome_cliente
ORDER BY faturamento DESC
LIMIT 5;

-- Top 5 produtos por faturamento--
SELECT
    tb_dsa_produtos.id_produto,
    tb_dsa_produtos.nome_produto,
    SUM(tb_dsa_vendas.valor_venda) AS faturamento
FROM tb_dsa_vendas
JOIN tb_dsa_produtos
    ON tb_dsa_vendas.produto = tb_dsa_produtos.id_produto
GROUP BY
    tb_dsa_produtos.id_produto,
    tb_dsa_produtos.nome_produto
ORDER BY faturamento DESC
LIMIT 5;

-- Faturamento por mês--
SELECT
    tb_dsa_pedidos.ano,
    tb_dsa_pedidos.mes,
    SUM(tb_dsa_vendas.valor_venda) AS faturamento
FROM tb_dsa_vendas
JOIN tb_dsa_pedidos
    ON tb_dsa_vendas.pedido = tb_dsa_pedidos.id_pedido
GROUP BY
    tb_dsa_pedidos.ano,
    tb_dsa_pedidos.mes
ORDER BY
    tb_dsa_pedidos.ano,
    tb_dsa_pedidos.mes;

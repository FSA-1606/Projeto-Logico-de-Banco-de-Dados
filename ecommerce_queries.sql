-- Quantos pedidos foram feitos por cada cliente?
-- Cláusulas utilizadas: SELECT, JOIN, GROUP BY, COUNT

SELECT
    c.nome AS nome_cliente,
    COUNT(p.id_pedido) AS total_de_pedidos
FROM
    cliente c
LEFT JOIN
    pedido p ON c.id_cliente = p.id_cliente
GROUP BY
    c.id_cliente, c.nome
ORDER BY
    total_de_pedidos DESC;

-- Quais fornecedores também são clientes?
SELECT
    f.razao_social AS fornecedor_e_cliente
FROM
    fornecedor f
JOIN
    cliente_pj cpj ON f.cnpj = cpj.cnpj;

-- Relação de produtos, seus fornecedores e a quantidade em cada estoque.
SELECT
    p.descricao AS produto,
    p.valor_unitario,
    f.razao_social AS fornecedor,
    e.local AS local_estoque,
    pe.quantidade
FROM
    produto p
JOIN fornecedor_produto fp ON p.id_produto = fp.id_produto
JOIN fornecedor f ON fp.id_fornecedor = f.id_fornecedor
JOIN produto_estoque pe ON p.id_produto = pe.id_produto
JOIN estoque e ON pe.id_estoque = e.id_estoque
ORDER BY
    p.descricao, f.razao_social;

--  Relação de nomes dos fornecedores e nomes dos produtos que eles fornecem.
SELECT
    f.razao_social AS fornecedor,
    p.descricao AS produto
FROM
    fornecedor f
JOIN
    fornecedor_produto fp ON f.id_fornecedor = fp.id_fornecedor
JOIN
    produto p ON fp.id_produto = p.id_produto
ORDER BY
    f.razao_social, p.descricao;


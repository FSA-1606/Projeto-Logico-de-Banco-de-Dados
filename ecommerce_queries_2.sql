USE ecommerce;

-- Relação de nomes dos fornecedores e nomes dos produtos que eles fornecem.
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

-- Qual o valor total de cada pedido e quais clientes fizeram pedidos acima de R$ 500,00?
SELECT
    c.nome AS nome_cliente,
    p.id_pedido,
    -- Expressão para gerar o atributo derivado 'valor_total_pedido'
    (SUM(rpp.quantidade * pr.valor_unitario) + p.frete) AS valor_total_pedido
FROM
    cliente c
JOIN pedido p ON c.id_cliente = p.id_cliente
JOIN relacao_produto_pedido rpp ON p.id_pedido = rpp.id_pedido
JOIN produto pr ON rpp.id_produto = pr.id_produto
GROUP BY
    c.nome, p.id_pedido, p.frete
HAVING
    valor_total_pedido > 500.00
ORDER BY
    valor_total_pedido DESC;


-- Listar produtos com menos de 30 unidades em estoque, exibindo o local e o contato do fornecedor.
SELECT
    p.descricao AS produto_com_baixo_estoque,
    pe.quantidade,
    e.local AS local_estoque,
    f.razao_social AS fornecedor,
    f.telefone AS telefone_fornecedor
FROM
    produto p
JOIN produto_estoque pe ON p.id_produto = pe.id_produto
JOIN estoque e ON pe.id_estoque = e.id_estoque
JOIN fornecedor_produto fp ON p.id_produto = fp.id_produto
JOIN fornecedor f ON fp.id_fornecedor = f.id_fornecedor
WHERE
    pe.quantidade < 30;
USE ecommerce;

INSERT INTO fornecedor (razao_social, cnpj, telefone) VALUES
('Tecnologia & Cia', '11111111000111', '11987654321'),
('Móveis Modernos SA', '22222222000122', '21912345678'),
('Importados de Qualidade', '33333333000133', '51999887766');

INSERT INTO estoque (local) VALUES ('São Paulo'), ('Rio de Janeiro'), ('Porto Alegre');

INSERT INTO produto (codigo_produto, categoria, descricao, valor_unitario) VALUES
('P001', 'Eletrônicos', 'Monitor Gamer 4K', 2500.00),
('P002', 'Eletrônicos', 'Teclado Mecânico RGB', 350.50),
('P003', 'Móveis', 'Cadeira de Escritório Ergonômica', 1200.00),
('P004', 'Decoração', 'Luminária de Mesa LED', 150.00);

INSERT INTO fornecedor_produto (id_fornecedor, id_produto) VALUES (1, 1), (1, 2), (2, 3), (3, 4), (3, 1);
INSERT INTO produto_estoque (id_produto, id_estoque, quantidade) VALUES (1, 1, 10), (2, 1, 50), (3, 2, 25), (4, 3, 30);

INSERT INTO cliente_pf (cpf, data_nascimento) VALUES ('123.456.789-00', '1990-05-15'), ('987.654.321-00', '1985-11-22');
INSERT INTO cliente_pj (cnpj, razao_social) VALUES ('44444444000144', 'Soluções de TI Ltda');

INSERT INTO cliente (nome, email, tipo, id_cliente_pf) VALUES
('Carlos Silva', 'carlos.silva@email.com', 'PF', 1),
('Ana Pereira', 'ana.pereira@email.com', 'PF', 2);
INSERT INTO cliente (nome, email, tipo, id_cliente_pj) VALUES
('Soluções de TI Ltda', 'compras@solucoesti.com', 'PJ', 1);

INSERT INTO pedido (id_cliente, frete, status_pedido) VALUES
(1, 25.50, 'Entregue'),
(3, 50.00, 'Enviado'),
(1, 15.00, 'Em processamento'),
(2, 22.75, 'Entregue');

INSERT INTO relacao_produto_pedido (id_pedido, id_produto, quantidade) VALUES
(1, 1, 1), (1, 2, 1),
(2, 3, 5),
(3, 4, 2),
(4, 2, 1);
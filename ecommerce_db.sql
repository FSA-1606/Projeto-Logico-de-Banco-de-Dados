CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

CREATE TABLE fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(45) NOT NULL,
    cnpj CHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(15)
);

CREATE TABLE estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    local VARCHAR(45) NOT NULL
);

CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    codigo_produto VARCHAR(45) NOT NULL UNIQUE,
    categoria VARCHAR(45) NOT NULL,
    descricao VARCHAR(45),
    valor_unitario DECIMAL(10, 2) NOT NULL
);

CREATE TABLE cliente_pf (
    id_cliente_pf INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE
);

CREATE TABLE cliente_pj (
    id_cliente_pj INT AUTO_INCREMENT PRIMARY KEY,
    cnpj VARCHAR(14) NOT NULL UNIQUE,
    razao_social VARCHAR(45)
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL UNIQUE,
    tipo ENUM('PF', 'PJ') NOT NULL,
    id_cliente_pf INT,
    id_cliente_pj INT,
    CONSTRAINT fk_cliente_pf FOREIGN KEY (id_cliente_pf) REFERENCES cliente_pf(id_cliente_pf),
    CONSTRAINT fk_cliente_pj FOREIGN KEY (id_cliente_pj) REFERENCES cliente_pj(id_cliente_pj)
);

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    status_pedido ENUM('Em processamento', 'Enviado', 'Entregue', 'Cancelado') DEFAULT 'Em processamento',
    frete FLOAT,
    id_cliente INT,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE entrega (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    status ENUM('Aguardando envio', 'Em trânsito', 'Entregue') NOT NULL,
    codigo_rastreio VARCHAR(30),
    id_pedido INT,
    CONSTRAINT fk_entrega_pedido FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT,
    id_cliente INT,
    forma_pagamento ENUM('Boleto', 'Cartão de Crédito', 'Pix'),
    valor DECIMAL(10, 2),
    PRIMARY KEY (id_pagamento, id_cliente),
    CONSTRAINT fk_pagamento_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE fornecedor_produto (
    id_fornecedor INT,
    id_produto INT,
    PRIMARY KEY (id_fornecedor, id_produto),
    CONSTRAINT fk_fornecedor_produto_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor),
    CONSTRAINT fk_fornecedor_produto_produto FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

CREATE TABLE produto_estoque (
    id_produto INT,
    id_estoque INT,
    quantidade FLOAT,
    PRIMARY KEY (id_produto, id_estoque),
    CONSTRAINT fk_produto_estoque_produto FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    CONSTRAINT fk_produto_estoque_estoque FOREIGN KEY (id_estoque) REFERENCES estoque(id_estoque)
);

CREATE TABLE relacao_produto_pedido (
    id_pedido INT,
    id_produto INT,
    quantidade FLOAT,
    PRIMARY KEY (id_pedido, id_produto),
    CONSTRAINT fk_rel_produto_pedido_pedido FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    CONSTRAINT fk_rel_produto_pedido_produto FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);
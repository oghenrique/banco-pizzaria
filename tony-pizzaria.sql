create schema tony_pizzaria;

use tony_pizzaria;

create table clientes (
    id_cliente int primary key,
    nome varchar(255),
    email varchar(255),
    telefone bigint, 
    endereco varchar(400)
);

create table contas (
    id_conta int primary key,
    id_cliente int,
    email varchar(255),
    senha varchar(255),
    telefone bigint,
    foto_perfil varchar(155),
    
    foreign key (id_cliente) references clientes(id_cliente)
);

create table categorias (
    id_categoria int primary key,
    nome_categoria varchar(100)
);

create table produtos (
    id_produto int primary key,
    nome_produto varchar(100),
    descricao varchar(300),
    valor_produto double,
    id_categoria int,
    
    foreign key (id_categoria) references categorias (id_categoria)
);

create table pedidos (
    id_pedido int primary key,
    id_cliente int,
    data_pedido date,
    endereco_entrega varchar(455),
    
    foreign key (id_cliente) references clientes(id_cliente)
);

create table itens_pedido (
    itens_id int primary key,
    id_pedido int,
    id_produto int,
    quantidade_produtos int,
    
    foreign key (id_pedido) references pedidos (id_pedido),
    foreign key (id_produto) references produtos (id_produto)
    
);

create table comentarios (
    id_comentario int primary key,
    id_cliente int,
    id_produto int,
    data_comentario date,
    titulo_comentario varchar(55),
    comentario varchar(500),
    avaliacao double,
    
    foreign key (id_cliente) references clientes (id_cliente),
    foreign key (id_produto) references produtos (id_produto)
);

create table favoritos (
    id_favorito int primary key,
    id_cliente int,
    id_produto int,
    
    foreign key (id_cliente) references clientes (id_cliente),
    foreign key (id_produto) references produtos (id_produto)
);

create table pagamentos (
    id_pagamento int primary key,
    id_pedido int,
    total_a_pagar double,
    data_pagamento date,
    forma_pagamento varchar(55),
    
    foreign key (id_pedido) references pedidos (id_pedido)
);
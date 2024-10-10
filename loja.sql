CREATE DATABASE Loja;

CREATE LOGIN loja WITH PASSWORD = 'Loja2468';

CREATE TABLE [dbo].[usuario] (
    [idUsuario] INT           IDENTITY (1, 1) NOT NULL,
    [login]     NVARCHAR (50) NOT NULL,
    [senha]     NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([idUsuario] ASC)
);

CREATE TABLE [dbo].[pessoa] (
    [idPessoa]   INT           NOT NULL,
    [nome]       VARCHAR (255) NOT NULL,
    [logradouro] VARCHAR (255) NOT NULL,
    [cidade]     VARCHAR (100) NOT NULL,
    [estado]     VARCHAR (50)  NOT NULL,
    [telefone]   VARCHAR (20)  NOT NULL,
    [email]      VARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([idPessoa] ASC)
);

CREATE TABLE [dbo].[pessoa_fisica] (
    [idPessoa]  INT          NOT NULL,
    [cpf] VARCHAR(14) UNIQUE NOT NULL,
    PRIMARY KEY CLUSTERED ([idPessoa] ASC),
    FOREIGN KEY ([idPessoa]) REFERENCES [dbo].[pessoa] ([idPessoa])
);

CREATE TABLE [dbo].[pessoa_juridica] (
    [idPessoa]  INT          NOT NULL,
    [cnpj] VARCHAR(14) UNIQUE NOT NULL,
    PRIMARY KEY CLUSTERED ([idPessoa] ASC),
    FOREIGN KEY ([idPessoa]) REFERENCES [dbo].[pessoa] ([idPessoa])
);

CREATE TABLE [dbo].[produto] (
    [idProduto]  INT             NOT NULL,
    [nome]       VARCHAR (255)   NOT NULL,
    [quantidade] INT             NOT NULL,
    [precoVenda] DECIMAL (10, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([idProduto] ASC)
);

CREATE TABLE [dbo].[movimento] (
    [idMovimento]   INT             NOT NULL,
    [idUsuario]     INT             NOT NULL,
    [idPessoa]      INT             NOT NULL,
    [idProduto]     INT             NOT NULL,
    [quantidade]    INT             NOT NULL,
    [tipo]          CHAR (1)        NOT NULL,
    [valorUnitario] DECIMAL (10, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([idMovimento] ASC),
    CONSTRAINT [chk_tipo_movimento] CHECK ([tipo]='S' OR [tipo]='E'),
    FOREIGN KEY ([idPessoa]) REFERENCES [dbo].[pessoa] ([idPessoa]),
    FOREIGN KEY ([idProduto]) REFERENCES [dbo].[produto] ([idProduto]),
    FOREIGN KEY ([idUsuario]) REFERENCES [dbo].[usuario] ([idUsuario])
);



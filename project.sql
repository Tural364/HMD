create database bmc
use bmc

CREATE TABLE Category
(
    [Id] INT PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(MAX)
);
SELECT * FROM Category

CREATE TABLE Buyers
(
    [Id] INT PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(MAX),
    [Surname] NVARCHAR(MAX),
    [Email] NVARCHAR(MAX),
    [Phone] NVARCHAR(MAX),
    [Password] NVARCHAR(MAX),
    [Address] NVARCHAR(MAX),
    [City] NVARCHAR(MAX)
);
SELECT * FROM Buyers

CREATE TABLE Products
(
    [Id] INT PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(MAX),
    [Price] MONEY,
    [Quantity] INT,
    [CategoryId] INT,
    FOREIGN KEY ([CategoryId]) REFERENCES Category([Id])
);
SELECT * FROM Products

CREATE TABLE [Order]
(
    [Id] INT PRIMARY KEY IDENTITY(1,1),
    [BuyerId] INT,
    [Date] DATETIME,
    [Status] NVARCHAR(MAX),
    FOREIGN KEY ([BuyerId]) REFERENCES Buyers([Id])
);
SELECT * FROM [Order]


CREATE TABLE OrderDetails
(
    [Id] INT PRIMARY KEY IDENTITY(1,1),
    [OrderId] INT,
    [ProductId] INT,
    [Quantity] INT,
    [Price] MONEY,
    FOREIGN KEY ([OrderId]) REFERENCES [Order]([Id]),
    FOREIGN KEY ([ProductId]) REFERENCES Products([Id])
);
SELECT * FROM OrderDetails


CREATE TABLE Payments
(
    [Id] INT PRIMARY KEY IDENTITY(1,1),
    [OrderId] INT,
    [Sum] MONEY,
    [PayMethod] NVARCHAR(MAX),
    [Status] NVARCHAR(MAX),
    FOREIGN KEY ([OrderId]) REFERENCES [Order]([Id])
);
SELECT * FROM Payments


CREATE TABLE Shipping
(
    [Id] INT PRIMARY KEY IDENTITY(1,1),
    [OrderId] INT,
    [Address] NVARCHAR(MAX),
    [Delivery] NVARCHAR(MAX),
    [SendDate] DATETIME,
    [DateReceived] DATETIME,
    [TrackNum] NVARCHAR(100),
    FOREIGN KEY ([OrderId]) REFERENCES [Order]([Id])
);
SELECT * FROM Shipping


CREATE TABLE Admins
(
    [Id] INT PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(MAX),
    [Role] NVARCHAR(MAX),
    [Email] NVARCHAR(MAX)
);
SELECT * FROM Admins



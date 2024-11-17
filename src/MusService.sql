/*
Created: 03.04.2024
Modified: 09.04.2024
Model: KeyModel
Database: MS SQL Server 2019
*/


-- Create tables section -------------------------------------------------

-- Table Пользователь/E1

CREATE TABLE [Пользователь/E1]
(
 [Никнейм] Varchar(30) NOT NULL,
 [Имя_пользователя] Varchar(50) NOT NULL,
 [Колличество_баллов] Int NOT NULL,
 [ID_подписки] Int NOT NULL,
 [Код_пользователя] Int NOT NULL
)
go

-- Add keys for table Пользователь/E1

ALTER TABLE [Пользователь/E1] ADD CONSTRAINT [Unique_Identifier1] PRIMARY KEY ([Код_пользователя])
go

-- Table Подписка/E2

CREATE TABLE [Подписка/E2]
(
 [ID_подписки] Int NOT NULL,
 [Дата_подключения] Date NOT NULL,
 [Дата_окончания_подписки] Date NOT NULL,
 [Код_пользователя] Int NULL
)
go

-- Add keys for table Подписка/E2

ALTER TABLE [Подписка/E2] ADD CONSTRAINT [Unique_Identifier2] PRIMARY KEY ([ID_подписки])
go

-- Table Трек/E3

CREATE TABLE [Трек/E3]
(
 [ID_трека] Int NOT NULL,
 [Название_трека] Varchar(45) NOT NULL,
 [Лейбл] Varchar(30) NOT NULL,
 [Исполнитель] Varchar(30) NOT NULL,
 [Год_издания] Date NOT NULL,
 [Альбом] Varchar(30) NOT NULL,
 [Код_пользователя] Int NULL
)
go

-- Create indexes for table Трек/E3

CREATE INDEX [IX_Relationship1] ON [Трек/E3] ([Код_пользователя])
go

-- Add keys for table Трек/E3

ALTER TABLE [Трек/E3] ADD CONSTRAINT [Unique_Identifier3] PRIMARY KEY ([ID_трека])
go

-- Table Исполнитель/E4

CREATE TABLE [Исполнитель/E4]
(
 [ID_Исполнителя] Int NOT NULL,
 [Никнейм_исполнителя] Varchar(30) NOT NULL,
 [Номер_счета_исполнителя] Int NOT NULL
)
go

-- Add keys for table Исполнитель/E4

ALTER TABLE [Исполнитель/E4] ADD CONSTRAINT [Unique_Identifier4] PRIMARY KEY ([ID_Исполнителя])
go

-- Table Плейлист/E5

CREATE TABLE [Плейлист/E5]
(
 [ID_плейлиста] Char(1) NOT NULL,
 [ID_трека] Int NOT NULL,
 [Название_плейлиста] Varchar(50) NOT NULL,
 [Описание_плейлиста] Varchar(500) NOT NULL,
 [Дата_последнего_обновления] Date NOT NULL
)
go

-- Create indexes for table Плейлист/E5

CREATE INDEX [IX_Relationship4] ON [Плейлист/E5] ([ID_трека])
go

-- Add keys for table Плейлист/E5

ALTER TABLE [Плейлист/E5] ADD CONSTRAINT [Unique_Identifier5] PRIMARY KEY ([ID_плейлиста])
go

-- Table Исполнитель/E4_Трек/E3

CREATE TABLE [Исполнитель/E4_Трек/E3]
(
 [ID_трека] Int NOT NULL,
 [Attribute1] Int NOT NULL
)
go

-- Table Пользователь/E1_Плейлист/E5

CREATE TABLE [Пользователь/E1_Плейлист/E5]
(
 [Attribute1] Char(1) NOT NULL,
 [Код_пользователя] Int NOT NULL
)
go

-- Table Альбом/E6

CREATE TABLE [Альбом/E6]
(
 [ID_альбома] Int NOT NULL,
 [ID_Исполнителя] Int NOT NULL,
 [Название_альбома] Varchar(30) NOT NULL,
 [Дата_выхода_альбома] Date NOT NULL
)
go

-- Create indexes for table Альбом/E6

CREATE INDEX [IX_Relationship5] ON [Альбом/E6] ([ID_Исполнителя])
go

-- Add keys for table Альбом/E6

ALTER TABLE [Альбом/E6] ADD CONSTRAINT [PK_Альбом/E6] PRIMARY KEY ([ID_альбома])
go

-- Table Альбом/E1_Трек/E3

CREATE TABLE [Альбом/E1_Трек/E3]
(
 [ID_трека] Int NOT NULL,
 [ID_альбома] Int NOT NULL
)
go

-- Add keys for table Альбом/E1_Трек/E3

ALTER TABLE [Альбом/E1_Трек/E3] ADD CONSTRAINT [PK_Альбом/E1_Трек/E3] PRIMARY KEY ([ID_трека],[ID_альбома])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [Подписка/E2] ADD CONSTRAINT [приобретает] FOREIGN KEY ([Код_пользователя]) REFERENCES [Пользователь/E1] ([Код_пользователя]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Трек/E3] ADD CONSTRAINT [Прослушивает/прослушивается] FOREIGN KEY ([Код_пользователя]) REFERENCES [Пользователь/E1] ([Код_пользователя]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Плейлист/E5] ADD CONSTRAINT [Находится/Содержит] FOREIGN KEY ([ID_трека]) REFERENCES [Трек/E3] ([ID_трека]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Альбом/E6] ADD CONSTRAINT [Создает/принадлежит] FOREIGN KEY ([ID_Исполнителя]) REFERENCES [Исполнитель/E4] ([ID_Исполнителя]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Альбом/E1_Трек/E3] ADD CONSTRAINT [Хранится_Трек/E3] FOREIGN KEY ([ID_трека]) REFERENCES [Трек/E3] ([ID_трека]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Альбом/E1_Трек/E3] ADD CONSTRAINT [Хранится_Трек/E3] FOREIGN KEY ([ID_альбома]) REFERENCES [Альбом/E6] ([ID_альбома]) ON UPDATE NO ACTION ON DELETE NO ACTION
go





/*
Created: 03.04.2024
Modified: 09.04.2024
Model: KeyModel
Database: MS SQL Server 2019
*/


-- Create tables section -------------------------------------------------

-- Table ������������/E1

CREATE TABLE [������������/E1]
(
 [�������] Varchar(30) NOT NULL,
 [���_������������] Varchar(50) NOT NULL,
 [�����������_������] Int NOT NULL,
 [ID_��������] Int NOT NULL,
 [���_������������] Int NOT NULL
)
go

-- Add keys for table ������������/E1

ALTER TABLE [������������/E1] ADD CONSTRAINT [Unique_Identifier1] PRIMARY KEY ([���_������������])
go

-- Table ��������/E2

CREATE TABLE [��������/E2]
(
 [ID_��������] Int NOT NULL,
 [����_�����������] Date NOT NULL,
 [����_���������_��������] Date NOT NULL,
 [���_������������] Int NULL
)
go

-- Add keys for table ��������/E2

ALTER TABLE [��������/E2] ADD CONSTRAINT [Unique_Identifier2] PRIMARY KEY ([ID_��������])
go

-- Table ����/E3

CREATE TABLE [����/E3]
(
 [ID_�����] Int NOT NULL,
 [��������_�����] Varchar(45) NOT NULL,
 [�����] Varchar(30) NOT NULL,
 [�����������] Varchar(30) NOT NULL,
 [���_�������] Date NOT NULL,
 [������] Varchar(30) NOT NULL,
 [���_������������] Int NULL
)
go

-- Create indexes for table ����/E3

CREATE INDEX [IX_Relationship1] ON [����/E3] ([���_������������])
go

-- Add keys for table ����/E3

ALTER TABLE [����/E3] ADD CONSTRAINT [Unique_Identifier3] PRIMARY KEY ([ID_�����])
go

-- Table �����������/E4

CREATE TABLE [�����������/E4]
(
 [ID_�����������] Int NOT NULL,
 [�������_�����������] Varchar(30) NOT NULL,
 [�����_�����_�����������] Int NOT NULL
)
go

-- Add keys for table �����������/E4

ALTER TABLE [�����������/E4] ADD CONSTRAINT [Unique_Identifier4] PRIMARY KEY ([ID_�����������])
go

-- Table ��������/E5

CREATE TABLE [��������/E5]
(
 [ID_���������] Char(1) NOT NULL,
 [ID_�����] Int NOT NULL,
 [��������_���������] Varchar(50) NOT NULL,
 [��������_���������] Varchar(500) NOT NULL,
 [����_����������_����������] Date NOT NULL
)
go

-- Create indexes for table ��������/E5

CREATE INDEX [IX_Relationship4] ON [��������/E5] ([ID_�����])
go

-- Add keys for table ��������/E5

ALTER TABLE [��������/E5] ADD CONSTRAINT [Unique_Identifier5] PRIMARY KEY ([ID_���������])
go

-- Table �����������/E4_����/E3

CREATE TABLE [�����������/E4_����/E3]
(
 [ID_�����] Int NOT NULL,
 [Attribute1] Int NOT NULL
)
go

-- Table ������������/E1_��������/E5

CREATE TABLE [������������/E1_��������/E5]
(
 [Attribute1] Char(1) NOT NULL,
 [���_������������] Int NOT NULL
)
go

-- Table ������/E6

CREATE TABLE [������/E6]
(
 [ID_�������] Int NOT NULL,
 [ID_�����������] Int NOT NULL,
 [��������_�������] Varchar(30) NOT NULL,
 [����_������_�������] Date NOT NULL
)
go

-- Create indexes for table ������/E6

CREATE INDEX [IX_Relationship5] ON [������/E6] ([ID_�����������])
go

-- Add keys for table ������/E6

ALTER TABLE [������/E6] ADD CONSTRAINT [PK_������/E6] PRIMARY KEY ([ID_�������])
go

-- Table ������/E1_����/E3

CREATE TABLE [������/E1_����/E3]
(
 [ID_�����] Int NOT NULL,
 [ID_�������] Int NOT NULL
)
go

-- Add keys for table ������/E1_����/E3

ALTER TABLE [������/E1_����/E3] ADD CONSTRAINT [PK_������/E1_����/E3] PRIMARY KEY ([ID_�����],[ID_�������])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [��������/E2] ADD CONSTRAINT [�����������] FOREIGN KEY ([���_������������]) REFERENCES [������������/E1] ([���_������������]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [����/E3] ADD CONSTRAINT [������������/��������������] FOREIGN KEY ([���_������������]) REFERENCES [������������/E1] ([���_������������]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [��������/E5] ADD CONSTRAINT [���������/��������] FOREIGN KEY ([ID_�����]) REFERENCES [����/E3] ([ID_�����]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [������/E6] ADD CONSTRAINT [�������/�����������] FOREIGN KEY ([ID_�����������]) REFERENCES [�����������/E4] ([ID_�����������]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [������/E1_����/E3] ADD CONSTRAINT [��������_����/E3] FOREIGN KEY ([ID_�����]) REFERENCES [����/E3] ([ID_�����]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [������/E1_����/E3] ADD CONSTRAINT [��������_����/E3] FOREIGN KEY ([ID_�������]) REFERENCES [������/E6] ([ID_�������]) ON UPDATE NO ACTION ON DELETE NO ACTION
go





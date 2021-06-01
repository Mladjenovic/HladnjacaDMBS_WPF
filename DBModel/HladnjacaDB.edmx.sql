
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/31/2021 17:34:18
-- Generated from EDMX file: C:\Users\ccvel\source\repos\HladnjacaDBMS\DBModel\HladnjacaDB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [HladnjacaDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_HladnjacaKomora]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Komoras] DROP CONSTRAINT [FK_HladnjacaKomora];
GO
IF OBJECT_ID(N'[dbo].[FK_HladnjacaOrganizacionaJedinica]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Hladnjacas] DROP CONSTRAINT [FK_HladnjacaOrganizacionaJedinica];
GO
IF OBJECT_ID(N'[dbo].[FK_KlijentUgovor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ugovors] DROP CONSTRAINT [FK_KlijentUgovor];
GO
IF OBJECT_ID(N'[dbo].[FK_HladnjacaUgovor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ugovors] DROP CONSTRAINT [FK_HladnjacaUgovor];
GO
IF OBJECT_ID(N'[dbo].[FK_HladnjacaZaposleni]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Zaposlenis] DROP CONSTRAINT [FK_HladnjacaZaposleni];
GO
IF OBJECT_ID(N'[dbo].[FK_UgovorKarton]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Kartons] DROP CONSTRAINT [FK_UgovorKarton];
GO
IF OBJECT_ID(N'[dbo].[FK_KlijentPredaje]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Predajes] DROP CONSTRAINT [FK_KlijentPredaje];
GO
IF OBJECT_ID(N'[dbo].[FK_VocePredaje]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Predajes] DROP CONSTRAINT [FK_VocePredaje];
GO
IF OBJECT_ID(N'[dbo].[FK_PoljoprivredniTehnicarOtkupljuje]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Otkupljujes] DROP CONSTRAINT [FK_PoljoprivredniTehnicarOtkupljuje];
GO
IF OBJECT_ID(N'[dbo].[FK_VoceOtkupljuje]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Otkupljujes] DROP CONSTRAINT [FK_VoceOtkupljuje];
GO
IF OBJECT_ID(N'[dbo].[FK_KartonOtkupljuje]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Otkupljujes] DROP CONSTRAINT [FK_KartonOtkupljuje];
GO
IF OBJECT_ID(N'[dbo].[FK_TransportPrenosiSe]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PrenosiSes] DROP CONSTRAINT [FK_TransportPrenosiSe];
GO
IF OBJECT_ID(N'[dbo].[FK_OtkupljujePrenosiSe]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PrenosiSes] DROP CONSTRAINT [FK_OtkupljujePrenosiSe];
GO
IF OBJECT_ID(N'[dbo].[FK_MagacionerObavlja]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Obavljas] DROP CONSTRAINT [FK_MagacionerObavlja];
GO
IF OBJECT_ID(N'[dbo].[FK_TransportObavlja]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Obavljas] DROP CONSTRAINT [FK_TransportObavlja];
GO
IF OBJECT_ID(N'[dbo].[FK_KomoraSmestaSe]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SmestaSes] DROP CONSTRAINT [FK_KomoraSmestaSe];
GO
IF OBJECT_ID(N'[dbo].[FK_SmestaSeTransport]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SmestaSes] DROP CONSTRAINT [FK_SmestaSeTransport];
GO
IF OBJECT_ID(N'[dbo].[FK_OrganizacionaJedinicaOrganizacionaJedinica]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrganizacionaJedinicas] DROP CONSTRAINT [FK_OrganizacionaJedinicaOrganizacionaJedinica];
GO
IF OBJECT_ID(N'[dbo].[FK_PoljoprivredniTehnicar_inherits_Zaposleni]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Zaposlenis_PoljoprivredniTehnicar] DROP CONSTRAINT [FK_PoljoprivredniTehnicar_inherits_Zaposleni];
GO
IF OBJECT_ID(N'[dbo].[FK_Magacioner_inherits_Zaposleni]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Zaposlenis_Magacioner] DROP CONSTRAINT [FK_Magacioner_inherits_Zaposleni];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Hladnjacas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Hladnjacas];
GO
IF OBJECT_ID(N'[dbo].[Komoras]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Komoras];
GO
IF OBJECT_ID(N'[dbo].[OrganizacionaJedinicas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrganizacionaJedinicas];
GO
IF OBJECT_ID(N'[dbo].[Zaposlenis]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Zaposlenis];
GO
IF OBJECT_ID(N'[dbo].[Klijents]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Klijents];
GO
IF OBJECT_ID(N'[dbo].[Ugovors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ugovors];
GO
IF OBJECT_ID(N'[dbo].[Kartons]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Kartons];
GO
IF OBJECT_ID(N'[dbo].[Voces]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Voces];
GO
IF OBJECT_ID(N'[dbo].[Predajes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Predajes];
GO
IF OBJECT_ID(N'[dbo].[Otkupljujes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Otkupljujes];
GO
IF OBJECT_ID(N'[dbo].[Transports]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Transports];
GO
IF OBJECT_ID(N'[dbo].[PrenosiSes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PrenosiSes];
GO
IF OBJECT_ID(N'[dbo].[Obavljas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Obavljas];
GO
IF OBJECT_ID(N'[dbo].[SmestaSes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SmestaSes];
GO
IF OBJECT_ID(N'[dbo].[Zaposlenis_PoljoprivredniTehnicar]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Zaposlenis_PoljoprivredniTehnicar];
GO
IF OBJECT_ID(N'[dbo].[Zaposlenis_Magacioner]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Zaposlenis_Magacioner];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Hladnjacas'
CREATE TABLE [dbo].[Hladnjacas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NazivHladnjace] nvarchar(max)  NOT NULL,
    [OrganizacionaJedinicaId] int  NOT NULL
);
GO

-- Creating table 'Komoras'
CREATE TABLE [dbo].[Komoras] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NazivKomore] nvarchar(max)  NOT NULL,
    [HladnjacaId] int  NOT NULL
);
GO

-- Creating table 'OrganizacionaJedinicas'
CREATE TABLE [dbo].[OrganizacionaJedinicas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Naziv] nvarchar(max)  NOT NULL,
    [OrganizacionaJedinicaId_nadredjena] int  NULL
);
GO

-- Creating table 'Zaposlenis'
CREATE TABLE [dbo].[Zaposlenis] (
    [Mbr] int IDENTITY(1,1) NOT NULL,
    [Jmbg] int  NOT NULL,
    [Ime] nvarchar(max)  NOT NULL,
    [Prezime] nvarchar(max)  NOT NULL,
    [Kategorija] nvarchar(max)  NOT NULL,
    [HladnjacaId] int  NOT NULL
);
GO

-- Creating table 'Klijents'
CREATE TABLE [dbo].[Klijents] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Adresa] nvarchar(max)  NOT NULL,
    [Ime] nvarchar(max)  NOT NULL,
    [Prezime] nvarchar(max)  NOT NULL,
    [Jmbg] int  NOT NULL
);
GO

-- Creating table 'Ugovors'
CREATE TABLE [dbo].[Ugovors] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Tip] nvarchar(max)  NOT NULL,
    [DatumPotpisivanja] datetime  NOT NULL,
    [KlijentId] int  NOT NULL,
    [HladnjacaId] int  NOT NULL
);
GO

-- Creating table 'Kartons'
CREATE TABLE [dbo].[Kartons] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Vrsta] nvarchar(max)  NOT NULL,
    [UgovorId] int  NOT NULL,
    [UgovorKlijentId] int  NOT NULL,
    [UgovorHladnjacaId] int  NOT NULL
);
GO

-- Creating table 'Voces'
CREATE TABLE [dbo].[Voces] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Vrsta] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Predajes'
CREATE TABLE [dbo].[Predajes] (
    [KlijentId] int  NOT NULL,
    [VoceId] int  NOT NULL
);
GO

-- Creating table 'Otkupljujes'
CREATE TABLE [dbo].[Otkupljujes] (
    [PoljoprivredniTehnicarMbr] int  NOT NULL,
    [VoceId] int  NOT NULL,
    [KartonId] int  NOT NULL,
    [KartonUgovorId] int  NOT NULL,
    [KartonUgovorKlijentId] int  NOT NULL,
    [KartonUgovorHladnjacaId] int  NOT NULL
);
GO

-- Creating table 'Transports'
CREATE TABLE [dbo].[Transports] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'PrenosiSes'
CREATE TABLE [dbo].[PrenosiSes] (
    [TransportId] int  NOT NULL,
    [OtkupljujePoljoprivredniTehnicarMbr] int  NOT NULL,
    [OtkupljujeVoceId] int  NOT NULL
);
GO

-- Creating table 'Obavljas'
CREATE TABLE [dbo].[Obavljas] (
    [MagacionerMbr] int  NOT NULL,
    [TransportId] int  NOT NULL
);
GO

-- Creating table 'SmestaSes'
CREATE TABLE [dbo].[SmestaSes] (
    [KomoraId] int  NOT NULL,
    [KomoraHladnjacaId] int  NOT NULL,
    [TransportId] int  NOT NULL
);
GO

-- Creating table 'Zaposlenis_PoljoprivredniTehnicar'
CREATE TABLE [dbo].[Zaposlenis_PoljoprivredniTehnicar] (
    [Mbr] int  NOT NULL
);
GO

-- Creating table 'Zaposlenis_Magacioner'
CREATE TABLE [dbo].[Zaposlenis_Magacioner] (
    [ObucenZaViljuskar] nvarchar(max)  NOT NULL,
    [Mbr] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Hladnjacas'
ALTER TABLE [dbo].[Hladnjacas]
ADD CONSTRAINT [PK_Hladnjacas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id], [HladnjacaId] in table 'Komoras'
ALTER TABLE [dbo].[Komoras]
ADD CONSTRAINT [PK_Komoras]
    PRIMARY KEY CLUSTERED ([Id], [HladnjacaId] ASC);
GO

-- Creating primary key on [Id] in table 'OrganizacionaJedinicas'
ALTER TABLE [dbo].[OrganizacionaJedinicas]
ADD CONSTRAINT [PK_OrganizacionaJedinicas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Mbr] in table 'Zaposlenis'
ALTER TABLE [dbo].[Zaposlenis]
ADD CONSTRAINT [PK_Zaposlenis]
    PRIMARY KEY CLUSTERED ([Mbr] ASC);
GO

-- Creating primary key on [Id] in table 'Klijents'
ALTER TABLE [dbo].[Klijents]
ADD CONSTRAINT [PK_Klijents]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id], [KlijentId], [HladnjacaId] in table 'Ugovors'
ALTER TABLE [dbo].[Ugovors]
ADD CONSTRAINT [PK_Ugovors]
    PRIMARY KEY CLUSTERED ([Id], [KlijentId], [HladnjacaId] ASC);
GO

-- Creating primary key on [Id], [UgovorId], [UgovorKlijentId], [UgovorHladnjacaId] in table 'Kartons'
ALTER TABLE [dbo].[Kartons]
ADD CONSTRAINT [PK_Kartons]
    PRIMARY KEY CLUSTERED ([Id], [UgovorId], [UgovorKlijentId], [UgovorHladnjacaId] ASC);
GO

-- Creating primary key on [Id] in table 'Voces'
ALTER TABLE [dbo].[Voces]
ADD CONSTRAINT [PK_Voces]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [KlijentId], [VoceId] in table 'Predajes'
ALTER TABLE [dbo].[Predajes]
ADD CONSTRAINT [PK_Predajes]
    PRIMARY KEY CLUSTERED ([KlijentId], [VoceId] ASC);
GO

-- Creating primary key on [PoljoprivredniTehnicarMbr], [VoceId] in table 'Otkupljujes'
ALTER TABLE [dbo].[Otkupljujes]
ADD CONSTRAINT [PK_Otkupljujes]
    PRIMARY KEY CLUSTERED ([PoljoprivredniTehnicarMbr], [VoceId] ASC);
GO

-- Creating primary key on [Id] in table 'Transports'
ALTER TABLE [dbo].[Transports]
ADD CONSTRAINT [PK_Transports]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [TransportId], [OtkupljujePoljoprivredniTehnicarMbr], [OtkupljujeVoceId] in table 'PrenosiSes'
ALTER TABLE [dbo].[PrenosiSes]
ADD CONSTRAINT [PK_PrenosiSes]
    PRIMARY KEY CLUSTERED ([TransportId], [OtkupljujePoljoprivredniTehnicarMbr], [OtkupljujeVoceId] ASC);
GO

-- Creating primary key on [MagacionerMbr], [TransportId] in table 'Obavljas'
ALTER TABLE [dbo].[Obavljas]
ADD CONSTRAINT [PK_Obavljas]
    PRIMARY KEY CLUSTERED ([MagacionerMbr], [TransportId] ASC);
GO

-- Creating primary key on [TransportId], [KomoraHladnjacaId], [KomoraId] in table 'SmestaSes'
ALTER TABLE [dbo].[SmestaSes]
ADD CONSTRAINT [PK_SmestaSes]
    PRIMARY KEY CLUSTERED ([TransportId], [KomoraHladnjacaId], [KomoraId] ASC);
GO

-- Creating primary key on [Mbr] in table 'Zaposlenis_PoljoprivredniTehnicar'
ALTER TABLE [dbo].[Zaposlenis_PoljoprivredniTehnicar]
ADD CONSTRAINT [PK_Zaposlenis_PoljoprivredniTehnicar]
    PRIMARY KEY CLUSTERED ([Mbr] ASC);
GO

-- Creating primary key on [Mbr] in table 'Zaposlenis_Magacioner'
ALTER TABLE [dbo].[Zaposlenis_Magacioner]
ADD CONSTRAINT [PK_Zaposlenis_Magacioner]
    PRIMARY KEY CLUSTERED ([Mbr] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [HladnjacaId] in table 'Komoras'
ALTER TABLE [dbo].[Komoras]
ADD CONSTRAINT [FK_HladnjacaKomora]
    FOREIGN KEY ([HladnjacaId])
    REFERENCES [dbo].[Hladnjacas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HladnjacaKomora'
CREATE INDEX [IX_FK_HladnjacaKomora]
ON [dbo].[Komoras]
    ([HladnjacaId]);
GO

-- Creating foreign key on [OrganizacionaJedinicaId] in table 'Hladnjacas'
ALTER TABLE [dbo].[Hladnjacas]
ADD CONSTRAINT [FK_HladnjacaOrganizacionaJedinica]
    FOREIGN KEY ([OrganizacionaJedinicaId])
    REFERENCES [dbo].[OrganizacionaJedinicas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HladnjacaOrganizacionaJedinica'
CREATE INDEX [IX_FK_HladnjacaOrganizacionaJedinica]
ON [dbo].[Hladnjacas]
    ([OrganizacionaJedinicaId]);
GO

-- Creating foreign key on [KlijentId] in table 'Ugovors'
ALTER TABLE [dbo].[Ugovors]
ADD CONSTRAINT [FK_KlijentUgovor]
    FOREIGN KEY ([KlijentId])
    REFERENCES [dbo].[Klijents]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_KlijentUgovor'
CREATE INDEX [IX_FK_KlijentUgovor]
ON [dbo].[Ugovors]
    ([KlijentId]);
GO

-- Creating foreign key on [HladnjacaId] in table 'Ugovors'
ALTER TABLE [dbo].[Ugovors]
ADD CONSTRAINT [FK_HladnjacaUgovor]
    FOREIGN KEY ([HladnjacaId])
    REFERENCES [dbo].[Hladnjacas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HladnjacaUgovor'
CREATE INDEX [IX_FK_HladnjacaUgovor]
ON [dbo].[Ugovors]
    ([HladnjacaId]);
GO

-- Creating foreign key on [HladnjacaId] in table 'Zaposlenis'
ALTER TABLE [dbo].[Zaposlenis]
ADD CONSTRAINT [FK_HladnjacaZaposleni]
    FOREIGN KEY ([HladnjacaId])
    REFERENCES [dbo].[Hladnjacas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HladnjacaZaposleni'
CREATE INDEX [IX_FK_HladnjacaZaposleni]
ON [dbo].[Zaposlenis]
    ([HladnjacaId]);
GO

-- Creating foreign key on [UgovorId], [UgovorKlijentId], [UgovorHladnjacaId] in table 'Kartons'
ALTER TABLE [dbo].[Kartons]
ADD CONSTRAINT [FK_UgovorKarton]
    FOREIGN KEY ([UgovorId], [UgovorKlijentId], [UgovorHladnjacaId])
    REFERENCES [dbo].[Ugovors]
        ([Id], [KlijentId], [HladnjacaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UgovorKarton'
CREATE INDEX [IX_FK_UgovorKarton]
ON [dbo].[Kartons]
    ([UgovorId], [UgovorKlijentId], [UgovorHladnjacaId]);
GO

-- Creating foreign key on [KlijentId] in table 'Predajes'
ALTER TABLE [dbo].[Predajes]
ADD CONSTRAINT [FK_KlijentPredaje]
    FOREIGN KEY ([KlijentId])
    REFERENCES [dbo].[Klijents]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [VoceId] in table 'Predajes'
ALTER TABLE [dbo].[Predajes]
ADD CONSTRAINT [FK_VocePredaje]
    FOREIGN KEY ([VoceId])
    REFERENCES [dbo].[Voces]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VocePredaje'
CREATE INDEX [IX_FK_VocePredaje]
ON [dbo].[Predajes]
    ([VoceId]);
GO

-- Creating foreign key on [PoljoprivredniTehnicarMbr] in table 'Otkupljujes'
ALTER TABLE [dbo].[Otkupljujes]
ADD CONSTRAINT [FK_PoljoprivredniTehnicarOtkupljuje]
    FOREIGN KEY ([PoljoprivredniTehnicarMbr])
    REFERENCES [dbo].[Zaposlenis_PoljoprivredniTehnicar]
        ([Mbr])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [VoceId] in table 'Otkupljujes'
ALTER TABLE [dbo].[Otkupljujes]
ADD CONSTRAINT [FK_VoceOtkupljuje]
    FOREIGN KEY ([VoceId])
    REFERENCES [dbo].[Voces]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VoceOtkupljuje'
CREATE INDEX [IX_FK_VoceOtkupljuje]
ON [dbo].[Otkupljujes]
    ([VoceId]);
GO

-- Creating foreign key on [KartonId], [KartonUgovorId], [KartonUgovorKlijentId], [KartonUgovorHladnjacaId] in table 'Otkupljujes'
ALTER TABLE [dbo].[Otkupljujes]
ADD CONSTRAINT [FK_KartonOtkupljuje]
    FOREIGN KEY ([KartonId], [KartonUgovorId], [KartonUgovorKlijentId], [KartonUgovorHladnjacaId])
    REFERENCES [dbo].[Kartons]
        ([Id], [UgovorId], [UgovorKlijentId], [UgovorHladnjacaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_KartonOtkupljuje'
CREATE INDEX [IX_FK_KartonOtkupljuje]
ON [dbo].[Otkupljujes]
    ([KartonId], [KartonUgovorId], [KartonUgovorKlijentId], [KartonUgovorHladnjacaId]);
GO

-- Creating foreign key on [TransportId] in table 'PrenosiSes'
ALTER TABLE [dbo].[PrenosiSes]
ADD CONSTRAINT [FK_TransportPrenosiSe]
    FOREIGN KEY ([TransportId])
    REFERENCES [dbo].[Transports]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [OtkupljujePoljoprivredniTehnicarMbr], [OtkupljujeVoceId] in table 'PrenosiSes'
ALTER TABLE [dbo].[PrenosiSes]
ADD CONSTRAINT [FK_OtkupljujePrenosiSe]
    FOREIGN KEY ([OtkupljujePoljoprivredniTehnicarMbr], [OtkupljujeVoceId])
    REFERENCES [dbo].[Otkupljujes]
        ([PoljoprivredniTehnicarMbr], [VoceId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OtkupljujePrenosiSe'
CREATE INDEX [IX_FK_OtkupljujePrenosiSe]
ON [dbo].[PrenosiSes]
    ([OtkupljujePoljoprivredniTehnicarMbr], [OtkupljujeVoceId]);
GO

-- Creating foreign key on [MagacionerMbr] in table 'Obavljas'
ALTER TABLE [dbo].[Obavljas]
ADD CONSTRAINT [FK_MagacionerObavlja]
    FOREIGN KEY ([MagacionerMbr])
    REFERENCES [dbo].[Zaposlenis_Magacioner]
        ([Mbr])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [TransportId] in table 'Obavljas'
ALTER TABLE [dbo].[Obavljas]
ADD CONSTRAINT [FK_TransportObavlja]
    FOREIGN KEY ([TransportId])
    REFERENCES [dbo].[Transports]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TransportObavlja'
CREATE INDEX [IX_FK_TransportObavlja]
ON [dbo].[Obavljas]
    ([TransportId]);
GO

-- Creating foreign key on [KomoraId], [KomoraHladnjacaId] in table 'SmestaSes'
ALTER TABLE [dbo].[SmestaSes]
ADD CONSTRAINT [FK_KomoraSmestaSe]
    FOREIGN KEY ([KomoraId], [KomoraHladnjacaId])
    REFERENCES [dbo].[Komoras]
        ([Id], [HladnjacaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_KomoraSmestaSe'
CREATE INDEX [IX_FK_KomoraSmestaSe]
ON [dbo].[SmestaSes]
    ([KomoraId], [KomoraHladnjacaId]);
GO

-- Creating foreign key on [TransportId] in table 'SmestaSes'
ALTER TABLE [dbo].[SmestaSes]
ADD CONSTRAINT [FK_SmestaSeTransport]
    FOREIGN KEY ([TransportId])
    REFERENCES [dbo].[Transports]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [OrganizacionaJedinicaId_nadredjena] in table 'OrganizacionaJedinicas'
ALTER TABLE [dbo].[OrganizacionaJedinicas]
ADD CONSTRAINT [FK_OrganizacionaJedinicaOrganizacionaJedinica]
    FOREIGN KEY ([OrganizacionaJedinicaId_nadredjena])
    REFERENCES [dbo].[OrganizacionaJedinicas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrganizacionaJedinicaOrganizacionaJedinica'
CREATE INDEX [IX_FK_OrganizacionaJedinicaOrganizacionaJedinica]
ON [dbo].[OrganizacionaJedinicas]
    ([OrganizacionaJedinicaId_nadredjena]);
GO

-- Creating foreign key on [Mbr] in table 'Zaposlenis_PoljoprivredniTehnicar'
ALTER TABLE [dbo].[Zaposlenis_PoljoprivredniTehnicar]
ADD CONSTRAINT [FK_PoljoprivredniTehnicar_inherits_Zaposleni]
    FOREIGN KEY ([Mbr])
    REFERENCES [dbo].[Zaposlenis]
        ([Mbr])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Mbr] in table 'Zaposlenis_Magacioner'
ALTER TABLE [dbo].[Zaposlenis_Magacioner]
ADD CONSTRAINT [FK_Magacioner_inherits_Zaposleni]
    FOREIGN KEY ([Mbr])
    REFERENCES [dbo].[Zaposlenis]
        ([Mbr])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
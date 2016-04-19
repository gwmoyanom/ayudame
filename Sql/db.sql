
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/18/2016 22:39:01
-- Generated from EDMX file: c:\Users\Gustavo\documents\visual studio 2015\Projects\AET_Proj\AET.Data\AET_DB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [db];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_RequesterItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Elements] DROP CONSTRAINT [FK_RequesterItem];
GO
IF OBJECT_ID(N'[dbo].[FK_ItemStateHistory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StateHistories] DROP CONSTRAINT [FK_ItemStateHistory];
GO
IF OBJECT_ID(N'[dbo].[FK_MobileUserEntity1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Arrivals1] DROP CONSTRAINT [FK_MobileUserEntity1];
GO
IF OBJECT_ID(N'[dbo].[FK_ArrivalItemsRecibidos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ArrivalElements] DROP CONSTRAINT [FK_ArrivalItemsRecibidos];
GO
IF OBJECT_ID(N'[dbo].[FK_ElementElementCatalog]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Elements] DROP CONSTRAINT [FK_ElementElementCatalog];
GO
IF OBJECT_ID(N'[dbo].[FK_RequestMobileUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Requests] DROP CONSTRAINT [FK_RequestMobileUser];
GO
IF OBJECT_ID(N'[dbo].[FK_CommentMobileUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReqComments] DROP CONSTRAINT [FK_CommentMobileUser];
GO
IF OBJECT_ID(N'[dbo].[FK_ArrivalElementElement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ArrivalElements] DROP CONSTRAINT [FK_ArrivalElementElement];
GO
IF OBJECT_ID(N'[dbo].[FK_ArrivalArrComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ArrComments] DROP CONSTRAINT [FK_ArrivalArrComment];
GO
IF OBJECT_ID(N'[dbo].[FK_ArrCommentMobileUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ArrComments] DROP CONSTRAINT [FK_ArrCommentMobileUser];
GO
IF OBJECT_ID(N'[dbo].[FK_RequestReqComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReqComments] DROP CONSTRAINT [FK_RequestReqComment];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Requests]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Requests];
GO
IF OBJECT_ID(N'[dbo].[ElementCatalogs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ElementCatalogs];
GO
IF OBJECT_ID(N'[dbo].[Elements]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Elements];
GO
IF OBJECT_ID(N'[dbo].[StateHistories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StateHistories];
GO
IF OBJECT_ID(N'[dbo].[MobileUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MobileUsers];
GO
IF OBJECT_ID(N'[dbo].[ReqComments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ReqComments];
GO
IF OBJECT_ID(N'[dbo].[ArrivalElements]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ArrivalElements];
GO
IF OBJECT_ID(N'[dbo].[Arrivals1]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Arrivals1];
GO
IF OBJECT_ID(N'[dbo].[ArrComments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ArrComments];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Requests'
CREATE TABLE [dbo].[Requests] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Longitude] decimal(18,0)  NOT NULL,
    [Latitude] decimal(18,0)  NOT NULL,
    [Geolocation] geography  NOT NULL,
    [CategoryId] int  NULL,
    [CreateDate] datetime  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [MobileUserId] int  NOT NULL
);
GO

-- Creating table 'ElementCatalogs'
CREATE TABLE [dbo].[ElementCatalogs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Elements'
CREATE TABLE [dbo].[Elements] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [RequestId] int  NOT NULL,
    [CurrentState] int  NOT NULL,
    [Other] nvarchar(max)  NULL,
    [ElementCatalogId] int  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'StateHistories'
CREATE TABLE [dbo].[StateHistories] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [Order] nvarchar(max)  NOT NULL,
    [State] int  NOT NULL,
    [ItemId] bigint  NOT NULL,
    [CreationDate] datetime  NOT NULL,
    [ModifyDate] datetime  NULL
);
GO

-- Creating table 'MobileUsers'
CREATE TABLE [dbo].[MobileUsers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NULL,
    [AndroidId] nvarchar(max)  NULL,
    [Email] nvarchar(max)  NULL,
    [Photo] varbinary(max)  NULL,
    [DocumentId] nvarchar(max)  NOT NULL,
    [RoleId] int  NOT NULL
);
GO

-- Creating table 'ReqComments'
CREATE TABLE [dbo].[ReqComments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [MobileUserId] int  NOT NULL,
    [RequestId] int  NOT NULL,
    [RequestId1] int  NULL
);
GO

-- Creating table 'ArrivalElements'
CREATE TABLE [dbo].[ArrivalElements] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ArrivalId] int  NOT NULL,
    [ElementId] bigint  NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Arrivals1'
CREATE TABLE [dbo].[Arrivals1] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MobileUserId] int  NOT NULL,
    [ReportedTime] datetime  NOT NULL,
    [HasArrived] bit  NOT NULL,
    [ArrivedTime] datetime  NULL,
    [EstimatedArrivedTime] datetime  NULL,
    [Longitude] nvarchar(max)  NOT NULL,
    [Latitude] nvarchar(max)  NOT NULL,
    [Geolocation] nvarchar(max)  NOT NULL,
    [State] int  NOT NULL
);
GO

-- Creating table 'ArrComments'
CREATE TABLE [dbo].[ArrComments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [MobileUserId] int  NOT NULL,
    [ArrivalId] int  NOT NULL,
    [RequestId] int  NOT NULL,
    [ArrivalId1] int  NULL,
    [MobileUserId1] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Requests'
ALTER TABLE [dbo].[Requests]
ADD CONSTRAINT [PK_Requests]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ElementCatalogs'
ALTER TABLE [dbo].[ElementCatalogs]
ADD CONSTRAINT [PK_ElementCatalogs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Elements'
ALTER TABLE [dbo].[Elements]
ADD CONSTRAINT [PK_Elements]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StateHistories'
ALTER TABLE [dbo].[StateHistories]
ADD CONSTRAINT [PK_StateHistories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MobileUsers'
ALTER TABLE [dbo].[MobileUsers]
ADD CONSTRAINT [PK_MobileUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ReqComments'
ALTER TABLE [dbo].[ReqComments]
ADD CONSTRAINT [PK_ReqComments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ArrivalElements'
ALTER TABLE [dbo].[ArrivalElements]
ADD CONSTRAINT [PK_ArrivalElements]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Arrivals1'
ALTER TABLE [dbo].[Arrivals1]
ADD CONSTRAINT [PK_Arrivals1]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ArrComments'
ALTER TABLE [dbo].[ArrComments]
ADD CONSTRAINT [PK_ArrComments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [RequestId] in table 'Elements'
ALTER TABLE [dbo].[Elements]
ADD CONSTRAINT [FK_RequesterItem]
    FOREIGN KEY ([RequestId])
    REFERENCES [dbo].[Requests]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RequesterItem'
CREATE INDEX [IX_FK_RequesterItem]
ON [dbo].[Elements]
    ([RequestId]);
GO

-- Creating foreign key on [ItemId] in table 'StateHistories'
ALTER TABLE [dbo].[StateHistories]
ADD CONSTRAINT [FK_ItemStateHistory]
    FOREIGN KEY ([ItemId])
    REFERENCES [dbo].[Elements]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ItemStateHistory'
CREATE INDEX [IX_FK_ItemStateHistory]
ON [dbo].[StateHistories]
    ([ItemId]);
GO

-- Creating foreign key on [MobileUserId] in table 'Arrivals1'
ALTER TABLE [dbo].[Arrivals1]
ADD CONSTRAINT [FK_MobileUserEntity1]
    FOREIGN KEY ([MobileUserId])
    REFERENCES [dbo].[MobileUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MobileUserEntity1'
CREATE INDEX [IX_FK_MobileUserEntity1]
ON [dbo].[Arrivals1]
    ([MobileUserId]);
GO

-- Creating foreign key on [ArrivalId] in table 'ArrivalElements'
ALTER TABLE [dbo].[ArrivalElements]
ADD CONSTRAINT [FK_ArrivalItemsRecibidos]
    FOREIGN KEY ([ArrivalId])
    REFERENCES [dbo].[Arrivals1]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArrivalItemsRecibidos'
CREATE INDEX [IX_FK_ArrivalItemsRecibidos]
ON [dbo].[ArrivalElements]
    ([ArrivalId]);
GO

-- Creating foreign key on [ElementCatalogId] in table 'Elements'
ALTER TABLE [dbo].[Elements]
ADD CONSTRAINT [FK_ElementElementCatalog]
    FOREIGN KEY ([ElementCatalogId])
    REFERENCES [dbo].[ElementCatalogs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ElementElementCatalog'
CREATE INDEX [IX_FK_ElementElementCatalog]
ON [dbo].[Elements]
    ([ElementCatalogId]);
GO

-- Creating foreign key on [MobileUserId] in table 'Requests'
ALTER TABLE [dbo].[Requests]
ADD CONSTRAINT [FK_RequestMobileUser]
    FOREIGN KEY ([MobileUserId])
    REFERENCES [dbo].[MobileUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RequestMobileUser'
CREATE INDEX [IX_FK_RequestMobileUser]
ON [dbo].[Requests]
    ([MobileUserId]);
GO

-- Creating foreign key on [MobileUserId] in table 'ReqComments'
ALTER TABLE [dbo].[ReqComments]
ADD CONSTRAINT [FK_CommentMobileUser]
    FOREIGN KEY ([MobileUserId])
    REFERENCES [dbo].[MobileUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CommentMobileUser'
CREATE INDEX [IX_FK_CommentMobileUser]
ON [dbo].[ReqComments]
    ([MobileUserId]);
GO

-- Creating foreign key on [ElementId] in table 'ArrivalElements'
ALTER TABLE [dbo].[ArrivalElements]
ADD CONSTRAINT [FK_ArrivalElementElement]
    FOREIGN KEY ([ElementId])
    REFERENCES [dbo].[Elements]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArrivalElementElement'
CREATE INDEX [IX_FK_ArrivalElementElement]
ON [dbo].[ArrivalElements]
    ([ElementId]);
GO

-- Creating foreign key on [ArrivalId1] in table 'ArrComments'
ALTER TABLE [dbo].[ArrComments]
ADD CONSTRAINT [FK_ArrivalArrComment]
    FOREIGN KEY ([ArrivalId1])
    REFERENCES [dbo].[Arrivals1]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArrivalArrComment'
CREATE INDEX [IX_FK_ArrivalArrComment]
ON [dbo].[ArrComments]
    ([ArrivalId1]);
GO

-- Creating foreign key on [MobileUserId1] in table 'ArrComments'
ALTER TABLE [dbo].[ArrComments]
ADD CONSTRAINT [FK_ArrCommentMobileUser]
    FOREIGN KEY ([MobileUserId1])
    REFERENCES [dbo].[MobileUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArrCommentMobileUser'
CREATE INDEX [IX_FK_ArrCommentMobileUser]
ON [dbo].[ArrComments]
    ([MobileUserId1]);
GO

-- Creating foreign key on [RequestId1] in table 'ReqComments'
ALTER TABLE [dbo].[ReqComments]
ADD CONSTRAINT [FK_RequestReqComment]
    FOREIGN KEY ([RequestId1])
    REFERENCES [dbo].[Requests]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RequestReqComment'
CREATE INDEX [IX_FK_RequestReqComment]
ON [dbo].[ReqComments]
    ([RequestId1]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
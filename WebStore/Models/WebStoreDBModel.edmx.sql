
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/10/2018 16:17:15
-- Generated from EDMX file: C:\Users\taha.mosaad\Documents\Visual Studio 2015\Projects\WebStore\WebStore\Models\WebStoreDBModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [WebStoreDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[WebStoreDBModelStoreContainer].[FK_Attributes_Index_SubCategories]', 'F') IS NOT NULL
    ALTER TABLE [WebStoreDBModelStoreContainer].[Attributes_Index] DROP CONSTRAINT [FK_Attributes_Index_SubCategories];
GO
IF OBJECT_ID(N'[dbo].[FK_Products_Attributes_Attributes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products_Attributes] DROP CONSTRAINT [FK_Products_Attributes_Attributes];
GO
IF OBJECT_ID(N'[dbo].[FK_Products_Attributes_Products]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products_Attributes] DROP CONSTRAINT [FK_Products_Attributes_Products];
GO
IF OBJECT_ID(N'[dbo].[FK_Products_Images_ProductImages]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products_Images] DROP CONSTRAINT [FK_Products_Images_ProductImages];
GO
IF OBJECT_ID(N'[dbo].[FK_Products_Images_Products]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products_Images] DROP CONSTRAINT [FK_Products_Images_Products];
GO
IF OBJECT_ID(N'[dbo].[FK_Products_MainCategories]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Products_MainCategories];
GO
IF OBJECT_ID(N'[dbo].[FK_Products_SubCategories]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Products_SubCategories];
GO
IF OBJECT_ID(N'[dbo].[FK_SubCategories_MainCategories]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SubCategories] DROP CONSTRAINT [FK_SubCategories_MainCategories];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Attributes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Attributes];
GO
IF OBJECT_ID(N'[dbo].[MainCategories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MainCategories];
GO
IF OBJECT_ID(N'[dbo].[ProductImages]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductImages];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[Products_Attributes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products_Attributes];
GO
IF OBJECT_ID(N'[dbo].[Products_Images]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products_Images];
GO
IF OBJECT_ID(N'[dbo].[SubCategories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SubCategories];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[WebStoreDBModelStoreContainer].[Attributes_Index]', 'U') IS NOT NULL
    DROP TABLE [WebStoreDBModelStoreContainer].[Attributes_Index];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Attributes'
CREATE TABLE [dbo].[Attributes] (
    [AttributeID] int IDENTITY(1,1) NOT NULL,
    [Size] float  NULL,
    [Wight] float  NULL,
    [Width] float  NULL,
    [Hight] float  NULL,
    [Color] nvarchar(50)  NULL,
    [Gender] bit  NULL,
    [Describtion] varchar(max)  NULL,
    [SubCat_ID] int  NOT NULL
);
GO

-- Creating table 'MainCategories'
CREATE TABLE [dbo].[MainCategories] (
    [MainCategoryID] int IDENTITY(1,1) NOT NULL,
    [MainCategoryName] nvarchar(50)  NULL
);
GO

-- Creating table 'ProductImages'
CREATE TABLE [dbo].[ProductImages] (
    [ImageID] int  NOT NULL,
    [LogoImage] nvarchar(max)  NULL,
    [ProuductImg1] nvarchar(max)  NULL,
    [ProuductImg2] nvarchar(max)  NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [ProductID] int IDENTITY(1,1) NOT NULL,
    [ProductName] nvarchar(50)  NOT NULL,
    [ProductDescription] nvarchar(max)  NULL,
    [SubCat_ID] int  NOT NULL,
    [MainCat_ID] int  NOT NULL
);
GO

-- Creating table 'SubCategories'
CREATE TABLE [dbo].[SubCategories] (
    [SubCategoryID] int IDENTITY(1,1) NOT NULL,
    [SubCategoryName] nvarchar(50)  NOT NULL,
    [MainCat_ID] int  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'Attributes_Index'
CREATE TABLE [dbo].[Attributes_Index] (
    [SubCat_ID] int  NOT NULL,
    [has_Size] bit  NOT NULL,
    [has_Wight] bit  NOT NULL,
    [has_Hight] bit  NOT NULL,
    [has_Width] bit  NOT NULL,
    [has_Color] bit  NOT NULL,
    [has_Gender] bit  NOT NULL,
    [has_Describtion] bit  NOT NULL
);
GO

-- Creating table 'Products_Attributes'
CREATE TABLE [dbo].[Products_Attributes] (
    [Attributes_AttributeID] int  NOT NULL,
    [Products_ProductID] int  NOT NULL
);
GO

-- Creating table 'Products_Images'
CREATE TABLE [dbo].[Products_Images] (
    [ProductImages_ImageID] int  NOT NULL,
    [Products_ProductID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [AttributeID] in table 'Attributes'
ALTER TABLE [dbo].[Attributes]
ADD CONSTRAINT [PK_Attributes]
    PRIMARY KEY CLUSTERED ([AttributeID] ASC);
GO

-- Creating primary key on [MainCategoryID] in table 'MainCategories'
ALTER TABLE [dbo].[MainCategories]
ADD CONSTRAINT [PK_MainCategories]
    PRIMARY KEY CLUSTERED ([MainCategoryID] ASC);
GO

-- Creating primary key on [ImageID] in table 'ProductImages'
ALTER TABLE [dbo].[ProductImages]
ADD CONSTRAINT [PK_ProductImages]
    PRIMARY KEY CLUSTERED ([ImageID] ASC);
GO

-- Creating primary key on [ProductID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([ProductID] ASC);
GO

-- Creating primary key on [SubCategoryID] in table 'SubCategories'
ALTER TABLE [dbo].[SubCategories]
ADD CONSTRAINT [PK_SubCategories]
    PRIMARY KEY CLUSTERED ([SubCategoryID] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [SubCat_ID], [has_Size], [has_Wight], [has_Hight], [has_Width], [has_Color], [has_Gender], [has_Describtion] in table 'Attributes_Index'
ALTER TABLE [dbo].[Attributes_Index]
ADD CONSTRAINT [PK_Attributes_Index]
    PRIMARY KEY CLUSTERED ([SubCat_ID], [has_Size], [has_Wight], [has_Hight], [has_Width], [has_Color], [has_Gender], [has_Describtion] ASC);
GO

-- Creating primary key on [Attributes_AttributeID], [Products_ProductID] in table 'Products_Attributes'
ALTER TABLE [dbo].[Products_Attributes]
ADD CONSTRAINT [PK_Products_Attributes]
    PRIMARY KEY CLUSTERED ([Attributes_AttributeID], [Products_ProductID] ASC);
GO

-- Creating primary key on [ProductImages_ImageID], [Products_ProductID] in table 'Products_Images'
ALTER TABLE [dbo].[Products_Images]
ADD CONSTRAINT [PK_Products_Images]
    PRIMARY KEY CLUSTERED ([ProductImages_ImageID], [Products_ProductID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [SubCat_ID] in table 'Attributes'
ALTER TABLE [dbo].[Attributes]
ADD CONSTRAINT [FK_Attributes_SubCategories]
    FOREIGN KEY ([SubCat_ID])
    REFERENCES [dbo].[SubCategories]
        ([SubCategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Attributes_SubCategories'
CREATE INDEX [IX_FK_Attributes_SubCategories]
ON [dbo].[Attributes]
    ([SubCat_ID]);
GO

-- Creating foreign key on [MainCat_ID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_Products_MainCategories]
    FOREIGN KEY ([MainCat_ID])
    REFERENCES [dbo].[MainCategories]
        ([MainCategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Products_MainCategories'
CREATE INDEX [IX_FK_Products_MainCategories]
ON [dbo].[Products]
    ([MainCat_ID]);
GO

-- Creating foreign key on [MainCat_ID] in table 'SubCategories'
ALTER TABLE [dbo].[SubCategories]
ADD CONSTRAINT [FK_SubCategories_MainCategories]
    FOREIGN KEY ([MainCat_ID])
    REFERENCES [dbo].[MainCategories]
        ([MainCategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SubCategories_MainCategories'
CREATE INDEX [IX_FK_SubCategories_MainCategories]
ON [dbo].[SubCategories]
    ([MainCat_ID]);
GO

-- Creating foreign key on [SubCat_ID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_Products_SubCategories]
    FOREIGN KEY ([SubCat_ID])
    REFERENCES [dbo].[SubCategories]
        ([SubCategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Products_SubCategories'
CREATE INDEX [IX_FK_Products_SubCategories]
ON [dbo].[Products]
    ([SubCat_ID]);
GO

-- Creating foreign key on [Attributes_AttributeID] in table 'Products_Attributes'
ALTER TABLE [dbo].[Products_Attributes]
ADD CONSTRAINT [FK_Products_Attributes_Attributes]
    FOREIGN KEY ([Attributes_AttributeID])
    REFERENCES [dbo].[Attributes]
        ([AttributeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Products_ProductID] in table 'Products_Attributes'
ALTER TABLE [dbo].[Products_Attributes]
ADD CONSTRAINT [FK_Products_Attributes_Products]
    FOREIGN KEY ([Products_ProductID])
    REFERENCES [dbo].[Products]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Products_Attributes_Products'
CREATE INDEX [IX_FK_Products_Attributes_Products]
ON [dbo].[Products_Attributes]
    ([Products_ProductID]);
GO

-- Creating foreign key on [ProductImages_ImageID] in table 'Products_Images'
ALTER TABLE [dbo].[Products_Images]
ADD CONSTRAINT [FK_Products_Images_ProductImages]
    FOREIGN KEY ([ProductImages_ImageID])
    REFERENCES [dbo].[ProductImages]
        ([ImageID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Products_ProductID] in table 'Products_Images'
ALTER TABLE [dbo].[Products_Images]
ADD CONSTRAINT [FK_Products_Images_Products]
    FOREIGN KEY ([Products_ProductID])
    REFERENCES [dbo].[Products]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Products_Images_Products'
CREATE INDEX [IX_FK_Products_Images_Products]
ON [dbo].[Products_Images]
    ([Products_ProductID]);
GO

-- Creating foreign key on [SubCat_ID] in table 'Attributes_Index'
ALTER TABLE [dbo].[Attributes_Index]
ADD CONSTRAINT [FK_Attributes_Index_SubCategories]
    FOREIGN KEY ([SubCat_ID])
    REFERENCES [dbo].[SubCategories]
        ([SubCategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
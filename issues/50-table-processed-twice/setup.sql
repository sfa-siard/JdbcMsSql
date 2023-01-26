CREATE DATABASE siard1;
GO

USE [siard1]
GO

/****** Object:  Table [dbo].[CollCollectionType_Enum]    Script Date: 25.01.2023 12:12:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CollCollectionType_Enum]
(
    [Code]          [nvarchar](50)                NOT NULL,
    [Description]   [nvarchar](500)               NULL,
    [DisplayText]   [nvarchar](50)                NULL,
    [DisplayOrder]  [smallint]                    NULL,
    [DisplayEnable] [bit]                         NULL,
    [InternalNotes] [nvarchar](500)               NULL,
    [ParentCode]    [nvarchar](50)                NULL,
    [Icon]          [image]                       NULL,
    [RowGUID]       [uniqueidentifier] ROWGUIDCOL NOT NULL,
    CONSTRAINT [PK_CollCollectionType_Enum] PRIMARY KEY CLUSTERED
        (
         [Code] ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[CollCollectionType_Enum]
    ADD DEFAULT (newsequentialid()) FOR [RowGUID]
GO

ALTER TABLE [dbo].[CollCollectionType_Enum]
    WITH CHECK ADD CONSTRAINT [FK_CollCollectionType_Enum_CollCollectionType_Enum] FOREIGN KEY ([ParentCode])
        REFERENCES [dbo].[CollCollectionType_Enum] ([Code])
GO

ALTER TABLE [dbo].[CollCollectionType_Enum]
    CHECK CONSTRAINT [FK_CollCollectionType_Enum_CollCollectionType_Enum]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'A text code which uniquely identifies each object in the enumeration (primary key). This value may not be changed, because the application may depend upon it.',
     @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'CollCollectionType_Enum',
     @level2type=N'COLUMN', @level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'Description of enumerated object, displayed in the user interface', @level0type=N'SCHEMA',
     @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'CollCollectionType_Enum', @level2type=N'COLUMN',
     @level2name=N'Description'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'Short abbreviated description of the object, displayed in the user interface', @level0type=N'SCHEMA',
     @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'CollCollectionType_Enum', @level2type=N'COLUMN',
     @level2name=N'DisplayText'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'The order in which the entries are displayed. The order may be changed at any time, but all values must be unique.',
     @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'CollCollectionType_Enum',
     @level2type=N'COLUMN', @level2name=N'DisplayOrder'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'Enumerated objects can be hidden from the user interface, if this attribute is set to false (= unchecked check box)',
     @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'CollCollectionType_Enum',
     @level2type=N'COLUMN', @level2name=N'DisplayEnable'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'Internal development notes on usage, definition, etc. of an enumerated object', @level0type=N'SCHEMA',
     @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'CollCollectionType_Enum', @level2type=N'COLUMN',
     @level2name=N'InternalNotes'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'The code of the superior entry, if a hierarchy within the entries is necessary', @level0type=N'SCHEMA',
     @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'CollCollectionType_Enum', @level2type=N'COLUMN',
     @level2name=N'ParentCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'A symbol representing this entry in the user interface', @level0type=N'SCHEMA', @level0name=N'dbo',
     @level1type=N'TABLE', @level1name=N'CollCollectionType_Enum', @level2type=N'COLUMN', @level2name=N'Icon'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'The types of a collection, e.g. cupboard, drawer, box, rack etc.', @level0type=N'SCHEMA',
     @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'CollCollectionType_Enum'
GO


USE [siard1]
GO

/****** Object:  Table [dbo].[Collection]    Script Date: 25.01.2023 12:11:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Collection]
(
    [CollectionID]                  [int] IDENTITY (1,1)          NOT NULL,
    [CollectionParentID]            [int]                         NULL,
    [CollectionName]                [nvarchar](255)               NOT NULL,
    [CollectionAcronym]             [nvarchar](10)                NULL,
    [AdministrativeContactName]     [nvarchar](500)               NULL,
    [AdministrativeContactAgentURI] [varchar](255)                NULL,
    [Description]                   [nvarchar](max)               NULL,
    [Location]                      [nvarchar](255)               NULL,
    [CollectionOwner]               [nvarchar](255)               NULL,
    [DisplayOrder]                  [smallint]                    NULL,
    [Type]                          [nvarchar](50)                NULL,
    [LogCreatedWhen]                [datetime]                    NULL,
    [LogCreatedBy]                  [nvarchar](50)                NULL,
    [LogUpdatedWhen]                [datetime]                    NULL,
    [LogUpdatedBy]                  [nvarchar](50)                NULL,
    [RowGUID]                       [uniqueidentifier] ROWGUIDCOL NOT NULL,
    [LocationPlan]                  [varchar](500)                NULL,
    [LocationPlanWidth]             [float]                       NULL,
    [LocationGeometry]              [geometry]                    NULL,
    [LocationHeight]                [float]                       NULL,
    [LocationParentID]              [int]                         NULL,
    [LocationPlanDate]              [datetime]                    NULL,
    CONSTRAINT [PK_Collection] PRIMARY KEY CLUSTERED
        (
         [CollectionID] ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Collection]
    ADD CONSTRAINT [DF_Collection_LogCreatedWhen] DEFAULT (getdate()) FOR [LogCreatedWhen]
GO

ALTER TABLE [dbo].[Collection]
    ADD CONSTRAINT [DF__Collectio__LogCr__25731E56] DEFAULT (suser_sname()) FOR [LogCreatedBy]
GO

ALTER TABLE [dbo].[Collection]
    ADD CONSTRAINT [DF_Collection_LogUpdatedWhen] DEFAULT (getdate()) FOR [LogUpdatedWhen]
GO

ALTER TABLE [dbo].[Collection]
    ADD CONSTRAINT [DF__Collectio__LogUp__2667428F] DEFAULT (suser_sname()) FOR [LogUpdatedBy]
GO

ALTER TABLE [dbo].[Collection]
    ADD CONSTRAINT [DF__Collectio__RowGU__2D73677A] DEFAULT (newsequentialid()) FOR [RowGUID]
GO

ALTER TABLE [dbo].[Collection]
    WITH CHECK ADD CONSTRAINT [FK_Collection_CollCollectionType_Enum] FOREIGN KEY ([Type])
        REFERENCES [dbo].[CollCollectionType_Enum] ([Code])
        ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[Collection]
    CHECK CONSTRAINT [FK_Collection_CollCollectionType_Enum]
GO

ALTER TABLE [dbo].[Collection]
    WITH NOCHECK ADD CONSTRAINT [FK_Collection_Collection] FOREIGN KEY ([CollectionParentID])
        REFERENCES [dbo].[Collection] ([CollectionID])
GO

ALTER TABLE [dbo].[Collection]
    CHECK CONSTRAINT [FK_Collection_Collection]
GO

ALTER TABLE [dbo].[Collection]
    WITH CHECK ADD CONSTRAINT [FK_Collection_CollectionLocation] FOREIGN KEY ([LocationParentID])
        REFERENCES [dbo].[Collection] ([CollectionID])
GO

ALTER TABLE [dbo].[Collection]
    CHECK CONSTRAINT [FK_Collection_CollectionLocation]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'Unique reference ID for the collection (= primary key)', @level0type=N'SCHEMA', @level0name=N'dbo',
     @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN', @level2name=N'CollectionID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'For a subcollection within another collection: CollectionID of the collection to which the subcollection belongs. Empty for an independent collection',
     @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN',
     @level2name=N'CollectionParentID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'Name of the collection (e.g. ''Herbarium Kew'') or subcollection (e.g. ''cone collection'', ''alcohol preservations''). This text should be kept relatively short. You may use Description for additional information',
     @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN',
     @level2name=N'CollectionName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'A unique code for the collection, e.g. the herbarium code from Index Herbariorum', @level0type=N'SCHEMA',
     @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN', @level2name=N'CollectionAcronym'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'The name of the person or organisation responsible for this collection', @level0type=N'SCHEMA',
     @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN', @level2name=N'AdministrativeContactName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'The URI of the person or organisation responsible for the collection e.g. as provided by the module DiversityAgents',
     @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN',
     @level2name=N'AdministrativeContactAgentURI'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A short description of the collection',
     @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN',
     @level2name=N'Description'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'Optional location of the collection, e.g. the number within a file system or a description of the room(s) housing the (sub)collection',
     @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN',
     @level2name=N'Location'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'The owner of the collection as e.g. printed on a label. Should be given if CollectionParentID is null',
     @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN',
     @level2name=N'CollectionOwner'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'The order in which the entries are displayed. The order may be changed at any time, but all values must be unique.',
     @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN',
     @level2name=N'DisplayOrder'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type of the collection, e.g. cupboard, drawer etc.',
     @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN',
     @level2name=N'Type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Point in time when this data set was created',
     @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN',
     @level2name=N'LogCreatedWhen'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the creator of this data set',
     @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN',
     @level2name=N'LogCreatedBy'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Point in time when this data set was updated last',
     @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN',
     @level2name=N'LogUpdatedWhen'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the person to update this data set last',
     @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN',
     @level2name=N'LogUpdatedBy'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'URI or file name including path of the floor plan of the collection', @level0type=N'SCHEMA',
     @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN', @level2name=N'LocationPlan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'Width of location plan in meter for calculation of size by provided geometry', @level0type=N'SCHEMA',
     @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN', @level2name=N'LocationPlanWidth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Geometry of the collection within the floor plan',
     @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN',
     @level2name=N'LocationGeometry'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'Height from ground level, e.g. for the position of sensors', @level0type=N'SCHEMA', @level0name=N'dbo',
     @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN', @level2name=N'LocationHeight'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'If the hierarchy of the location does not match the logical hierarchy, the ID of the parent location',
     @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN',
     @level2name=N'LocationParentID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
     @value=N'The date when the plan for the collection has been created', @level0type=N'SCHEMA', @level0name=N'dbo',
     @level1type=N'TABLE', @level1name=N'Collection', @level2type=N'COLUMN', @level2name=N'LocationPlanDate'
GO

EXEC sys.sp_addextendedproperty @name=N'Caption',
     @value=N'Definition of independent collections and a tree of subcollections (subcollections may contain subcollections).',
     @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Collection'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The collections where the specimen are stored',
     @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Collection'
GO
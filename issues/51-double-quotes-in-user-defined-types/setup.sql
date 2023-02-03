CREATE DATABASE siard1;
GO

USE [siard1]
GO


SET ANSI_NULLS ON
GO

SET ANSI_PADDING ON
GO


CREATE TYPE [dbo].[dtDay2] FROM [tinyint] NOT NULL
    GO
CREATE TYPE [dbo].[dtMonth2] FROM [tinyint] NOT NULL
    GO

CREATE TABLE [dbo].[CollectionEvent](
    [CollectionEventID] [int] IDENTITY(1,1) NOT NULL,
    [Version] [int] NOT NULL,
    [SeriesID] [int] NULL,
    [CollectorsEventNumber] [nvarchar](50) NULL,
    [CollectionDate] [datetime] NULL,
    [CollectionDay] [dbo].[dtDay2] NULL,
    [CollectionMonth] [dbo].[dtMonth2] NULL,
    [CollectionYear] [smallint] NULL,
    [CollectionEndDay] [dbo].[dtDay2] NULL,
    [CollectionEndMonth] [dbo].[dtMonth2] NULL,
    [CollectionEndYear] [smallint] NULL,
    [CollectionDateSupplement] [nvarchar](100) NULL,
    [CollectionDateCategory] [nvarchar](50) NULL,
    [CollectionTime] [varchar](50) NULL,
    [CollectionTimeSpan] [varchar](50) NULL,
    [LocalityDescription] [nvarchar](max) NULL,
    [LocalityVerbatim] [nvarchar](max) NULL,
    [HabitatDescription] [nvarchar](max) NULL,
    [ReferenceTitle] [nvarchar](255) NULL,
    [ReferenceURI] [varchar](255) NULL,
    [ReferenceDetails] [nvarchar](50) NULL,
    [CollectingMethod] [nvarchar](max) NULL,
    [Notes] [nvarchar](max) NULL,
    [CountryCache] [nvarchar](50) NULL,
    [DataWithholdingReason] [nvarchar](255) NULL,
    [DataWithholdingReasonDate] [nvarchar](50) NULL,
    [LogCreatedWhen] [datetime] NULL,
    [LogCreatedBy] [nvarchar](50) NULL,
    [LogUpdatedWhen] [datetime] NULL,
    [LogUpdatedBy] [nvarchar](50) NULL,
    [RowGUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
    CONSTRAINT [PK_CollectionEvent] PRIMARY KEY CLUSTERED
(
[CollectionEventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

    GO

    SET ANSI_PADDING OFF
    GO

ALTER TABLE [dbo].[CollectionEvent] ADD  CONSTRAINT [DF_CollectionEvent_Version]  DEFAULT ((1)) FOR [Version]
    GO
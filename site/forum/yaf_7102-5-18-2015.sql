USE [yaf_7102]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_WatchTopic](
	[WatchTopicID] [int] IDENTITY(1,1) NOT NULL,
	[TopicID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[LastMail] [datetime] NULL,
 CONSTRAINT [PK_yaf_WatchTopic] PRIMARY KEY CLUSTERED 
(
	[WatchTopicID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_yaf_WatchTopic] UNIQUE NONCLUSTERED 
(
	[TopicID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[yaf_WatchTopic] ON
INSERT [dbo].[yaf_WatchTopic] ([WatchTopicID], [TopicID], [UserID], [Created], [LastMail]) VALUES (3, 4, 31, CAST(0x0000A4950142A78F AS DateTime), NULL)
INSERT [dbo].[yaf_WatchTopic] ([WatchTopicID], [TopicID], [UserID], [Created], [LastMail]) VALUES (4, 5, 31, CAST(0x0000A49501439B33 AS DateTime), NULL)
INSERT [dbo].[yaf_WatchTopic] ([WatchTopicID], [TopicID], [UserID], [Created], [LastMail]) VALUES (5, 6, 31, CAST(0x0000A495014540C7 AS DateTime), NULL)
INSERT [dbo].[yaf_WatchTopic] ([WatchTopicID], [TopicID], [UserID], [Created], [LastMail]) VALUES (6, 7, 31, CAST(0x0000A4950145675C AS DateTime), NULL)
INSERT [dbo].[yaf_WatchTopic] ([WatchTopicID], [TopicID], [UserID], [Created], [LastMail]) VALUES (7, 8, 31, CAST(0x0000A4950146142C AS DateTime), NULL)
INSERT [dbo].[yaf_WatchTopic] ([WatchTopicID], [TopicID], [UserID], [Created], [LastMail]) VALUES (8, 9, 31, CAST(0x0000A4950146D6C8 AS DateTime), NULL)
INSERT [dbo].[yaf_WatchTopic] ([WatchTopicID], [TopicID], [UserID], [Created], [LastMail]) VALUES (9, 10, 31, CAST(0x0000A4950148BE42 AS DateTime), NULL)
INSERT [dbo].[yaf_WatchTopic] ([WatchTopicID], [TopicID], [UserID], [Created], [LastMail]) VALUES (10, 11, 16, CAST(0x0000A49600EB908B AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[yaf_WatchTopic] OFF
/****** Object:  StoredProcedure [dbo].[yaf_watchtopic_delete]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_watchtopic_delete](@WatchTopicID int) as
begin
        delete from [dbo].[yaf_WatchTopic] where WatchTopicID = @WatchTopicID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_watchtopic_check]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_watchtopic_check](@UserID int,@TopicID int) as
begin
    
    SELECT WatchTopicID FROM [dbo].[yaf_WatchTopic] WHERE UserID = @UserID AND TopicID = @TopicID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_watchtopic_add]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_watchtopic_add](@UserID int,@TopicID int,@UTCTIMESTAMP datetime) as
begin
    
    insert into [dbo].[yaf_WatchTopic](TopicID,UserID,Created)
    select @TopicID, @UserID, @UTCTIMESTAMP 
    where not exists(select 1 from [dbo].[yaf_WatchTopic] where TopicID=@TopicID and UserID=@UserID)
end
GO
/****** Object:  Table [dbo].[yaf_WatchForum]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_WatchForum](
	[WatchForumID] [int] IDENTITY(1,1) NOT NULL,
	[ForumID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[LastMail] [datetime] NULL,
 CONSTRAINT [PK_yaf_WatchForum] PRIMARY KEY CLUSTERED 
(
	[WatchForumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_yaf_WatchForum] UNIQUE NONCLUSTERED 
(
	[ForumID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[yaf_watchforum_delete]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_watchforum_delete](@WatchForumID int) as
begin
    
    delete from [dbo].[yaf_WatchForum] where WatchForumID = @WatchForumID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_watchforum_check]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_watchforum_check](@UserID int,@ForumID int) as
begin
    
    SELECT WatchForumID FROM [dbo].[yaf_WatchForum] WHERE UserID = @UserID AND ForumID = @ForumID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_watchforum_add]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_watchforum_add](@UserID int,@ForumID int,@UTCTIMESTAMP datetime) as
begin
    
    insert into [dbo].[yaf_WatchForum](ForumID,UserID,Created)
    select @ForumID, @UserID, @UTCTIMESTAMP 
    where not exists(select 1 from [dbo].[yaf_WatchForum] where ForumID=@ForumID and UserID=@UserID)
end
GO
/****** Object:  Table [dbo].[yaf_UserForum]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_UserForum](
	[UserID] [int] NOT NULL,
	[ForumID] [int] NOT NULL,
	[AccessMaskID] [int] NOT NULL,
	[Invited] [datetime] NOT NULL,
	[Accepted] [bit] NOT NULL,
 CONSTRAINT [PK_yaf_UserForum] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ForumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[yaf_userforum_save]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_userforum_save](@UserID int,@ForumID int,@AccessMaskID int,@UTCTIMESTAMP datetime) as
begin
    
    if exists(select 1 from [dbo].[yaf_UserForum] where UserID=@UserID and ForumID=@ForumID)
        update [dbo].[yaf_UserForum] set AccessMaskID=@AccessMaskID where UserID=@UserID and ForumID=@ForumID
    else
        insert into [dbo].[yaf_UserForum](UserID,ForumID,AccessMaskID,Invited,Accepted) values(@UserID,@ForumID,@AccessMaskID,@UTCTIMESTAMP ,1)
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_userforum_delete]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_userforum_delete](@UserID int,@ForumID int) as
begin
    
    delete from [dbo].[yaf_UserForum] where UserID=@UserID and ForumID=@ForumID
end
GO
/****** Object:  Table [dbo].[yaf_TopicReadTracking]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_TopicReadTracking](
	[UserID] [int] NOT NULL,
	[TopicID] [int] NOT NULL,
	[LastAccessDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[yaf_readtopic_lastread]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_readtopic_lastread](@UserID int,@TopicID int) as
begin
        SELECT LastAccessDate FROM  [dbo].[yaf_TopicReadTracking] WHERE UserID = @UserID AND TopicID = @TopicID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_readtopic_delete]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_readtopic_delete](@UserID int) as
begin
        delete from [dbo].[yaf_TopicReadTracking] where UserID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_readtopic_addorupdate]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_readtopic_addorupdate](@UserID int,@TopicID int,
      @UTCTIMESTAMP datetime) as
begin

    declare	@LastAccessDate	datetime
    set @LastAccessDate = (select top 1 LastAccessDate from [dbo].[yaf_TopicReadTracking] where UserID=@UserID AND TopicID=@TopicID)
    IF @LastAccessDate is not null
    begin	     
          update [dbo].[yaf_TopicReadTracking] set LastAccessDate=@UTCTIMESTAMP where LastAccessDate = @LastAccessDate AND UserID=@UserID AND TopicID=@TopicID
    end
    ELSE
      begin
          insert into [dbo].[yaf_TopicReadTracking](UserID,TopicID,LastAccessDate)
          values (@UserID, @TopicID, @UTCTIMESTAMP)
      end
end
GO
/****** Object:  Table [dbo].[yaf_Topic]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_Topic](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[ForumID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[UserName] [nvarchar](255) NULL,
	[UserDisplayName] [nvarchar](255) NULL,
	[Posted] [datetime] NOT NULL,
	[Topic] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[Styles] [nvarchar](255) NULL,
	[LinkDate] [datetime] NULL,
	[Views] [int] NOT NULL,
	[Priority] [smallint] NOT NULL,
	[PollID] [int] NULL,
	[TopicMovedID] [int] NULL,
	[LastPosted] [datetime] NULL,
	[LastMessageID] [int] NULL,
	[LastUserID] [int] NULL,
	[LastUserName] [nvarchar](255) NULL,
	[LastUserDisplayName] [nvarchar](255) NULL,
	[NumPosts] [int] NOT NULL,
	[Flags] [int] NOT NULL,
	[IsDeleted]  AS (CONVERT([bit],sign([Flags]&(8)),(0))),
	[IsQuestion]  AS (CONVERT([bit],sign([Flags]&(1024)),(0))),
	[AnswerMessageId] [int] NULL,
	[LastMessageFlags] [int] NULL,
	[TopicImage] [nvarchar](255) NULL,
 CONSTRAINT [PK_yaf_Topic] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_Topic_Flags] ON [dbo].[yaf_Topic] 
(
	[Flags] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_Topic_ForumID] ON [dbo].[yaf_Topic] 
(
	[ForumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_Topic_LastPosted_Desc] ON [dbo].[yaf_Topic] 
(
	[LastPosted] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_Topic_UserID] ON [dbo].[yaf_Topic] 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[yaf_Topic] ON
INSERT [dbo].[yaf_Topic] ([TopicID], [ForumID], [UserID], [UserName], [UserDisplayName], [Posted], [Topic], [Description], [Status], [Styles], [LinkDate], [Views], [Priority], [PollID], [TopicMovedID], [LastPosted], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumPosts], [Flags], [AnswerMessageId], [LastMessageFlags], [TopicImage]) VALUES (4, 1, 31, NULL, N'ST Project Team', CAST(0x0000A4950142A777 AS DateTime), N'Getting Around Nashville', N'Getting Around Nashville', N'', N'', NULL, 3, 0, NULL, NULL, CAST(0x0000A4950142A777 AS DateTime), NULL, 31, NULL, N'ST Project Team', 1, 8, NULL, 22, NULL)
INSERT [dbo].[yaf_Topic] ([TopicID], [ForumID], [UserID], [UserName], [UserDisplayName], [Posted], [Topic], [Description], [Status], [Styles], [LinkDate], [Views], [Priority], [PollID], [TopicMovedID], [LastPosted], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumPosts], [Flags], [AnswerMessageId], [LastMessageFlags], [TopicImage]) VALUES (5, 1, 31, NULL, N'ST Project Team', CAST(0x0000A49501439B30 AS DateTime), N'Local Schools', N'Local Schools', N'', N'', NULL, 1, 0, NULL, NULL, CAST(0x0000A49501439B30 AS DateTime), NULL, 31, NULL, N'ST Project Team', 1, 8, NULL, 22, NULL)
INSERT [dbo].[yaf_Topic] ([TopicID], [ForumID], [UserID], [UserName], [UserDisplayName], [Posted], [Topic], [Description], [Status], [Styles], [LinkDate], [Views], [Priority], [PollID], [TopicMovedID], [LastPosted], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumPosts], [Flags], [AnswerMessageId], [LastMessageFlags], [TopicImage]) VALUES (6, 1, 31, NULL, N'ST Project Team', CAST(0x0000A495014540C3 AS DateTime), N'Neighborhoods', N'Neighborhoods', N'', N'', NULL, 1, 0, NULL, NULL, CAST(0x0000A495014540C3 AS DateTime), NULL, 31, NULL, N'ST Project Team', 1, 8, NULL, 22, NULL)
INSERT [dbo].[yaf_Topic] ([TopicID], [ForumID], [UserID], [UserName], [UserDisplayName], [Posted], [Topic], [Description], [Status], [Styles], [LinkDate], [Views], [Priority], [PollID], [TopicMovedID], [LastPosted], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumPosts], [Flags], [AnswerMessageId], [LastMessageFlags], [TopicImage]) VALUES (7, 1, 31, NULL, N'ST Project Team', CAST(0x0000A49501456759 AS DateTime), N'Local Volunteer Opportunities', N'Local Volunteer Opportunities', N'', N'', NULL, 1, 0, NULL, NULL, CAST(0x0000A49501456759 AS DateTime), NULL, 31, NULL, N'ST Project Team', 1, 8, NULL, 22, NULL)
INSERT [dbo].[yaf_Topic] ([TopicID], [ForumID], [UserID], [UserName], [UserDisplayName], [Posted], [Topic], [Description], [Status], [Styles], [LinkDate], [Views], [Priority], [PollID], [TopicMovedID], [LastPosted], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumPosts], [Flags], [AnswerMessageId], [LastMessageFlags], [TopicImage]) VALUES (8, 1, 31, NULL, N'ST Project Team', CAST(0x0000A49501461428 AS DateTime), N'Local Schools', N'Local Schools', N'', N'', NULL, 5, 0, NULL, NULL, CAST(0x0000A49501461428 AS DateTime), NULL, 31, NULL, N'ST Project Team', 1, 8, NULL, 22, NULL)
INSERT [dbo].[yaf_Topic] ([TopicID], [ForumID], [UserID], [UserName], [UserDisplayName], [Posted], [Topic], [Description], [Status], [Styles], [LinkDate], [Views], [Priority], [PollID], [TopicMovedID], [LastPosted], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumPosts], [Flags], [AnswerMessageId], [LastMessageFlags], [TopicImage]) VALUES (9, 1, 31, NULL, N'ST Project Team', CAST(0x0000A4950146D6C5 AS DateTime), N'Getting Around Nashville', N'Getting Around Nashville', N'', N'', NULL, 2, 0, NULL, NULL, CAST(0x0000A4950146D6C5 AS DateTime), NULL, 31, NULL, N'ST Project Team', 1, 8, NULL, 22, NULL)
INSERT [dbo].[yaf_Topic] ([TopicID], [ForumID], [UserID], [UserName], [UserDisplayName], [Posted], [Topic], [Description], [Status], [Styles], [LinkDate], [Views], [Priority], [PollID], [TopicMovedID], [LastPosted], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumPosts], [Flags], [AnswerMessageId], [LastMessageFlags], [TopicImage]) VALUES (10, 2, 31, NULL, N'ST Project Team', CAST(0x0000A4950148BE3C AS DateTime), N'The Music Scene', N'The Music Scene', N'', N'', NULL, 1, 0, NULL, NULL, CAST(0x0000A4950148BE3C AS DateTime), NULL, 31, NULL, N'ST Project Team', 1, 8, NULL, 22, NULL)
INSERT [dbo].[yaf_Topic] ([TopicID], [ForumID], [UserID], [UserName], [UserDisplayName], [Posted], [Topic], [Description], [Status], [Styles], [LinkDate], [Views], [Priority], [PollID], [TopicMovedID], [LastPosted], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumPosts], [Flags], [AnswerMessageId], [LastMessageFlags], [TopicImage]) VALUES (11, 1, 16, NULL, N'testUser', CAST(0x0000A49600EB9077 AS DateTime), N'test', N'test', N'', N'', NULL, 1, 0, NULL, NULL, CAST(0x0000A49600EB9077 AS DateTime), NULL, 16, NULL, N'testUser', 1, 8, NULL, 22, NULL)
INSERT [dbo].[yaf_Topic] ([TopicID], [ForumID], [UserID], [UserName], [UserDisplayName], [Posted], [Topic], [Description], [Status], [Styles], [LinkDate], [Views], [Priority], [PollID], [TopicMovedID], [LastPosted], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumPosts], [Flags], [AnswerMessageId], [LastMessageFlags], [TopicImage]) VALUES (12, 1, 37, NULL, N'woodhullwes', CAST(0x0000A49600FA5986 AS DateTime), N'Test post from Chrome on Mac', N'Test post', N'', N'', NULL, 8, 0, NULL, NULL, CAST(0x0000A49600FA5986 AS DateTime), 12, 37, NULL, N'woodhullwes', 1, 0, NULL, 22, NULL)
SET IDENTITY_INSERT [dbo].[yaf_Topic] OFF
/****** Object:  StoredProcedure [dbo].[yaf_topic_updatetopic]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_topic_updatetopic]
(@TopicID int,@Topic nvarchar (100)) as
begin
        if @TopicID is not null
        update [dbo].[yaf_Topic] set
            Topic = @Topic
        where TopicID = @TopicID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_simplelist]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_topic_simplelist](
                @StartID INT  = 0,
                @Limit   INT  = 500)
AS
    BEGIN
        SET ARITHABORT ON      
        SELECT TOP(@Limit)  t.[TopicID],
                 t.[Topic]
        FROM     [dbo].[yaf_Topic] t
        WHERE    t.[TopicID] >= @StartID
        AND t.[TopicID] < (@StartID + @Limit)
        ORDER BY t.[TopicID]        
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_lock]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_topic_lock](@TopicID int,@Locked bit) as
begin
        if @Locked<>0
        update [dbo].[yaf_Topic] set Flags = Flags | 1 where TopicID = @TopicID
    else
        update [dbo].[yaf_Topic] set Flags = Flags & ~1 where TopicID = @TopicID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_info]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_topic_info]
(
    @TopicID int = null,
    @ShowDeleted bit = 0
)
AS
BEGIN
        IF @TopicID = 0 SET @TopicID = NULL

    IF @TopicID IS NULL
    BEGIN
        IF @ShowDeleted = 1 
            SELECT * FROM [dbo].[yaf_Topic]
        ELSE
            SELECT * FROM [dbo].[yaf_Topic] WHERE IsDeleted=0
    END
    ELSE
    BEGIN
        IF @ShowDeleted = 1 
            SELECT * FROM [dbo].[yaf_Topic] WHERE TopicID = @TopicID
        ELSE
            SELECT * FROM [dbo].[yaf_Topic] WHERE TopicID = @TopicID AND IsDeleted=0		
    END
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_findprev]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_topic_findprev](@TopicID int) AS 
BEGIN
        DECLARE @LastPosted datetime
    DECLARE @ForumID int
    SELECT @LastPosted = LastPosted, @ForumID = ForumID FROM [dbo].[yaf_Topic] WHERE TopicID = @TopicID AND TopicMovedID IS NULL
    SELECT TOP 1 TopicID from [dbo].[yaf_Topic] where LastPosted<@LastPosted AND ForumID = @ForumID AND IsDeleted=0 AND TopicMovedID IS NULL ORDER BY LastPosted DESC
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_findnext]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_topic_findnext](@TopicID int) as
begin
        declare @LastPosted datetime
    declare @ForumID int
    select @LastPosted = LastPosted, @ForumID = ForumID from [dbo].[yaf_Topic] where TopicID = @TopicID AND TopicMovedID IS NULL
    select top 1 TopicID from [dbo].[yaf_Topic] where LastPosted>@LastPosted and ForumID = @ForumID AND IsDeleted=0 AND TopicMovedID IS NULL order by LastPosted asc
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_findduplicate]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_topic_findduplicate]
(
    @TopicName nvarchar(255)
)
AS
BEGIN
    IF @TopicName IS NOT NULL
    BEGIN	
        IF EXISTS (SELECT TOP 1 1 FROM [dbo].[yaf_Topic] WHERE [Topic] LIKE  @TopicName AND TopicMovedID IS NULL)
        SELECT 1
        ELSE
        SELECT 0
    END
    ELSE
    BEGIN
        SELECT 0
    END	
END
GO
/****** Object:  Table [dbo].[yaf_ForumReadTracking]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_ForumReadTracking](
	[UserID] [int] NOT NULL,
	[ForumID] [int] NOT NULL,
	[LastAccessDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_lastread]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_lastread](@UserID int) as
begin
        DECLARE @LastForumRead datetime
        DECLARE @LastTopicRead datetime
        
         SET @LastForumRead = (SELECT TOP 1 LastAccessDate FROM  [dbo].[yaf_ForumReadTracking] WHERE UserID = @UserID ORDER BY LastAccessDate DESC)
        SET @LastTopicRead = (SELECT TOP 1 LastAccessDate FROM  [dbo].[yaf_TopicReadTracking] WHERE UserID = @UserID ORDER BY LastAccessDate DESC)

        IF @LastForumRead is not null AND @LastTopicRead is not null
        
        IF @LastForumRead > @LastTopicRead
           SELECT LastAccessDate = @LastForumRead
        ELSE
           SELECT LastAccessDate = @LastTopicRead
           
        ELSE IF @LastForumRead is not null
           SELECT LastAccessDate = @LastForumRead
            
        ELSE IF @LastTopicRead is not null
            SELECT LastAccessDate = @LastTopicRead
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_readforum_lastread]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_readforum_lastread](@UserID int,@ForumID int) as
begin
        SELECT LastAccessDate FROM  [dbo].[yaf_ForumReadTracking] WHERE UserID = @UserID AND ForumID = @ForumID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_readforum_delete]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_readforum_delete](@UserID int) as
begin
        delete from [dbo].[yaf_ForumReadTracking] where UserID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_readforum_addorupdate]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_readforum_addorupdate] (
    @UserID INT
    ,@ForumID INT,
      @UTCTIMESTAMP datetime
    )
AS
BEGIN
    DECLARE @LastAccessDate DATETIME

    IF EXISTS (
            SELECT 1
            FROM [dbo].[yaf_ForumReadTracking]
            WHERE UserID = @UserID
                AND ForumID = @ForumID
            )
    BEGIN
        SET @LastAccessDate = (
                SELECT LastAccessDate
                FROM [dbo].[yaf_ForumReadTracking]
                WHERE (
                        UserID = @UserID
                        AND ForumID = @ForumID
                        )
                )

        UPDATE [dbo].[yaf_ForumReadTracking]
        SET LastAccessDate = @UTCTIMESTAMP
        WHERE LastAccessDate = @LastAccessDate
            AND UserID = @UserID
            AND ForumID = @ForumID
    END
    ELSE
    BEGIN
        INSERT INTO [dbo].[yaf_ForumReadTracking] (
            UserID
            ,ForumID
            ,LastAccessDate
            )
        VALUES (
            @UserID
            ,@ForumID
            ,@UTCTIMESTAMP
            )
    END

    -- Delete TopicReadTracking for forum...
    DELETE
    FROM [dbo].[yaf_TopicReadTracking]
    WHERE UserID = @UserID
        AND TopicID IN (
            SELECT TopicID
            FROM [dbo].[yaf_Topic]
            WHERE ForumID = @ForumID
            )
END
GO
/****** Object:  Table [dbo].[yaf_ForumAccess]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_ForumAccess](
	[GroupID] [int] NOT NULL,
	[ForumID] [int] NOT NULL,
	[AccessMaskID] [int] NOT NULL,
 CONSTRAINT [PK_yaf_ForumAccess] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[ForumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_ForumAccess_ForumID] ON [dbo].[yaf_ForumAccess] 
(
	[ForumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (1, 1, 1)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (1, 2, 1)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (1, 3, 1)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (1, 4, 1)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (1, 5, 1)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (1, 6, 1)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (1, 7, 1)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (1, 8, 1)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (1, 9, 1)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (1, 10, 1)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (1, 11, 1)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (1, 12, 1)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (2, 1, 4)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (2, 2, 4)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (2, 3, 4)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (2, 4, 4)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (2, 5, 4)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (2, 6, 4)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (2, 7, 4)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (2, 8, 4)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (2, 9, 4)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (2, 10, 4)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (2, 11, 4)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (2, 12, 4)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (3, 1, 3)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (3, 2, 3)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (3, 3, 3)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (3, 4, 3)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (3, 5, 3)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (3, 6, 3)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (3, 7, 3)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (3, 8, 3)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (3, 9, 3)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (3, 10, 3)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (3, 11, 3)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (3, 12, 3)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (4, 1, 2)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (4, 2, 2)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (4, 3, 2)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (4, 4, 2)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (4, 5, 2)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (4, 6, 2)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (4, 7, 2)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (4, 8, 2)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (4, 9, 2)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (4, 10, 2)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (4, 11, 2)
INSERT [dbo].[yaf_ForumAccess] ([GroupID], [ForumID], [AccessMaskID]) VALUES (4, 12, 2)
/****** Object:  StoredProcedure [dbo].[yaf_forumaccess_save]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_forumaccess_save](
    @ForumID			int,
    @GroupID			int,
    @AccessMaskID		int
) as
begin
        update [dbo].[yaf_ForumAccess]
        set AccessMaskID=@AccessMaskID
    where 
        ForumID = @ForumID and 
        GroupID = @GroupID
end
GO
/****** Object:  Table [dbo].[yaf_Message]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[yaf_Message](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[TopicID] [int] NOT NULL,
	[ReplyTo] [int] NULL,
	[Position] [int] NOT NULL,
	[Indent] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[UserName] [nvarchar](255) NULL,
	[UserDisplayName] [nvarchar](255) NULL,
	[Posted] [datetime] NOT NULL,
	[Message] [ntext] NOT NULL,
	[IP] [varchar](39) NOT NULL,
	[Edited] [datetime] NULL,
	[Flags] [int] NOT NULL,
	[EditReason] [nvarchar](100) NULL,
	[IsModeratorChanged] [bit] NOT NULL,
	[DeleteReason] [nvarchar](100) NULL,
	[ExternalMessageId] [nvarchar](255) NULL,
	[ReferenceMessageId] [nvarchar](255) NULL,
	[IsDeleted]  AS (CONVERT([bit],sign([Flags]&(8)),(0))),
	[IsApproved]  AS (CONVERT([bit],sign([Flags]&(16)),(0))),
	[BlogPostID] [nvarchar](50) NULL,
	[EditedBy] [int] NULL,
 CONSTRAINT [PK_yaf_Message] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_yaf_Message_Flags] ON [dbo].[yaf_Message] 
(
	[Flags] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_Message_Posted_Desc] ON [dbo].[yaf_Message] 
(
	[Posted] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_Message_TopicID] ON [dbo].[yaf_Message] 
(
	[TopicID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_Message_UserID] ON [dbo].[yaf_Message] 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[yaf_Message] ON
INSERT [dbo].[yaf_Message] ([MessageID], [TopicID], [ReplyTo], [Position], [Indent], [UserID], [UserName], [UserDisplayName], [Posted], [Message], [IP], [Edited], [Flags], [EditReason], [IsModeratorChanged], [DeleteReason], [ExternalMessageId], [ReferenceMessageId], [BlogPostID], [EditedBy]) VALUES (4, 4, NULL, 0, 0, 31, NULL, N'ST Project Team', CAST(0x0000A4950142A777 AS DateTime), N'Use this thread to discuss Getting Around Nashville.', N'206.169.247.189', NULL, 30, NULL, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[yaf_Message] ([MessageID], [TopicID], [ReplyTo], [Position], [Indent], [UserID], [UserName], [UserDisplayName], [Posted], [Message], [IP], [Edited], [Flags], [EditReason], [IsModeratorChanged], [DeleteReason], [ExternalMessageId], [ReferenceMessageId], [BlogPostID], [EditedBy]) VALUES (5, 5, NULL, 0, 0, 31, NULL, N'ST Project Team', CAST(0x0000A49501439B30 AS DateTime), N'Use this thread to discuss Local Schools.', N'206.169.247.189', NULL, 30, NULL, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[yaf_Message] ([MessageID], [TopicID], [ReplyTo], [Position], [Indent], [UserID], [UserName], [UserDisplayName], [Posted], [Message], [IP], [Edited], [Flags], [EditReason], [IsModeratorChanged], [DeleteReason], [ExternalMessageId], [ReferenceMessageId], [BlogPostID], [EditedBy]) VALUES (6, 6, NULL, 0, 0, 31, NULL, N'ST Project Team', CAST(0x0000A495014540C3 AS DateTime), N'Use this topic to discuss Neighborhoods.', N'206.169.247.189', NULL, 30, NULL, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[yaf_Message] ([MessageID], [TopicID], [ReplyTo], [Position], [Indent], [UserID], [UserName], [UserDisplayName], [Posted], [Message], [IP], [Edited], [Flags], [EditReason], [IsModeratorChanged], [DeleteReason], [ExternalMessageId], [ReferenceMessageId], [BlogPostID], [EditedBy]) VALUES (7, 7, NULL, 0, 0, 31, NULL, N'ST Project Team', CAST(0x0000A49501456759 AS DateTime), N'Use this topic to discuss Local Volunteer Opportunities.', N'206.169.247.189', NULL, 30, NULL, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[yaf_Message] ([MessageID], [TopicID], [ReplyTo], [Position], [Indent], [UserID], [UserName], [UserDisplayName], [Posted], [Message], [IP], [Edited], [Flags], [EditReason], [IsModeratorChanged], [DeleteReason], [ExternalMessageId], [ReferenceMessageId], [BlogPostID], [EditedBy]) VALUES (8, 8, NULL, 0, 0, 31, NULL, N'ST Project Team', CAST(0x0000A49501461428 AS DateTime), N'Use this topic to discuss Local Schools.', N'206.169.247.189', CAST(0x0000A49501466B0F AS DateTime), 30, N'', 0, NULL, NULL, NULL, N'', 31)
INSERT [dbo].[yaf_Message] ([MessageID], [TopicID], [ReplyTo], [Position], [Indent], [UserID], [UserName], [UserDisplayName], [Posted], [Message], [IP], [Edited], [Flags], [EditReason], [IsModeratorChanged], [DeleteReason], [ExternalMessageId], [ReferenceMessageId], [BlogPostID], [EditedBy]) VALUES (9, 9, NULL, 0, 0, 31, NULL, N'ST Project Team', CAST(0x0000A4950146D6C5 AS DateTime), N'Use this topic to discuss Getting Around Nashville.', N'206.169.247.189', CAST(0x0000A4950146EF4E AS DateTime), 30, N'', 0, NULL, NULL, NULL, N'', 31)
INSERT [dbo].[yaf_Message] ([MessageID], [TopicID], [ReplyTo], [Position], [Indent], [UserID], [UserName], [UserDisplayName], [Posted], [Message], [IP], [Edited], [Flags], [EditReason], [IsModeratorChanged], [DeleteReason], [ExternalMessageId], [ReferenceMessageId], [BlogPostID], [EditedBy]) VALUES (10, 10, NULL, 0, 0, 31, NULL, N'ST Project Team', CAST(0x0000A4950148BE3C AS DateTime), N'Use this thread to discuss The Music Scene.', N'206.169.247.189', NULL, 30, NULL, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[yaf_Message] ([MessageID], [TopicID], [ReplyTo], [Position], [Indent], [UserID], [UserName], [UserDisplayName], [Posted], [Message], [IP], [Edited], [Flags], [EditReason], [IsModeratorChanged], [DeleteReason], [ExternalMessageId], [ReferenceMessageId], [BlogPostID], [EditedBy]) VALUES (11, 11, NULL, 0, 0, 16, NULL, N'testUser', CAST(0x0000A49600EB9077 AS DateTime), N'test', N'206.169.247.189', NULL, 30, NULL, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[yaf_Message] ([MessageID], [TopicID], [ReplyTo], [Position], [Indent], [UserID], [UserName], [UserDisplayName], [Posted], [Message], [IP], [Edited], [Flags], [EditReason], [IsModeratorChanged], [DeleteReason], [ExternalMessageId], [ReferenceMessageId], [BlogPostID], [EditedBy]) VALUES (12, 12, NULL, 0, 0, 37, NULL, N'woodhullwes', CAST(0x0000A49600FA5986 AS DateTime), N'Testing this post function', N'207.45.158.252', NULL, 22, NULL, 0, NULL, NULL, NULL, N'', NULL)
SET IDENTITY_INSERT [dbo].[yaf_Message] OFF
/****** Object:  Table [dbo].[yaf_Forum]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_Forum](
	[ForumID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ParentID] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[SortOrder] [smallint] NOT NULL,
	[LastPosted] [datetime] NULL,
	[LastTopicID] [int] NULL,
	[LastMessageID] [int] NULL,
	[LastUserID] [int] NULL,
	[LastUserName] [nvarchar](255) NULL,
	[LastUserDisplayName] [nvarchar](255) NULL,
	[NumTopics] [int] NOT NULL,
	[NumPosts] [int] NOT NULL,
	[RemoteURL] [nvarchar](100) NULL,
	[Flags] [int] NOT NULL,
	[IsLocked]  AS (CONVERT([bit],sign([Flags]&(1)),(0))),
	[IsHidden]  AS (CONVERT([bit],sign([Flags]&(2)),(0))),
	[IsNoCount]  AS (CONVERT([bit],sign([Flags]&(4)),(0))),
	[IsModerated]  AS (CONVERT([bit],sign([Flags]&(8)),(0))),
	[ThemeURL] [nvarchar](50) NULL,
	[PollGroupID] [int] NULL,
	[ImageURL] [nvarchar](128) NULL,
	[Styles] [nvarchar](255) NULL,
	[UserID] [int] NULL,
	[ModeratedPostCount] [int] NULL,
	[IsModeratedNewTopicOnly] [bit] NOT NULL,
 CONSTRAINT [PK_yaf_Forum] PRIMARY KEY CLUSTERED 
(
	[ForumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_Forum_CategoryID] ON [dbo].[yaf_Forum] 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_Forum_Flags] ON [dbo].[yaf_Forum] 
(
	[Flags] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_Forum_ParentID] ON [dbo].[yaf_Forum] 
(
	[ParentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[yaf_Forum] ON
INSERT [dbo].[yaf_Forum] ([ForumID], [CategoryID], [ParentID], [Name], [Description], [SortOrder], [LastPosted], [LastTopicID], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumTopics], [NumPosts], [RemoteURL], [Flags], [ThemeURL], [PollGroupID], [ImageURL], [Styles], [UserID], [ModeratedPostCount], [IsModeratedNewTopicOnly]) VALUES (1, 1, NULL, N'Getting Around Nashville', N'', 1, CAST(0x0000A49600FA5986 AS DateTime), 12, 12, 37, NULL, N'woodhullwes', 1, 1, NULL, 4, NULL, NULL, NULL, N'', NULL, NULL, 0)
INSERT [dbo].[yaf_Forum] ([ForumID], [CategoryID], [ParentID], [Name], [Description], [SortOrder], [LastPosted], [LastTopicID], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumTopics], [NumPosts], [RemoteURL], [Flags], [ThemeURL], [PollGroupID], [ImageURL], [Styles], [UserID], [ModeratedPostCount], [IsModeratedNewTopicOnly]) VALUES (2, 1, NULL, N'Local Schools', N'', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, 0)
INSERT [dbo].[yaf_Forum] ([ForumID], [CategoryID], [ParentID], [Name], [Description], [SortOrder], [LastPosted], [LastTopicID], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumTopics], [NumPosts], [RemoteURL], [Flags], [ThemeURL], [PollGroupID], [ImageURL], [Styles], [UserID], [ModeratedPostCount], [IsModeratedNewTopicOnly]) VALUES (3, 3, NULL, N'Athletics/Fitness in Nashville', N'', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, 0)
INSERT [dbo].[yaf_Forum] ([ForumID], [CategoryID], [ParentID], [Name], [Description], [SortOrder], [LastPosted], [LastTopicID], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumTopics], [NumPosts], [RemoteURL], [Flags], [ThemeURL], [PollGroupID], [ImageURL], [Styles], [UserID], [ModeratedPostCount], [IsModeratedNewTopicOnly]) VALUES (4, 1, NULL, N'Local Volunteer Opportunites', N'', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, 0)
INSERT [dbo].[yaf_Forum] ([ForumID], [CategoryID], [ParentID], [Name], [Description], [SortOrder], [LastPosted], [LastTopicID], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumTopics], [NumPosts], [RemoteURL], [Flags], [ThemeURL], [PollGroupID], [ImageURL], [Styles], [UserID], [ModeratedPostCount], [IsModeratedNewTopicOnly]) VALUES (5, 3, NULL, N'Cool Places to Visit', N'', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, 0)
INSERT [dbo].[yaf_Forum] ([ForumID], [CategoryID], [ParentID], [Name], [Description], [SortOrder], [LastPosted], [LastTopicID], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumTopics], [NumPosts], [RemoteURL], [Flags], [ThemeURL], [PollGroupID], [ImageURL], [Styles], [UserID], [ModeratedPostCount], [IsModeratedNewTopicOnly]) VALUES (6, 3, NULL, N'Outdoorsy Activities', N'', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, 0)
INSERT [dbo].[yaf_Forum] ([ForumID], [CategoryID], [ParentID], [Name], [Description], [SortOrder], [LastPosted], [LastTopicID], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumTopics], [NumPosts], [RemoteURL], [Flags], [ThemeURL], [PollGroupID], [ImageURL], [Styles], [UserID], [ModeratedPostCount], [IsModeratedNewTopicOnly]) VALUES (7, 3, NULL, N'Parks', N'', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, 0)
INSERT [dbo].[yaf_Forum] ([ForumID], [CategoryID], [ParentID], [Name], [Description], [SortOrder], [LastPosted], [LastTopicID], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumTopics], [NumPosts], [RemoteURL], [Flags], [ThemeURL], [PollGroupID], [ImageURL], [Styles], [UserID], [ModeratedPostCount], [IsModeratedNewTopicOnly]) VALUES (8, 3, NULL, N'Shopping', N'', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, 0)
INSERT [dbo].[yaf_Forum] ([ForumID], [CategoryID], [ParentID], [Name], [Description], [SortOrder], [LastPosted], [LastTopicID], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumTopics], [NumPosts], [RemoteURL], [Flags], [ThemeURL], [PollGroupID], [ImageURL], [Styles], [UserID], [ModeratedPostCount], [IsModeratedNewTopicOnly]) VALUES (9, 3, NULL, N'Sports and Sporting Events', N'', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, 0)
INSERT [dbo].[yaf_Forum] ([ForumID], [CategoryID], [ParentID], [Name], [Description], [SortOrder], [LastPosted], [LastTopicID], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumTopics], [NumPosts], [RemoteURL], [Flags], [ThemeURL], [PollGroupID], [ImageURL], [Styles], [UserID], [ModeratedPostCount], [IsModeratedNewTopicOnly]) VALUES (10, 3, NULL, N'The Food Scene in Nashville', N'', 10, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, 0)
INSERT [dbo].[yaf_Forum] ([ForumID], [CategoryID], [ParentID], [Name], [Description], [SortOrder], [LastPosted], [LastTopicID], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumTopics], [NumPosts], [RemoteURL], [Flags], [ThemeURL], [PollGroupID], [ImageURL], [Styles], [UserID], [ModeratedPostCount], [IsModeratedNewTopicOnly]) VALUES (11, 3, NULL, N'The Music Scene', N'', 11, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, 0)
INSERT [dbo].[yaf_Forum] ([ForumID], [CategoryID], [ParentID], [Name], [Description], [SortOrder], [LastPosted], [LastTopicID], [LastMessageID], [LastUserID], [LastUserName], [LastUserDisplayName], [NumTopics], [NumPosts], [RemoteURL], [Flags], [ThemeURL], [PollGroupID], [ImageURL], [Styles], [UserID], [ModeratedPostCount], [IsModeratedNewTopicOnly]) VALUES (12, 4, NULL, N'IT Professionals', N'', 12, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[yaf_Forum] OFF
/****** Object:  StoredProcedure [dbo].[yaf_forum_updatelastpost]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_forum_updatelastpost](@ForumID int) as
begin
        update [dbo].[yaf_Forum] set
        LastPosted = (select top 1 y.Posted from [dbo].[yaf_Topic] x join [dbo].[yaf_Message] y on y.TopicID=x.TopicID where x.ForumID = @ForumID and (y.Flags & 24)=16 and x.IsDeleted = 0 order by y.Posted desc),
        LastTopicID = (select top 1 y.TopicID from [dbo].[yaf_Topic] x join [dbo].[yaf_Message] y on y.TopicID=x.TopicID where x.ForumID = @ForumID and (y.Flags & 24)=16 and x.IsDeleted = 0order by y.Posted desc),
        LastMessageID = (select top 1 y.MessageID from [dbo].[yaf_Topic] x join [dbo].[yaf_Message] y on y.TopicID=x.TopicID where x.ForumID = @ForumID and (y.Flags & 24)=16 and x.IsDeleted = 0order by y.Posted desc),
        LastUserID = (select top 1 y.UserID from [dbo].[yaf_Topic] x join [dbo].[yaf_Message] y on y.TopicID=x.TopicID where x.ForumID = @ForumID and (y.Flags & 24)=16 and x.IsDeleted = 0order by y.Posted desc),
        LastUserName = (select top 1 y.UserName from [dbo].[yaf_Topic] x join [dbo].[yaf_Message] y on y.TopicID=x.TopicID where x.ForumID = @ForumID and (y.Flags & 24)=16 and x.IsDeleted = 0order by y.Posted desc),
        LastUserDisplayName = (select top 1 y.UserDisplayName from [dbo].[yaf_Topic] x join [dbo].[yaf_Message] y on y.TopicID=x.TopicID where x.ForumID = @ForumID and (y.Flags & 24)=16 and x.IsDeleted = 0 order by y.Posted desc)
    where ForumID = @ForumID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_forum_updatestats]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_forum_updatestats]
@ForumID int
as
begin
    --update Forum with forum and subforum topic values
    update  f
        set NumPosts  = isnull(t.Numposts, 0),
            NumTopics = isnull(t.Numtopics, 0)
    from    [dbo].[yaf_Forum] as f cross apply (select sum(t.NumPosts) as Numposts,
                                                                                count(t.TopicID) as Numtopics
                                                                         from   [dbo].[yaf_Topic] as t
                                                                                inner join
                                                                                [dbo].[yaf_Forum] as ff
                                                                                on ff.ForumID = t.ForumID
                                                                         where  (ff.ForumID = f.ForumID
                                                                                 or ff.ParentID = f.ForumID)
                                                                                and t.IsDeleted <> 1) as t
    where   f.ForumID = isnull(@ForumID, f.ForumID);
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_move]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_topic_move](@TopicID int,@ForumID int,@ShowMoved bit, @LinkDays int, @UTCTIMESTAMP datetime) AS
begin
        declare @OldForumID int		
        declare @newTimestamp datetime
        if @LinkDays > -1
        begin
        SET @newTimestamp = DATEADD(d,@LinkDays,@UTCTIMESTAMP);
        end
    select @OldForumID = ForumID from [dbo].[yaf_Topic] where TopicID = @TopicID

    if @ShowMoved <> 0 begin
        -- delete an old link if exists
        delete from [dbo].[yaf_Topic] where TopicMovedID = @TopicID
        -- create a moved message
        insert into [dbo].[yaf_Topic](ForumID,UserID,UserName,UserDisplayName,Posted,Topic,[Views],Flags,Priority,PollID,TopicMovedID,LastPosted,NumPosts,LinkDate)
        select ForumID,UserID,UserName,UserDisplayName,Posted,Topic,0,Flags,Priority,PollID,@TopicID,LastPosted,0,@newTimestamp
        from [dbo].[yaf_Topic] where TopicID = @TopicID
    end

    -- move the topic
    update [dbo].[yaf_Topic] set ForumID = @ForumID where TopicID = @TopicID

    -- update last posts
    exec [dbo].[yaf_forum_updatelastpost] @OldForumID
    exec [dbo].[yaf_forum_updatelastpost] @ForumID
    
    -- update stats
    exec [dbo].[yaf_forum_updatestats] @OldForumID
    exec [dbo].[yaf_forum_updatestats] @ForumID
    
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_forum_listtopics]    Script Date: 05/18/2015 09:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_forum_listtopics](@ForumID int) as
begin
        select * from [dbo].[yaf_Topic]
    Where ForumID = @ForumID
end
GO
/****** Object:  UserDefinedFunction [dbo].[yaf_forum_topics]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[yaf_forum_topics](@ForumID int) returns int as

begin
    declare @NumTopics int
    declare @tmp int

    select @NumTopics=NumTopics from [dbo].[yaf_Forum] where ForumID=@ForumID


    if exists(select 1 from [dbo].[yaf_Forum] where ParentID=@ForumID)

    begin
        declare c cursor for
        select ForumID from [dbo].[yaf_Forum]

        where ParentID = @ForumID
        
        open c
        
        fetch next from c into @tmp
        while @@FETCH_STATUS = 0
        begin
            set @NumTopics=@NumTopics+[dbo].[yaf_forum_topics](@tmp)

            fetch next from c into @tmp
        end
        close c
        deallocate c
    end

    return @NumTopics
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_forum_simplelist]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_forum_simplelist](
                @StartID INT  = 0,
                @Limit   INT  = 500)
AS
    BEGIN
        SET ARITHABORT ON        
        SELECT TOP(@Limit)  f.[ForumID],
                 f.[Name]
        FROM     [dbo].[yaf_Forum] f
        WHERE    f.[ForumID] >= @StartID
        AND f.[ForumID] < (@StartID + @Limit)
        ORDER BY f.[ForumID]    
    END
GO
/****** Object:  UserDefinedFunction [dbo].[yaf_forum_save_parentschecker]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[yaf_forum_save_parentschecker](@ForumID int, @ParentID int) returns int as

begin
-- Checks if the forum is already referenced as a parent 
    declare @dependency int
    declare @haschildren int
    declare @frmtmp int
    declare @prntmp int
    
    set @dependency = 0
    set @haschildren = 0
    
    select @dependency=ForumID from [dbo].[yaf_Forum] where ParentID=@ForumID AND ForumID = @ParentID;
    if @dependency > 0
    begin
    return @ParentID
    end

    if exists(select 1 from [dbo].[yaf_Forum] where ParentID=@ForumID)
        begin        
        declare c cursor for
        select ForumID,ParentID from [dbo].[yaf_Forum]
        where ParentID = @ForumID
        
        open c
        
        fetch next from c into @frmtmp,@prntmp
        while @@FETCH_STATUS = 0
        begin
        if @frmtmp > 0 AND @frmtmp IS NOT NULL
         begin        
            set @haschildren= [dbo].[yaf_forum_save_parentschecker](@frmtmp,@ParentID)            
            if  @prntmp = @ParentID
            begin
            set @dependency= @ParentID
            end    
            else if @haschildren > 0
            begin
            set @dependency= @haschildren
            end        
        end
        fetch next from c into @frmtmp,@prntmp
        end
        close c
        deallocate c    
    end
    return @dependency
end
GO
/****** Object:  UserDefinedFunction [dbo].[yaf_forum_posts]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[yaf_forum_posts](@ForumID int) returns int as
begin
    declare @NumPosts int
    declare @tmp int

    select @NumPosts=NumPosts from [dbo].[yaf_Forum] where ForumID=@ForumID


    if exists(select 1 from [dbo].[yaf_Forum] where ParentID=@ForumID)

    begin
        declare c cursor for
        select ForumID from [dbo].[yaf_Forum]

        where ParentID = @ForumID
        
        open c
        
        fetch next from c into @tmp
        while @@FETCH_STATUS = 0
        begin
            set @NumPosts=@NumPosts+[dbo].[yaf_forum_posts](@tmp)

            fetch next from c into @tmp
        end
        close c
        deallocate c
    end

    return @NumPosts
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_forum_listSubForums]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_forum_listSubForums](@ForumID int) as
begin
        select Sum(1) from [dbo].[yaf_Forum] where ParentID = @ForumID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_forum_listpath]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_forum_listpath](@ForumID int) as
begin
declare @tbllpath TABLE (ForumID int, Name nvarchar(255), Indent int);
declare @Indent int;
declare @CurrentParentID int;
declare @CurrentForumID int;
declare @CurrentForumName nvarchar(255);

-- Flag if a record was selected
declare @Selectcount int;

-- Forum 1000 is a legal value... always use -1 instead
SET @CurrentParentID = -1;

SET @Indent = 0;
	while (@CurrentParentID IS NOT NULL and @Indent < 1000)
      begin                
	   set @Selectcount = 0;
       select
			@Selectcount = 1,
            @CurrentForumID =  a.ForumID,
            @CurrentParentID = a.ParentID,
            @CurrentForumName = a.Name			                      
        from
             [dbo].[yaf_Forum] a
        where
            a.ForumID=@ForumID;

		if @Selectcount = 0
		begin
			break;
		end
            Insert into @tbllpath(ForumID, Name,Indent)
            values (@CurrentForumID,@CurrentForumName,@Indent)
            SET @ForumID = @CurrentParentID; 
            SET @Indent = @Indent + 1;
     end     
     select ForumID, Name from  @tbllpath order by Indent Desc; 
end
GO
/****** Object:  Table [dbo].[yaf_FavoriteTopic]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_FavoriteTopic](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[TopicID] [int] NOT NULL,
 CONSTRAINT [PK_yaf_FavoriteTopic] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_FavoriteTopic_TopicID] ON [dbo].[yaf_FavoriteTopic] 
(
	[TopicID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_FavoriteTopic_UserID] ON [dbo].[yaf_FavoriteTopic] 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_favorite_remove]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_topic_favorite_remove] 
    @UserID int,
    @TopicID int
AS
BEGIN
    DELETE FROM [dbo].[yaf_FavoriteTopic] WHERE UserID=@UserID AND TopicID=@TopicID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_favorite_list]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_topic_favorite_list](@UserID int) as
BEGIN
SELECT TopicID FROM [dbo].[yaf_FavoriteTopic] WHERE UserID=@UserID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_favorite_count]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_topic_favorite_count](@TopicID int) as
BEGIN
    SELECT COUNT(ID) as [FavoriteCount] FROM [dbo].[yaf_FavoriteTopic] WHERE TopicId = @TopicID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_favorite_add]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* End of stored procedures for Buddy feature */

CREATE PROCEDURE [dbo].[yaf_topic_favorite_add] 
    @UserID int,
    @TopicID int
AS
BEGIN
    IF NOT EXISTS (SELECT ID FROM [dbo].[yaf_FavoriteTopic] WHERE (UserID = @UserID AND TopicID=@TopicID))
    BEGIN
        INSERT INTO [dbo].[yaf_FavoriteTopic] (UserID, TopicID) Values 
                                (@UserID, @TopicID)
    END
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_repliedtopic]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_user_repliedtopic]
(@MessageID int, @UserID int) as
begin
        DECLARE @TopicID int
        SET @TopicID = (SELECT TopicID FROM [dbo].[yaf_Message] WHERE (MessageID = @MessageID))

        SELECT COUNT(t.MessageID)
        FROM [dbo].[yaf_Message] AS t WHERE (t.TopicID=@TopicID) AND (t.UserID = @UserID)
        
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_updatelastpost]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_topic_updatelastpost]
(@ForumID int=null,@TopicID int=null) as
begin
        if @TopicID is not null
        update [dbo].[yaf_Topic] set
            LastPosted = (select top 1 x.Posted from [dbo].[yaf_Message] x where x.TopicID=[dbo].[yaf_Topic].TopicID and (x.Flags & 24)=16 order by Posted desc),
            LastMessageID = (select top 1 x.MessageID from [dbo].[yaf_Message] x where x.TopicID=[dbo].[yaf_Topic].TopicID and (x.Flags & 24)=16 order by Posted desc),
            LastUserID = (select top 1 x.UserID from [dbo].[yaf_Message] x where x.TopicID=[dbo].[yaf_Topic].TopicID and (x.Flags & 24)=16 order by Posted desc),
            LastUserName = (select top 1 x.UserName from [dbo].[yaf_Message] x where x.TopicID=[dbo].[yaf_Topic].TopicID and (x.Flags & 24)=16 order by Posted desc),
            LastUserDisplayName = (select top 1 x.UserDisplayName from [dbo].[yaf_Message] x where x.TopicID=[dbo].[yaf_Topic].TopicID and (x.Flags & 24)=16 order by Posted desc),
            LastMessageFlags = (select top 1 x.Flags from [dbo].[yaf_Message] x where x.TopicID=[dbo].[yaf_Topic].TopicID and (x.Flags & 24)=16 order by Posted desc)
        where TopicID = @TopicID
    else
        update [dbo].[yaf_Topic] set
            LastPosted = (select top 1 x.Posted from [dbo].[yaf_Message] x where x.TopicID=[dbo].[yaf_Topic].TopicID and (x.Flags & 24)=16 order by Posted desc),
            LastMessageID = (select top 1 x.MessageID from [dbo].[yaf_Message] x where x.TopicID=[dbo].[yaf_Topic].TopicID and (x.Flags & 24)=16 order by Posted desc),
            LastUserID = (select top 1 x.UserID from [dbo].[yaf_Message] x where x.TopicID=[dbo].[yaf_Topic].TopicID and (x.Flags & 24)=16 order by Posted desc),
            LastUserName = (select top 1 x.UserName from [dbo].[yaf_Message] x where x.TopicID=[dbo].[yaf_Topic].TopicID and (x.Flags & 24)=16 order by Posted desc),
            LastUserDisplayName = (select top 1 x.UserDisplayName from [dbo].[yaf_Message] x where x.TopicID=[dbo].[yaf_Topic].TopicID and (x.Flags & 24)=16 order by Posted desc),
            LastMessageFlags = (select top 1 x.Flags from [dbo].[yaf_Message] x where x.TopicID=[dbo].[yaf_Topic].TopicID and (x.Flags & 24)=16 order by Posted desc)
        where TopicMovedID is null
        and (@ForumID is null or ForumID=@ForumID)

    exec [dbo].[yaf_forum_updatelastpost] @ForumID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_create_by_message]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_topic_create_by_message] (
    @MessageID int,
    @ForumID	int,
    @Subject	nvarchar(100),
    @UTCTIMESTAMP datetime
) as
begin
        
declare		@UserID		int
declare		@Posted		datetime

set @UserID = (select UserID from [dbo].[yaf_message] where MessageID =  @MessageID)
set  @Posted  = (select  posted from [dbo].[yaf_message] where MessageID =  @MessageID)


    declare @TopicID int
    --declare @MessageID int

    if @Posted is null set @Posted = @UTCTIMESTAMP 

    insert into [dbo].[yaf_Topic](ForumID,Topic,UserID,Posted,[Views],Priority,PollID,UserName,NumPosts)
    values(@ForumID,@Subject,@UserID,@Posted,0,0,null,null,0)

    set @TopicID = @@IDENTITY
--	exec [dbo].[yaf_message_save] @TopicID,@UserID,@Message,@UserName,@IP,@Posted,null,@Flags,@MessageID output
    select TopicID = @TopicID, MessageID = @MessageID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_rsstopic_list]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_rsstopic_list]
(
    @ForumID int,
    @TopicLimit int
)
as
begin
  
    select top(@TopicLimit)
	Topic = a.Topic,
	TopicID = a.TopicID, 
	Name = b.Name, 
	LastPosted = IsNull(a.LastPosted,a.Posted), 
	LastUserID = IsNull(a.LastUserID, a.UserID), 
	LastMessageID= IsNull(a.LastMessageID,
	(select top 1 m.MessageID 
	from [dbo].[yaf_Message] m where m.TopicID = a.TopicID order by m.Posted desc)), 
	LastMessageFlags = IsNull(a.LastMessageFlags,22) , 
	LastMessage = (SELECT TOP 1 CAST([Message] as nvarchar(1000)) FROM [dbo].[yaf_Message] mes2 where mes2.TopicID = IsNull(a.TopicMovedID,a.TopicID) AND mes2.IsApproved = 1 AND mes2.IsDeleted = 0 ORDER BY mes2.Posted DESC) 

from [dbo].[yaf_Topic] a, 
     [dbo].[yaf_Forum] b 

where a.ForumID = @ForumID and 
      b.ForumID = a.ForumID and 
	  a.TopicMovedID is null and 
	  a.IsDeleted = 0 and
	  a.NumPosts > 0

order by LastPosted desc
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_post_alluser_simple]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_post_alluser_simple](@BoardID int,@UserID int) as
begin
    select
        a.MessageID,	
        a.IP
    from
        [dbo].[yaf_Message] a
    where
        a.UserID = @UserID
    order by
        a.Posted desc
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_GetTextByIds]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_message_GetTextByIds] (@MessageIDs varchar(max))
AS 
    BEGIN
    -- vzrus says: the server version > 2000 ntext works too slowly with substring in the 2005 
    DECLARE @ParsedMessageIDs TABLE
          (
                MessageID int
          )
      
    DECLARE @MessageID varchar(11), @Pos INT      

    SET @Pos = CHARINDEX(',', @MessageIDs, 1)

    -- check here if the value is not empty
    IF REPLACE(@MessageIDs, ',', '') <> ''
    BEGIN
        WHILE @Pos > 0
        BEGIN
            SET @MessageID = LTRIM(RTRIM(LEFT(@MessageIDs, @Pos - 1)))
            IF @MessageID <> ''
            BEGIN
                  INSERT INTO @ParsedMessageIDs (MessageID) VALUES (CAST(@MessageID AS int)) --Use Appropriate conversion
            END
            SET @MessageIDs = RIGHT(@MessageIDs, LEN(@MessageIDs) - @Pos)
            SET @Pos = CHARINDEX(',', @MessageIDs, 1)
        END
        -- to be sure that last value is inserted
        IF (LEN(@MessageIDs) > 0)
               INSERT INTO @ParsedMessageIDs (MessageID) VALUES (CAST(@MessageIDs AS int)) 
        END 

        SELECT a.MessageID, d.Message
            FROM @ParsedMessageIDs a
            INNER JOIN [dbo].[yaf_Message] d ON (d.MessageID = a.MessageID)
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_getReplies]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_message_getReplies](@MessageID int) as
BEGIN
    SELECT MessageID FROM [dbo].[yaf_Message] WHERE ReplyTo = @MessageID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_findunread]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_message_findunread](
@TopicID int,
@MessageID int,
@LastRead datetime,
@MinDateTime datetime,
@ShowDeleted bit = 0,
@AuthorUserID int) as
begin
   declare @MessagePosition int

   if (@MessageID > 0)
   begin
   select top 1 @MessagePosition = CONVERT(int,RowNum), @MessageID = tbl.MessageID  from 
   (
   select ROW_NUMBER() OVER ( order by Posted desc) as RowNum, m.MessageID
   from [dbo].[yaf_Message] m  
   where m.TopicID = @TopicID			
        AND m.IsApproved = 1
        AND (@ShowDeleted = 1 OR m.IsDeleted = 0 OR (@AuthorUserID > 0 AND m.UserID = @AuthorUserID))        
   ) as tbl
   where tbl.MessageID = @MessageID
   order by tbl.RowNum ASC;
   end
-- a message with the id was not found or we are looking for first unread or last post 
  if (@MessageID <= 0)
   begin  
   -- if value > yaf db min value (1-1-1903) we are looking for first unread 
   if (@LastRead > @MinDateTime)  
   begin
   select top 1 @MessagePosition = CONVERT(int,RowNum), @MessageID = tbl.MessageID  from 
   (
   select ROW_NUMBER() OVER ( order by m.Posted asc) as RowNum, m.MessageID, m.Posted
   from [dbo].[yaf_Message] m  
   where m.TopicID = @TopicID			
        AND m.IsApproved = 1
        AND (@ShowDeleted = 1 OR m.IsDeleted = 0 OR (@AuthorUserID > 0 AND m.UserID = @AuthorUserID))		     
   ) as tbl
   where tbl.Posted > @LastRead 
   order by tbl.RowNum ASC;
   end
   -- if first unread was not found or we looking for last posted 
   if (@LastRead < @MinDateTime OR @MessagePosition IS NULL) 
   begin    
        select top 1 @MessageID = m.MessageID, @MessagePosition = 1
    from
        [dbo].[yaf_Message] m	
    where
        m.TopicID = @TopicID			
        AND m.IsApproved = 1
       AND (@ShowDeleted = 1 OR m.IsDeleted = 0 OR (@AuthorUserID > 0 AND m.UserID = @AuthorUserID))
    order by		
        m.Posted DESC;    
    end

	 select top 1 @MessagePosition = CONVERT(int,RowNum), @MessageID = tbl.MessageID  from 
   (
   select ROW_NUMBER() OVER ( order by Posted desc) as RowNum, m.MessageID
   from [dbo].[yaf_Message] m  
   where m.TopicID = @TopicID			
        AND m.IsApproved = 1
        AND (@ShowDeleted = 1 OR m.IsDeleted = 0 OR (@AuthorUserID > 0 AND m.UserID = @AuthorUserID))        
   ) as tbl
   where tbl.MessageID = @MessageID
   order by tbl.RowNum ASC;
end
  
select @MessageID as MessageID, @MessagePosition as MessagePosition;
end
GO
/****** Object:  Table [dbo].[yaf_NntpTopic]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_NntpTopic](
	[NntpTopicID] [int] IDENTITY(1,1) NOT NULL,
	[NntpForumID] [int] NOT NULL,
	[Thread] [nvarchar](64) NULL,
	[TopicID] [int] NOT NULL,
 CONSTRAINT [PK_yaf_NntpTopic] PRIMARY KEY CLUSTERED 
(
	[NntpTopicID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[yaf_nntptopic_list]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_nntptopic_list](@Thread nvarchar(64)) as
begin
        select
        a.*
    from
        [dbo].[yaf_NntpTopic] a
    where
        a.Thread = @Thread
end
GO
/****** Object:  Table [dbo].[yaf_NntpForum]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_NntpForum](
	[NntpForumID] [int] IDENTITY(1,1) NOT NULL,
	[NntpServerID] [int] NOT NULL,
	[GroupName] [nvarchar](100) NOT NULL,
	[ForumID] [int] NOT NULL,
	[LastMessageNo] [int] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
	[DateCutOff] [datetime] NULL,
 CONSTRAINT [PK_yaf_NntpForum] PRIMARY KEY CLUSTERED 
(
	[NntpForumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[yaf_nntpforum_update]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_nntpforum_update](@NntpForumID int,@LastMessageNo int,@UserID int,@UTCTIMESTAMP datetime) as
begin
        declare	@ForumID	int
    
    select @ForumID=ForumID from [dbo].[yaf_NntpForum] where NntpForumID=@NntpForumID

    update [dbo].[yaf_NntpForum] set
        LastMessageNo = @LastMessageNo,
        LastUpdate = @UTCTIMESTAMP 
    where NntpForumID = @NntpForumID

    update [dbo].[yaf_Topic] set 
        NumPosts = (select count(1) from [dbo].[yaf_message] x where x.TopicID=[dbo].[yaf_Topic].TopicID and x.IsApproved = 1 and x.IsDeleted = 0)
    where ForumID=@ForumID

    --exec [dbo].[yaf_user_upgrade] @UserID
    exec [dbo].[yaf_forum_updatestats] @ForumID
    -- exec [dbo].[yaf_topic_updatelastpost] @ForumID,null
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_nntpforum_save]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_nntpforum_save](@NntpForumID int=null,@NntpServerID int,@GroupName nvarchar(100),@ForumID int,@Active bit,@DateCutOff datetime = null,@UTCTIMESTAMP datetime) as
begin
        if @NntpForumID is null
        insert into [dbo].[yaf_NntpForum](NntpServerID,GroupName,ForumID,LastMessageNo,LastUpdate,Active,DateCutOff)
        values(@NntpServerID,@GroupName,@ForumID,0,DATEADD(d,-1,@UTCTIMESTAMP),@Active,@DateCutOff)
    else
        update [dbo].[yaf_NntpForum] set
            NntpServerID = @NntpServerID,
            GroupName = @GroupName,
            ForumID = @ForumID,
            Active = @Active,
            DateCutOff = @DateCutOff
        where NntpForumID = @NntpForumID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_nntpforum_delete]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_nntpforum_delete](@NntpForumID int) as
begin
        delete from [dbo].[yaf_NntpTopic] where NntpForumID = @NntpForumID
    delete from [dbo].[yaf_NntpForum] where NntpForumID = @NntpForumID
end
GO
/****** Object:  Table [dbo].[yaf_Active]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[yaf_Active](
	[SessionID] [nvarchar](24) NOT NULL,
	[BoardID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[IP] [varchar](39) NOT NULL,
	[Login] [datetime] NOT NULL,
	[LastActive] [datetime] NOT NULL,
	[Location] [nvarchar](255) NOT NULL,
	[ForumID] [int] NULL,
	[TopicID] [int] NULL,
	[Browser] [nvarchar](50) NULL,
	[Platform] [nvarchar](50) NULL,
	[Flags] [int] NULL,
	[ForumPage] [nvarchar](1024) NULL,
 CONSTRAINT [PK_yaf_Active] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC,
	[BoardID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[yaf_Active] ([SessionID], [BoardID], [UserID], [IP], [Login], [LastActive], [Location], [ForumID], [TopicID], [Browser], [Platform], [Flags], [ForumPage]) VALUES (N'2zq2zzfkiadzdv2uu3bsohou', 1, 1, N'206.169.247.189', CAST(0x0000A499016B4A45 AS DateTime), CAST(0x0000A499016B4A45 AS DateTime), N'/forum/Default.aspx', NULL, NULL, N'Chrome 42.0', N'Mac OS X', 3, NULL)
/****** Object:  StoredProcedure [dbo].[yaf_forum_move]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_forum_move](@ForumOldID int,@ForumNewID int, @UTCTIMESTAMP datetime) as
begin
        -- Maybe an idea to use cascading foreign keys instead? Too bad they don't work on MS SQL 7.0...
    update [dbo].[yaf_Forum] set LastMessageID=null,LastTopicID=null where ForumID=@ForumOldID
    update [dbo].[yaf_Active] set ForumID=@ForumNewID where ForumID=@ForumOldID
    update [dbo].[yaf_NntpForum] set ForumID=@ForumNewID where ForumID=@ForumOldID
    update [dbo].[yaf_WatchForum] set ForumID=@ForumNewID where ForumID=@ForumOldID
    delete from [dbo].[yaf_ForumReadTracking] where ForumID = @ForumOldID

    -- BAI CHANGED 02.02.2004
    -- Move topics, messages and attachments

    declare @tmpTopicID int;
    declare topic_cursor cursor for
        select TopicID from [dbo].[yaf_Topic]
        where ForumID = @ForumOldID
        order by TopicID desc
    
    open topic_cursor
    
    fetch next from topic_cursor
    into @tmpTopicID
    
    -- Check @@FETCH_STATUS to see if there are any more rows to fetch.
    while @@FETCH_STATUS = 0
    begin
        exec [dbo].[yaf_topic_move] @tmpTopicID,@ForumNewID,0, -1,@UTCTIMESTAMP;
    
       -- This is executed as long as the previous fetch succeeds.
        fetch next from topic_cursor
        into @tmpTopicID
    end
    
    close topic_cursor
    deallocate topic_cursor

    -- TopicMove finished
    -- END BAI CHANGED 02.02.2004

    delete from [dbo].[yaf_ForumAccess] where ForumID = @ForumOldID

    --Update UserForums Too 
    update [dbo].[yaf_UserForum] set ForumID=@ForumNewID where ForumID=@ForumOldID
    --END ABOT CHANGED 09.04.2004
    delete from [dbo].[yaf_Forum] where ForumID = @ForumOldID
end
GO
/****** Object:  Table [dbo].[yaf_Attachment]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_Attachment](
	[AttachmentID] [int] IDENTITY(1,1) NOT NULL,
	[MessageID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[FileName] [nvarchar](255) NOT NULL,
	[Bytes] [int] NOT NULL,
	[ContentType] [nvarchar](max) NULL,
	[Downloads] [int] NOT NULL,
	[FileData] [image] NULL,
 CONSTRAINT [PK_yaf_Attachment] PRIMARY KEY CLUSTERED 
(
	[AttachmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yaf_User]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[yaf_User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[BoardID] [int] NOT NULL,
	[ProviderUserKey] [nvarchar](64) NULL,
	[Name] [nvarchar](255) NOT NULL,
	[DisplayName] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](32) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Joined] [datetime] NOT NULL,
	[LastVisit] [datetime] NOT NULL,
	[IP] [varchar](39) NULL,
	[NumPosts] [int] NOT NULL,
	[TimeZone] [int] NOT NULL,
	[Avatar] [nvarchar](255) NULL,
	[Signature] [ntext] NULL,
	[AvatarImage] [image] NULL,
	[AvatarImageType] [nvarchar](50) NULL,
	[RankID] [int] NOT NULL,
	[Suspended] [datetime] NULL,
	[LanguageFile] [nvarchar](50) NULL,
	[ThemeFile] [nvarchar](50) NULL,
	[TextEditor] [nvarchar](50) NULL,
	[OverridedefaultThemes] [bit] NOT NULL,
	[PMNotification] [bit] NOT NULL,
	[AutoWatchTopics] [bit] NOT NULL,
	[DailyDigest] [bit] NOT NULL,
	[NotificationType] [int] NULL,
	[Flags] [int] NOT NULL,
	[Points] [int] NOT NULL,
	[IsApproved]  AS (CONVERT([bit],sign([Flags]&(2)),(0))),
	[IsGuest]  AS (CONVERT([bit],sign([Flags]&(4)),(0))),
	[IsCaptchaExcluded]  AS (CONVERT([bit],sign([Flags]&(8)),(0))),
	[IsActiveExcluded]  AS (CONVERT([bit],sign([Flags]&(16)),(0))),
	[IsDST]  AS (CONVERT([bit],sign([Flags]&(32)),(0))),
	[IsDirty]  AS (CONVERT([bit],sign([Flags]&(64)),(0))),
	[Culture] [varchar](10) NULL,
	[IsFacebookUser] [bit] NOT NULL,
	[IsTwitterUser] [bit] NOT NULL,
	[UserStyle] [varchar](510) NULL,
	[StyleFlags] [int] NOT NULL,
	[IsUserStyle]  AS (CONVERT([bit],sign([StyleFlags]&(1)),(0))),
	[IsGroupStyle]  AS (CONVERT([bit],sign([StyleFlags]&(2)),(0))),
	[IsRankStyle]  AS (CONVERT([bit],sign([StyleFlags]&(4)),(0))),
	[IsGoogleUser] [bit] NOT NULL,
 CONSTRAINT [PK_yaf_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_yaf_User] UNIQUE NONCLUSTERED 
(
	[BoardID] ASC,
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_yaf_User_DisplayName] ON [dbo].[yaf_User] 
(
	[DisplayName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_User_Flags] ON [dbo].[yaf_User] 
(
	[Flags] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_User_FlagsNJoinded] ON [dbo].[yaf_User] 
(
	[BoardID] ASC
)
INCLUDE ( [UserID],
[Joined],
[Flags]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_User_Joined] ON [dbo].[yaf_User] 
(
	[Joined] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_User_Name] ON [dbo].[yaf_User] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_User_ProviderUserKey] ON [dbo].[yaf_User] 
(
	[ProviderUserKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_User_UserStyle] ON [dbo].[yaf_User] 
(
	[UserStyle] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[yaf_User] ON
INSERT [dbo].[yaf_User] ([UserID], [BoardID], [ProviderUserKey], [Name], [DisplayName], [Password], [Email], [Joined], [LastVisit], [IP], [NumPosts], [TimeZone], [Avatar], [Signature], [AvatarImage], [AvatarImageType], [RankID], [Suspended], [LanguageFile], [ThemeFile], [TextEditor], [OverridedefaultThemes], [PMNotification], [AutoWatchTopics], [DailyDigest], [NotificationType], [Flags], [Points], [Culture], [IsFacebookUser], [IsTwitterUser], [UserStyle], [StyleFlags], [IsGoogleUser]) VALUES (1, 1, NULL, N'Guest', N'Guest', N'na', N'info@padillacrt.com', CAST(0x0000A450010FDC8D AS DateTime), CAST(0x0000A499016B4A45 AS DateTime), N'206.169.247.189', 0, -360, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 10, 6, 1, NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[yaf_User] ([UserID], [BoardID], [ProviderUserKey], [Name], [DisplayName], [Password], [Email], [Joined], [LastVisit], [IP], [NumPosts], [TimeZone], [Avatar], [Signature], [AvatarImage], [AvatarImageType], [RankID], [Suspended], [LanguageFile], [ThemeFile], [TextEditor], [OverridedefaultThemes], [PMNotification], [AutoWatchTopics], [DailyDigest], [NotificationType], [Flags], [Points], [Culture], [IsFacebookUser], [IsTwitterUser], [UserStyle], [StyleFlags], [IsGoogleUser]) VALUES (2, 1, N'122DE33F-497E-4CCC-8719-C6A43945F9CA', N'admin', N'admin', N'na', N'info@padillacrt.com', CAST(0x0000A450010FDC8D AS DateTime), CAST(0x0000A499015FD7BC AS DateTime), N'206.169.247.189', 0, -360, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 10, 3, 4, N'en', 0, 0, NULL, 0, 0)
INSERT [dbo].[yaf_User] ([UserID], [BoardID], [ProviderUserKey], [Name], [DisplayName], [Password], [Email], [Joined], [LastVisit], [IP], [NumPosts], [TimeZone], [Avatar], [Signature], [AvatarImage], [AvatarImageType], [RankID], [Suspended], [LanguageFile], [ThemeFile], [TextEditor], [OverridedefaultThemes], [PMNotification], [AutoWatchTopics], [DailyDigest], [NotificationType], [Flags], [Points], [Culture], [IsFacebookUser], [IsTwitterUser], [UserStyle], [StyleFlags], [IsGoogleUser]) VALUES (14, 1, N'01985175-AE49-4617-B466-3B83564BD95A', N'rhk', N'rhk', N'-', N'rohit.keshwani@padillacrt.com', CAST(0x0000A450018224A3 AS DateTime), CAST(0x0000A450018224A3 AS DateTime), NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 30, 66, 1, NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[yaf_User] ([UserID], [BoardID], [ProviderUserKey], [Name], [DisplayName], [Password], [Email], [Joined], [LastVisit], [IP], [NumPosts], [TimeZone], [Avatar], [Signature], [AvatarImage], [AvatarImageType], [RankID], [Suspended], [LanguageFile], [ThemeFile], [TextEditor], [OverridedefaultThemes], [PMNotification], [AutoWatchTopics], [DailyDigest], [NotificationType], [Flags], [Points], [Culture], [IsFacebookUser], [IsTwitterUser], [UserStyle], [StyleFlags], [IsGoogleUser]) VALUES (16, 1, N'A7312CF9-5408-4425-BE56-BE09AE7DFF9C', N'testUser', N'testUser', N'-', N'john.flynn@padillacrt.com', CAST(0x0000A4510163579F AS DateTime), CAST(0x0000A49600EBBF0F AS DateTime), N'206.169.247.189', 0, -360, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 30, 66, 4, NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[yaf_User] ([UserID], [BoardID], [ProviderUserKey], [Name], [DisplayName], [Password], [Email], [Joined], [LastVisit], [IP], [NumPosts], [TimeZone], [Avatar], [Signature], [AvatarImage], [AvatarImageType], [RankID], [Suspended], [LanguageFile], [ThemeFile], [TextEditor], [OverridedefaultThemes], [PMNotification], [AutoWatchTopics], [DailyDigest], [NotificationType], [Flags], [Points], [Culture], [IsFacebookUser], [IsTwitterUser], [UserStyle], [StyleFlags], [IsGoogleUser]) VALUES (18, 1, N'94E43761-8FB3-4F41-A0E2-F44F6D944D08', N'lachermollie', N'lachermollie', N'-', N'lachermollie@bfusa.com', CAST(0x0000A4880102E032 AS DateTime), CAST(0x0000A4880102E032 AS DateTime), NULL, 0, -360, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 10, 0, 1, NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[yaf_User] ([UserID], [BoardID], [ProviderUserKey], [Name], [DisplayName], [Password], [Email], [Joined], [LastVisit], [IP], [NumPosts], [TimeZone], [Avatar], [Signature], [AvatarImage], [AvatarImageType], [RankID], [Suspended], [LanguageFile], [ThemeFile], [TextEditor], [OverridedefaultThemes], [PMNotification], [AutoWatchTopics], [DailyDigest], [NotificationType], [Flags], [Points], [Culture], [IsFacebookUser], [IsTwitterUser], [UserStyle], [StyleFlags], [IsGoogleUser]) VALUES (19, 1, N'AAE4EC56-4328-44A4-99A4-0FCF41A96CDA', N'Poakley', N'Poakley', N'-', N'oakleypaul@bfusa.com', CAST(0x0000A4880102E40D AS DateTime), CAST(0x0000A4880102E40D AS DateTime), NULL, 0, -360, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 10, 2, 1, NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[yaf_User] ([UserID], [BoardID], [ProviderUserKey], [Name], [DisplayName], [Password], [Email], [Joined], [LastVisit], [IP], [NumPosts], [TimeZone], [Avatar], [Signature], [AvatarImage], [AvatarImageType], [RankID], [Suspended], [LanguageFile], [ThemeFile], [TextEditor], [OverridedefaultThemes], [PMNotification], [AutoWatchTopics], [DailyDigest], [NotificationType], [Flags], [Points], [Culture], [IsFacebookUser], [IsTwitterUser], [UserStyle], [StyleFlags], [IsGoogleUser]) VALUES (25, 1, N'830A901C-FB89-4056-850B-051D0A289053', N'testModerator', N'testModerator', N'-', N'test@aol.com', CAST(0x0000A48E0168A070 AS DateTime), CAST(0x0000A48E0168A070 AS DateTime), NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 30, 64, 1, NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[yaf_User] ([UserID], [BoardID], [ProviderUserKey], [Name], [DisplayName], [Password], [Email], [Joined], [LastVisit], [IP], [NumPosts], [TimeZone], [Avatar], [Signature], [AvatarImage], [AvatarImageType], [RankID], [Suspended], [LanguageFile], [ThemeFile], [TextEditor], [OverridedefaultThemes], [PMNotification], [AutoWatchTopics], [DailyDigest], [NotificationType], [Flags], [Points], [Culture], [IsFacebookUser], [IsTwitterUser], [UserStyle], [StyleFlags], [IsGoogleUser]) VALUES (31, 1, N'150C17CA-9684-4282-8CF0-40A9BC084498', N'ST Project Team', N'ST Project Team', N'-', N'Kathryn.Canning@padillacrt.com', CAST(0x0000A48F00FFF4BC AS DateTime), CAST(0x0000A49600ECC513 AS DateTime), N'206.169.247.189', 1, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 30, 2, 22, NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[yaf_User] ([UserID], [BoardID], [ProviderUserKey], [Name], [DisplayName], [Password], [Email], [Joined], [LastVisit], [IP], [NumPosts], [TimeZone], [Avatar], [Signature], [AvatarImage], [AvatarImageType], [RankID], [Suspended], [LanguageFile], [ThemeFile], [TextEditor], [OverridedefaultThemes], [PMNotification], [AutoWatchTopics], [DailyDigest], [NotificationType], [Flags], [Points], [Culture], [IsFacebookUser], [IsTwitterUser], [UserStyle], [StyleFlags], [IsGoogleUser]) VALUES (37, 1, N'F27FD66E-C250-4D10-8F43-9E5BD282A56C', N'woodhullwes', N'woodhullwes', N'-', N'woodhullwes@bfusa.com', CAST(0x0000A49600F9C146 AS DateTime), CAST(0x0000A49600FA599A AS DateTime), N'207.45.158.252', 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 30, 66, 4, NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[yaf_User] ([UserID], [BoardID], [ProviderUserKey], [Name], [DisplayName], [Password], [Email], [Joined], [LastVisit], [IP], [NumPosts], [TimeZone], [Avatar], [Signature], [AvatarImage], [AvatarImageType], [RankID], [Suspended], [LanguageFile], [ThemeFile], [TextEditor], [OverridedefaultThemes], [PMNotification], [AutoWatchTopics], [DailyDigest], [NotificationType], [Flags], [Points], [Culture], [IsFacebookUser], [IsTwitterUser], [UserStyle], [StyleFlags], [IsGoogleUser]) VALUES (42, 1, N'BB314EBC-BBA2-40EF-A36A-C8C0E9B11088', N'jborisx', N'jborisx', N'-', N'jack.boris@padillacrt.com', CAST(0x0000A49900F866C4 AS DateTime), CAST(0x0000A49900F866C4 AS DateTime), NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 30, 66, 1, NULL, 0, 0, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[yaf_User] OFF
/****** Object:  Table [dbo].[yaf_MessageReportedAudit]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_MessageReportedAudit](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[MessageID] [int] NOT NULL,
	[Reported] [datetime] NULL,
	[ReportedNumber] [int] NOT NULL,
	[ReportText] [nvarchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yaf_MessageReported]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_MessageReported](
	[MessageID] [int] NOT NULL,
	[Message] [ntext] NULL,
	[Resolved] [bit] NULL,
	[ResolvedBy] [int] NULL,
	[ResolvedDate] [datetime] NULL,
 CONSTRAINT [PK_yaf_MessageReported] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yaf_MessageHistory]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[yaf_MessageHistory](
	[MessageID] [int] NOT NULL,
	[Message] [ntext] NOT NULL,
	[IP] [varchar](39) NOT NULL,
	[Edited] [datetime] NOT NULL,
	[EditedBy] [int] NULL,
	[EditReason] [nvarchar](100) NULL,
	[IsModeratorChanged] [bit] NOT NULL,
	[Flags] [int] NOT NULL,
 CONSTRAINT [PK_yaf_MessageHistory] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC,
	[Edited] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[yaf_MessageHistory] ([MessageID], [Message], [IP], [Edited], [EditedBy], [EditReason], [IsModeratorChanged], [Flags]) VALUES (8, N'Use this topic to discuss Schools.', N'206.169.247.189', CAST(0x0000A49501461428 AS DateTime), 31, NULL, 0, 22)
INSERT [dbo].[yaf_MessageHistory] ([MessageID], [Message], [IP], [Edited], [EditedBy], [EditReason], [IsModeratorChanged], [Flags]) VALUES (8, N'Use this topic to discuss Schools.', N'206.169.247.189', CAST(0x0000A49501464C81 AS DateTime), 31, N'', 0, 22)
INSERT [dbo].[yaf_MessageHistory] ([MessageID], [Message], [IP], [Edited], [EditedBy], [EditReason], [IsModeratorChanged], [Flags]) VALUES (8, N'Use this topic to discuss Schools.', N'206.169.247.189', CAST(0x0000A49501466B0F AS DateTime), 31, N'', 0, 22)
INSERT [dbo].[yaf_MessageHistory] ([MessageID], [Message], [IP], [Edited], [EditedBy], [EditReason], [IsModeratorChanged], [Flags]) VALUES (9, N'Use this topic to discuss Getting Around Nashville.', N'206.169.247.189', CAST(0x0000A4950146D6C5 AS DateTime), 31, NULL, 0, 22)
/****** Object:  Table [dbo].[yaf_PollVote]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[yaf_PollVote](
	[PollVoteID] [int] IDENTITY(1,1) NOT NULL,
	[PollID] [int] NOT NULL,
	[UserID] [int] NULL,
	[RemoteIP] [varchar](39) NULL,
	[ChoiceID] [int] NULL,
 CONSTRAINT [PK_yaf_PollVote] PRIMARY KEY CLUSTERED 
(
	[PollVoteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_yaf_PollVote_PollID] ON [dbo].[yaf_PollVote] 
(
	[PollID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_PollVote_RemoteIP] ON [dbo].[yaf_PollVote] 
(
	[RemoteIP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_PollVote_UserID] ON [dbo].[yaf_PollVote] 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yaf_Choice]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[yaf_Choice](
	[ChoiceID] [int] IDENTITY(1,1) NOT NULL,
	[PollID] [int] NOT NULL,
	[Choice] [nvarchar](50) NOT NULL,
	[Votes] [int] NOT NULL,
	[ObjectPath] [nvarchar](255) NULL,
	[MimeType] [varchar](50) NULL,
 CONSTRAINT [PK_yaf_Choice] PRIMARY KEY CLUSTERED 
(
	[ChoiceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[yaf_Category]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[BoardID] [int] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[CategoryImage] [nvarchar](255) NULL,
	[SortOrder] [smallint] NOT NULL,
	[PollGroupID] [int] NULL,
 CONSTRAINT [PK_yaf_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_yaf_Category] UNIQUE NONCLUSTERED 
(
	[BoardID] ASC,
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_Category_BoardID] ON [dbo].[yaf_Category] 
(
	[BoardID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_Category_Name] ON [dbo].[yaf_Category] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[yaf_Category] ON
INSERT [dbo].[yaf_Category] ([CategoryID], [BoardID], [Name], [CategoryImage], [SortOrder], [PollGroupID]) VALUES (1, 1, N'Living In Nashville', NULL, 1, NULL)
INSERT [dbo].[yaf_Category] ([CategoryID], [BoardID], [Name], [CategoryImage], [SortOrder], [PollGroupID]) VALUES (3, 1, N'Things to Do in Nashville', NULL, 2, NULL)
INSERT [dbo].[yaf_Category] ([CategoryID], [BoardID], [Name], [CategoryImage], [SortOrder], [PollGroupID]) VALUES (4, 1, N'Working In Nashville', NULL, 3, NULL)
SET IDENTITY_INSERT [dbo].[yaf_Category] OFF
/****** Object:  Table [dbo].[yaf_Poll]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[yaf_Poll](
	[PollID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](256) NOT NULL,
	[Closes] [datetime] NULL,
	[PollGroupID] [int] NULL,
	[UserID] [int] NOT NULL,
	[ObjectPath] [nvarchar](255) NULL,
	[MimeType] [varchar](50) NULL,
	[Flags] [int] NOT NULL,
	[IsClosedBound]  AS (CONVERT([bit],sign([Flags]&(4)),(0))),
	[AllowMultipleChoices]  AS (CONVERT([bit],sign([Flags]&(8)),(0))),
	[ShowVoters]  AS (CONVERT([bit],sign([Flags]&(16)),(0))),
	[AllowSkipVote]  AS (CONVERT([bit],sign([Flags]&(32)),(0))),
 CONSTRAINT [PK_yaf_Poll] PRIMARY KEY CLUSTERED 
(
	[PollID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[yaf_PollGroupCluster]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_PollGroupCluster](
	[PollGroupID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Flags] [int] NOT NULL,
	[IsBound]  AS (CONVERT([bit],sign([Flags]&(2)),(0))),
 CONSTRAINT [PK_yaf_PollGroupCluster] PRIMARY KEY CLUSTERED 
(
	[PollGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[yaf_pollgroup_remove]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_pollgroup_remove](@PollGroupID int, @TopicID int =null, @ForumID int= null, @CategoryID int = null, @BoardID int = null, @RemoveCompletely bit, @RemoveEverywhere bit)
 as
  begin   
    declare @polllist table( PollID int)
    declare @tmp int

    
    
             -- we delete poll from the place only it persists in other places 
         if @RemoveEverywhere <> 1
             begin
                   if @TopicID > 0
                   Update [dbo].[yaf_Topic] set PollID = NULL where TopicID = @TopicID                 
                  
                   if @ForumID > 0
                   Update [dbo].[yaf_Forum] set PollGroupID = NULL where ForumID = @ForumID
              
                   if @CategoryID > 0
                   Update [dbo].[yaf_Category] set PollGroupID = NULL where CategoryID = @CategoryID
                
             end        
            
          -- we remove poll group links from all places where they are
         if ( @RemoveEverywhere = 1 OR @RemoveCompletely = 1)
         begin
                   Update [dbo].[yaf_Topic] set PollID = NULL where PollID = @PollGroupID 
                   Update [dbo].[yaf_Forum] set PollGroupID = NULL where PollGroupID = @PollGroupID
                   Update [dbo].[yaf_Category] set PollGroupID = NULL where PollGroupID = @PollGroupID				 
         end

         -- simply remove all polls
    if @RemoveCompletely = 1 
    begin	
    insert into @polllist (PollID)
    select PollID from [dbo].[yaf_Poll] where PollGroupID = @PollGroupID   
            DELETE FROM  [dbo].[yaf_PollVote] WHERE PollID IN (SELECT PollID FROM @polllist)
            DELETE FROM  [dbo].[yaf_Choice] WHERE PollID IN (SELECT PollID FROM @polllist)	
            DELETE FROM  [dbo].[yaf_Poll] WHERE PollGroupID = @PollGroupID 
            DELETE FROM  [dbo].[yaf_PollGroupCluster] WHERE PollGroupID = @PollGroupID		
    end

    -- don't remove cluster if the polls are not removed from db 
    end
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_delete]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_topic_delete] (@TopicID int,@UpdateLastPost bit=1,@EraseTopic bit=0) 
AS
BEGIN
        SET NOCOUNT ON
    DECLARE @ForumID int
    DECLARE @pollID int
    
    SELECT @ForumID=ForumID FROM  [dbo].[yaf_Topic] WHERE TopicID=@TopicID
    
    UPDATE [dbo].[yaf_Topic] SET LastMessageID = null WHERE TopicID = @TopicID
    
    UPDATE [dbo].[yaf_Forum] SET 
        LastTopicID = null,
        LastMessageID = null,
        LastUserID = null,
        LastUserName = null,
        LastUserDisplayName = null,
        LastPosted = null
    WHERE LastMessageID IN (SELECT MessageID FROM  [dbo].[yaf_Message] WHERE TopicID = @TopicID)
    
    UPDATE  [dbo].[yaf_Active] SET TopicID = null WHERE TopicID = @TopicID
    
    --delete messages and topics
    DELETE FROM  [dbo].[yaf_nntptopic] WHERE TopicID = @TopicID
    
    IF @EraseTopic = 0
    BEGIN
        UPDATE  [dbo].[yaf_topic] set Flags = Flags | 8 where TopicMovedID = @TopicID
        UPDATE  [dbo].[yaf_topic] set Flags = Flags | 8 where TopicID = @TopicID
        UPDATE  [dbo].[yaf_Message] set Flags = Flags | 8 where TopicID = @TopicID
    END
    ELSE
    BEGIN
        --remove polls	
        SELECT @pollID = pollID FROM  [dbo].[yaf_topic] WHERE TopicID = @TopicID
        IF (@pollID is not null)
        BEGIN
             exec [dbo].[yaf_pollgroup_remove] @pollID, @TopicID, null, null, null, 1, 1
        END	
    
        DELETE FROM  [dbo].[yaf_topic] WHERE TopicMovedID = @TopicID
        
        DELETE  [dbo].[yaf_Attachment] WHERE MessageID IN (SELECT MessageID FROM  [dbo].[yaf_message] WHERE TopicID = @TopicID) 
        DELETE  [dbo].[yaf_MessageHistory] WHERE MessageID IN (SELECT MessageID FROM  [dbo].[yaf_message] WHERE TopicID = @TopicID) 
		
		update [dbo].[yaf_Message] SET ReplyTo = null WHERE TopicID = @TopicID

		-- update user post count
		if not exists(select top 1 1 from [dbo].[yaf_Forum] where ForumID=@ForumID and (Flags & 4)=0)
          -- delete messages
		  DELETE  [dbo].[yaf_Message] WHERE TopicID = @TopicID
        else 
		   begin
		   declare @tmpUserID int;
		   declare message_cursor cursor for
		   select UserID from [dbo].[yaf_Message]
		   where TopicID=@TopicID
    
           -- delete messages
		   open message_cursor
    
		   fetch next from message_cursor
		   into @tmpUserID
    
		   -- Check @@FETCH_STATUS to see if there are any more rows to fetch.
		   while @@FETCH_STATUS = 0
    		   begin
		   UPDATE [dbo].[yaf_User] SET NumPosts = (SELECT count(MessageID) FROM [dbo].[yaf_Message] WHERE UserID = @tmpUserID AND IsDeleted = 0 AND IsApproved = 1) WHERE UserID = @tmpUserID

		   

		   DELETE  [dbo].[yaf_Message] WHERE TopicID = @TopicID and UserID = @tmpUserID
    
		   -- This is executed as long as the previous fetch succeeds.
		   fetch next from message_cursor
		   into @tmpUserID
		   end
    
		   close message_cursor
		   deallocate message_cursor

		end

		EXEC [dbo].[yaf_pollgroup_remove] @pollID, @TopicID, null, null, null, 0, 0 	
        
        DELETE  [dbo].[yaf_WatchTopic] WHERE TopicID = @TopicID
        DELETE  [dbo].[yaf_TopicReadTracking] WHERE TopicID = @TopicID
        DELETE  [dbo].[yaf_FavoriteTopic]  WHERE TopicID = @TopicID
        DELETE  [dbo].[yaf_Topic] WHERE TopicMovedID = @TopicID
        DELETE  [dbo].[yaf_Topic] WHERE TopicID = @TopicID
        DELETE  [dbo].[yaf_MessageReportedAudit] WHERE MessageID IN (SELECT MessageID FROM  [dbo].[yaf_message] WHERE TopicID = @TopicID) 
        DELETE  [dbo].[yaf_MessageReported] WHERE MessageID IN (SELECT MessageID FROM  [dbo].[yaf_message] WHERE TopicID = @TopicID)

		END
        
    --commit
    IF @UpdateLastPost<>0
        EXEC  [dbo].[yaf_forum_updatelastpost] @ForumID
    
    IF @ForumID is not null
        EXEC  [dbo].[yaf_forum_updatestats] @ForumID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_forum_delete]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_forum_delete](@ForumID int) as
begin
        -- Maybe an idea to use cascading foreign keys instead? Too bad they don't work on MS SQL 7.0...
    update [dbo].[yaf_Forum] set LastMessageID=null,LastTopicID=null where ForumID=@ForumID
    update [dbo].[yaf_Topic] set LastMessageID=null where ForumID=@ForumID
    update [dbo].[yaf_Active] set ForumID=null where ForumID=@ForumID
    delete from [dbo].[yaf_WatchTopic] from [dbo].[yaf_Topic] where [dbo].[yaf_Topic].ForumID = @ForumID and [dbo].[yaf_WatchTopic].TopicID = [dbo].[yaf_Topic].TopicID
    delete from [dbo].[yaf_Active] from [dbo].[yaf_Topic] where [dbo].[yaf_Topic].ForumID = @ForumID and [dbo].[yaf_Active].TopicID = [dbo].[yaf_Topic].TopicID
    delete from [dbo].[yaf_NntpTopic] from [dbo].[yaf_NntpForum] where [dbo].[yaf_NntpForum].ForumID = @ForumID and [dbo].[yaf_NntpTopic].NntpForumID = [dbo].[yaf_NntpForum].NntpForumID
    delete from [dbo].[yaf_NntpForum] where ForumID=@ForumID	
    delete from [dbo].[yaf_WatchForum] where ForumID = @ForumID
    delete from [dbo].[yaf_ForumReadTracking] where ForumID = @ForumID

    -- BAI CHANGED 02.02.2004
    -- Delete topics, messages and attachments

    declare @tmpTopicID int;
    declare topic_cursor cursor for
        select TopicID from [dbo].[yaf_Topic]
        where ForumID = @ForumID
        order by TopicID desc
    
    open topic_cursor
    
    fetch next from topic_cursor
    into @tmpTopicID
    
    -- Check @@FETCH_STATUS to see if there are any more rows to fetch.
    while @@FETCH_STATUS = 0
    begin
        exec [dbo].[yaf_topic_delete] @tmpTopicID,1,1;
    
       -- This is executed as long as the previous fetch succeeds.
        fetch next from topic_cursor
        into @tmpTopicID
    end
    
    close topic_cursor
    deallocate topic_cursor

    -- TopicDelete finished
    -- END BAI CHANGED 02.02.2004

    delete from [dbo].[yaf_ForumAccess] where ForumID = @ForumID
    --ABOT CHANGED
    --Delete UserForums Too 
    delete from [dbo].[yaf_UserForum] where ForumID = @ForumID
    --END ABOT CHANGED 09.04.2004
    delete from [dbo].[yaf_Forum] where ForumID = @ForumID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_simplelist]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_message_simplelist](
                @StartID INT  = 0,
                @Limit   INT  = 1000)
AS
    BEGIN
        SET ARITHABORT ON       
        SELECT TOP(@Limit)  m.[MessageID],
                 m.[TopicID]
        FROM     [dbo].[yaf_Message] m
        WHERE    m.[MessageID] >= @StartID
        AND m.[MessageID] < (@StartID + @Limit)
        AND m.[TopicID] IS NOT NULL
        ORDER BY m.[MessageID]   
    END
GO
/****** Object:  Table [dbo].[yaf_Rank]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_Rank](
	[RankID] [int] IDENTITY(1,1) NOT NULL,
	[BoardID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MinPosts] [int] NULL,
	[RankImage] [nvarchar](50) NULL,
	[Flags] [int] NOT NULL,
	[PMLimit] [int] NULL,
	[Style] [nvarchar](255) NULL,
	[SortOrder] [smallint] NOT NULL,
	[Description] [nvarchar](128) NULL,
	[UsrSigChars] [int] NOT NULL,
	[UsrSigBBCodes] [nvarchar](255) NULL,
	[UsrSigHTMLTags] [nvarchar](255) NULL,
	[UsrAlbums] [int] NOT NULL,
	[UsrAlbumImages] [int] NOT NULL,
 CONSTRAINT [PK_yaf_Rank] PRIMARY KEY CLUSTERED 
(
	[RankID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_yaf_Rank] UNIQUE NONCLUSTERED 
(
	[BoardID] ASC,
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[yaf_Rank] ON
INSERT [dbo].[yaf_Rank] ([RankID], [BoardID], [Name], [MinPosts], [RankImage], [Flags], [PMLimit], [Style], [SortOrder], [Description], [UsrSigChars], [UsrSigBBCodes], [UsrSigHTMLTags], [UsrAlbums], [UsrAlbumImages]) VALUES (1, 1, N'Administration', NULL, NULL, 0, 2147483647, N'default!font-size: 8pt; color: #811334/yafpro!font-size: 8pt; color:blue', 0, NULL, 0, NULL, NULL, 0, 0)
INSERT [dbo].[yaf_Rank] ([RankID], [BoardID], [Name], [MinPosts], [RankImage], [Flags], [PMLimit], [Style], [SortOrder], [Description], [UsrSigChars], [UsrSigBBCodes], [UsrSigHTMLTags], [UsrAlbums], [UsrAlbumImages]) VALUES (2, 1, N'Guest', NULL, NULL, 0, 0, NULL, 100, NULL, 0, NULL, NULL, 0, 0)
INSERT [dbo].[yaf_Rank] ([RankID], [BoardID], [Name], [MinPosts], [RankImage], [Flags], [PMLimit], [Style], [SortOrder], [Description], [UsrSigChars], [UsrSigBBCodes], [UsrSigHTMLTags], [UsrAlbums], [UsrAlbumImages]) VALUES (3, 1, N'Newbie', 0, NULL, 3, 10, NULL, 3, NULL, 0, NULL, NULL, 0, 0)
INSERT [dbo].[yaf_Rank] ([RankID], [BoardID], [Name], [MinPosts], [RankImage], [Flags], [PMLimit], [Style], [SortOrder], [Description], [UsrSigChars], [UsrSigBBCodes], [UsrSigHTMLTags], [UsrAlbums], [UsrAlbumImages]) VALUES (4, 1, N'Member', 10, NULL, 2, 30, NULL, 2, NULL, 0, NULL, NULL, 0, 0)
INSERT [dbo].[yaf_Rank] ([RankID], [BoardID], [Name], [MinPosts], [RankImage], [Flags], [PMLimit], [Style], [SortOrder], [Description], [UsrSigChars], [UsrSigBBCodes], [UsrSigHTMLTags], [UsrAlbums], [UsrAlbumImages]) VALUES (5, 1, N'Advanced Member', 30, NULL, 2, 100, NULL, 1, NULL, 0, NULL, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[yaf_Rank] OFF
/****** Object:  StoredProcedure [dbo].[yaf_user_upgrade]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_upgrade](@UserID int) as
begin
    
    declare @RankID			int
    declare @Flags			int
    declare @MinPosts		int
    declare @NumPosts		int
    declare @BoardId		int
    declare @RankBoardID	int

    -- Get user and rank information
    select
        @RankID = b.RankID,
        @Flags = b.Flags,
        @MinPosts = b.MinPosts,
        @NumPosts = a.NumPosts,
        @BoardId = a.BoardId		
    from
        [dbo].[yaf_User] a
        inner join [dbo].[yaf_Rank] b on b.RankID = a.RankID
    where
        a.UserID = @UserID
    
    -- If user isn't member of a ladder rank, exit
    if (@Flags & 2) = 0 return

    -- retrieve board current user's rank beling to	
    select @RankBoardID = BoardID
    from   [dbo].[yaf_Rank]
    where  RankID = @RankID

    -- does user have rank from his board?
    IF @RankBoardID <> @BoardId begin
        -- get highest rank user can get
        select top 1
               @RankID = RankID
        from   [dbo].[yaf_Rank]
        where  BoardId = @BoardId
               and (Flags & 2) = 2
               and MinPosts <= @NumPosts
        order by
               MinPosts desc
    end
    else begin
        -- See if user got enough posts for next ladder group
        select top 1
            @RankID = RankID
        from
            [dbo].[yaf_Rank]
        where
            BoardId = @BoardId and
            (Flags & 2) = 2 and
            MinPosts <= @NumPosts and
            MinPosts > @MinPosts
        order by
            MinPosts
    end

    if @@ROWCOUNT=1
        update [dbo].[yaf_User] set RankID = @RankID where UserID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_approve]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_message_approve](@MessageID int) as begin
    
    declare	@UserID		int
    declare	@ForumID	int
    declare	@TopicID	int
    declare	@Flags	    int
    declare @Posted		datetime
    declare	@UserName	nvarchar(255)
    declare	@UserDisplayName	nvarchar(255)
    select 
        @UserID = a.UserID,
        @TopicID = a.TopicID,
        @ForumID = b.ForumID,
        @Posted = a.Posted,
        @UserName = a.UserName,
        @UserDisplayName = a.UserDisplayName,
        @Flags	= a.Flags
    from
        [dbo].[yaf_Message] a
        inner join [dbo].[yaf_Topic] b on b.TopicID=a.TopicID
    where
        a.MessageID = @MessageID

    -- update Message table, set meesage flag to approved
    update [dbo].[yaf_Message] set Flags = Flags | 16 where MessageID = @MessageID

    -- update User table to increase postcount
    if exists(select top 1 1 from [dbo].[yaf_Forum] where ForumID=@ForumID and (Flags & 4)=0)
    begin
        update [dbo].[yaf_User] set NumPosts = NumPosts + 1 where UserID = @UserID
        -- upgrade user, i.e. promote rank if conditions allow it
        exec [dbo].[yaf_user_upgrade] @UserID
    end

    -- update Forum table with last topic/post info
    update [dbo].[yaf_Forum] set
        LastPosted = @Posted,
        LastTopicID = @TopicID,
        LastMessageID = @MessageID,
        LastUserID = @UserID,
        LastUserName = @UserName,
        LastUserDisplayName = @UserDisplayName
    where ForumID = @ForumID

    -- update Topic table with info about last post in topic
    update [dbo].[yaf_Topic] set
        LastPosted = @Posted,
        LastMessageID = @MessageID,
        LastUserID = @UserID,
        LastUserName = @UserName,
        LastUserDisplayName = @UserDisplayName,		
        LastMessageFlags = @Flags | 16,
        NumPosts = (select count(1) from [dbo].[yaf_Message] x where x.TopicID=[dbo].[yaf_Topic].TopicID and x.IsApproved = 1 and x.IsDeleted = 0)
    where TopicID = @TopicID
    
    -- update forum stats
    exec [dbo].[yaf_forum_updatestats] @ForumID	
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_save]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_message_save](
    @TopicID		int,
    @UserID			int,
    @Message		ntext,	
    @UserName		nvarchar(255)=null,
    @IP				varchar(39),
    @Posted			datetime=null,
    @ReplyTo		int,
    @BlogPostID		nvarchar(50) = null,
    @ExternalMessageId nvarchar(255) = null,
    @ReferenceMessageId nvarchar(255) = null,
    @Flags			int,
    @UTCTIMESTAMP datetime,	
    @MessageID		int output
)
AS
BEGIN
        DECLARE @ForumID INT, @ForumFlags INT, @Position INT, @Indent INT, @OverrideDisplayName BIT, @ReplaceName nvarchar(255) 

    IF @Posted IS NULL
        SET @Posted = @UTCTIMESTAMP 

    SELECT @ForumID = x.ForumID, @ForumFlags = y.Flags
    FROM 
        [dbo].[yaf_Topic] x
    INNER JOIN 
        [dbo].[yaf_Forum] y ON y.ForumID=x.ForumID
    WHERE x.TopicID = @TopicID 

    IF @ReplyTo IS NULL
            SELECT @Position = 0, @Indent = 0 -- New thread

    ELSE IF @ReplyTo<0
        -- Find post to reply to AND indent of this post
        SELECT TOP 1 @ReplyTo = MessageID, @Indent = Indent+1
        FROM [dbo].[yaf_Message]
        WHERE TopicID = @TopicID AND ReplyTo IS NULL
        ORDER BY Posted

    ELSE
        -- Got reply, find indent of this post
            SELECT @Indent=Indent+1
            FROM [dbo].[yaf_Message]
            WHERE MessageID=@ReplyTo

    -- Find position
    IF @ReplyTo IS NOT NULL
    BEGIN
        DECLARE @temp INT
        
        SELECT @temp=ReplyTo,@Position=Position FROM [dbo].[yaf_Message] WHERE MessageID=@ReplyTo

        IF @temp IS NULL
            -- We are replying to first post
            SELECT @Position=MAX(Position)+1 FROM [dbo].[yaf_Message] WHERE TopicID=@TopicID

        ELSE
            -- Last position of replies to parent post
            SELECT @Position=MIN(Position) FROM [dbo].[yaf_Message] WHERE ReplyTo=@temp AND Position>@Position

        -- No replies, THEN USE parent post's position+1
        IF @Position IS NULL
            SELECT @Position=Position+1 FROM [dbo].[yaf_Message] WHERE MessageID=@ReplyTo
        -- Increase position of posts after this

        UPDATE [dbo].[yaf_Message] SET Position=Position+1 WHERE TopicID=@TopicID AND Position>=@Position
    END

	-- Add points to Users total reputation points
 	UPDATE [dbo].[yaf_User] SET Points = Points + 3 WHERE UserID = @UserID
    
	-- this check is for guest user only to not override replace name 
    if (SELECT Name FROM [dbo].[yaf_User] WHERE UserID = @UserID) != @UserName
    begin
    SET @OverrideDisplayName = 1
    end
    SET @ReplaceName = (CASE WHEN @OverrideDisplayName = 1 THEN @UserName ELSE (SELECT DisplayName FROM [dbo].[yaf_User] WHERE UserID = @UserID) END);
    INSERT [dbo].[yaf_Message] ( UserID, [Message], TopicID, Posted, UserName, UserDisplayName, IP, ReplyTo, Position, Indent, Flags, BlogPostID, ExternalMessageId, ReferenceMessageId)
    VALUES ( @UserID, @Message, @TopicID, @Posted, @UserName,@ReplaceName, @IP, @ReplyTo, @Position, @Indent, @Flags & ~16, @BlogPostID, @ExternalMessageId, @ReferenceMessageId)	
    
    SET @MessageID = SCOPE_IDENTITY()

    IF ((@Flags & 16) = 16)
        EXEC [dbo].[yaf_message_approve] @MessageID	
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_nntptopic_savemessage]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_nntptopic_savemessage](
    @NntpForumID	int,
    @Topic 			nvarchar(100),
    @Body 			ntext,
    @UserID 		int,
    @UserName		nvarchar(255),
    @IP				varchar(39),
    @Posted			datetime,
    @ExternalMessageId	nvarchar(255),
    @ReferenceMessageId nvarchar(255) = null,
    @UTCTIMESTAMP datetime
) as 
begin
    declare	@ForumID	int
    declare @TopicID	int
    declare	@MessageID	int
    declare @ReplyTo	int
    
    SET @TopicID = NULL
    SET @ReplyTo = NULL

    select @ForumID = ForumID from [dbo].[yaf_NntpForum] where NntpForumID=@NntpForumID

    if exists(select 1 from [dbo].[yaf_Message] where ExternalMessageId = @ReferenceMessageId)
    begin
        -- referenced message exists
        select @TopicID = TopicID, @ReplyTo = MessageID from [dbo].[yaf_Message] where ExternalMessageId = @ReferenceMessageId
    end else
    if not exists(select 1 from [dbo].[yaf_Message] where ExternalMessageId = @ExternalMessageId)
    begin
        if (@ReferenceMessageId IS NULL)
        begin
            -- thread doesn't exists
            insert into [dbo].[yaf_Topic](ForumID,UserID,UserName, UserDisplayName,Posted,Topic,[Views],Priority,NumPosts)
            values (@ForumID,@UserID,@UserName, @UserName,@Posted,@Topic,0,0,0)
            set @TopicID=SCOPE_IDENTITY()

            insert into [dbo].[yaf_NntpTopic](NntpForumID,Thread,TopicID)
            values (@NntpForumID,'',@TopicID)
        end
    end
    
    IF @TopicID IS NOT NULL
    BEGIN
        exec [dbo].[yaf_message_save]  @TopicID, @UserID, @Body, @UserName, @IP, @Posted, @ReplyTo, NULL, @ExternalMessageId, @ReferenceMessageId, 17,@UTCTIMESTAMP, @MessageID OUTPUT
    END	
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_move]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_message_move] (@MessageID int, @MoveToTopic int) AS
BEGIN
    DECLARE
    @Position int,
    @ReplyToID int,
    @OldTopicID int,
    @OldForumID int

    
    declare @NewForumID		int
    declare @MessageCount	int
    declare @LastMessageID	int

    -- Find TopicID and ForumID
--	select @OldTopicID=b.TopicID,@ForumID=b.ForumID from [dbo].[yaf_Message] a,yaf_Topic b where a.MessageID=@MessageID and b.TopicID=a.TopicID

SET 	@NewForumID = (SELECT     ForumID
                FROM         [dbo].[yaf_Topic]
                WHERE     (TopicId = @MoveToTopic))


SET 	@OldTopicID = 	(SELECT     TopicID
                FROM         [dbo].[yaf_Message]
                WHERE     (MessageID = @MessageID))

SET 	@OldForumID = (SELECT     ForumID
                FROM         [dbo].[yaf_Topic]
                WHERE     (TopicId = @OldTopicID))

SET	@ReplyToID = (SELECT     MessageID
            FROM         [dbo].[yaf_Message]
            WHERE     ([Position] = 0) AND (TopicID = @MoveToTopic))

SET	@Position = 	(SELECT     MAX([Position]) + 1 AS Expr1
            FROM         [dbo].[yaf_Message]
            WHERE     (TopicID = @MoveToTopic) and posted < (select posted from [dbo].[yaf_Message] where MessageID = @MessageID ) )

if @Position is null  set @Position = 0

update [dbo].[yaf_Message] set
        Position = Position+1
     WHERE     (TopicID = @MoveToTopic) and posted > (select posted from [dbo].[yaf_Message] where MessageID = @MessageID)

update [dbo].[yaf_Message] set
        Position = Position-1
     WHERE     (TopicID = @OldTopicID) and posted > (select posted from [dbo].[yaf_Message] where MessageID = @MessageID)

    


    -- Update LastMessageID in Topic and Forum
    update [dbo].[yaf_Topic] set
        LastPosted = null,
        LastMessageID = null,
        LastUserID = null,
        LastUserName = null,
        LastMessageFlags = null,
        LastUserDisplayName = null
    where LastMessageID = @MessageID

    update [dbo].[yaf_Forum] set
        LastPosted = null,
        LastTopicID = null,
        LastMessageID = null,
        LastUserID = null,
        LastUserName = null,
        LastUserDisplayName = null
    where LastMessageID = @MessageID


UPDATE [dbo].[yaf_Message] SET
    TopicID = @MoveToTopic,
    ReplyTo = @ReplyToID,
    [Position] = @Position
WHERE  MessageID = @MessageID

    -- Delete topic if there are no more messages
    select @MessageCount = count(1) from [dbo].[yaf_Message] where TopicID = @OldTopicID and IsDeleted=0
    if @MessageCount=0 exec [dbo].[yaf_topic_delete] @OldTopicID

    -- update lastpost
    exec [dbo].[yaf_topic_updatelastpost] @OldForumID,@OldTopicID
    exec [dbo].[yaf_topic_updatelastpost] @NewForumID,@MoveToTopic

    -- update topic numposts
    update [dbo].[yaf_Topic] set
        NumPosts = (select count(1) from [dbo].[yaf_Message] x where x.TopicID=[dbo].[yaf_Topic].TopicID and x.IsApproved = 1 and x.IsDeleted = 0)
    where TopicID = @OldTopicID
    update [dbo].[yaf_Topic] set
        NumPosts = (select count(1) from [dbo].[yaf_Message] x where x.TopicID=[dbo].[yaf_Topic].TopicID and x.IsApproved = 1 and x.IsDeleted = 0)
    where TopicID = @MoveToTopic

    exec [dbo].[yaf_forum_updatelastpost] @NewForumID
    exec [dbo].[yaf_forum_updatestats] @NewForumID
    exec [dbo].[yaf_forum_updatelastpost] @OldForumID
    exec [dbo].[yaf_forum_updatestats] @OldForumID

END
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_update]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_message_update](
@MessageID int,
@Priority int,
@Subject nvarchar(100),
@Description nvarchar(255),
@Status nvarchar(255),
@Styles nvarchar(255),
@Flags int, 
@Message ntext, 
@Reason nvarchar(100), 
@EditedBy int,
@IsModeratorChanged bit, 
@OverrideApproval bit = null,
@OriginalMessage ntext,
@CurrentUtcTimestamp datetime) as
begin
        declare @TopicID	int
    declare	@ForumFlags	int

    set @Flags = @Flags & ~16	
    
    select 
        @TopicID	= a.TopicID,
        @ForumFlags	= c.Flags
    from 
        [dbo].[yaf_Message] a
        inner join [dbo].[yaf_Topic] b on b.TopicID = a.TopicID
        inner join [dbo].[yaf_Forum] c on c.ForumID = b.ForumID
    where 
        a.MessageID = @MessageID

    if (@OverrideApproval = 1 OR (@ForumFlags & 8)=0) set @Flags = @Flags | 16

	-- save original message in the history if this is the first edit
	if not exists(select 1 from [dbo].[yaf_MessageHistory] where MessageID=@MessageID)
	  begin
	    insert into [dbo].[yaf_MessageHistory] (MessageID,		
            [Message],
            IP,
            Edited,
            EditedBy,		
            EditReason,
            IsModeratorChanged,
            Flags)
            select MessageID, 
			       OriginalMessage=@OriginalMessage, 
				   IP,
				   Posted,
				   UserID,
				   NULL, 
				   IsModeratorChanged, 
				   Flags
		    from [dbo].[yaf_Message] where MessageID = @MessageID
	  end
	else
	 begin
	     -- insert current message variant - use OriginalMessage in future 	
        insert into [dbo].[yaf_MessageHistory]
        (MessageID,		
            [Message],
            IP,
            Edited,
            EditedBy,		
            EditReason,
            IsModeratorChanged,
            Flags)
        select 
        MessageID, OriginalMessage=@OriginalMessage, IP , @CurrentUtcTimestamp, IsNull(EditedBy,UserID), EditReason, IsModeratorChanged, Flags
        from [dbo].[yaf_Message] where MessageID = @MessageID
	 end
    
    
    
    
    update [dbo].[yaf_Message] set
        [Message] = @Message,
        Edited = @CurrentUtcTimestamp,
        EditedBy = @EditedBy,
        Flags = @Flags,
        IsModeratorChanged  = @IsModeratorChanged,
                EditReason = @Reason
    where
        MessageID = @MessageID

    if @Priority is not null begin
        update [dbo].[yaf_Topic] set
            Priority = @Priority
        where
            TopicID = @TopicID
    end

    if not @Subject = '' and @Subject is not null begin
        update [dbo].[yaf_Topic] set
            Topic = @Subject, 
            [Description] = @Description,
            [Status] = @Status,
            [Styles] = @Styles
        where
            TopicID = @TopicID
    end 
    
    -- If forum is moderated, make sure last post pointers are correct
    if (@ForumFlags & 8)<>0 exec [dbo].[yaf_topic_updatelastpost]
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_reportresolve]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_message_reportresolve](@MessageFlag int, @MessageID int, @UserID int,@UTCTIMESTAMP datetime) AS
BEGIN
    
    UPDATE [dbo].[yaf_MessageReported]
    SET Resolved = 1, ResolvedBy = @UserID, ResolvedDate = @UTCTIMESTAMP 
    WHERE MessageID = @MessageID;
    
    /* Remove Flag */
    UPDATE [dbo].[yaf_Message]
    SET Flags = Flags & (~POWER(2, @MessageFlag))
    WHERE MessageID = @MessageID;
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_reportcopyover]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_message_reportcopyover](@MessageID int) AS
BEGIN
        UPDATE [dbo].[yaf_MessageReported]
    SET [dbo].[yaf_MessageReported].[Message] = m.[Message]
    FROM [dbo].[yaf_MessageReported] mr
    JOIN [dbo].[yaf_Message] m ON m.MessageID = mr.MessageID
    WHERE mr.MessageID = @MessageID;
END
GO
/****** Object:  UserDefinedFunction [dbo].[yaf_medal_getsortorder]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[yaf_medal_getsortorder]
(
    @SortOrder tinyint,
    @DefaultSortOrder tinyint,
    @Flags int
)
RETURNS tinyint
AS
BEGIN

    if ((@Flags & 8) = 0) set @SortOrder = @DefaultSortOrder

    return @SortOrder

END
GO
/****** Object:  UserDefinedFunction [dbo].[yaf_medal_getribbonsetting]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[yaf_medal_getribbonsetting]
(
    @RibbonURL nvarchar(250),
    @Flags int,
    @OnlyRibbon bit
)
RETURNS bit
AS
BEGIN

    if ((@RibbonURL is null) or ((@Flags & 2) = 0)) set @OnlyRibbon = 0

    return @OnlyRibbon

END
GO
/****** Object:  UserDefinedFunction [dbo].[yaf_medal_gethide]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[yaf_medal_gethide]
(
    @Hide bit,
    @Flags int
)
RETURNS bit
AS
BEGIN

    if ((@Flags & 4) = 0) set @Hide = 0

    return @Hide

END
GO
/****** Object:  StoredProcedure [dbo].[yaf_drop_defaultconstraint_oncolumn]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_drop_defaultconstraint_oncolumn](@tablename varchar(255), @columnname varchar(255)) as
BEGIN
DECLARE @DefName sysname

SELECT 
  @DefName = o1.name
FROM
  sys.objects o1
  INNER JOIN sys.columns c ON
  o1.object_id = c.default_object_id
  INNER JOIN sys.objects o2 ON
  c.object_id = o2.object_id
WHERE
  o2.name = @tablename AND
  c.name = @columnname
  
IF @DefName IS NOT NULL
  EXECUTE ('ALTER TABLE [dbo].[' + @tablename + '] DROP constraint [' + @DefName + ']')
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_db_handle_computedcolumns]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_db_handle_computedcolumns]( @SetOnDisk bit )  
as
begin
    declare @tmpC nvarchar(255)
    declare @tmpT nvarchar(255)
    declare @tmpD nvarchar(255)	

    CREATE TABLE #MyTempTable (tname nvarchar(255),cname nvarchar(255), ctext nvarchar(255))
    INSERT INTO #MyTempTable(tname,cname, ctext)     
        SELECT        o.name,s.name,sc.text
FROM            sys.columns AS s INNER JOIN
                         sys.objects AS o ON o.object_id = s.object_id INNER JOIN
                         sys.syscomments AS sc ON sc.id = o.object_id
WHERE        (s.is_computed = 1) AND (o.type = 'U') AND (s.system_type_id = 104)

    if @SetOnDisk = 1
    begin
        declare c cursor for
        SELECT    tname, cname, ctext
        FROM           #MyTempTable       
        
        open c
        
        fetch next from c into @tmpT, @tmpC, @tmpD
        while @@FETCH_STATUS = 0
        begin
            
        exec('ALTER TABLE [dbo].[yaf_'+ @tmpT +'] drop column ' + @tmpC)
        exec('ALTER TABLE [dbo].[yaf_'+ @tmpT +'] add ' + @tmpC + ' AS ' + @tmpD + ' PERSISTED ' )

            fetch next from c into  @tmpT, @tmpC, @tmpD
        end
        close c
        deallocate c
    end
    else
    begin
        declare c cursor for
            SELECT    tname, cname, ctext
        FROM           #MyTempTable 
        
        open c
        
        fetch next from c into @tmpT, @tmpC, @tmpD
        while @@FETCH_STATUS = 0
        begin		    	
            exec('ALTER TABLE [dbo].[yaf_'+ @tmpT +'] drop column ' + @tmpC)
            exec('ALTER TABLE [dbo].[yaf_'+ @tmpT +'] add ' + @tmpC + ' AS ' + @tmpD)
            fetch next from c into @tmpT, @tmpC, @tmpD
        end
        close c
        deallocate c
    end	
end
GO
/****** Object:  Table [dbo].[yaf_Mail]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_Mail](
	[MailID] [int] IDENTITY(1,1) NOT NULL,
	[FromUser] [nvarchar](255) NULL,
	[FromUserName] [nvarchar](255) NULL,
	[ToUser] [nvarchar](255) NULL,
	[ToUserName] [nvarchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Subject] [nvarchar](100) NOT NULL,
	[Body] [ntext] NOT NULL,
	[BodyHtml] [ntext] NULL,
	[SendTries] [int] NOT NULL,
	[SendAttempt] [datetime] NULL,
	[ProcessID] [int] NULL,
 CONSTRAINT [PK_yaf_Mail] PRIMARY KEY CLUSTERED 
(
	[MailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[yaf_init_styles]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_init_styles] as
begin 
-- previously it was mangled so it's desirable update styles every time to be sure
exec('[dbo].[yaf_user_savestyle] null,null')
end
GO
/****** Object:  Table [dbo].[yaf_IgnoreUser]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_IgnoreUser](
	[UserID] [int] NOT NULL,
	[IgnoredUserID] [int] NOT NULL,
 CONSTRAINT [PK_yaf_IgnoreUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[IgnoredUserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yaf_Medal]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_Medal](
	[BoardID] [int] NOT NULL,
	[MedalID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [ntext] NOT NULL,
	[Message] [nvarchar](100) NOT NULL,
	[Category] [nvarchar](50) NULL,
	[MedalURL] [nvarchar](250) NOT NULL,
	[RibbonURL] [nvarchar](250) NULL,
	[SmallMedalURL] [nvarchar](250) NOT NULL,
	[SmallRibbonURL] [nvarchar](250) NULL,
	[SmallMedalWidth] [smallint] NOT NULL,
	[SmallMedalHeight] [smallint] NOT NULL,
	[SmallRibbonWidth] [smallint] NULL,
	[SmallRibbonHeight] [smallint] NULL,
	[SortOrder] [tinyint] NOT NULL,
	[Flags] [int] NOT NULL,
 CONSTRAINT [PK_yaf_Medal] PRIMARY KEY CLUSTERED 
(
	[MedalID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yaf_Board]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_Board](
	[BoardID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[AllowThreaded] [bit] NOT NULL,
	[MembershipAppName] [nvarchar](255) NULL,
	[RolesAppName] [nvarchar](255) NULL,
 CONSTRAINT [PK_yaf_Board] PRIMARY KEY CLUSTERED 
(
	[BoardID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[yaf_Board] ON
INSERT [dbo].[yaf_Board] ([BoardID], [Name], [AllowThreaded], [MembershipAppName], [RolesAppName]) VALUES (1, N'Conversation Board', 0, N'', N'')
SET IDENTITY_INSERT [dbo].[yaf_Board] OFF
/****** Object:  StoredProcedure [dbo].[yaf_forum_resync]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[yaf_forum_resync]
    @BoardID int,
    @ForumID int = null
AS
begin
    
    if (@ForumID is null) begin
        declare curForums cursor for
            select 
                a.ForumID
            from
                [dbo].[yaf_Forum] a
                JOIN [dbo].[yaf_Category] b on a.CategoryID=b.CategoryID
                JOIN [dbo].[yaf_Board] c on b.BoardID = c.BoardID  
            where
                c.BoardID=@BoardID

        open curForums
        
        -- cycle through forums
        fetch next from curForums into @ForumID
        while @@FETCH_STATUS = 0
        begin
            --update statistics
            exec [dbo].[yaf_forum_updatestats] @ForumID
            --update last post
            exec [dbo].[yaf_forum_updatelastpost] @ForumID

            fetch next from curForums into @ForumID
        end
        close curForums
        deallocate curForums
    end
    else begin
        --update statistics
        exec [dbo].[yaf_forum_updatestats] @ForumID
        --update last post
        exec [dbo].[yaf_forum_updatelastpost] @ForumID
    end
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_board_resync]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[yaf_board_resync]
    @BoardID int = null
as
begin
    
    if (@BoardID is null) begin
        declare curBoards cursor for
            select BoardID from	[dbo].[yaf_Board]

        open curBoards
        
        -- cycle through forums
        fetch next from curBoards into @BoardID
        while @@FETCH_STATUS = 0
        begin
            --resync board forums
            exec [dbo].[yaf_forum_resync] @BoardID

            fetch next from curBoards into @BoardID
        end
        close curBoards
        deallocate curBoards
    end
    else begin
        --resync board forums
        exec [dbo].[yaf_forum_resync] @BoardID
    end
end
GO
/****** Object:  Table [dbo].[yaf_ActiveAccess]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_ActiveAccess](
	[UserID] [int] NOT NULL,
	[BoardID] [int] NOT NULL,
	[ForumID] [int] NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[IsForumModerator] [bit] NOT NULL,
	[IsModerator] [bit] NOT NULL,
	[ReadAccess] [bit] NOT NULL,
	[PostAccess] [bit] NOT NULL,
	[ReplyAccess] [bit] NOT NULL,
	[PriorityAccess] [bit] NOT NULL,
	[PollAccess] [bit] NOT NULL,
	[VoteAccess] [bit] NOT NULL,
	[ModeratorAccess] [bit] NOT NULL,
	[EditAccess] [bit] NOT NULL,
	[DeleteAccess] [bit] NOT NULL,
	[UploadAccess] [bit] NOT NULL,
	[DownloadAccess] [bit] NOT NULL,
	[LastActive] [datetime] NULL,
	[IsGuestX] [bit] NOT NULL,
 CONSTRAINT [PK_yaf_ActiveAccess] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ForumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[yaf_ActiveAccess] ([UserID], [BoardID], [ForumID], [IsAdmin], [IsForumModerator], [IsModerator], [ReadAccess], [PostAccess], [ReplyAccess], [PriorityAccess], [PollAccess], [VoteAccess], [ModeratorAccess], [EditAccess], [DeleteAccess], [UploadAccess], [DownloadAccess], [LastActive], [IsGuestX]) VALUES (1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(0x0000A49600F4F1A1 AS DateTime), 1)
INSERT [dbo].[yaf_ActiveAccess] ([UserID], [BoardID], [ForumID], [IsAdmin], [IsForumModerator], [IsModerator], [ReadAccess], [PostAccess], [ReplyAccess], [PriorityAccess], [PollAccess], [VoteAccess], [ModeratorAccess], [EditAccess], [DeleteAccess], [UploadAccess], [DownloadAccess], [LastActive], [IsGuestX]) VALUES (1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(0x0000A49600F4F1A1 AS DateTime), 1)
INSERT [dbo].[yaf_ActiveAccess] ([UserID], [BoardID], [ForumID], [IsAdmin], [IsForumModerator], [IsModerator], [ReadAccess], [PostAccess], [ReplyAccess], [PriorityAccess], [PollAccess], [VoteAccess], [ModeratorAccess], [EditAccess], [DeleteAccess], [UploadAccess], [DownloadAccess], [LastActive], [IsGuestX]) VALUES (1, 1, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(0x0000A49600F4F1A1 AS DateTime), 1)
INSERT [dbo].[yaf_ActiveAccess] ([UserID], [BoardID], [ForumID], [IsAdmin], [IsForumModerator], [IsModerator], [ReadAccess], [PostAccess], [ReplyAccess], [PriorityAccess], [PollAccess], [VoteAccess], [ModeratorAccess], [EditAccess], [DeleteAccess], [UploadAccess], [DownloadAccess], [LastActive], [IsGuestX]) VALUES (1, 1, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(0x0000A49600F4F1A1 AS DateTime), 1)
INSERT [dbo].[yaf_ActiveAccess] ([UserID], [BoardID], [ForumID], [IsAdmin], [IsForumModerator], [IsModerator], [ReadAccess], [PostAccess], [ReplyAccess], [PriorityAccess], [PollAccess], [VoteAccess], [ModeratorAccess], [EditAccess], [DeleteAccess], [UploadAccess], [DownloadAccess], [LastActive], [IsGuestX]) VALUES (1, 1, 4, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(0x0000A49600F4F1A1 AS DateTime), 1)
INSERT [dbo].[yaf_ActiveAccess] ([UserID], [BoardID], [ForumID], [IsAdmin], [IsForumModerator], [IsModerator], [ReadAccess], [PostAccess], [ReplyAccess], [PriorityAccess], [PollAccess], [VoteAccess], [ModeratorAccess], [EditAccess], [DeleteAccess], [UploadAccess], [DownloadAccess], [LastActive], [IsGuestX]) VALUES (1, 1, 5, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(0x0000A49600F4F1A1 AS DateTime), 1)
INSERT [dbo].[yaf_ActiveAccess] ([UserID], [BoardID], [ForumID], [IsAdmin], [IsForumModerator], [IsModerator], [ReadAccess], [PostAccess], [ReplyAccess], [PriorityAccess], [PollAccess], [VoteAccess], [ModeratorAccess], [EditAccess], [DeleteAccess], [UploadAccess], [DownloadAccess], [LastActive], [IsGuestX]) VALUES (1, 1, 6, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(0x0000A49600F4F1A1 AS DateTime), 1)
INSERT [dbo].[yaf_ActiveAccess] ([UserID], [BoardID], [ForumID], [IsAdmin], [IsForumModerator], [IsModerator], [ReadAccess], [PostAccess], [ReplyAccess], [PriorityAccess], [PollAccess], [VoteAccess], [ModeratorAccess], [EditAccess], [DeleteAccess], [UploadAccess], [DownloadAccess], [LastActive], [IsGuestX]) VALUES (1, 1, 7, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(0x0000A49600F4F1A1 AS DateTime), 1)
INSERT [dbo].[yaf_ActiveAccess] ([UserID], [BoardID], [ForumID], [IsAdmin], [IsForumModerator], [IsModerator], [ReadAccess], [PostAccess], [ReplyAccess], [PriorityAccess], [PollAccess], [VoteAccess], [ModeratorAccess], [EditAccess], [DeleteAccess], [UploadAccess], [DownloadAccess], [LastActive], [IsGuestX]) VALUES (1, 1, 8, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(0x0000A49600F4F1A1 AS DateTime), 1)
INSERT [dbo].[yaf_ActiveAccess] ([UserID], [BoardID], [ForumID], [IsAdmin], [IsForumModerator], [IsModerator], [ReadAccess], [PostAccess], [ReplyAccess], [PriorityAccess], [PollAccess], [VoteAccess], [ModeratorAccess], [EditAccess], [DeleteAccess], [UploadAccess], [DownloadAccess], [LastActive], [IsGuestX]) VALUES (1, 1, 9, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(0x0000A49600F4F1A1 AS DateTime), 1)
INSERT [dbo].[yaf_ActiveAccess] ([UserID], [BoardID], [ForumID], [IsAdmin], [IsForumModerator], [IsModerator], [ReadAccess], [PostAccess], [ReplyAccess], [PriorityAccess], [PollAccess], [VoteAccess], [ModeratorAccess], [EditAccess], [DeleteAccess], [UploadAccess], [DownloadAccess], [LastActive], [IsGuestX]) VALUES (1, 1, 10, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(0x0000A49600F4F1A1 AS DateTime), 1)
INSERT [dbo].[yaf_ActiveAccess] ([UserID], [BoardID], [ForumID], [IsAdmin], [IsForumModerator], [IsModerator], [ReadAccess], [PostAccess], [ReplyAccess], [PriorityAccess], [PollAccess], [VoteAccess], [ModeratorAccess], [EditAccess], [DeleteAccess], [UploadAccess], [DownloadAccess], [LastActive], [IsGuestX]) VALUES (1, 1, 11, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(0x0000A49600F4F1A1 AS DateTime), 1)
INSERT [dbo].[yaf_ActiveAccess] ([UserID], [BoardID], [ForumID], [IsAdmin], [IsForumModerator], [IsModerator], [ReadAccess], [PostAccess], [ReplyAccess], [PriorityAccess], [PollAccess], [VoteAccess], [ModeratorAccess], [EditAccess], [DeleteAccess], [UploadAccess], [DownloadAccess], [LastActive], [IsGuestX]) VALUES (1, 1, 12, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(0x0000A49600F4F1A1 AS DateTime), 1)
/****** Object:  Table [dbo].[yaf_UserGroup]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_UserGroup](
	[UserID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
 CONSTRAINT [PK_yaf_UserGroup] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_UserGroup_UserID] ON [dbo].[yaf_UserGroup] 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[yaf_UserGroup] ([UserID], [GroupID]) VALUES (1, 2)
INSERT [dbo].[yaf_UserGroup] ([UserID], [GroupID]) VALUES (2, 1)
INSERT [dbo].[yaf_UserGroup] ([UserID], [GroupID]) VALUES (16, 3)
INSERT [dbo].[yaf_UserGroup] ([UserID], [GroupID]) VALUES (18, 3)
INSERT [dbo].[yaf_UserGroup] ([UserID], [GroupID]) VALUES (19, 3)
INSERT [dbo].[yaf_UserGroup] ([UserID], [GroupID]) VALUES (25, 3)
INSERT [dbo].[yaf_UserGroup] ([UserID], [GroupID]) VALUES (31, 4)
INSERT [dbo].[yaf_UserGroup] ([UserID], [GroupID]) VALUES (37, 3)
INSERT [dbo].[yaf_UserGroup] ([UserID], [GroupID]) VALUES (42, 3)
/****** Object:  Table [dbo].[yaf_Group]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_Group](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[BoardID] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Flags] [int] NOT NULL,
	[PMLimit] [int] NOT NULL,
	[Style] [nvarchar](255) NULL,
	[SortOrder] [smallint] NOT NULL,
	[Description] [nvarchar](128) NULL,
	[UsrSigChars] [int] NOT NULL,
	[UsrSigBBCodes] [nvarchar](255) NULL,
	[UsrSigHTMLTags] [nvarchar](255) NULL,
	[UsrAlbums] [int] NOT NULL,
	[UsrAlbumImages] [int] NOT NULL,
	[IsHidden]  AS (CONVERT([bit],sign([Flags]&(16)),(0))),
	[IsUserGroup]  AS (CONVERT([bit],sign([Flags]&(32)),(0))),
 CONSTRAINT [PK_yaf_Group] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_yaf_Group] UNIQUE NONCLUSTERED 
(
	[BoardID] ASC,
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_Group_SortOrder] ON [dbo].[yaf_Group] 
(
	[SortOrder] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_Group_Style] ON [dbo].[yaf_Group] 
(
	[Style] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[yaf_Group] ON
INSERT [dbo].[yaf_Group] ([GroupID], [BoardID], [Name], [Flags], [PMLimit], [Style], [SortOrder], [Description], [UsrSigChars], [UsrSigBBCodes], [UsrSigHTMLTags], [UsrAlbums], [UsrAlbumImages]) VALUES (1, 1, N'Administrators', 1, 2147483647, N'default!font-size: 8pt; color: red/yafpro!font-size: 8pt; color:blue', 0, NULL, 256, N'URL,IMG,SPOILER,QUOTE', NULL, 10, 120)
INSERT [dbo].[yaf_Group] ([GroupID], [BoardID], [Name], [Flags], [PMLimit], [Style], [SortOrder], [Description], [UsrSigChars], [UsrSigBBCodes], [UsrSigHTMLTags], [UsrAlbums], [UsrAlbumImages]) VALUES (2, 1, N'Guests', 2, 0, N'default!font-size: 8pt; font-style: italic; font-weight: bold; color: #0c7333/yafpro!font-size: 8pt; color: #6e1987', 1, NULL, 0, NULL, NULL, 0, 0)
INSERT [dbo].[yaf_Group] ([GroupID], [BoardID], [Name], [Flags], [PMLimit], [Style], [SortOrder], [Description], [UsrSigChars], [UsrSigBBCodes], [UsrSigHTMLTags], [UsrAlbums], [UsrAlbumImages]) VALUES (3, 1, N'Registered', 4, 100, NULL, 1, NULL, 128, N'URL,IMG,SPOILER,QUOTE', NULL, 5, 30)
INSERT [dbo].[yaf_Group] ([GroupID], [BoardID], [Name], [Flags], [PMLimit], [Style], [SortOrder], [Description], [UsrSigChars], [UsrSigBBCodes], [UsrSigHTMLTags], [UsrAlbums], [UsrAlbumImages]) VALUES (4, 1, N'ForumModeratorRole1', 8, 0, NULL, 0, N'Forum Moderator', 128, N'', N'', 0, 0)
SET IDENTITY_INSERT [dbo].[yaf_Group] OFF
/****** Object:  Table [dbo].[yaf_AccessMask]    Script Date: 05/18/2015 09:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_AccessMask](
	[AccessMaskID] [int] IDENTITY(1,1) NOT NULL,
	[BoardID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Flags] [int] NOT NULL,
	[SortOrder] [smallint] NOT NULL,
 CONSTRAINT [PK_yaf_AccessMask] PRIMARY KEY CLUSTERED 
(
	[AccessMaskID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[yaf_AccessMask] ON
INSERT [dbo].[yaf_AccessMask] ([AccessMaskID], [BoardID], [Name], [Flags], [SortOrder]) VALUES (1, 1, N'Admin Access', 2047, 4)
INSERT [dbo].[yaf_AccessMask] ([AccessMaskID], [BoardID], [Name], [Flags], [SortOrder]) VALUES (2, 1, N'Moderator Access', 1511, 3)
INSERT [dbo].[yaf_AccessMask] ([AccessMaskID], [BoardID], [Name], [Flags], [SortOrder]) VALUES (3, 1, N'Member Access', 1447, 2)
INSERT [dbo].[yaf_AccessMask] ([AccessMaskID], [BoardID], [Name], [Flags], [SortOrder]) VALUES (4, 1, N'Read Only Access', 1, 1)
INSERT [dbo].[yaf_AccessMask] ([AccessMaskID], [BoardID], [Name], [Flags], [SortOrder]) VALUES (5, 1, N'No Access', 0, 0)
SET IDENTITY_INSERT [dbo].[yaf_AccessMask] OFF
/****** Object:  View [dbo].[yaf_vaccess_null]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[yaf_vaccess_null]
WITH SCHEMABINDING
AS
        select
            a.UserID,
            ForumID			  = convert(int,0),
            AccessMaskID  = convert(int,0),
            GroupID				= convert(int,0),
            ReadAccess		= convert(int,0),
            PostAccess		= convert(int,0),
            ReplyAccess		= convert(int,0),
            PriorityAccess	= convert(int,0),
            PollAccess		= convert(int,0),
            VoteAccess		= convert(int,0),
            ModeratorAccess	= convert(int,0),
            EditAccess		= convert(int,0),
            DeleteAccess	= convert(int,0),
            UploadAccess	= convert(int,0),
            DownloadAccess	= convert(int,0),
            AdminGroup		= convert(int,0)
        from
            [dbo].[yaf_User] a
GO
SET ARITHABORT ON
GO
SET CONCAT_NULL_YIELDS_NULL ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_WARNINGS ON
GO
SET NUMERIC_ROUNDABORT OFF
GO
CREATE UNIQUE CLUSTERED INDEX [yaf_vaccess_null_UserForum_PK] ON [dbo].[yaf_vaccess_null] 
(
	[UserID] ASC,
	[ForumID] ASC,
	[AccessMaskID] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[yaf_vaccess_user]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[yaf_vaccess_user]
WITH SCHEMABINDING
AS
    SELECT
            b.UserID,
            b.ForumID,
            c.AccessMaskID,
            GroupID				= convert(int,0),
            ReadAccess		= convert(int,c.Flags & 1),
            PostAccess		= convert(int,c.Flags & 2),
            ReplyAccess		= convert(int,c.Flags & 4),
            PriorityAccess	= convert(int,c.Flags & 8),
            PollAccess		= convert(int,c.Flags & 16),
            VoteAccess		= convert(int,c.Flags & 32),
            ModeratorAccess	= convert(int,c.Flags & 64),
            EditAccess		= convert(int,c.Flags & 128),
            DeleteAccess	= convert(int,c.Flags & 256),
            UploadAccess	= convert(int,c.Flags & 512),
            DownloadAccess	= convert(int,c.Flags & 1024),
            AdminGroup		= convert(int,0)
        from
            [dbo].[yaf_UserForum] b
            INNER JOIN [dbo].[yaf_AccessMask] c on c.AccessMaskID=b.AccessMaskID
GO
SET ARITHABORT ON
GO
SET CONCAT_NULL_YIELDS_NULL ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_WARNINGS ON
GO
SET NUMERIC_ROUNDABORT OFF
GO
CREATE UNIQUE CLUSTERED INDEX [yaf_vaccess_user_UserForum_PK] ON [dbo].[yaf_vaccess_user] 
(
	[UserID] ASC,
	[ForumID] ASC,
	[AccessMaskID] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[yaf_vaccess_group]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[yaf_vaccess_group]
WITH SCHEMABINDING
AS
        select
            b.UserID,
            c.ForumID,
            d.AccessMaskID,
            b.GroupID,
            ReadAccess		= convert(int,d.Flags & 1),
            PostAccess		= convert(int,d.Flags & 2),
            ReplyAccess		= convert(int,d.Flags & 4),
            PriorityAccess	= convert(int,d.Flags & 8),
            PollAccess		= convert(int,d.Flags & 16),
            VoteAccess		= convert(int,d.Flags & 32),
            ModeratorAccess	= convert(int,d.Flags & 64),
            EditAccess		= convert(int,d.Flags & 128),
            DeleteAccess	= convert(int,d.Flags & 256),
            UploadAccess	= convert(int,d.Flags & 512),
            DownloadAccess	= convert(int,d.Flags & 1024),
            AdminGroup		= convert(int,e.Flags & 1)
        from
            [dbo].[yaf_UserGroup] b
            INNER JOIN [dbo].[yaf_ForumAccess] c on c.GroupID=b.GroupID
            INNER JOIN [dbo].[yaf_AccessMask] d on d.AccessMaskID=c.AccessMaskID
            INNER JOIN [dbo].[yaf_Group] e on e.GroupID=b.GroupID
GO
SET ARITHABORT ON
GO
SET CONCAT_NULL_YIELDS_NULL ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_WARNINGS ON
GO
SET NUMERIC_ROUNDABORT OFF
GO
CREATE UNIQUE CLUSTERED INDEX [yaf_vaccess_group_UserForum_PK] ON [dbo].[yaf_vaccess_group] 
(
	[UserID] ASC,
	[ForumID] ASC,
	[AccessMaskID] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[yaf_vaccessfull]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[yaf_vaccessfull]
WITH SCHEMABINDING
AS

select 
            UserID,
            ForumID,
                      MAX(ReadAccess) AS ReadAccess, MAX(PostAccess) AS PostAccess, MAX(ReplyAccess) AS ReplyAccess, MAX(PriorityAccess) AS PriorityAccess, 
                      MAX(PollAccess) AS PollAccess, MAX(VoteAccess) AS VoteAccess, MAX(ModeratorAccess) AS ModeratorAccess, MAX(EditAccess) AS EditAccess, 
                      MAX(DeleteAccess) AS DeleteAccess, MAX(UploadAccess) AS UploadAccess, MAX(DownloadAccess) AS DownloadAccess, MAX(AdminGroup) as AdminGroup
        FROM (
        select
            UserID,
            ForumID,
            ReadAccess		,
            PostAccess		,
            ReplyAccess		,
            PriorityAccess	,
            PollAccess		,
            VoteAccess		,
            ModeratorAccess	,
            EditAccess		,
            DeleteAccess	,
            UploadAccess	,
            DownloadAccess	,
            AdminGroup		
        from
            [dbo].[yaf_vaccess_user] b
        
        union all
        
        select
            UserID,
            ForumID,
            ReadAccess		,
            PostAccess		,
            ReplyAccess		,
            PriorityAccess	,
            PollAccess		,
            VoteAccess		,
            ModeratorAccess	,
            EditAccess		,
            DeleteAccess	,
            UploadAccess	,
            DownloadAccess	,
            AdminGroup	
        from
            [dbo].[yaf_vaccess_group] b

        union all

        select
            UserID,
            ForumID,
            ReadAccess		,
            PostAccess		,
            ReplyAccess		,
            PriorityAccess	,
            PollAccess		,
            VoteAccess		,
            ModeratorAccess	,
            EditAccess		,
            DeleteAccess	,
            UploadAccess	,
            DownloadAccess	,
            AdminGroup	
        from
            [dbo].[yaf_vaccess_null] b
) access
    GROUP BY
        UserID,ForumID
GO
/****** Object:  View [dbo].[yaf_vaccess]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  View [dbo].[yaf_vaccess]    Script Date: 09/28/2009 22:26:00 ******/
CREATE VIEW [dbo].[yaf_vaccess]
AS
    SELECT
        UserID				= a.UserID,
        ForumID				= x.ForumID,
        IsAdmin				= max(convert(int,b.Flags & 1)),
        IsForumModerator	= max(convert(int,b.Flags & 8)),
        IsModerator			= (select count(1) from [dbo].[yaf_UserGroup] v,[dbo].[yaf_Group] w,[dbo].[yaf_ForumAccess] x,[dbo].[yaf_AccessMask] y where v.UserID=a.UserID and w.GroupID=v.GroupID and x.GroupID=w.GroupID and y.AccessMaskID=x.AccessMaskID and (y.Flags & 64)<>0),
        ReadAccess			= max(x.ReadAccess),
        PostAccess			= max(x.PostAccess),
        ReplyAccess			= max(x.ReplyAccess),
        PriorityAccess		= max(x.PriorityAccess),
        PollAccess			= max(x.PollAccess),
        VoteAccess			= max(x.VoteAccess),
        ModeratorAccess		= max(x.ModeratorAccess),
        EditAccess			= max(x.EditAccess),
        DeleteAccess		= max(x.DeleteAccess),
        UploadAccess		= max(x.UploadAccess),		
        DownloadAccess		= max(x.DownloadAccess)			
    FROM
        [dbo].[yaf_vaccessfull] as x WITH(NOLOCK)
        INNER JOIN [dbo].[yaf_UserGroup] a WITH(NOLOCK) on a.UserID=x.UserID
        INNER JOIN [dbo].[yaf_Group] b WITH(NOLOCK) on b.GroupID=a.GroupID
    GROUP BY
        a.UserID,x.ForumID
GO
/****** Object:  StoredProcedure [dbo].[yaf_pageaccess]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_pageaccess](
    @BoardID int,
    @UserID	int,
    @IsGuest bit,
    @UTCTIMESTAMP datetime
) as
begin
    -- ensure that access right are in place		
        if not exists (select top 1
            UserID	
            from [dbo].[yaf_ActiveAccess] WITH(NOLOCK) 
            where UserID = @UserID )		
            begin
            insert into [dbo].[yaf_ActiveAccess](
            UserID,
            BoardID,
            ForumID,
            IsAdmin, 
            IsForumModerator,
            IsModerator,
            IsGuestX,
            LastActive, 
            ReadAccess,
            PostAccess,
            ReplyAccess,
            PriorityAccess,
            PollAccess,
            VoteAccess,	
            ModeratorAccess,
            EditAccess,
            DeleteAccess,
            UploadAccess,
            DownloadAccess)
            select 
            UserID, 
            @BoardID, 
            ForumID, 
            IsAdmin,
            IsForumModerator,
            IsModerator,
            @IsGuest,
            @UTCTIMESTAMP,
            ReadAccess,
            (CONVERT([bit],sign([PostAccess]&(2)),(0))),
            ReplyAccess,
            PriorityAccess,
            PollAccess,
            VoteAccess,
            ModeratorAccess,
            EditAccess,
            DeleteAccess,
            UploadAccess,
            DownloadAccess			
            from [dbo].[yaf_vaccess] 
            where UserID = @UserID 
            end
    -- return information
    select   
        x.*
    from
     [dbo].[yaf_ActiveAccess] x  with(nolock)
    where
        x.UserID = @UserID
end
GO
/****** Object:  UserDefinedFunction [dbo].[yaf_forum_lastposted]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[yaf_forum_lastposted] 

(	
    @ForumID int,
    @UserID int = null,
    @LastTopicID int = null,
    @LastPosted datetime = null
)
RETURNS @LastPostInForum TABLE 
(
    LastTopicID int,
    LastPosted datetime
)
AS
BEGIN
    -- local variables for temporary values
    declare @SubforumID int
    declare @TopicID int
    declare @Posted datetime

    -- try to retrieve last direct topic posed in forums if not supplied as argument 
    if (@LastTopicID is null or @LastPosted is null) BEGIN
        IF (@UserID IS NULL)
        BEGIN	
                SELECT TOP 1 
                    @LastTopicID=a.LastTopicID,
                    @LastPosted=a.LastPosted
                FROM
                    [dbo].[yaf_Forum] a WITH(NOLOCK)
                    INNER JOIN [dbo].[yaf_ActiveAccess] x WITH(NOLOCK) ON a.ForumID=x.ForumID
                WHERE
                    a.ForumID = @ForumID AND a.IsHidden = 0
        END			
        ELSE
        BEGIN	
                SELECT TOP 1
                    @LastTopicID=a.LastTopicID,
                    @LastPosted=a.LastPosted
                FROM
                    [dbo].[yaf_Forum] a WITH(NOLOCK)
                    INNER JOIN [dbo].[yaf_ActiveAccess] x WITH(NOLOCK) ON a.ForumID=x.ForumID
                WHERE
                    (a.IsHidden = 0 or x.ReadAccess <> 0) AND a.ForumID=@ForumID and x.UserID=@UserID
        END	
    END

    -- look for newer topic/message in subforums
    if exists(select 1 from [dbo].[yaf_Forum] where ParentID=@ForumID)

    begin
        declare c cursor FORWARD_ONLY READ_ONLY for
            SELECT
                a.ForumID,
                a.LastTopicID,
                a.LastPosted
            FROM
                [dbo].[yaf_Forum] a WITH(NOLOCK)
                JOIN [dbo].[yaf_ActiveAccess] x WITH(NOLOCK) ON a.ForumID=x.ForumID
            WHERE
                a.ParentID=@ForumID and
                (					
                    (x.UserID=@UserID and ((a.Flags & 2)=0 or x.ReadAccess<>0))
                )	
            UNION			
            SELECT
                a.ForumID,
                a.LastTopicID,
                a.LastPosted
            FROM
                [dbo].[yaf_Forum] a WITH(NOLOCK)
                JOIN [dbo].[yaf_ActiveAccess]x WITH(NOLOCK) ON a.ForumID=x.ForumID
            WHERE
                a.ParentID=@ForumID and
                (					
                    (@UserID is null and (a.Flags & 2)=0)
                )
            
        open c
        
        -- cycle through subforums
        fetch next from c into @SubforumID, @TopicID, @Posted
        while @@FETCH_STATUS = 0
        begin
            -- get last topic/message info for subforum
            SELECT 
                @TopicID = LastTopicID,
                @Posted = LastPosted
            FROM
                [dbo].[yaf_forum_lastposted](@SubforumID, @UserID, @TopicID, @Posted)


            -- if subforum has newer topic/message, make it last for parent forum
            if (@TopicID is not null and @Posted is not null and @LastPosted < @Posted) begin
                SET @LastTopicID = @TopicID
                SET @LastPosted = @Posted
            end

            fetch next from c into @SubforumID, @TopicID, @Posted
        end
        close c
        deallocate c
    end

    -- return vector
    INSERT @LastPostInForum
    SELECT 
        @LastTopicID,
        @LastPosted
    RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[yaf_forum_lasttopic]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[yaf_forum_lasttopic] 

(	
    @ForumID int,
    @UserID int = null,
    @LastTopicID int = null,
    @LastPosted datetime = null
) RETURNS int AS
BEGIN
    -- local variables for temporary values
    declare @SubforumID int
    declare @TopicID int
    declare @Posted datetime

    -- try to retrieve last direct topic posed in forums if not supplied as argument 
    if (@LastTopicID is null or @LastPosted is null) BEGIN
        IF (@UserID IS NULL)
        BEGIN	
                SELECT TOP 1 
                    @LastTopicID=a.LastTopicID,
                    @LastPosted=a.LastPosted
                FROM
                    [dbo].[yaf_Forum] a WITH(NOLOCK)
                    INNER JOIN [dbo].[yaf_ActiveAccess] x WITH(NOLOCK) ON a.ForumID=x.ForumID
                WHERE
                    a.ForumID = @ForumID AND a.IsHidden = 0
        END			
        ELSE
        BEGIN	
                SELECT TOP 1
                    @LastTopicID=a.LastTopicID,
                    @LastPosted=a.LastPosted
                FROM
                    [dbo].[yaf_Forum] a WITH(NOLOCK)
                    INNER JOIN [dbo].[yaf_ActiveAccess] x WITH(NOLOCK) ON a.ForumID=x.ForumID
                WHERE
                    (a.IsHidden = 0 or x.ReadAccess <> 0) AND a.ForumID=@ForumID and x.UserID=@UserID
        END	
    END

    -- look for newer topic/message in subforums
    if exists(select 1 from [dbo].[yaf_Forum] where ParentID=@ForumID)
    begin
        declare c cursor FORWARD_ONLY READ_ONLY for
            SELECT
                a.ForumID,
                a.LastTopicID,
                a.LastPosted
            FROM
                [dbo].[yaf_Forum] a WITH(NOLOCK)
                JOIN [dbo].[yaf_ActiveAccess] x WITH(NOLOCK) ON a.ForumID=x.ForumID
            WHERE
                a.ParentID=@ForumID and
                (					
                    (x.UserID=@UserID and ((a.Flags & 2)=0 or x.ReadAccess<>0))
                )	
            UNION			
            SELECT
                a.ForumID,
                a.LastTopicID,
                a.LastPosted
            FROM
                [dbo].[yaf_Forum] a WITH(NOLOCK)
                JOIN [dbo].[yaf_ActiveAccess]x WITH(NOLOCK) ON a.ForumID=x.ForumID
            WHERE
                a.ParentID=@ForumID and
                (					
                    (@UserID is null and (a.Flags & 2)=0)
                )
            
        open c
        
        -- cycle through subforums
        fetch next from c into @SubforumID, @TopicID, @Posted
        while @@FETCH_STATUS = 0
        begin
            -- get last topic/message info for subforum
            SELECT 
                @TopicID = LastTopicID,
                @Posted = LastPosted
            FROM
                [dbo].[yaf_forum_lastposted](@SubforumID, @UserID, @TopicID, @Posted)


            -- if subforum has newer topic/message, make it last for parent forum
            if (@TopicID is not null and @Posted is not null and @LastPosted < @Posted) begin
                SET @LastTopicID = @TopicID
                SET @LastPosted = @Posted
            end
            -- workaround to avoid logical expressions with NULL possible differences through SQL server versions. 
            if (@TopicID is not null and @Posted is not null and @LastPosted is null) begin
                SET @LastTopicID = @TopicID
                SET @LastPosted = @Posted
            end	

            fetch next from c into @SubforumID, @TopicID, @Posted
        end
        close c
        deallocate c
    end

    -- return id of topic with last message in this forum or its subforums
    RETURN @LastTopicID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_activeaccess_reset]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_activeaccess_reset] 
as
begin
delete from [dbo].[yaf_Active];
delete from [dbo].[yaf_ActiveAccess];
end
GO
/****** Object:  Table [dbo].[yaf_prov_Profile]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_prov_Profile](
	[UserID] [nvarchar](64) NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[Gender] [int] NULL,
	[Blog] [nvarchar](255) NULL,
	[RealName] [nvarchar](255) NULL,
	[Interests] [nvarchar](400) NULL,
	[Skype] [nvarchar](255) NULL,
	[Facebook] [nvarchar](400) NULL,
	[Location] [nvarchar](255) NULL,
	[BlogServiceUrl] [nvarchar](255) NULL,
	[Birthday] [datetime] NULL,
	[LastSyncedWithDNN] [datetime] NULL,
	[ICQ] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[MSN] [nvarchar](255) NULL,
	[TwitterId] [nvarchar](400) NULL,
	[Twitter] [nvarchar](400) NULL,
	[BlogServicePassword] [nvarchar](255) NULL,
	[Country] [nvarchar](2) NULL,
	[Occupation] [nvarchar](400) NULL,
	[Region] [nvarchar](255) NULL,
	[AIM] [nvarchar](255) NULL,
	[XMPP] [nvarchar](255) NULL,
	[YIM] [nvarchar](255) NULL,
	[Google] [nvarchar](400) NULL,
	[BlogServiceUsername] [nvarchar](255) NULL,
	[GoogleId] [nvarchar](255) NULL,
	[Homepage] [nvarchar](255) NULL,
	[FacebookId] [nvarchar](400) NULL,
 CONSTRAINT [PK_yaf_prov_Profile] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[yaf_prov_Profile] ([UserID], [LastUpdatedDate], [Gender], [Blog], [RealName], [Interests], [Skype], [Facebook], [Location], [BlogServiceUrl], [Birthday], [LastSyncedWithDNN], [ICQ], [City], [MSN], [TwitterId], [Twitter], [BlogServicePassword], [Country], [Occupation], [Region], [AIM], [XMPP], [YIM], [Google], [BlogServiceUsername], [GoogleId], [Homepage], [FacebookId]) VALUES (N'01985175-AE49-4617-B466-3B83564BD95A', CAST(0x0000A45001822AD0 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[yaf_prov_Profile] ([UserID], [LastUpdatedDate], [Gender], [Blog], [RealName], [Interests], [Skype], [Facebook], [Location], [BlogServiceUrl], [Birthday], [LastSyncedWithDNN], [ICQ], [City], [MSN], [TwitterId], [Twitter], [BlogServicePassword], [Country], [Occupation], [Region], [AIM], [XMPP], [YIM], [Google], [BlogServiceUsername], [GoogleId], [Homepage], [FacebookId]) VALUES (N'150C17CA-9684-4282-8CF0-40A9BC084498', CAST(0x0000A4900110FD7A AS DateTime), 0, N'', N'', N'', N'', N'', N'Richmond', N'', CAST(0x0000044700000000 AS DateTime), NULL, N'', N'Watertown', N'', NULL, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', NULL, N'', NULL)
INSERT [dbo].[yaf_prov_Profile] ([UserID], [LastUpdatedDate], [Gender], [Blog], [RealName], [Interests], [Skype], [Facebook], [Location], [BlogServiceUrl], [Birthday], [LastSyncedWithDNN], [ICQ], [City], [MSN], [TwitterId], [Twitter], [BlogServicePassword], [Country], [Occupation], [Region], [AIM], [XMPP], [YIM], [Google], [BlogServiceUsername], [GoogleId], [Homepage], [FacebookId]) VALUES (N'830A901C-FB89-4056-850B-051D0A289053', CAST(0x0000A48E0168A071 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'us', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'google.com', NULL)
INSERT [dbo].[yaf_prov_Profile] ([UserID], [LastUpdatedDate], [Gender], [Blog], [RealName], [Interests], [Skype], [Facebook], [Location], [BlogServiceUrl], [Birthday], [LastSyncedWithDNN], [ICQ], [City], [MSN], [TwitterId], [Twitter], [BlogServicePassword], [Country], [Occupation], [Region], [AIM], [XMPP], [YIM], [Google], [BlogServiceUsername], [GoogleId], [Homepage], [FacebookId]) VALUES (N'A7312CF9-5408-4425-BE56-BE09AE7DFF9C', CAST(0x0000A45101639055 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[yaf_prov_Profile] ([UserID], [LastUpdatedDate], [Gender], [Blog], [RealName], [Interests], [Skype], [Facebook], [Location], [BlogServiceUrl], [Birthday], [LastSyncedWithDNN], [ICQ], [City], [MSN], [TwitterId], [Twitter], [BlogServicePassword], [Country], [Occupation], [Region], [AIM], [XMPP], [YIM], [Google], [BlogServiceUsername], [GoogleId], [Homepage], [FacebookId]) VALUES (N'BB314EBC-BBA2-40EF-A36A-C8C0E9B11088', CAST(0x0000A49900F86C64 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'MNXC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[yaf_prov_Profile] ([UserID], [LastUpdatedDate], [Gender], [Blog], [RealName], [Interests], [Skype], [Facebook], [Location], [BlogServiceUrl], [Birthday], [LastSyncedWithDNN], [ICQ], [City], [MSN], [TwitterId], [Twitter], [BlogServicePassword], [Country], [Occupation], [Region], [AIM], [XMPP], [YIM], [Google], [BlogServiceUsername], [GoogleId], [Homepage], [FacebookId]) VALUES (N'F27FD66E-C250-4D10-8F43-9E5BD282A56C', CAST(0x0000A49600F9CA76 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'Nashville', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
/****** Object:  Table [dbo].[yaf_prov_Membership]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_prov_Membership](
	[UserID] [nvarchar](64) NOT NULL,
	[ApplicationID] [uniqueidentifier] NOT NULL,
	[Username] [nvarchar](256) NOT NULL,
	[UsernameLwd] [nvarchar](256) NOT NULL,
	[Password] [nvarchar](256) NULL,
	[PasswordSalt] [nvarchar](256) NULL,
	[PasswordFormat] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailLwd] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](256) NULL,
	[IsApproved] [bit] NULL,
	[IsLockedOut] [bit] NULL,
	[LastLogin] [datetime] NULL,
	[LastActivity] [datetime] NULL,
	[LastPasswordChange] [datetime] NULL,
	[LastLockOut] [datetime] NULL,
	[FailedPasswordAttempts] [int] NULL,
	[FailedAnswerAttempts] [int] NULL,
	[FailedPasswordWindow] [datetime] NULL,
	[FailedAnswerWindow] [datetime] NULL,
	[Joined] [datetime] NULL,
	[Comment] [ntext] NULL,
 CONSTRAINT [PK_yaf_prov_Membership] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_prov_Membership_ApplicationID] ON [dbo].[yaf_prov_Membership] 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_prov_Membership_Email] ON [dbo].[yaf_prov_Membership] 
(
	[Email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_prov_Membership_Username] ON [dbo].[yaf_prov_Membership] 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[yaf_prov_Membership] ([UserID], [ApplicationID], [Username], [UsernameLwd], [Password], [PasswordSalt], [PasswordFormat], [Email], [EmailLwd], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [LastLogin], [LastActivity], [LastPasswordChange], [LastLockOut], [FailedPasswordAttempts], [FailedAnswerAttempts], [FailedPasswordWindow], [FailedAnswerWindow], [Joined], [Comment]) VALUES (N'01985175-AE49-4617-B466-3B83564BD95A', N'97fde33e-59e5-423e-8a8d-743bd30f5857', N'rhk', N'rhk', N'o3v5C0pOFiS17/TSayxJywfhv5o=', N'mt0hxYGt7CG86IKXr7Ze1A==', N'1', N'rohit.keshwani@padillacrt.com', N'rohit.keshwani@padillacrt.com', NULL, N'', 1, NULL, CAST(0x0000A45001204737 AS DateTime), CAST(0x0000A450018327B7 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A450018224A1 AS DateTime), N'')
INSERT [dbo].[yaf_prov_Membership] ([UserID], [ApplicationID], [Username], [UsernameLwd], [Password], [PasswordSalt], [PasswordFormat], [Email], [EmailLwd], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [LastLogin], [LastActivity], [LastPasswordChange], [LastLockOut], [FailedPasswordAttempts], [FailedAnswerAttempts], [FailedPasswordWindow], [FailedAnswerWindow], [Joined], [Comment]) VALUES (N'122DE33F-497E-4CCC-8719-C6A43945F9CA', N'97fde33e-59e5-423e-8a8d-743bd30f5857', N'admin', N'admin', N'xvJLf3VR8R9rwK4eS5eYMcUKnsQ=', N'mgoLKAFgV9F2KqMyYh/QlA==', N'1', N'info@padillacrt.com', N'info@padillacrt.com', N'Favorite childhood superhero?', N'mwUvylzh86pISoTHnXG7QWOhMSo=', 1, NULL, NULL, CAST(0x0000A499015FD7BC AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A450010FDC42 AS DateTime), NULL)
INSERT [dbo].[yaf_prov_Membership] ([UserID], [ApplicationID], [Username], [UsernameLwd], [Password], [PasswordSalt], [PasswordFormat], [Email], [EmailLwd], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [LastLogin], [LastActivity], [LastPasswordChange], [LastLockOut], [FailedPasswordAttempts], [FailedAnswerAttempts], [FailedPasswordWindow], [FailedAnswerWindow], [Joined], [Comment]) VALUES (N'150C17CA-9684-4282-8CF0-40A9BC084498', N'97fde33e-59e5-423e-8a8d-743bd30f5857', N'ST Project Team', N'st project team', N'n/Lie++UJXvFGRXoYxo5cRENGsQ=', N't81h2uLv1VcnbzgYXtLC3A==', N'1', N'Kathryn.Canning@padillacrt.com', N'kathryn.canning@padillacrt.com', NULL, N'', 1, NULL, CAST(0x0000A48F00AE1D70 AS DateTime), CAST(0x0000A496013F2AA4 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A48F00FFF4BA AS DateTime), N'')
INSERT [dbo].[yaf_prov_Membership] ([UserID], [ApplicationID], [Username], [UsernameLwd], [Password], [PasswordSalt], [PasswordFormat], [Email], [EmailLwd], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [LastLogin], [LastActivity], [LastPasswordChange], [LastLockOut], [FailedPasswordAttempts], [FailedAnswerAttempts], [FailedPasswordWindow], [FailedAnswerWindow], [Joined], [Comment]) VALUES (N'830A901C-FB89-4056-850B-051D0A289053', N'97fde33e-59e5-423e-8a8d-743bd30f5857', N'testModerator', N'testmoderator', N'CmwJ+fMgIVBuPHpUv6OZ5QYnUA8=', N'FIVQSILWa9+bzw3GwdOtfQ==', N'1', N'test@aol.com', N'test@aol.com', N'favorite color', N'5bx4h4bmsvsrlR24Xlb0jvECuAE=', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A48E0168A06E AS DateTime), NULL)
INSERT [dbo].[yaf_prov_Membership] ([UserID], [ApplicationID], [Username], [UsernameLwd], [Password], [PasswordSalt], [PasswordFormat], [Email], [EmailLwd], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [LastLogin], [LastActivity], [LastPasswordChange], [LastLockOut], [FailedPasswordAttempts], [FailedAnswerAttempts], [FailedPasswordWindow], [FailedAnswerWindow], [Joined], [Comment]) VALUES (N'94E43761-8FB3-4F41-A0E2-F44F6D944D08', N'97fde33e-59e5-423e-8a8d-743bd30f5857', N'lachermollie', N'lachermollie', N'MT5Pl8oMUH9HFsAucCS/kQEGuhY=', N'meXUD/0b+k+wmxMWaPsEKA==', N'1', N'lachermollie@bfusa.com', N'lachermollie@bfusa.com', NULL, N'', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4880102E030 AS DateTime), NULL)
INSERT [dbo].[yaf_prov_Membership] ([UserID], [ApplicationID], [Username], [UsernameLwd], [Password], [PasswordSalt], [PasswordFormat], [Email], [EmailLwd], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [LastLogin], [LastActivity], [LastPasswordChange], [LastLockOut], [FailedPasswordAttempts], [FailedAnswerAttempts], [FailedPasswordWindow], [FailedAnswerWindow], [Joined], [Comment]) VALUES (N'A7312CF9-5408-4425-BE56-BE09AE7DFF9C', N'97fde33e-59e5-423e-8a8d-743bd30f5857', N'testUser', N'testuser', N's0dQUH9XldJR3DjmoWji7QtBXG4=', N'J1HVuPBQMVlsn0EFhip3JQ==', N'1', N'john.flynn@padillacrt.com', N'john.flynn@padillacrt.com', NULL, N'', 1, NULL, CAST(0x0000A48F00C1E2AF AS DateTime), CAST(0x0000A49600EBBF0E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4510163579D AS DateTime), N'')
INSERT [dbo].[yaf_prov_Membership] ([UserID], [ApplicationID], [Username], [UsernameLwd], [Password], [PasswordSalt], [PasswordFormat], [Email], [EmailLwd], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [LastLogin], [LastActivity], [LastPasswordChange], [LastLockOut], [FailedPasswordAttempts], [FailedAnswerAttempts], [FailedPasswordWindow], [FailedAnswerWindow], [Joined], [Comment]) VALUES (N'AAE4EC56-4328-44A4-99A4-0FCF41A96CDA', N'97fde33e-59e5-423e-8a8d-743bd30f5857', N'Poakley', N'poakley', N'1FiwxlT8xoGm0lnHfdXDhZbPbLU=', N'NgruqzCF0I8MLErX+kTmOw==', N'1', N'oakleypaul@bfusa.com', N'oakleypaul@bfusa.com', NULL, N'', 1, NULL, CAST(0x0000A49600AC811A AS DateTime), CAST(0x0000A49600FEE6DA AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4880102E40C AS DateTime), N'')
INSERT [dbo].[yaf_prov_Membership] ([UserID], [ApplicationID], [Username], [UsernameLwd], [Password], [PasswordSalt], [PasswordFormat], [Email], [EmailLwd], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [LastLogin], [LastActivity], [LastPasswordChange], [LastLockOut], [FailedPasswordAttempts], [FailedAnswerAttempts], [FailedPasswordWindow], [FailedAnswerWindow], [Joined], [Comment]) VALUES (N'BB314EBC-BBA2-40EF-A36A-C8C0E9B11088', N'97fde33e-59e5-423e-8a8d-743bd30f5857', N'jborisx', N'jborisx', N'i+8CQs0EO+JFOQW9W6KZSjNIn94=', N'yRugBJfL+/PwLam5TWxKVA==', N'1', N'jack.boris@padillacrt.com', N'jack.boris@padillacrt.com', NULL, N'', 1, NULL, CAST(0x0000A49900A61BE7 AS DateTime), CAST(0x0000A49900F881A7 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A49900F866B6 AS DateTime), N'')
INSERT [dbo].[yaf_prov_Membership] ([UserID], [ApplicationID], [Username], [UsernameLwd], [Password], [PasswordSalt], [PasswordFormat], [Email], [EmailLwd], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [LastLogin], [LastActivity], [LastPasswordChange], [LastLockOut], [FailedPasswordAttempts], [FailedAnswerAttempts], [FailedPasswordWindow], [FailedAnswerWindow], [Joined], [Comment]) VALUES (N'F27FD66E-C250-4D10-8F43-9E5BD282A56C', N'97fde33e-59e5-423e-8a8d-743bd30f5857', N'woodhullwes', N'woodhullwes', N'H9JF2eTJdRzfn+A5SsiJjEEK6p4=', N'LUaoD2v82rmi51jZpHFVwg==', N'1', N'woodhullwes@bfusa.com', N'woodhullwes@bfusa.com', NULL, N'', 1, NULL, CAST(0x0000A49600A7752D AS DateTime), CAST(0x0000A49600FA599A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A49600F9C135 AS DateTime), N'')
/****** Object:  Table [dbo].[yaf_prov_Application]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_prov_Application](
	[ApplicationID] [uniqueidentifier] NOT NULL,
	[ApplicationName] [nvarchar](256) NULL,
	[ApplicationNameLwd] [nvarchar](256) NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_yaf_prov_Application] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_prov_Application_Name] ON [dbo].[yaf_prov_Application] 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[yaf_prov_Application] ([ApplicationID], [ApplicationName], [ApplicationNameLwd], [Description]) VALUES (N'97fde33e-59e5-423e-8a8d-743bd30f5857', N'YetAnotherForum', N'yetanotherforum', NULL)
/****** Object:  Table [dbo].[yaf_prov_Role]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_prov_Role](
	[RoleID] [uniqueidentifier] NOT NULL,
	[ApplicationID] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[RoleNameLwd] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_yaf_prov_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_prov_Role_ApplicationID] ON [dbo].[yaf_prov_Role] 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_prov_Role_Name] ON [dbo].[yaf_prov_Role] 
(
	[RoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[yaf_prov_Role] ([RoleID], [ApplicationID], [RoleName], [RoleNameLwd]) VALUES (N'2b3965aa-f139-400f-8020-5119e68a2464', N'97fde33e-59e5-423e-8a8d-743bd30f5857', N'ForumModeratorRole1', N'forummoderatorrole1')
INSERT [dbo].[yaf_prov_Role] ([RoleID], [ApplicationID], [RoleName], [RoleNameLwd]) VALUES (N'96b7af44-ad42-4f38-820c-614183a1bc52', N'97fde33e-59e5-423e-8a8d-743bd30f5857', N'Administrators', N'administrators')
INSERT [dbo].[yaf_prov_Role] ([RoleID], [ApplicationID], [RoleName], [RoleNameLwd]) VALUES (N'dcb9a9ea-7fcd-4235-9f68-f1743b8c092c', N'97fde33e-59e5-423e-8a8d-743bd30f5857', N'Registered', N'registered')
/****** Object:  Table [dbo].[yaf_prov_RoleMembership]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_prov_RoleMembership](
	[RoleID] [uniqueidentifier] NOT NULL,
	[UserID] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_yaf_prov_RoleMembership] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_prov_RoleMembership_RoleID] ON [dbo].[yaf_prov_RoleMembership] 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_prov_RoleMembership_UserID] ON [dbo].[yaf_prov_RoleMembership] 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[yaf_prov_RoleMembership] ([RoleID], [UserID]) VALUES (N'985c3fa5-88e7-4b35-8204-04f8107933f9', N'01985175-AE49-4617-B466-3B83564BD95A')
INSERT [dbo].[yaf_prov_RoleMembership] ([RoleID], [UserID]) VALUES (N'f45064c5-f640-4dc4-9594-8c6f8360a843', N'01985175-AE49-4617-B466-3B83564BD95A')
INSERT [dbo].[yaf_prov_RoleMembership] ([RoleID], [UserID]) VALUES (N'96b7af44-ad42-4f38-820c-614183a1bc52', N'122DE33F-497E-4CCC-8719-C6A43945F9CA')
INSERT [dbo].[yaf_prov_RoleMembership] ([RoleID], [UserID]) VALUES (N'2b3965aa-f139-400f-8020-5119e68a2464', N'150C17CA-9684-4282-8CF0-40A9BC084498')
INSERT [dbo].[yaf_prov_RoleMembership] ([RoleID], [UserID]) VALUES (N'dcb9a9ea-7fcd-4235-9f68-f1743b8c092c', N'830A901C-FB89-4056-850B-051D0A289053')
INSERT [dbo].[yaf_prov_RoleMembership] ([RoleID], [UserID]) VALUES (N'985c3fa5-88e7-4b35-8204-04f8107933f9', N'94E43761-8FB3-4F41-A0E2-F44F6D944D08')
INSERT [dbo].[yaf_prov_RoleMembership] ([RoleID], [UserID]) VALUES (N'f45064c5-f640-4dc4-9594-8c6f8360a843', N'94E43761-8FB3-4F41-A0E2-F44F6D944D08')
INSERT [dbo].[yaf_prov_RoleMembership] ([RoleID], [UserID]) VALUES (N'985c3fa5-88e7-4b35-8204-04f8107933f9', N'A7312CF9-5408-4425-BE56-BE09AE7DFF9C')
INSERT [dbo].[yaf_prov_RoleMembership] ([RoleID], [UserID]) VALUES (N'f45064c5-f640-4dc4-9594-8c6f8360a843', N'A7312CF9-5408-4425-BE56-BE09AE7DFF9C')
INSERT [dbo].[yaf_prov_RoleMembership] ([RoleID], [UserID]) VALUES (N'dcb9a9ea-7fcd-4235-9f68-f1743b8c092c', N'A7312CF9-5408-4425-BE56-BE09AE7DFF9C')
INSERT [dbo].[yaf_prov_RoleMembership] ([RoleID], [UserID]) VALUES (N'985c3fa5-88e7-4b35-8204-04f8107933f9', N'AAE4EC56-4328-44A4-99A4-0FCF41A96CDA')
INSERT [dbo].[yaf_prov_RoleMembership] ([RoleID], [UserID]) VALUES (N'f45064c5-f640-4dc4-9594-8c6f8360a843', N'AAE4EC56-4328-44A4-99A4-0FCF41A96CDA')
INSERT [dbo].[yaf_prov_RoleMembership] ([RoleID], [UserID]) VALUES (N'dcb9a9ea-7fcd-4235-9f68-f1743b8c092c', N'BB314EBC-BBA2-40EF-A36A-C8C0E9B11088')
INSERT [dbo].[yaf_prov_RoleMembership] ([RoleID], [UserID]) VALUES (N'dcb9a9ea-7fcd-4235-9f68-f1743b8c092c', N'F27FD66E-C250-4D10-8F43-9E5BD282A56C')
/****** Object:  Table [dbo].[yaf_Replace_Words]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_Replace_Words](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BoardId] [int] NOT NULL,
	[BadWord] [nvarchar](255) NULL,
	[GoodWord] [nvarchar](255) NULL,
 CONSTRAINT [PK_yaf_Replace_Words] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[yaf_Replace_Words] ON
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (1, 1, N'ahole ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (2, 1, N'anus ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (3, 1, N'ash0le ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (4, 1, N'ash0les ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (5, 1, N'asholes ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (6, 1, N'Ass Monkey ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (7, 1, N'Assface ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (8, 1, N'assh0le ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (9, 1, N'assh0lez ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (10, 1, N'asshole ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (11, 1, N'assholes ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (12, 1, N'assholz ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (13, 1, N'asswipe ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (14, 1, N'azzhole ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (15, 1, N'bassterds ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (16, 1, N'bastard ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (17, 1, N'bastards ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (18, 1, N'bastardz ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (19, 1, N'basterds ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (20, 1, N'basterdz ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (21, 1, N'Biatch ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (22, 1, N'bitch ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (23, 1, N'bitches ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (24, 1, N'Blow Job ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (25, 1, N'boffing ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (26, 1, N'butthole ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (27, 1, N'buttwipe ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (28, 1, N'c0ck ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (29, 1, N'c0cks ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (30, 1, N'c0k ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (31, 1, N'Carpet Muncher ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (32, 1, N'cawk ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (33, 1, N'cawks ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (34, 1, N'cnts ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (35, 1, N'cntz ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (36, 1, N'cockhead ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (37, 1, N'cock-head ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (38, 1, N'cocks ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (39, 1, N'CockSucker ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (40, 1, N'cock-sucker ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (41, 1, N'crap ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (42, 1, N'cunt ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (43, 1, N'cunts ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (44, 1, N'cuntz ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (45, 1, N'dick ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (46, 1, N'dild0 ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (47, 1, N'dild0s ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (48, 1, N'dildo ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (49, 1, N'dildos ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (50, 1, N'dilld0 ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (51, 1, N'dilld0s ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (52, 1, N'dominatricks ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (53, 1, N'dominatrics ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (54, 1, N'dominatrix ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (55, 1, N'dyke ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (56, 1, N'enema ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (57, 1, N'fag ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (58, 1, N'fag1t ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (59, 1, N'faget ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (60, 1, N'fagg1t ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (61, 1, N'faggit ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (62, 1, N'faggot ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (63, 1, N'fagit ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (64, 1, N'fags ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (65, 1, N'fagz ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (66, 1, N'faig ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (67, 1, N'faigs ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (68, 1, N'fart ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (69, 1, N'flipping the bird ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (70, 1, N'fuck ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (71, 1, N'fucker ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (72, 1, N'fuckin ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (73, 1, N'fucking ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (74, 1, N'fucks ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (75, 1, N'Fudge Packer ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (76, 1, N'fuk ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (77, 1, N'Fukah ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (78, 1, N'Fuken ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (79, 1, N'fuker ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (80, 1, N'Fukin ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (81, 1, N'Fukk ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (82, 1, N'Fukkah ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (83, 1, N'Fukken ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (84, 1, N'Fukker ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (85, 1, N'Fukkin ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (86, 1, N'g00k ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (87, 1, N'gayboy ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (88, 1, N'gaygirl ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (89, 1, N'gays ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (90, 1, N'gayz ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (91, 1, N'God-damned ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (92, 1, N'h00r ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (93, 1, N'h0ar ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (94, 1, N'h0re ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (95, 1, N'hoar ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (96, 1, N'hoor ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (97, 1, N'hoore ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (98, 1, N'jackoff ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (99, 1, N'jap ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (100, 1, N'japs ', N'[censored]')
GO
print 'Processed 100 total records'
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (101, 1, N'jerk-off ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (102, 1, N'jisim ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (103, 1, N'jiss ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (104, 1, N'jizm ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (105, 1, N'jizz ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (106, 1, N'knobz ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (107, 1, N'kunt ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (108, 1, N'kunts ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (109, 1, N'kuntz ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (110, 1, N'Lesbian ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (111, 1, N'Lezzian ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (112, 1, N'Lipshits ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (113, 1, N'Lipshitz ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (114, 1, N'masochist ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (115, 1, N'masokist ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (116, 1, N'massterbait ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (117, 1, N'masstrbait ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (118, 1, N'masstrbate ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (119, 1, N'masterbaiter ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (120, 1, N'masterbate ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (121, 1, N'masterbates ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (122, 1, N'Motha Fucker ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (123, 1, N'Motha Fuker ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (124, 1, N'Motha Fukkah ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (125, 1, N'Motha Fukker ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (126, 1, N'Mother Fucker ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (127, 1, N'Mother Fukah ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (128, 1, N'Mother Fuker ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (129, 1, N'Mother Fukkah ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (130, 1, N'Mother Fukker ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (131, 1, N'mother-fucker ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (132, 1, N'Mutha Fucker ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (133, 1, N'Mutha Fukah ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (134, 1, N'Mutha Fuker ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (135, 1, N'Mutha Fukkah ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (136, 1, N'Mutha Fukker ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (137, 1, N'n1gr ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (138, 1, N'nastt ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (139, 1, N'nigger ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (140, 1, N'nigur ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (141, 1, N'niiger ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (142, 1, N'niigr ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (143, 1, N'orafis ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (144, 1, N'orgasim ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (145, 1, N'orgasm ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (146, 1, N'orgasum ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (147, 1, N'oriface ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (148, 1, N'orifice ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (149, 1, N'orifiss ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (150, 1, N'packi ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (151, 1, N'packie ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (152, 1, N'packy ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (153, 1, N'paki ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (154, 1, N'pakie ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (155, 1, N'paky ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (156, 1, N'pecker ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (157, 1, N'peeenus ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (158, 1, N'peeenusss ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (159, 1, N'peenus ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (160, 1, N'peinus ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (161, 1, N'pen1s ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (162, 1, N'penas ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (163, 1, N'penis ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (164, 1, N'penis-breath ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (165, 1, N'penus ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (166, 1, N'penuus ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (167, 1, N'Phuc ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (168, 1, N'Phuck ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (169, 1, N'Phuk ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (170, 1, N'Phuker ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (171, 1, N'Phukker ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (172, 1, N'polac ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (173, 1, N'polack ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (174, 1, N'polak ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (175, 1, N'Poonani ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (176, 1, N'pr1c ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (177, 1, N'pr1ck ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (178, 1, N'pr1k ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (179, 1, N'pusse ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (180, 1, N'pussee ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (181, 1, N'pussy ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (182, 1, N'puuke ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (183, 1, N'puuker ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (184, 1, N'queer ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (185, 1, N'queers ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (186, 1, N'queerz ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (187, 1, N'qweers ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (188, 1, N'qweerz ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (189, 1, N'qweir ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (190, 1, N'recktum ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (191, 1, N'rectum ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (192, 1, N'retard ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (193, 1, N'sadist ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (194, 1, N'scank ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (195, 1, N'schlong ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (196, 1, N'screwing ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (197, 1, N'semen ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (198, 1, N'\bsex ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (199, 1, N'sexy ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (200, 1, N'Sh!t ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (201, 1, N'sh1t ', N'[censored]')
GO
print 'Processed 200 total records'
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (202, 1, N'sh1ter ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (203, 1, N'sh1ts ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (204, 1, N'sh1tter ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (205, 1, N'sh1tz ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (206, 1, N'shit ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (207, 1, N'shits ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (208, 1, N'shitter ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (209, 1, N'Shitty ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (210, 1, N'Shity ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (211, 1, N'shitz ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (212, 1, N'Shyt ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (213, 1, N'Shyte ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (214, 1, N'Shytty ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (215, 1, N'Shyty ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (216, 1, N'skanck ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (217, 1, N'skank ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (218, 1, N'skankee ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (219, 1, N'skankey ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (220, 1, N'skanks ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (221, 1, N'Skanky ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (222, 1, N'\bslut ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (223, 1, N'Slutty ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (224, 1, N'son-of-a-bitch ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (225, 1, N'turd ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (226, 1, N'va1jina ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (227, 1, N'vag1na ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (228, 1, N'vagiina ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (229, 1, N'vagina ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (230, 1, N'vaj1na ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (231, 1, N'vajina ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (232, 1, N'vullva ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (233, 1, N'vulva ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (234, 1, N'w0p ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (235, 1, N'wh00r ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (236, 1, N'wh0re ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (237, 1, N'whore ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (238, 1, N'xrated ', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (239, 1, N'xxx', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (240, 1, N'b!+ch', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (241, 1, N'bitch', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (242, 1, N'blowjob', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (243, 1, N'clit', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (244, 1, N'arschloch', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (245, 1, N'fuck', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (246, 1, N'asshole', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (247, 1, N'b!tch', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (248, 1, N'b17ch', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (249, 1, N'b1tch', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (250, 1, N'bastard', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (251, 1, N'bi+ch', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (252, 1, N'boiolas', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (253, 1, N'buceta', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (254, 1, N'c0ck', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (255, 1, N'cawk', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (256, 1, N'chink', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (257, 1, N'clits', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (258, 1, N'cock', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (259, 1, N'cunt', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (260, 1, N'dildo', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (261, 1, N'dirsa', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (262, 1, N'ejakulate', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (263, 1, N'fatass', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (264, 1, N'fcuk', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (265, 1, N'fuk', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (266, 1, N'fux0r', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (267, 1, N'hoer', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (268, 1, N'\bhore', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (269, 1, N'jism', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (270, 1, N'kawk', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (271, 1, N'l3itch', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (272, 1, N'l3i+ch', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (273, 1, N'lesbian', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (274, 1, N'masturbate', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (275, 1, N'masterbat*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (276, 1, N'masterbat3', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (277, 1, N'motherfucker', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (278, 1, N's.o.b.', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (279, 1, N'mofo', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (280, 1, N'nazi', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (281, 1, N'nigga', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (282, 1, N'nigger', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (283, 1, N'nutsack', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (284, 1, N'phuck', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (285, 1, N'pimpis', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (286, 1, N'pusse', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (287, 1, N'pussy', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (288, 1, N'scrotum', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (289, 1, N'sh!t', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (290, 1, N'shemale', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (291, 1, N'slut', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (292, 1, N'smut', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (293, 1, N'teets', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (294, 1, N'tits', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (295, 1, N'boobs', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (296, 1, N'b00bs', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (297, 1, N'teez', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (298, 1, N'testical', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (299, 1, N'testicle', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (300, 1, N'titt', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (301, 1, N'w00se', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (302, 1, N'jackoff', N'[censored]')
GO
print 'Processed 300 total records'
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (303, 1, N'wank', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (304, 1, N'whoar', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (305, 1, N'whore', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (306, 1, N'*dyke', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (307, 1, N'@$$', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (308, 1, N'amcik', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (309, 1, N'andskota', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (310, 1, N'\barse*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (311, 1, N'assrammer', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (312, 1, N'ayir', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (313, 1, N'bi7ch', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (314, 1, N'bitch*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (315, 1, N'bollock*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (316, 1, N'breasts', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (317, 1, N'butt-pirate', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (318, 1, N'cabron', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (319, 1, N'cazzo', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (320, 1, N'chraa', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (321, 1, N'chuj', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (322, 1, N'cunt*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (323, 1, N'd4mn', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (324, 1, N'daygo', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (325, 1, N'dego', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (326, 1, N'dupa', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (327, 1, N'dziwka', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (328, 1, N'ejackulate', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (329, 1, N'Ekrem*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (330, 1, N'Ekto', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (331, 1, N'enculer', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (332, 1, N'faen', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (333, 1, N'fanculo', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (334, 1, N'fanny', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (335, 1, N'feces', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (336, 1, N'feg', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (337, 1, N'Felcher', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (338, 1, N'ficken', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (339, 1, N'Flikker', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (340, 1, N'foreskin', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (341, 1, N'Fotze', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (342, 1, N'futkretzn', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (343, 1, N'gay', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (344, 1, N'gook', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (345, 1, N'guiena', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (346, 1, N'h0r', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (347, 1, N'h4x0r', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (348, 1, N'helvete', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (349, 1, N'hoer*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (350, 1, N'honkey', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (351, 1, N'Huevon', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (352, 1, N'hui', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (353, 1, N'injun', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (354, 1, N'jizz', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (355, 1, N'kanker*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (356, 1, N'kike', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (357, 1, N'klootzak', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (358, 1, N'kraut', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (359, 1, N'knulle', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (360, 1, N'kuk', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (361, 1, N'kuksuger', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (362, 1, N'Kurac', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (363, 1, N'kurwa', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (364, 1, N'kusi*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (365, 1, N'kyrpa*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (366, 1, N'lesbo', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (367, 1, N'mamhoon', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (368, 1, N'masturbat*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (369, 1, N'mibun', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (370, 1, N'monkleigh', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (371, 1, N'mouliewop', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (372, 1, N'muie', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (373, 1, N'mulkku', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (374, 1, N'muschi', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (375, 1, N'nazis', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (376, 1, N'nepesaurio', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (377, 1, N'nigger*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (378, 1, N'orospu', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (379, 1, N'paska*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (380, 1, N'pierdol*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (381, 1, N'pillu*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (382, 1, N'pimmel', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (383, 1, N'piss*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (384, 1, N'pizda', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (385, 1, N'poontsee', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (386, 1, N'poop', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (387, 1, N'porn', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (388, 1, N'p0rn', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (389, 1, N'pr0n', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (390, 1, N'qahbeh', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (391, 1, N'queef*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (392, 1, N'rautenberg', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (393, 1, N'schaffer', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (394, 1, N'scheiss*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (395, 1, N'schlampe', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (396, 1, N'schmuck', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (397, 1, N'sh!t*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (398, 1, N'sharmuta', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (399, 1, N'sharmute', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (400, 1, N'shipal', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (401, 1, N'shiz', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (402, 1, N'skribz', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (403, 1, N'skurwysyn', N'[censored]')
GO
print 'Processed 400 total records'
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (404, 1, N'sphencter', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (405, 1, N'\bspic\b', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (406, 1, N'spierdalaj', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (407, 1, N'splooge', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (408, 1, N'suka', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (409, 1, N'b00b*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (410, 1, N'testicle*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (411, 1, N'twat', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (412, 1, N'vittu', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (413, 1, N'wank*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (414, 1, N'wetback*', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (415, 1, N'wichser', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (416, 1, N'zabourah', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (417, 1, N'\bass', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (418, 1, N'\bcock', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (419, 1, N'\bclit', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (420, 1, N'\bcum', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (421, 1, N'sp1c', N'[censored]')
INSERT [dbo].[yaf_Replace_Words] ([ID], [BoardId], [BadWord], [GoodWord]) VALUES (422, 1, N'bullshit', N'[censored]')
SET IDENTITY_INSERT [dbo].[yaf_Replace_Words] OFF
/****** Object:  Table [dbo].[yaf_PollVoteRefuse]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[yaf_PollVoteRefuse](
	[RefuseID] [int] IDENTITY(1,1) NOT NULL,
	[PollID] [int] NOT NULL,
	[UserID] [int] NULL,
	[RemoteIP] [varchar](57) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[yaf_ShoutboxMessage]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[yaf_ShoutboxMessage](
	[ShoutBoxMessageID] [int] IDENTITY(1,1) NOT NULL,
	[BoardId] [int] NOT NULL,
	[UserID] [int] NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[UserDisplayName] [nvarchar](255) NOT NULL,
	[Message] [ntext] NULL,
	[Date] [datetime] NOT NULL,
	[IP] [varchar](50) NOT NULL,
 CONSTRAINT [PK_yaf_ShoutboxMessage] PRIMARY KEY CLUSTERED 
(
	[ShoutBoxMessageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[yaf_ShoutboxMessage] ON
INSERT [dbo].[yaf_ShoutboxMessage] ([ShoutBoxMessageID], [BoardId], [UserID], [UserName], [UserDisplayName], [Message], [Date], [IP]) VALUES (1, 1, 15, N'jdawg', N'jdawg', N'Anyone home?', CAST(0x0000A45101787C64 AS DateTime), N'206.169.247.189')
INSERT [dbo].[yaf_ShoutboxMessage] ([ShoutBoxMessageID], [BoardId], [UserID], [UserName], [UserDisplayName], [Message], [Date], [IP]) VALUES (2, 1, 15, N'jdawg', N'jdawg', N'Anyone on this forum?', CAST(0x0000A45101788EEF AS DateTime), N'206.169.247.189')
INSERT [dbo].[yaf_ShoutboxMessage] ([ShoutBoxMessageID], [BoardId], [UserID], [UserName], [UserDisplayName], [Message], [Date], [IP]) VALUES (3, 1, 15, N'jdawg', N'jdawg', N'Dammit! Where the hell is everyone?', CAST(0x0000A4510178C7D1 AS DateTime), N'206.169.247.189')
INSERT [dbo].[yaf_ShoutboxMessage] ([ShoutBoxMessageID], [BoardId], [UserID], [UserName], [UserDisplayName], [Message], [Date], [IP]) VALUES (4, 1, 15, N'jdawg', N'jdawg', N'Does this thing fuckin censor?', CAST(0x0000A4510178E3B8 AS DateTime), N'206.169.247.189')
SET IDENTITY_INSERT [dbo].[yaf_ShoutboxMessage] OFF
/****** Object:  Table [dbo].[yaf_Spam_Words]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_Spam_Words](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BoardId] [int] NOT NULL,
	[SpamWord] [nvarchar](255) NULL,
 CONSTRAINT [PK_yaf_Spam_Words] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[yaf_Spam_Words] ON
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (1, 1, N'kitchen.*?co.uk')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (2, 1, N'http://www.cheap-for-jerseys.com/')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (3, 1, N'http://www.wholesalejerseysclub.com/')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (4, 1, N'http://www.allcheapairmax.co.uk/')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (5, 1, N'sportschoenenoutletonlinenl')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (6, 1, N'http://www.conversecanvasshoegermany.com/')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (7, 1, N'http://www.scarpenikesaldiitalia.com')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (8, 1, N'Nike.*?air')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (9, 1, N'http://www.blazerprezzo.com')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (10, 1, N'Nike.*?free')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (11, 1, N'diesel.*?watch')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (12, 1, N'robertsb2000@gmail.com')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (13, 1, N'fake.*?passport')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (14, 1, N'http://nijia.vn/')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (15, 1, N'http://www.umetion.jp/')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (16, 1, N'buy.*?passport')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (17, 1, N'http://support.nitropdf.com/')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (18, 1, N'oz.*?mobile.*?phone')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (19, 1, N'http://blog.livedoor.jp/dentalsale/')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (20, 1, N'http://www.soran.edu.iq/')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (21, 1, N'Pandora.*?bracelets')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (22, 1, N'http://www.silvercharmsdiy.co.uk/')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (23, 1, N'http://twittyup.com')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (24, 1, N'http://www.fifa15coinsok.com/')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (25, 1, N'http://www.onlinexdating.com/')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (26, 1, N'http://www.unionbay.se.com/')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (27, 1, N'http://www.online12monthloans.co.uk/')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (28, 1, N'http://www.quick12monthpaydayloans.co.uk/')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (29, 1, N'http://www.honeysneakers.de/')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (30, 1, N'http://www.e12monthpaydayloans7.co.uk/')
INSERT [dbo].[yaf_Spam_Words] ([ID], [BoardId], [SpamWord]) VALUES (31, 1, N'http://www.moneyonlineinvestment.com/')
SET IDENTITY_INSERT [dbo].[yaf_Spam_Words] OFF
/****** Object:  Table [dbo].[yaf_TopicStatus]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_TopicStatus](
	[TopicStatusID] [int] IDENTITY(1,1) NOT NULL,
	[TopicStatusName] [nvarchar](100) NOT NULL,
	[BoardID] [int] NOT NULL,
	[defaultDescription] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_yaf_TopicStatus] PRIMARY KEY CLUSTERED 
(
	[TopicStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[yaf_TopicStatus] ON
INSERT [dbo].[yaf_TopicStatus] ([TopicStatusID], [TopicStatusName], [BoardID], [defaultDescription]) VALUES (1, N'INFORMATIC', 1, N'Informatic')
INSERT [dbo].[yaf_TopicStatus] ([TopicStatusID], [TopicStatusName], [BoardID], [defaultDescription]) VALUES (2, N'SOLVED', 1, N'Solved')
INSERT [dbo].[yaf_TopicStatus] ([TopicStatusID], [TopicStatusName], [BoardID], [defaultDescription]) VALUES (3, N'QUESTION', 1, N'Question')
INSERT [dbo].[yaf_TopicStatus] ([TopicStatusID], [TopicStatusName], [BoardID], [defaultDescription]) VALUES (4, N'ISSUE', 1, N'Issue')
INSERT [dbo].[yaf_TopicStatus] ([TopicStatusID], [TopicStatusName], [BoardID], [defaultDescription]) VALUES (5, N'FIXED', 1, N'Fixed')
SET IDENTITY_INSERT [dbo].[yaf_TopicStatus] OFF
/****** Object:  UserDefinedFunction [dbo].[yaf_Split]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[yaf_Split]
(
   @sInputList VARCHAR(8000) -- List of delimited items
  , @sDelimiter VARCHAR(8000) = ',' -- delimiter that separates items
) RETURNS @List TABLE (item VARCHAR(8000))

    BEGIN
    DECLARE @sItem VARCHAR(8000)
    WHILE CHARINDEX(@sDelimiter,@sInputList,0) <> 0
     BEGIN
     SELECT
      @sItem=RTRIM(LTRIM(SUBSTRING(@sInputList,1,CHARINDEX(@sDelimiter,@sInputList,0)-1))),
      @sInputList=RTRIM(LTRIM(SUBSTRING(@sInputList,CHARINDEX(@sDelimiter,@sInputList,0)+LEN(@sDelimiter),LEN(@sInputList))))
 
     IF LEN(@sItem) > 0
      INSERT INTO @List SELECT @sItem
     END

    IF LEN(@sInputList) > 0
     INSERT INTO @List SELECT @sInputList -- Put the last item in
    RETURN
    END
GO
/****** Object:  Table [dbo].[yaf_UserAlbum]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_UserAlbum](
	[AlbumID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Title] [nvarchar](255) NULL,
	[CoverImageID] [int] NULL,
	[Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_yaf_User_Album] PRIMARY KEY CLUSTERED 
(
	[AlbumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yaf_UserAlbumImage]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_UserAlbumImage](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[AlbumID] [int] NOT NULL,
	[Caption] [nvarchar](255) NULL,
	[FileName] [nvarchar](255) NOT NULL,
	[Bytes] [int] NOT NULL,
	[ContentType] [nvarchar](50) NULL,
	[Uploaded] [datetime] NOT NULL,
	[Downloads] [int] NOT NULL,
 CONSTRAINT [PK_yaf_User_AlbumImage] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_UserAlbumImage_AlbumID] ON [dbo].[yaf_UserAlbumImage] 
(
	[AlbumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_isuserignored]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_user_isuserignored]
    @UserID int,
    @IgnoredUserId int
AS BEGIN
        IF EXISTS(SELECT * FROM [dbo].[yaf_IgnoreUser] WHERE UserID = @UserID AND IgnoredUserID = @IgnoredUserId)
    BEGIN
        RETURN 1
    END
    ELSE
    BEGIN
        RETURN 0
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_ignoredlist]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_user_ignoredlist]
    @UserID int
AS
BEGIN
        SELECT * FROM [dbo].[yaf_IgnoreUser] WHERE UserID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_removeignoreduser]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_user_removeignoreduser]
    @UserID int,
    @IgnoredUserId int
AS BEGIN
        DELETE FROM [dbo].[yaf_IgnoreUser] WHERE UserID = @UserID AND IgnoredUserID = @IgnoredUserId
    
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_TopicStatus_Save]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_TopicStatus_Save] (@TopicStatusID int=null, @BoardID int, @TopicStatusName nvarchar(100),@DefaultDescription nvarchar(100)) as
begin
        if @TopicStatusID is null or @TopicStatusID = 0 begin
        insert into [dbo].[yaf_TopicStatus] (BoardID,TopicStatusName,DefaultDescription) 
        values(@BoardID,@TopicStatusName,@DefaultDescription)
    end
    else begin
        update [dbo].[yaf_TopicStatus] 
        set TopicStatusName = @TopicStatusName, 
            DefaultDescription = @DefaultDescription
        where TopicStatusID = @TopicStatusID
    end
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_TopicStatus_List]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_TopicStatus_List] (@BoardID int) as
    BEGIN
            SELECT
                *
            FROM
                [dbo].[yaf_TopicStatus]
            WHERE
                BoardID = @BoardID	
            ORDER BY
                TopicStatusID
        END
GO
/****** Object:  StoredProcedure [dbo].[yaf_TopicStatus_Edit]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_TopicStatus_Edit] (@TopicStatusID int) as
BEGIN
    SELECT * 
    FROM [dbo].[yaf_TopicStatus] 
    WHERE 
        TopicStatusID = @TopicStatusID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_TopicStatus_Delete]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_TopicStatus_Delete] (@TopicStatusID int) as
begin
   delete from [dbo].[yaf_TopicStatus] 
    where TopicStatusID = @TopicStatusID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_shoutbox_clearmessages]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_shoutbox_clearmessages]
(
    @BoardId int,
    @UTCTIMESTAMP datetime
)
AS
BEGIN
        DELETE FROM
            [dbo].[yaf_ShoutboxMessage]
        WHERE
            BoardId = @BoardId AND
            DATEDIFF(minute, Date, @UTCTIMESTAMP ) > 1
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_medal_list]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[yaf_medal_list]
    @BoardID	int = null,
    @MedalID	int = null,
    @Category	nvarchar(50) = null
as begin
        if not @MedalID is null begin
        select 
            * 
        from 
            [dbo].[yaf_Medal] 
        where 
            [MedalID]=@MedalID 
        order by 
            [Category] asc, 
            [SortOrder] asc
    end
    else if not @Category is null and not @BoardID is null begin
        select 
            * 
        from 
            [dbo].[yaf_Medal] 
        where 
            [Category]=@Category and [BoardID]=@BoardID
        order by 
            [Category] asc, 
            [SortOrder] asc
    end
    else if not @BoardID is null begin
        select 
            * 
        from 
            [dbo].[yaf_Medal] 
        where 
            [BoardID]=@BoardID
        order by 
            [Category] asc, 
            [SortOrder] asc
    end

end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_addignoreduser]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* User Ignore Procedures */

CREATE PROCEDURE [dbo].[yaf_user_addignoreduser]
    @UserID int,
    @IgnoredUserId int
AS BEGIN
        IF NOT EXISTS (SELECT * FROM [dbo].[yaf_IgnoreUser] WHERE UserID = @UserID AND IgnoredUserID = @IgnoredUserId)
    BEGIN
        INSERT INTO [dbo].[yaf_IgnoreUser] (UserID, IgnoredUserID) VALUES (@UserID, @IgnoredUserId)
    END
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_spam_words_save]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_spam_words_save]
(
    @BoardID int,
    @ID int = null,
    @SpamWord nvarchar(255)
)
AS
BEGIN
        IF (@ID IS NOT NULL AND @ID <> 0)
    BEGIN
        UPDATE [dbo].[yaf_Spam_Words] SET SpamWord = @SpamWord WHERE ID = @ID		
    END
    ELSE BEGIN
        INSERT INTO [dbo].[yaf_Spam_Words]
            (BoardID,SpamWord)
        VALUES
            (@BoardID,@SpamWord)
    END
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_spam_words_list]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_spam_words_list]
(
    @BoardID int,
    @ID int = null
)
AS BEGIN
        IF (@ID IS NOT NULL AND @ID <> 0)
        SELECT * FROM [dbo].[yaf_Spam_Words] WHERE BoardID = @BoardID AND ID = @ID
    ELSE
        SELECT * FROM [dbo].[yaf_Spam_Words] WHERE BoardID = @BoardID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_spam_words_delete]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_spam_words_delete](@ID int) AS
BEGIN
        DELETE FROM [dbo].[yaf_Spam_Words] WHERE ID = @ID
END
GO
/****** Object:  Table [dbo].[yaf_Smiley]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_Smiley](
	[SmileyID] [int] IDENTITY(1,1) NOT NULL,
	[BoardID] [int] NOT NULL,
	[Code] [nvarchar](10) NOT NULL,
	[Icon] [nvarchar](50) NOT NULL,
	[Emoticon] [nvarchar](50) NULL,
	[SortOrder] [tinyint] NOT NULL,
 CONSTRAINT [PK_yaf_Smiley] PRIMARY KEY CLUSTERED 
(
	[SmileyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_yaf_Smiley] UNIQUE NONCLUSTERED 
(
	[BoardID] ASC,
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yaf_Registry]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_Registry](
	[RegistryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Value] [ntext] NULL,
	[BoardID] [int] NULL,
 CONSTRAINT [PK_yaf_Registry] PRIMARY KEY CLUSTERED 
(
	[RegistryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_Registry_Name] ON [dbo].[yaf_Registry] 
(
	[BoardID] ASC,
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[yaf_Registry] ON
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (1, N'version', N'57', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (2, N'versionname', N'2.2.0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (3, N'timezone', N'-360', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (4, N'culture', N'en-US', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (5, N'language', N'english.xml', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (6, N'smtpserver', N'', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (7, N'forumemail', N'BSAShapingTomorrow@bfusa.com', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (8, N'baseurlmask', N'http://7102-cms.padillastaging.com', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (9, N'culture', N'en-US', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (10, N'language', N'english.xml', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (11, N'maxusers', N'5', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (12, N'maxuserswhen', N'2015-05-12T15:25:07.197', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (13, N'allowthemedlogo', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (14, N'digestsendeveryxhours', N'24', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (15, N'boardpollid', N'0', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (16, N'theme', N'OrangeGrey.xml', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (17, N'mobiletheme', NULL, 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (18, N'showtopicsdefault', N'0', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (19, N'fileextensionareallowed', N'1', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (20, N'notificationonuserregisteremaillist', NULL, 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (21, N'emailmoderatorsonmoderatedpost', N'1', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (22, N'emailmoderatorsonreportedpost', N'1', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (23, N'allowdigestemail', N'0', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (24, N'defaultsenddigestemail', N'0', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (25, N'defaultnotificationsetting', N'30', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (26, N'copyrightremovaldomainkey', NULL, 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (27, N'jqueryuitheme', N'smoothness', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (28, N'allowgenderinuserbox', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (29, N'enabledisplayname', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (30, N'enabletopicdescription', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (31, N'enabletopicstatus', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (32, N'jquerycdnhosted', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (33, N'jqueryuicdnhosted', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (34, N'jqueryuithemecdnhosted', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (35, N'scriptmanagerscriptscdnhosted', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (36, N'logerror', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (37, N'logwarning', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (38, N'logbannedip', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (39, N'loginformation', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (40, N'loguserdeleted', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (41, N'logusersuspendedunsuspended', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (42, N'logviewstateerror', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (43, N'banbotipondetection', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (44, N'notifcationnativeonmobile', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (45, N'allowuserstexteditor', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (46, N'emailverification', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (47, N'allownotificationallpostsalltopics', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (48, N'allowforumswithsamename', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (49, N'usefulltextsearch', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (50, N'usereadtrackingbydatabase', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (51, N'showlastunreadpost', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (52, N'enableipinfoservice', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (53, N'abadonsessionsfordonttrack', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (54, N'usessltologin', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (55, N'usessltoregister', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (56, N'showmoved', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (57, N'showavatarsintopic', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (58, N'showguestsindetailedactivelist', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (59, N'showcrawlersinactivelist', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (60, N'showcountryinfoinuserbox', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (61, N'showgroups', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (62, N'blanklinks', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (63, N'allowusertheme', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (64, N'allowuserhidehimself', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (65, N'allowuserlanguage', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (66, N'allowsinglesignon', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (67, N'allowmoderatorsviewips', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (68, N'allowpmemailnotification', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (69, N'allowpollchangesafterfirstvote', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (70, N'allowviewpollvotesifnopollacces', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (71, N'usefarsicalender', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (72, N'showrelativetime', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (73, N'allowmultiplechoices', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (74, N'allowguestsviewpolloptions', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (75, N'allowusersimagedpoll', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (76, N'avatarupload', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (77, N'avatarremote', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (78, N'avatargallery', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (79, N'avatargravatar', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (80, N'allowemailchange', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (81, N'allowpasswordchange', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (82, N'usefiletable', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (83, N'showrsslink', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (84, N'showatomlink', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (85, N'showpagegenerationtime', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (86, N'showyafversion', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (87, N'showforumjump', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (88, N'allowprivatemessages', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (89, N'allowemailsending', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (90, N'allowsignatures', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (91, N'externalsearchinnewwindow', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (92, N'showquicksearch', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (93, N'removenestedquotes', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (94, N'disableregistrations', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (95, N'createnntpusers', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (96, N'showgroupsprofile', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (97, N'pollvotetiedtoip', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (98, N'showadstosignedinusers', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (99, N'displaypoints', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (100, N'showquickanswer', N'1', NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (101, N'showdeletedmessages', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (102, N'showdeletedmessagestoall', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (103, N'showmoderatorlist', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (104, N'showmoderatorlistascolumn', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (105, N'enablecaptchaforpost', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (106, N'enablecaptchaforguests', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (107, N'usenofollowlinks', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (108, N'dourlreferrersecuritycheck', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (109, N'enableimageattachmentresize', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (110, N'resizepostedimages', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (111, N'showshoutbox', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (112, N'showshoutboxsmiles', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (113, N'nocountforumsinactivediscussions', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (114, N'usestylednicks', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (115, N'usestyledtopictitles', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (116, N'showuseronlinestatus', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (117, N'showthanksdate', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (118, N'enablethanksmod', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (119, N'enablebuddylist', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (120, N'enableactivelocationerrorslog', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (121, N'useragentbadlog', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (122, N'enablealbum', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (123, N'adddynamicpagemetatags', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (124, N'allowdisplaynamemodification', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (125, N'imageattachmentresizecropped', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (126, N'useloginbox', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (127, N'showconnectmessageintopic', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (128, N'enableuserinfohovercards', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (129, N'enableuserreputation', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (130, N'reputationallownegative', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (131, N'displayjoindate', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (132, N'showbrowsingusers', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (133, N'showsimilartopics', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (134, N'showmedals', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (135, N'allowposttoblog', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (136, N'allowemailtopic', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (137, N'requirelogin', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (138, N'showactivediscussions', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (139, N'showforumstatistics', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (140, N'showrecentusers', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (141, N'showtodaysbirthdays', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (142, N'showrulesforregistration', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (143, N'akismetapikey', NULL, NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (144, N'botscoutapikey', NULL, NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (145, N'stopforumspamapikey', NULL, NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (146, N'forumeditor', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (147, N'ipinfopageurl', N'http://www.ip2location.com/{0}', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (148, N'iplocatorurlpath', N'http://api.ipinfodb.com/v3/ip-city/?key=<your_api_key>&ip={0}', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (149, N'iplocatorresultsmapping', N'StatusCode,StatusMessage, IpAddress,CountryCode,CountryName,RegionName,CityName,ZipCode,Latitude,Longitude,TimeZone', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (150, N'recaptchapublickey', N'6LdX9QITAAAAAMV1EAyS2khnBsvJZa4Lc3YNps4j', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (151, N'recaptchaprivatekey', N'6LdX9QITAAAAAKKpcx4271ourNsHWyc4P1XtLkKE', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (152, N'searchengine1', N'http://google.com/search?as_q={Word}&hl={Language}&num={ResultsPerPage}&btnG={ButtonName}&as_epq={Word}&as_oq={Word}&as_eq={Word}&lr=&cr=&as_ft=i&as_filetype=&as_qdr=&as_occt=&as_dt=i&as_sitesearch={Site}&as_rights=&safe=off', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (153, N'searchengine2', N'http://yandex.ru/yandsearch?date=all&text=&site={Site}&rstr=&zone=all&wordforms=&lang={Language}&within=&from_day=&from_month=&from_year=&to_day=&to_month=&to_year=&mime=&numdoc={ResultsPerPage}&lr=', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (154, N'searchengine1parameters', N'Google^?^&^+^;^AnyWord:as_oq={Word}^AllWords:as_q={Word}^ExactFrase:as_epq={Word}^WithoutWords:as_eq={Word}', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (155, N'searchengine2parameters', N'Yandex^?^&^+^;^AnyWord:text={Word}/wordforms=any^AllWords:text={Word}/wordforms=all^ExactFrase:text={Word}/wordforms=exact^WithoutWords:text=~~{Word}', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (156, N'gravatarrating', N'G', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (157, N'acceptedhtml', N'br,hr,b,i,u,a,div,ol,ul,li,blockquote,img,span,p,em,strong,font,pre,h1,h2,h3,h4,h5,h6,address', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (158, N'adpost', NULL, NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (159, N'customloginredirecturl', NULL, NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (160, N'webservicetoken', N'cfeb5b11-d514-4954-9977-851a542f1a8a', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (161, N'searchstringpattern', N'.*', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (162, N'userbox', N'<yaf:avatar /><div class="section"><yaf:rankimage /><yaf:rank /></div><br /><yaf:reputation /><yaf:medals /><div class="section"><yaf:groups /><yaf:joindate /><yaf:posts /><yaf:gender /><yaf:countryimage /><yaf:location /></div><br/ ><div class="section"><yaf:thanksfrom /><yaf:thanksto /></div>', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (163, N'userboxavatar', N'<div class="section">{0}</div><br clear="all" />', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (164, N'userboxmedals', N'<div class="section medals">{0} {1}{2}</div><br clear="all" />', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (165, N'userboxrankimage', N'{0}<br clear="all" />', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (166, N'userboxcountryimage', N'{0}<br />', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (167, N'userboxrank', N'{0}: {1}<br clear="all" />', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (168, N'userboxgroups', N'{0}: {1}<br clear="all" />', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (169, N'userboxjoindate', N'{0}: {1}<br />', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (170, N'userboxgender', N'{0}<br />', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (171, N'userboxposts', N'{0}: {1:N0}<br />', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (172, N'userboxreputation', N'<div class="section">{0}: {1:N0}</div><br />', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (173, N'userboxlocation', N'{0}: {1}<br />', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (174, N'userboxthanksfrom', N'{0}<br />', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (175, N'userboxthanksto', N'{0}<br />', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (176, N'sendwelcomenotificationafterregister', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (177, N'spamservicetype', N'3', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (178, N'botspamservicetype', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (179, N'spammessagehandling', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (180, N'bothandlingonregister', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (181, N'ignorespamwordcheckpostcount', N'20', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (182, N'showsharetopicto', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (183, N'showretweetmessageto', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (184, N'showteamto', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (185, N'showhelpto', N'2', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (186, N'servertimecorrection', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (187, N'memberlistpagesize', N'20', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (188, N'mytopicslistpagesize', N'20', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (189, N'postlatestfeedaccess', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (190, N'postsfeedaccess', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (191, N'topicsfeedaccess', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (192, N'forumfeedaccess', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (193, N'activetopicfeedaccess', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (194, N'favoritetopicfeedaccess', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (195, N'avatarwidth', N'50', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (196, N'avatarheight', N'80', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (197, N'allowcreatetopicssamename', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (198, N'avatarsize', N'50000', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (199, N'maxwordlength', N'40', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (200, N'maxfilesize', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (201, N'messagehistorydaystolog', N'30', NULL)
GO
print 'Processed 200 total records'
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (202, N'lockposts', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (203, N'postsperpage', N'20', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (204, N'subforumsinforumlist', N'5', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (205, N'topicsperpage', N'15', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (206, N'postflooddelay', N'30', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (207, N'allowedpollchoicenumber', N'10', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (208, N'allowedpollnumber', N'3', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (209, N'pollimagemaxfilesize', N'100', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (210, N'captchatyperegister', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (211, N'edittimeout', N'30', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (212, N'reportpostpermissions', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (213, N'captchasize', N'8', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (214, N'profileviewpermission', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (215, N'returnsearchmax', N'100', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (216, N'activeusersviewpermissions', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (217, N'memberslistviewpermissions', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (218, N'activediscussionscount', N'5', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (219, N'activediscussionscachetimeout', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (220, N'searchstringminlength', N'4', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (221, N'searchstringmaxlength', N'50', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (222, N'searchpermissions', N'2', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (223, N'externalsearchpermissions', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (224, N'forumstatisticscachetimeout', N'60', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (225, N'boarduserstatscachetimeout', N'60', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (226, N'privatemessagemaxrecipients', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (227, N'disablenofollowlinksafterday', N'0', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (228, N'boardmoderatorscachetimeout', N'1440', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (229, N'boardcategoriescachetimeout', N'1440', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (230, N'replacerulescachetimeout', N'1440', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (231, N'firstpostcachetimeout', N'120', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (232, N'maxpostsize', N'32767', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (233, N'maxreportpostchars', N'128', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (234, N'maxnumberofattachments', N'5', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (235, N'pictureattachmentdisplaytreshold', N'262144', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (236, N'imageattachmentresizewidth', N'500', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (237, N'imageattachmentresizeheight', N'500', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (238, N'shoutboxshowmessagecount', N'30', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (239, N'shoutboxviewpermission', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (240, N'shoutboxdefaultstate', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (241, N'activeuserlazydatacachetimeout', N'10', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (242, N'onlinestatuscachetimeout', N'60000', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (243, N'usernamemaxlength', N'50', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (244, N'displaynameminlength', N'3', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (245, N'eventlogmaxmessages', N'1050', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (246, N'eventlogmaxdays', N'365', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (247, N'messagenotifcationduration', N'30', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (248, N'messagenotificationsystem', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (249, N'relativetimerefreshtime', N'60000', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (250, N'hovercardopendelay', N'2000', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (251, N'reputationmaxnegative', N'-100', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (252, N'reputationmaxpositive', N'500', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (253, N'reputationminupvoting', N'1', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (254, N'reputationmindownvoting', N'100', NULL)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (255, N'twitterusername', NULL, 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (256, N'activelisttime', N'5', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (257, N'albumimagessizemax', N'1048576', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (258, N'albumsperpage', N'6', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (259, N'albumimagesperpage', N'10', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (260, N'populartopicviews', N'100', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (261, N'populartopicreplys', N'10', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (262, N'populartopicdays', N'7', 1)
INSERT [dbo].[yaf_Registry] ([RegistryID], [Name], [Value], [BoardID]) VALUES (263, N'topicsfeeditemscount', N'20', 1)
SET IDENTITY_INSERT [dbo].[yaf_Registry] OFF
/****** Object:  StoredProcedure [dbo].[yaf_replace_words_save]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_replace_words_save]
(
    @BoardID int,
    @ID int = null,
    @BadWord nvarchar(255),
    @GoodWord nvarchar(255)
)
AS
BEGIN
        IF (@ID IS NOT NULL AND @ID <> 0)
    BEGIN
        UPDATE [dbo].[yaf_Replace_Words] SET BadWord = @BadWord, GoodWord = @GoodWord WHERE ID = @ID		
    END
    ELSE BEGIN
        INSERT INTO [dbo].[yaf_Replace_Words]
            (BoardID,BadWord,GoodWord)
        VALUES
            (@BoardID,@BadWord,@GoodWord)
    END
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_replace_words_list]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_replace_words_list]
(
    @BoardID int,
    @ID int = null
)
AS BEGIN
        IF (@ID IS NOT NULL AND @ID <> 0)
        SELECT * FROM [dbo].[yaf_Replace_Words] WHERE BoardID = @BoardID AND ID = @ID
    ELSE
        SELECT * FROM [dbo].[yaf_Replace_Words] WHERE BoardID = @BoardID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_replace_words_delete]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_replace_words_delete](@ID int) AS
BEGIN
        DELETE FROM [dbo].[yaf_Replace_Words] WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_upgrade]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Membership Create Procedures
-- =============================================

CREATE PROCEDURE [dbo].[yaf_prov_upgrade]
(
@PreviousVersion int,
@NewVersion int,
@UTCTIMESTAMP datetime
)
AS
BEGIN
    		IF (@PreviousVersion = 31) OR (@PreviousVersion = 32)
		BEGIN
			-- RESOLVE SALT ISSUE IN 193 BETA and RC2
			UPDATE [dbo].[yaf_prov_Membership] SET PasswordSalt='UwB5AHMAdABlAG0ALgBCAHkAdABlAFsAXQA=' WHERE PasswordSalt IS NOT NULL;
			UPDATE [dbo].[yaf_prov_Membership] SET Joined=@UTCTIMESTAMP  WHERE Joined IS NULL;
		END	
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_createapplication]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_createapplication]
(
@ApplicationName nvarchar(256),
@ApplicationID uniqueidentifier OUTPUT
)
AS
BEGIN
    	SET @ApplicationID = (SELECT ApplicationID FROM [dbo].[yaf_prov_Application] WHERE ApplicationNameLwd=LOWER(@ApplicationName))
	
	IF (@ApplicationID IS Null)
	BEGIN
		    SELECT  @ApplicationID = NEWID()
            INSERT  [dbo].[yaf_prov_Application] (ApplicationId, ApplicationName, ApplicationNameLwd)
            VALUES  (@ApplicationID, @ApplicationName, LOWER(@ApplicationName))
    END
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_pollgroup_migration]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_pollgroup_migration]
 as
  begin
     declare @ptmp int
	 declare @ttmp int
	 declare @utmp int 
	 declare @PollGroupID int

        declare c cursor for
        select  PollID,TopicID, UserID from [dbo].[yaf_Topic] where PollID IS NOT NULL
		        
        open c
        
        fetch next from c into @ptmp, @ttmp, @utmp
        while @@FETCH_STATUS = 0
        begin
		if @ptmp is not null
		begin
		insert into [dbo].[yaf_PollGroupCluster](UserID, Flags) values (@utmp, 0)	
		SET @PollGroupID = SCOPE_IDENTITY()  
		
	            update [dbo].[yaf_Topic] SET PollID = @PollGroupID WHERE TopicID = @ttmp
				update [dbo].[yaf_Poll] SET UserID = @utmp, PollGroupID = @PollGroupID, Flags = 0 WHERE PollID = @ptmp
		end       
        fetch next from c into @ptmp, @ttmp, @utmp
        end

        close c
        deallocate c 

		end
GO
/****** Object:  StoredProcedure [dbo].[yaf_mail_create]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_mail_create]
(
    @From nvarchar(255),
    @FromName nvarchar(255) = NULL,
    @To nvarchar(255),
    @ToName nvarchar(255) = NULL,
    @Subject nvarchar(100),
    @Body ntext,
    @BodyHtml ntext = NULL,
	@SendTries int,
	@SendAttempt datetime,
    @UTCTIMESTAMP datetime
)
AS 
BEGIN
        insert into [dbo].[yaf_Mail]
        (FromUser,FromUserName,ToUser,ToUserName,Created,Subject,Body,BodyHtml,SendTries,SendAttempt)
    values
        (@From,@FromName,@To,@ToName,@UTCTIMESTAMP ,@Subject,@Body,@BodyHtml,@SendTries,@SendAttempt)	
END
GO
/****** Object:  Table [dbo].[yaf_BannedEmail]    Script Date: 05/18/2015 09:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_BannedEmail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BoardID] [int] NOT NULL,
	[Mask] [nvarchar](255) NOT NULL,
	[Since] [datetime] NOT NULL,
	[Reason] [nvarchar](128) NULL,
 CONSTRAINT [PK_yaf_BannedEmail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_yaf_BannedEmail] UNIQUE NONCLUSTERED 
(
	[BoardID] ASC,
	[Mask] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[yaf_album_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_album_save]
    (
      @AlbumID INT = NULL,
      @UserID INT = null,
      @Title NVARCHAR(255) = NULL,
      @CoverImageID INT = NULL,
      @UTCTIMESTAMP datetime
    )
as 
    BEGIN
        -- Update Cover?
        IF ( @CoverImageID IS NOT NULL
             AND @CoverImageID <> 0
           ) 
            UPDATE  [dbo].[yaf_UserAlbum]
            SET     CoverImageID = @CoverImageID
            WHERE   AlbumID = @AlbumID
        ELSE 
            --Remove Cover?
            IF ( @CoverImageID = 0 ) 
                UPDATE  [dbo].[yaf_UserAlbum]
                SET     CoverImageID = NULL
                WHERE   AlbumID = @AlbumID            
            ELSE 
            -- Update Title?
                IF @AlbumID is not null 
                    UPDATE  [dbo].[yaf_UserAlbum]
                    SET     Title = @Title
                    WHERE   AlbumID = @AlbumID
                ELSE 
                    BEGIN
                    -- New album. insert into table.
                        INSERT  INTO [dbo].[yaf_UserAlbum]
                                (
                                  UserID,
                                  Title,
                                  CoverImageID,
                                  Updated
                                )
                        VALUES  (
                                  @UserID,
                                  @Title,
                                  @CoverImageID,
                                  @UTCTIMESTAMP 
                                )
                        RETURN SCOPE_IDENTITY()
                    END
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_album_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_album_list]
    (
      @UserID INT = NULL,
      @AlbumID INT = NULL
    )
as 
    BEGIN
        IF @UserID IS NOT null 
            select  *
            FROM    [dbo].[yaf_UserAlbum]
            WHERE   UserID = @UserID
            ORDER BY Updated DESC
        ELSE 
            SELECT  *
            FROM    [dbo].[yaf_UserAlbum]
            WHERE   AlbumID = @AlbumID
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_accessmask_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* End of procedures for "Thanks" Mod */

create procedure [dbo].[yaf_accessmask_delete](@AccessMaskID int) as
begin
        declare @flag int
    
    set @flag=1
    if exists(select 1 from [dbo].[yaf_ForumAccess] where AccessMaskID=@AccessMaskID) or exists(select 1 from [dbo].[yaf_UserForum] where AccessMaskID=@AccessMaskID)
        set @flag=0
    else
        delete from [dbo].[yaf_AccessMask] where AccessMaskID=@AccessMaskID
    
    select @flag
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_album_gettitle]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_album_gettitle]
    (
      @AlbumID INT,
      @paramOutput NVARCHAR(255) = NULL OUT
    )
as 
    BEGIN
        SET @paramOutput = ( SELECT [Title]
                             FROM   [dbo].[yaf_UserAlbum]
                             WHERE  ( AlbumID = @AlbumID )
                           )
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_board_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_board_list](@BoardID int=null) as
begin
        select
        a.*,
        SQLVersion = @@VERSION
    from 
        [dbo].[yaf_Board] a
    where
        (@BoardID is null or a.BoardID = @BoardID)
end
GO
/****** Object:  Table [dbo].[yaf_BannedName]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_BannedName](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BoardID] [int] NOT NULL,
	[Mask] [nvarchar](255) NOT NULL,
	[Since] [datetime] NOT NULL,
	[Reason] [nvarchar](128) NULL,
 CONSTRAINT [PK_yaf_BannedName] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_yaf_BannedName] UNIQUE NONCLUSTERED 
(
	[BoardID] ASC,
	[Mask] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yaf_BannedIP]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_BannedIP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BoardID] [int] NOT NULL,
	[Mask] [nvarchar](15) NOT NULL,
	[Since] [datetime] NOT NULL,
	[Reason] [nvarchar](128) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_yaf_BannedIP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_yaf_BannedIP] UNIQUE NONCLUSTERED 
(
	[BoardID] ASC,
	[Mask] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yaf_BBCode]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_BBCode](
	[BBCodeID] [int] IDENTITY(1,1) NOT NULL,
	[BoardID] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](4000) NULL,
	[OnClickJS] [nvarchar](1000) NULL,
	[DisplayJS] [ntext] NULL,
	[EditJS] [ntext] NULL,
	[DisplayCSS] [ntext] NULL,
	[SearchRegex] [ntext] NULL,
	[ReplaceRegex] [ntext] NULL,
	[Variables] [nvarchar](1000) NULL,
	[UseModule] [bit] NULL,
	[ModuleClass] [nvarchar](255) NULL,
	[ExecOrder] [int] NOT NULL,
 CONSTRAINT [PK_yaf_BBCode] PRIMARY KEY CLUSTERED 
(
	[BBCodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[yaf_BBCode] ON
INSERT [dbo].[yaf_BBCode] ([BBCodeID], [BoardID], [Name], [Description], [OnClickJS], [DisplayJS], [EditJS], [DisplayCSS], [SearchRegex], [ReplaceRegex], [Variables], [UseModule], [ModuleClass], [ExecOrder]) VALUES (1, 1, N'TWITTER', N'[TWITTER][localization=TWITTER_DESCRIPTION]Enter the Status ID of the Tweet you want to embed[/localization][/TWITTER]', N'', N'!function(d,s,id) {var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)) {js=d.createElement(s);js.id=id;js.async=true;js.src=''//platform.twitter.com/widgets.js'';fjs.parentNode.insertBefore(js,fjs);}}(document, ''script'', ''twitter-wjs'');', N'', N'', N'\[twitter\](?<statusID>[0-9].+?)\[/twitter\]', N'<!-- BEGIN twitter embed --><blockquote class="twitter-tweet"><a href="https://twitter.com/twitterapi/status/${statusID}"></a></blockquote><!-- END twitter embed -->', N'statusID', 0, N'', 100)
INSERT [dbo].[yaf_BBCode] ([BBCodeID], [BoardID], [Name], [Description], [OnClickJS], [DisplayJS], [EditJS], [DisplayCSS], [SearchRegex], [ReplaceRegex], [Variables], [UseModule], [ModuleClass], [ExecOrder]) VALUES (2, 1, N'DAILYMOTION', N'[dailymotion][localization=DAILYMOTION_DESCRIPTION]Enter Dailymotion Url (http://www.dailymotion.com/video/xxxx)[/localization][/dailymotion]', N'', N'', N'', N'', N'\[dailymotion\](?<inner>http://(?<prefix>[A-Za-z][A-Za-z][A-Za-z]?\.)?dailymotion.com/video/(?<id>[^_]*))[^[]*\[/dailymotion\]', N'<div><!-- BEGIN dailymotion --><iframe frameborder="0" width="560" height="315" src="http://${prefix}dailymotion.com/embed/video/${id}?forcedQuality=hd720"></iframe><!-- END dailymotion --></div>', N'id;prefix', 0, N'', 1)
INSERT [dbo].[yaf_BBCode] ([BBCodeID], [BoardID], [Name], [Description], [OnClickJS], [DisplayJS], [EditJS], [DisplayCSS], [SearchRegex], [ReplaceRegex], [Variables], [UseModule], [ModuleClass], [ExecOrder]) VALUES (3, 1, N'YOUTUBE', N'[YOUTUBE][localization=YOUTUBEMOD_DESCRIPTION]Put YouTube URL Here[/localization][/YOUTUBE]', N'', N'', N'', N'', N'\[youtube\](?<inner>(?<prefix>.+?)youtube.com/watch\?v=(?<id>[0-9A-Za-z-_]{11}))[^[]*\[/youtube\]|\[youtube\](?<inner>(?<prefix>.+?)youtu.be/(?<id>[0-9A-Za-z-_]{11}))\[/youtube\]', N'<!-- BEGIN youtube --><div><iframe width="560" height="350" src="//youtube.com/embed/${id}?hd=1" frameborder="0" allowfullscreen></iframe></div><!-- END youtube -->', N'id', 0, N'', 1)
INSERT [dbo].[yaf_BBCode] ([BBCodeID], [BoardID], [Name], [Description], [OnClickJS], [DisplayJS], [EditJS], [DisplayCSS], [SearchRegex], [ReplaceRegex], [Variables], [UseModule], [ModuleClass], [ExecOrder]) VALUES (4, 1, N'GOOGLEMAPS', N'[GOOGLEMAPS][localization=GOOGLEMAPS_DESCRIPTION]Enter Google Maps Url[/localization][/GOOGLEMAPS]', N'', N'', N'', N'', N'\[googlemaps\](?<inner>.+?)\[/googlemaps\]', N'<div><iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="${inner}&amp;output=embed"></iframe></div>', N'', 0, N'', 2)
INSERT [dbo].[yaf_BBCode] ([BBCodeID], [BoardID], [Name], [Description], [OnClickJS], [DisplayJS], [EditJS], [DisplayCSS], [SearchRegex], [ReplaceRegex], [Variables], [UseModule], [ModuleClass], [ExecOrder]) VALUES (5, 1, N'GOOGLEWIDGET', N'[GOOGLEWIDGET]&lt;script src=&quot;url&quot;&gt;&lt;/script&gt;[/GOOGLEWIDGET]', N'', N'', N'', N'', N'\[googlewidget\]&lt;script src=\&quot;(?<prefix>.+?)gmodules.com/ig/ifr\?url=(?<url>.+?)&quot;\&gt;\&lt;/script\&gt;\[/googlewidget\]', N'<!-- BEGIN Google Widget -->
<script type="text/javascript" src="http://www.gmodules.com/ig/ifr?url=${url}"></script>
<!-- END Google Widget -->', N'url:decode;', 0, N'', 1)
INSERT [dbo].[yaf_BBCode] ([BBCodeID], [BoardID], [Name], [Description], [OnClickJS], [DisplayJS], [EditJS], [DisplayCSS], [SearchRegex], [ReplaceRegex], [Variables], [UseModule], [ModuleClass], [ExecOrder]) VALUES (6, 1, N'SPOILER', N'[SPOILER][localization=SPOILERMOD_DESCRIPTION]Put Spoiler Text Here[/localization][/SPOILER]', N'', N'      function toggleSpoiler(btn, elid)
      {
      var el = document.getElementById(elid);
      if (el == null)
      return;
      if (el.style.display == '''')
      {
      el.style.display = ''none'';
      btn.value=''[localization=SPOILERMOD_SHOW]Show Spoiler[/localization]'';
      }
      else
      {
      el.style.display = '''';
      btn.value=''[localization=SPOILERMOD_HIDE]Hide Spoiler[/localization]'';
      }
      }
    ', N'', N'      .spoilerbox
      {
      margin: 5px;
      padding: 4px;
      background-color: #eeeeee;
      border: solid 1px #808080;
      color: #000000;
      }
    ', N'\[spoiler\](?<inner>.+?)\[\/spoiler\]', N'', N'', 1, N'YAF.Modules.SpoilerBBCodeModule', 50)
INSERT [dbo].[yaf_BBCode] ([BBCodeID], [BoardID], [Name], [Description], [OnClickJS], [DisplayJS], [EditJS], [DisplayCSS], [SearchRegex], [ReplaceRegex], [Variables], [UseModule], [ModuleClass], [ExecOrder]) VALUES (7, 1, N'USERLINK', N'[USERLINK][localization=USERLINKMOD_DESCRIPTION]Put User Name Here[/localization][/USERLINK]', N'', N'', N'', N'.yafnet .userLinkContainer
{
    background: url(Content/icons/user.png) #fff no-repeat 4px 50%;
    border: 1px solid #eee;
    padding: 4px 2px 4px 25px;
    margin: 3px;
    font-size: 80%;
    font-weight: bold;    
    background-color: #fff;
    -webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;	    
}

.yafnet .userLinkContainer:hover
{
    border: 1px solid #ddd;
    background-color: #eee;
}', N'\[userlink\](?<inner>.+?)\[\/userlink\]', N'', N'', 1, N'YAF.Modules.UserLinkBBCodeModule', 75)
INSERT [dbo].[yaf_BBCode] ([BBCodeID], [BoardID], [Name], [Description], [OnClickJS], [DisplayJS], [EditJS], [DisplayCSS], [SearchRegex], [ReplaceRegex], [Variables], [UseModule], [ModuleClass], [ExecOrder]) VALUES (8, 1, N'VIMEO', N'[VIMEO]http://www.vimeo.com/xxxxxxx[/VIMEO]', N'', N'', N'', N'', N'\[vimeo\](?<inner>http://(?<prefix>[A-Za-z][A-Za-z][A-Za-z]?\.)?vimeo.com/(?<vimeoId>[0-9]{8}))[^[]*\[/vimeo\]', N'<div><iframe width="560" height="350" src="http://player.vimeo.com/video/${vimeoId}?show_title=1&amp;show_byline=1&amp;show_portrait=1&amp;&amp;fullscreen=1" frameborder="0"></iframe></div>
    ', N'prefix;vimeoId', 0, N'', 1)
INSERT [dbo].[yaf_BBCode] ([BBCodeID], [BoardID], [Name], [Description], [OnClickJS], [DisplayJS], [EditJS], [DisplayCSS], [SearchRegex], [ReplaceRegex], [Variables], [UseModule], [ModuleClass], [ExecOrder]) VALUES (9, 1, N'HIDE', N'[HIDE][localization=HIDEMOD_DESCRIPTION]The tag hides content from people until they press the thank you button for the post.[/localization][/HIDE]', N'', N'', N'', N'.HiddenGuestBox {padding: 0 .7em;}.HiddenGuestBoxImage img {float: left; padding: 0 0 3px 3px;}.HiddenGuestBox br {clear:both}', N'\[hide\](?<inner>(.|\n)*?)\[\/hide\]', N'', N'', 1, N'YAF.Modules.BBCode.HideBBCodeModule', 60)
INSERT [dbo].[yaf_BBCode] ([BBCodeID], [BoardID], [Name], [Description], [OnClickJS], [DisplayJS], [EditJS], [DisplayCSS], [SearchRegex], [ReplaceRegex], [Variables], [UseModule], [ModuleClass], [ExecOrder]) VALUES (10, 1, N'GROUP-HIDE', N'[GROUP-HIDE][localization=HIDEGROUPMOD_DESCRIPTION]The tag hides from Guests[/localization][/GROUP-HIDE]', N'', N'', N'', N'.HiddenGuestBox {padding: 0 .7em;}.HiddenGuestBoxImage {float: left; margin-right: .3em;}', N'\[group-hide\](?<inner>(.|\n)*?)\[\/group-hide\]|\[group-hide=(?<group>([^""\r\n\]\[]*?))\](?<inner>(.|\n)*?)\[\/group-hide\]', N'', N'group', 1, N'YAF.Modules.BBCode.GroupHide', 1)
INSERT [dbo].[yaf_BBCode] ([BBCodeID], [BoardID], [Name], [Description], [OnClickJS], [DisplayJS], [EditJS], [DisplayCSS], [SearchRegex], [ReplaceRegex], [Variables], [UseModule], [ModuleClass], [ExecOrder]) VALUES (11, 1, N'HIDE-THANKS', N'[HIDE-THANKS=x][localization=HIDETHANKS_DESCRIPTION]The tag hides content from people who have below X thanks received.[/localization][/HIDE-THANKS]', N'', N'', N'', N'.HiddenGuestBox {padding: 0 .7em;}.HiddenGuestBoxImage img {float: left; padding: 0 0 3px 3px;}.HiddenGuestBox br {clear:both}', N'\[hide-thanks=(?<thanks>([0-9]*))\](?<inner>(.|\n)*?)\[\/hide-thanks\]', N'', N'thanks', 1, N'YAF.Modules.BBCode.HideBBCodeModule', 1)
INSERT [dbo].[yaf_BBCode] ([BBCodeID], [BoardID], [Name], [Description], [OnClickJS], [DisplayJS], [EditJS], [DisplayCSS], [SearchRegex], [ReplaceRegex], [Variables], [UseModule], [ModuleClass], [ExecOrder]) VALUES (12, 1, N'HIDE-REPLY-THANKS', N'[HIDE-REPLY-THANKS][localization=HIDEREPLYTHANKS_DESCRIPTION]The tag hides content from people until they either reply in the same thread or press the thank you button for the post.[/localization][/HIDE-REPLY-THANKS]', N'', N'', N'', N'.HiddenGuestBox {padding: 0 .7em;}.HiddenGuestBoxImage img {float: left; padding: 0 0 3px 3px;}.HiddenGuestBox br {clear:both}', N'\[hide-reply-thanks\](?<inner>(.|\n)*?)\[\/hide-reply-thanks\]', N'', N'', 1, N'YAF.Modules.BBCode.HideReplyThanksModule', 1)
INSERT [dbo].[yaf_BBCode] ([BBCodeID], [BoardID], [Name], [Description], [OnClickJS], [DisplayJS], [EditJS], [DisplayCSS], [SearchRegex], [ReplaceRegex], [Variables], [UseModule], [ModuleClass], [ExecOrder]) VALUES (13, 1, N'HIDE-REPLY', N'[HIDE-REPLY][localization=HIDEREPLY_DESCRIPTION]The tag hides content from people until they reply in the same thread.[/localization][/HIDE-REPLY]', N'', N'', N'', N'.HiddenGuestBox {padding: 0 .7em;}.HiddenGuestBoxImage img {float: left; padding: 0 0 3px 3px;}.HiddenGuestBox br {clear:both}', N'\[hide-reply\](?<inner>(.|\n)*?)\[\/hide-reply\]', N'', N'', 1, N'YAF.Modules.BBCode.HideReplyModule', 1)
INSERT [dbo].[yaf_BBCode] ([BBCodeID], [BoardID], [Name], [Description], [OnClickJS], [DisplayJS], [EditJS], [DisplayCSS], [SearchRegex], [ReplaceRegex], [Variables], [UseModule], [ModuleClass], [ExecOrder]) VALUES (14, 1, N'HIDE-POSTS', N'[HIDE-POSTS=x][localization=HIDEPOSTS_DESCRIPTION]The tag hides content from people who have below X posts.[/localization][/HIDE-POSTS]', N'', N'', N'', N'.HiddenGuestBox {padding: 0 .7em;}.HiddenGuestBoxImage img {float: left; padding: 0 0 3px 3px;}.HiddenGuestBox br {clear:both}', N'\[hide-posts=(?<posts>([0-9]*))\](?<inner>(.|\n)*?)\[\/hide-posts\]', N'', N'posts', 1, N'YAF.Modules.BBCode.HideBBCodeModule', 2)
INSERT [dbo].[yaf_BBCode] ([BBCodeID], [BoardID], [Name], [Description], [OnClickJS], [DisplayJS], [EditJS], [DisplayCSS], [SearchRegex], [ReplaceRegex], [Variables], [UseModule], [ModuleClass], [ExecOrder]) VALUES (15, 1, N'ALBUMIMG', N'[ALBUMIMG][localization=ALBUMIMG_DESCRIPTION]Enter a Album Image Number[/localization][/ALBUMIMG]', N'', N'', N'', N'', N'\[albumimg\](?<inner>.+?)\[\/albumimg\]', N'', N'', 1, N'YAF.Modules.BBCode.AlbumImage', 30)
INSERT [dbo].[yaf_BBCode] ([BBCodeID], [BoardID], [Name], [Description], [OnClickJS], [DisplayJS], [EditJS], [DisplayCSS], [SearchRegex], [ReplaceRegex], [Variables], [UseModule], [ModuleClass], [ExecOrder]) VALUES (16, 1, N'ATTACH', N'[ATTACH][localization=ATTACH_DESCRIPTION]Enter a Album Image Number[/localization][/ATTACH]', N'', N'', N'', N'', N'\[attach\](?<inner>.+?)\[\/attach\]', N'', N'', 1, N'YAF.Modules.BBCode.Attach', 31)
SET IDENTITY_INSERT [dbo].[yaf_BBCode] OFF
/****** Object:  StoredProcedure [dbo].[yaf_forumaccess_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_forumaccess_list](@ForumID int) as
begin
        select 
        a.*,
        GroupName=b.Name 
    from 
        [dbo].[yaf_ForumAccess] a 
        inner join [dbo].[yaf_Group] b on b.GroupID=a.GroupID
    where 
        a.ForumID = @ForumID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_mail_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_mail_save]
(
    @MailID int,
    @SendTries int,
    @SendAttempt datetime
)
AS 
BEGIN
    update [dbo].[yaf_Mail] set 
    SendAttempt = @SendAttempt,
    SendTries = @SendTries
    where MailID = @MailID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_mail_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_mail_list]
(
    @ProcessID int,
    @UTCTIMESTAMP datetime
)
AS
begin
	declare @count int

	set @count = (select (count(*)/100) 
	              from [dbo].[yaf_Mail] 
				  where SendAttempt is null or SendAttempt < @UTCTIMESTAMP
				 )
	set @count = (select Case When @count < 10 Then 10 Else @count End)

	update [dbo].[yaf_Mail]
	set 
		SendTries = SendTries + 1,
		SendAttempt = DATEADD(n,5,@UTCTIMESTAMP),
		ProcessID = @ProcessID
	where
		MailID in (select top (@count) MailID 
		           from [dbo].[yaf_Mail] 
				   where SendAttempt is null or SendAttempt < @UTCTIMESTAMP)

	select top (@count) * 
	from [dbo].[yaf_Mail] 
	where ProcessID = @ProcessID 
	order by SendAttempt, Created desc

	delete from [dbo].[yaf_Mail] where ProcessID = @ProcessID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_mail_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_mail_delete](@MailID int) as
BEGIN
        DELETE FROM [dbo].[yaf_Mail] WHERE MailID = @MailID
END
GO
/****** Object:  Table [dbo].[yaf_Extension]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_Extension](
	[ExtensionID] [int] IDENTITY(1,1) NOT NULL,
	[BoardId] [int] NOT NULL,
	[Extension] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_yaf_Extension] PRIMARY KEY CLUSTERED 
(
	[ExtensionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[yaf_Extension] ON
INSERT [dbo].[yaf_Extension] ([ExtensionID], [BoardId], [Extension]) VALUES (1, 1, N'avi')
INSERT [dbo].[yaf_Extension] ([ExtensionID], [BoardId], [Extension]) VALUES (2, 1, N'bmp')
INSERT [dbo].[yaf_Extension] ([ExtensionID], [BoardId], [Extension]) VALUES (3, 1, N'doc')
INSERT [dbo].[yaf_Extension] ([ExtensionID], [BoardId], [Extension]) VALUES (4, 1, N'gif')
INSERT [dbo].[yaf_Extension] ([ExtensionID], [BoardId], [Extension]) VALUES (5, 1, N'jpg')
INSERT [dbo].[yaf_Extension] ([ExtensionID], [BoardId], [Extension]) VALUES (6, 1, N'mov')
INSERT [dbo].[yaf_Extension] ([ExtensionID], [BoardId], [Extension]) VALUES (7, 1, N'mp3')
INSERT [dbo].[yaf_Extension] ([ExtensionID], [BoardId], [Extension]) VALUES (8, 1, N'mpg')
INSERT [dbo].[yaf_Extension] ([ExtensionID], [BoardId], [Extension]) VALUES (9, 1, N'png')
INSERT [dbo].[yaf_Extension] ([ExtensionID], [BoardId], [Extension]) VALUES (10, 1, N'rar')
INSERT [dbo].[yaf_Extension] ([ExtensionID], [BoardId], [Extension]) VALUES (11, 1, N'rm')
INSERT [dbo].[yaf_Extension] ([ExtensionID], [BoardId], [Extension]) VALUES (12, 1, N'tif')
INSERT [dbo].[yaf_Extension] ([ExtensionID], [BoardId], [Extension]) VALUES (13, 1, N'txt')
INSERT [dbo].[yaf_Extension] ([ExtensionID], [BoardId], [Extension]) VALUES (14, 1, N'wav')
INSERT [dbo].[yaf_Extension] ([ExtensionID], [BoardId], [Extension]) VALUES (15, 1, N'wma')
INSERT [dbo].[yaf_Extension] ([ExtensionID], [BoardId], [Extension]) VALUES (16, 1, N'wmv')
INSERT [dbo].[yaf_Extension] ([ExtensionID], [BoardId], [Extension]) VALUES (17, 1, N'wpd')
INSERT [dbo].[yaf_Extension] ([ExtensionID], [BoardId], [Extension]) VALUES (18, 1, N'xls')
INSERT [dbo].[yaf_Extension] ([ExtensionID], [BoardId], [Extension]) VALUES (19, 1, N'zip')
SET IDENTITY_INSERT [dbo].[yaf_Extension] OFF
/****** Object:  StoredProcedure [dbo].[yaf_topic_prune]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_topic_prune](@BoardID int, @ForumID int=null,@Days int, @PermDelete bit, @UTCTIMESTAMP datetime) as
BEGIN
        DECLARE @c cursor
    DECLARE @TopicID int
    DECLARE @Count int
    SET @Count = 0
    IF @ForumID = 0 SET @ForumID = NULL
    IF @ForumID IS NOT NULL
    BEGIN
        SET @c = cursor for
        SELECT 
            TopicID
        FROM [dbo].[yaf_topic] yt
        INNER JOIN
        [dbo].[yaf_Forum] yf
        ON
        yt.ForumID = yf.ForumID
        INNER JOIN
        [dbo].[yaf_Category] yc
        ON
        yf.CategoryID = yc.CategoryID
        WHERE
            yc.BoardID = @BoardID AND
            yt.ForumID = @ForumID AND
            Priority = 0 AND
            (yt.Flags & 512) = 0 AND /* not flagged as persistent */
            datediff(dd,yt.LastPosted,@UTCTIMESTAMP )>@Days
    END
    ELSE BEGIN
        SET @c = CURSOR FOR
        SELECT 
            TopicID
        FROM 
            [dbo].[yaf_Topic]
        WHERE 
            Priority = 0 and
            (Flags & 512) = 0 and					/* not flagged as persistent */
            datediff(dd,LastPosted,@UTCTIMESTAMP )>@Days
    END
    OPEN @c
    FETCH @c into @TopicID
    WHILE @@FETCH_STATUS=0 BEGIN
        IF (@Count % 100 = 1) WAITFOR DELAY '000:00:05'
        EXEC [dbo].[yaf_topic_delete] @TopicID, @PermDelete
        SET @Count = @Count + 1
        FETCH @c INTO @TopicID
    END
    CLOSE @c
    DEALLOCATE @c

    -- This takes forever with many posts...
    --exec [dbo].[yaf_topic_updatelastpost]

    SELECT Count = @Count
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_announcements]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_topic_announcements]
(
    @BoardID int,
    @NumPosts int,
    @PageUserID int
)
AS
BEGIN
    SELECT DISTINCT TOP (@NumPosts) 
	t.Topic, 
	t.LastPosted, 
	t.Posted,
	t.UserID,
	t.LastUserID, 
	t.TopicID,
	t.TopicMovedID, 
	Message = (select  CONVERT(VARCHAR(MAX), m.Message) from [dbo].[yaf_Message] m where t.LastMessageID = m.MessageID),
	t.LastMessageID, 
	t.LastMessageFlags 
	FROM
    [dbo].[yaf_Topic] t 
    INNER JOIN [dbo].[yaf_Forum] f ON t.ForumID = f.ForumID
    INNER JOIN [dbo].[yaf_Category] c 
    ON c.CategoryID = f.CategoryID 
    join [dbo].[yaf_ActiveAccess] v  with(nolock) on v.ForumID=f.ForumID
    WHERE c.BoardID = @BoardID AND v.UserID=@PageUserID AND (CONVERT(int,v.ReadAccess) <> 0 or (f.Flags & 2) = 0) AND t.IsDeleted=0 AND t.TopicMovedID IS NULL AND (t.Priority = 2) ORDER BY t.LastPosted DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_forumaccess_group]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_forumaccess_group](@GroupID int) as
begin
        select 
        a.*,
        ForumName = b.Name,
        CategoryName = c.Name ,
        CategoryID = b.CategoryID,
        ParentID = b.ParentID,
        BoardName = brd.Name 
    from 
        [dbo].[yaf_ForumAccess] a
        inner join [dbo].[yaf_Forum] b on b.ForumID=a.ForumID
        inner join [dbo].[yaf_Category] c on c.CategoryID=b.CategoryID
        inner join [dbo].[yaf_Board] brd on brd.BoardID=c.BoardID
    where 
        a.GroupID = @GroupID
    order by
        brd.Name,
        c.SortOrder,
        b.SortOrder
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_forum_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_forum_save](
    @ForumID 		int=null,
    @CategoryID		int,
    @ParentID		int=null,
    @Name			nvarchar(50),
    @Description	nvarchar(255),
    @SortOrder		smallint,
    @Locked			bit,
    @Hidden			bit,
    @IsTest			bit,
    @Moderated		bit,
	@ModeratedPostCount int = null,
	@IsModeratedNewTopicOnly bit,
    @RemoteURL		nvarchar(100)=null,
    @ThemeURL		nvarchar(100)=null,
    @ImageURL       nvarchar(128)=null,
    @Styles         nvarchar(255)=null,
    @AccessMaskID	int = null
) as
begin
    declare @BoardID	int
    declare @Flags		int	
    
    set @Flags = 0
    if @Locked<>0 set @Flags = @Flags | 1
    if @Hidden<>0 set @Flags = @Flags | 2
    if @IsTest<>0 set @Flags = @Flags | 4
    if @Moderated<>0 set @Flags = @Flags | 8
    
    if @ForumID = 0 set @ForumID = null
    if @ParentID = 0 set @ParentID = null
    
    if @ForumID is not null begin	
        update [dbo].[yaf_Forum] set 
            ParentID=@ParentID,
            Name=@Name,
            [Description]=@Description,
            SortOrder=@SortOrder,
            CategoryID=@CategoryID,
            RemoteURL = @RemoteURL,
            ThemeURL = @ThemeURL,
            ImageURL = @ImageURL,
            Styles = @Styles,
            Flags = @Flags,
			ModeratedPostCount = @ModeratedPostCount,
			IsModeratedNewTopicOnly = @IsModeratedNewTopicOnly
        where ForumID=@ForumID
    end
    else begin		
    
        insert into [dbo].[yaf_Forum](ParentID,Name,Description,SortOrder,CategoryID,NumTopics,NumPosts,RemoteURL,ThemeURL,Flags,ImageURL,Styles,ModeratedPostCount,IsModeratedNewTopicOnly)
        values(@ParentID,@Name,@Description,@SortOrder,@CategoryID,0,0,@RemoteURL,@ThemeURL,@Flags,@ImageURL,@Styles,@ModeratedPostCount,@IsModeratedNewTopicOnly)
        select @ForumID = SCOPE_IDENTITY()

        insert into [dbo].[yaf_ForumAccess](GroupID,ForumID,AccessMaskID) 
        select GroupID,@ForumID,@AccessMaskID
        from [dbo].[yaf_Group]
        where BoardID IN (select BoardID from [dbo].[yaf_Category] where CategoryID=@CategoryID)
    end
    select ForumID = @ForumID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_forum_moderatelist]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_forum_moderatelist](@BoardID int,@UserID int) AS
BEGIN
    
SELECT
        b.*,
        MessageCount  = 
        (SELECT     count([dbo].[yaf_Message].MessageID)
        FROM         [dbo].[yaf_Message] INNER JOIN
                              [dbo].[yaf_Topic] ON [dbo].[yaf_Message].TopicID = [dbo].[yaf_Topic].TopicID
        WHERE ([dbo].[yaf_Message].IsApproved=0) and ([dbo].[yaf_Message].IsDeleted=0) and ([dbo].[yaf_Topic].IsDeleted  = 0) AND ([dbo].[yaf_Topic].ForumID=b.ForumID)),

        ReportedCount	= 
        (SELECT     count([dbo].[yaf_Message].MessageID)
        FROM         [dbo].[yaf_Message] INNER JOIN
                              [dbo].[yaf_Topic] ON [dbo].[yaf_Message].TopicID = [dbo].[yaf_Topic].TopicID
        WHERE (([dbo].[yaf_Message].Flags & 128)=128) and ([dbo].[yaf_Message].IsDeleted=0) and ([dbo].[yaf_Topic].IsDeleted = 0) AND ([dbo].[yaf_Topic].ForumID=b.ForumID))
        FROM
        [dbo].[yaf_Category] a

    JOIN [dbo].[yaf_Forum] b ON b.CategoryID=a.CategoryID
    JOIN [dbo].[yaf_ActiveAccess] c  with(nolock) ON c.ForumID=b.ForumID

    WHERE
        a.BoardID=@BoardID AND
        CONVERT(int,c.ModeratorAccess)>0 AND
        c.UserID=@UserID
    ORDER BY
        a.SortOrder,
        b.SortOrder
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_forum_maxid]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_forum_maxid](@BoardID int) as
begin	
    select top 1 a.ForumID from [dbo].[yaf_Forum] a join [dbo].[yaf_Category] b on b.CategoryID=a.CategoryID where b.BoardID=@BoardID order by a.ForumID desc	
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_forum_listallmymoderated]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_forum_listallmymoderated](@BoardID int,@UserID int) as
begin
        select
        b.CategoryID,
        Category = b.Name,
        a.ForumID,
        Forum = a.Name,
        x.Indent
    from
        (select
            b.ForumID,
            Indent = 0
        from
            [dbo].[yaf_Category] a
            join [dbo].[yaf_Forum] b on b.CategoryID=a.CategoryID
        where
            a.BoardID=@BoardID and
            b.ParentID is null
    
        union
    
        select
            c.ForumID,
            Indent = 1
        from
            [dbo].[yaf_Category] a
            join [dbo].[yaf_Forum] b on b.CategoryID=a.CategoryID
            join [dbo].[yaf_Forum] c on c.ParentID=b.ForumID
        where
            a.BoardID=@BoardID and
            b.ParentID is null
    
        union
    
        select
            d.ForumID,
            Indent = 2
        from
            [dbo].[yaf_Category] a
            join [dbo].[yaf_Forum] b on b.CategoryID=a.CategoryID
            join [dbo].[yaf_Forum] c on c.ParentID=b.ForumID
            join [dbo].[yaf_Forum] d on d.ParentID=c.ForumID
        where
            a.BoardID=@BoardID and
            b.ParentID is null
        ) as x
        join [dbo].[yaf_Forum] a on a.ForumID=x.ForumID
        join [dbo].[yaf_Category] b on b.CategoryID=a.CategoryID
        join [dbo].[yaf_ActiveAccess] c  with(nolock) on c.ForumID=a.ForumID
    where
        c.UserID=@UserID and
        b.BoardID=@BoardID and
        CONVERT(int,c.ModeratorAccess)>0
    order by
        b.SortOrder,
        a.SortOrder
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_forum_listall_fromcat]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_forum_listall_fromcat](@BoardID int,@CategoryID int) AS
BEGIN
        SELECT     b.CategoryID, b.Name AS Category, a.ForumID, a.Name AS Forum, a.ParentID, a.PollGroupID 
    FROM         [dbo].[yaf_Forum] a INNER JOIN
                          [dbo].[yaf_Category] b ON b.CategoryID = a.CategoryID
        WHERE
            b.CategoryID=@CategoryID and
            b.BoardID=@BoardID
        ORDER BY
            b.SortOrder,
            a.SortOrder
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_forum_listall]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_forum_listall] (@BoardID int,@UserID int,@root int = 0) as
begin
    if @root = 0
begin
      select
        b.CategoryID,
        Category = b.Name,
        a.ForumID,
        Forum = a.Name,
        Indent = 0,
        a.ParentID,
        a.PollGroupID
    from
        [dbo].[yaf_Forum] a
        join [dbo].[yaf_Category] b on b.CategoryID=a.CategoryID
        join [dbo].[yaf_ActiveAccess] c  with(nolock) on c.ForumID=a.ForumID
    where
        c.UserID=@UserID and
        b.BoardID=@BoardID and
        CONVERT(int,c.ReadAccess) > 0
    order by
        b.SortOrder,
        a.SortOrder,
        b.CategoryID,
        a.ForumID
end
else if  @root > 0
begin
    select
        b.CategoryID,
        Category = b.Name,
        a.ForumID,
        Forum = a.Name,
        Indent = 0,
        a.ParentID
    from
        [dbo].[yaf_Forum] a
        join [dbo].[yaf_Category] b on b.CategoryID=a.CategoryID
        join [dbo].[yaf_ActiveAccess] c  with(nolock) on c.ForumID=a.ForumID
    where
        c.UserID=@UserID and
        b.BoardID=@BoardID and
        CONVERT(int,c.ReadAccess) > 0 and
        a.ForumID = @root

    order by
        b.SortOrder,
        a.SortOrder,
        b.CategoryID,
        a.ForumID
end
else
begin
    select
        b.CategoryID,
        Category = b.Name,
        a.ForumID,
        Forum = a.Name,
        Indent = 0,
        a.ParentID
    from
        [dbo].[yaf_Forum] a
        join [dbo].[yaf_Category] b on b.CategoryID=a.CategoryID
        join [dbo].[yaf_ActiveAccess] c  with(nolock) on c.ForumID=a.ForumID
    where
        c.UserID=@UserID and
        b.BoardID=@BoardID and
        CONVERT(int,c.ReadAccess) > 0 and
        b.CategoryID = -@root

    order by
        b.SortOrder,
        a.SortOrder,
        b.CategoryID,
        a.ForumID
end
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_forum_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_forum_list](@BoardID int,@ForumID int=null) as
begin
    if @ForumID = 0 set @ForumID = null
    if @ForumID is null
        select a.* from [dbo].[yaf_Forum] a join [dbo].[yaf_Category] b on b.CategoryID=a.CategoryID where b.BoardID=@BoardID order by a.SortOrder
    else
        select a.* from [dbo].[yaf_Forum] a join [dbo].[yaf_Category] b on b.CategoryID=a.CategoryID where b.BoardID=@BoardID and a.ForumID = @ForumID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_category_listread]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_category_listread](@BoardID int,@UserID int,@CategoryID int=null) as
begin
        select 
        a.CategoryID,
        a.Name,
        a.CategoryImage
    from 
        [dbo].[yaf_Category] a
        join [dbo].[yaf_Forum] b on b.CategoryID=a.CategoryID
        join [dbo].[yaf_ActiveAccess] v  with(nolock) on v.ForumID=b.ForumID
    where
        a.BoardID=@BoardID and
        v.UserID=@UserID and
        (CONVERT(int,v.ReadAccess)<>0 or (b.Flags & 2)=0) and
        (@CategoryID is null or a.CategoryID=@CategoryID) and
        b.ParentID is null
    group by
        a.CategoryID,
        a.Name,
        a.SortOrder,
        a.CategoryImage
    order by 
        a.SortOrder
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_category_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_category_delete](@CategoryID int) as
begin
        declare @flag int
 
    if exists(select 1 from [dbo].[yaf_Forum] where CategoryID = @CategoryID)
    begin
        set @flag = 0
    end else
    begin
        delete from [dbo].[yaf_Category] where CategoryID = @CategoryID
        set @flag = 1
    end

    select @flag
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_medal_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[yaf_medal_save]
    @BoardID int = NULL,
    @MedalID int = NULL,
    @Name nvarchar(100),
    @Description ntext,
    @Message nvarchar(100),
    @Category nvarchar(50) = NULL,
    @MedalURL nvarchar(250),
    @RibbonURL nvarchar(250) = NULL,
    @SmallMedalURL nvarchar(250),
    @SmallRibbonURL nvarchar(250) = NULL,
    @SmallMedalWidth smallint,
    @SmallMedalHeight smallint,
    @SmallRibbonWidth smallint = NULL,
    @SmallRibbonHeight smallint = NULL,
    @SortOrder tinyint = 255,
    @Flags int = 0
as begin
        if @MedalID is null begin
        insert into [dbo].[yaf_Medal]
            ([BoardID],[Name],[Description],[Message],[Category],
            [MedalURL],[RibbonURL],[SmallMedalURL],[SmallRibbonURL],
            [SmallMedalWidth],[SmallMedalHeight],[SmallRibbonWidth],[SmallRibbonHeight],
            [SortOrder],[Flags])
        values
            (@BoardID,@Name,@Description,@Message,@Category,
            @MedalURL,@RibbonURL,@SmallMedalURL,@SmallRibbonURL,
            @SmallMedalWidth,@SmallMedalHeight,@SmallRibbonWidth,@SmallRibbonHeight,
            @SortOrder,@Flags)

        select @@rowcount
    end
    else begin
        update [dbo].[yaf_Medal]
            set [BoardID] = BoardID,
                [Name] = @Name,
                [Description] = @Description,
                [Message] = @Message,
                [Category] = @Category,
                [MedalURL] = @MedalURL,
                [RibbonURL] = @RibbonURL,
                [SmallMedalURL] = @SmallMedalURL,
                [SmallRibbonURL] = @SmallRibbonURL,
                [SmallMedalWidth] = @SmallMedalWidth,
                [SmallMedalHeight] = @SmallMedalHeight,
                [SmallRibbonWidth] = @SmallRibbonWidth,
                [SmallRibbonHeight] = @SmallRibbonHeight,
                [SortOrder] = @SortOrder,
                [Flags] = @Flags
        where [MedalID] = @MedalID

        select @@rowcount
    end

end
GO
/****** Object:  StoredProcedure [dbo].[yaf_medal_resort]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[yaf_medal_resort]
    @BoardID int,@MedalID int,@Move int
as
begin
        declare @Position int
    declare @Category nvarchar(50)

    select 
        @Position=[SortOrder],
        @Category=[Category]
    from 
        [dbo].[yaf_Medal] 
    where 
        [BoardID]=@BoardID and [MedalID]=@MedalID

    if (@Position is null) return

    if (@Move > 0) begin
        update 
            [dbo].[yaf_Medal]
        set 
            [SortOrder]=[SortOrder]-1
        where 
            [BoardID]=@BoardID and 
            [Category]=@Category and
            [SortOrder] between @Position and (@Position + @Move) and
            [SortOrder] between 1 and 255
    end
    else if (@Move < 0) begin
        update 
            [dbo].[yaf_Medal]
        set
            [SortOrder]=[SortOrder]+1
        where 
            BoardID=@BoardID and 
            [Category]=@Category and
            [SortOrder] between (@Position+@Move) and @Position and
            [SortOrder] between 0 and 254
    end

    SET @Position = @Position + @Move

    if (@Position>255) SET @Position = 255
    else if (@Position<0) SET @Position = 0

    update [dbo].[yaf_Medal]
        set [SortOrder]=@Position
        where [BoardID]=@BoardID and 
            [MedalID]=@MedalID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_report]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_message_report](@MessageID int, @ReporterID int, @ReportedDate datetime, @ReportText nvarchar(4000),@UTCTIMESTAMP datetime) AS
BEGIN
    IF @ReportText IS NULL SET @ReportText = '';
    IF NOT exists(SELECT MessageID FROM [dbo].[yaf_MessageReported] WHERE MessageID=@MessageID)
    BEGIN
        INSERT INTO [dbo].[yaf_MessageReported](MessageID, [Message])
        SELECT 
            a.MessageID,
            a.[Message]
        FROM
            [dbo].[yaf_Message] a
        WHERE
            a.MessageID = @MessageID
    END	
    IF NOT exists(SELECT MessageID from [dbo].[yaf_MessageReportedAudit] WHERE MessageID=@MessageID AND UserID=@ReporterID)
        INSERT INTO [dbo].[yaf_MessageReportedAudit](MessageID,UserID,Reported,ReportText) VALUES (@MessageID,@ReporterID,@ReportedDate, CONVERT(varchar,@UTCTIMESTAMP )+ '??' + @ReportText)
    ELSE 
        UPDATE [dbo].[yaf_MessageReportedAudit] SET ReportedNumber = ( CASE WHEN ReportedNumber < 2147483647 THEN  ReportedNumber  + 1 ELSE ReportedNumber END ), Reported = @ReportedDate, ReportText = (CASE WHEN (LEN(ReportText) + LEN(@ReportText) + 255 < 4000)  THEN  ReportText + '|' + CONVERT(varchar(36),@UTCTIMESTAMP )+ '??' +  @ReportText ELSE ReportText END) WHERE MessageID=@MessageID AND UserID=@ReporterID 
    

    -- update Message table to set message with flag Reported
    UPDATE [dbo].[yaf_Message] SET Flags = Flags | 128 WHERE MessageID = @MessageID

END
GO
/****** Object:  Table [dbo].[yaf_NntpServer]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_NntpServer](
	[NntpServerID] [int] IDENTITY(1,1) NOT NULL,
	[BoardID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Port] [int] NULL,
	[UserName] [nvarchar](255) NULL,
	[UserPass] [nvarchar](50) NULL,
 CONSTRAINT [PK_yaf_NntpServer] PRIMARY KEY CLUSTERED 
(
	[NntpServerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[yaf_nntpserver_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_nntpserver_delete](@NntpServerID int) as
begin
        delete from [dbo].[yaf_NntpTopic] where NntpForumID in (select NntpForumID from [dbo].[yaf_NntpForum] where NntpServerID = @NntpServerID)
    delete from [dbo].[yaf_NntpForum] where NntpServerID = @NntpServerID
    delete from [dbo].[yaf_NntpServer] where NntpServerID = @NntpServerID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_nntpforum_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_nntpforum_list](@BoardID int,@Minutes int=null,@NntpForumID int=null,@Active bit=null,@UTCTIMESTAMP datetime) as
begin
        select
        a.Name,
        a.[Address],
        Port = IsNull(a.Port,119),
        a.UserName,
        a.UserPass,		
        a.NntpServerID,
        b.NntpForumID,		
        b.GroupName,
        b.ForumID,
        b.LastMessageNo,
        b.LastUpdate,
        b.Active,
        b.DateCutOff,
        ForumName = c.Name
    from
        [dbo].[yaf_NntpServer] a
        join [dbo].[yaf_NntpForum] b on b.NntpServerID = a.NntpServerID
        join [dbo].[yaf_Forum] c on c.ForumID = b.ForumID
    where
        (@Minutes is null or datediff(n,b.LastUpdate,@UTCTIMESTAMP )>@Minutes) and
        (@NntpForumID is null or b.NntpForumID=@NntpForumID) and
        a.BoardID=@BoardID and
        (@Active is null or b.Active=@Active)
    order by
        a.Name,
        b.GroupName
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_nntpserver_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_nntpserver_save](
    @NntpServerID 	int=null,
    @BoardID	int,
    @Name		nvarchar(50),
    @Address	nvarchar(100),
    @Port		int,
    @UserName	nvarchar(255)=null,
    @UserPass	nvarchar(50)=null
) as begin
        if @NntpServerID is null
        insert into [dbo].[yaf_NntpServer](Name,BoardID,Address,Port,UserName,UserPass)
        values(@Name,@BoardID,@Address,@Port,@UserName,@UserPass)
    else
        update [dbo].[yaf_NntpServer] set
            Name = @Name,
            [Address] = @Address,
            Port = @Port,
            UserName = @UserName,
            UserPass = @UserPass
        where NntpServerID = @NntpServerID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_nntpserver_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_nntpserver_list](@BoardID int=null,@NntpServerID int=null) as
begin
        if @NntpServerID is null
        select * from [dbo].[yaf_NntpServer] where BoardID=@BoardID order by Name
    else
        select * from [dbo].[yaf_NntpServer] where NntpServerID=@NntpServerID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_group_rank_style]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_group_rank_style]( @BoardID int) as
begin
-- added fields to get overall info about groups and ranks
SELECT 1 AS LegendID,[Name],Style, PMLimit,[Description],UsrSigChars,UsrSigBBCodes,UsrSigHTMLTags,UsrAlbums,UsrAlbumImages FROM [dbo].[yaf_Group]
WHERE BoardID = @BoardID GROUP BY SortOrder,[Name],Style,[Description],PMLimit,UsrSigChars,UsrSigBBCodes,UsrSigHTMLTags,UsrAlbums,UsrAlbumImages
UNION
SELECT 2  AS LegendID,[Name],Style,PMLimit, [Description],UsrSigChars,UsrSigBBCodes,UsrSigHTMLTags,UsrAlbums,UsrAlbumImages FROM [dbo].[yaf_Rank]
WHERE BoardID = @BoardID GROUP BY SortOrder,[Name],Style,[Description],PMLimit,UsrSigChars,UsrSigBBCodes,UsrSigHTMLTags,UsrAlbums,UsrAlbumImages
end
GO
/****** Object:  Table [dbo].[yaf_EventLogGroupAccess]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_EventLogGroupAccess](
	[GroupID] [int] NOT NULL,
	[EventTypeID] [int] NOT NULL,
	[EventTypeName] [nvarchar](128) NOT NULL,
	[DeleteAccess] [bit] NOT NULL,
 CONSTRAINT [PK_yaf_EventLogGroupAccess] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[EventTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[yaf_category_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_category_list](@BoardID int,@CategoryID int=null) as
begin
        if @CategoryID is null
        select * from [dbo].[yaf_Category] where BoardID = @BoardID order by SortOrder
    else
        select * from [dbo].[yaf_Category] where BoardID = @BoardID and CategoryID = @CategoryID
end
GO
/****** Object:  Table [dbo].[yaf_GroupMedal]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_GroupMedal](
	[GroupID] [int] NOT NULL,
	[MedalID] [int] NOT NULL,
	[Message] [nvarchar](100) NULL,
	[Hide] [bit] NOT NULL,
	[OnlyRibbon] [bit] NOT NULL,
	[SortOrder] [tinyint] NOT NULL,
 CONSTRAINT [PK_yaf_GroupMedal] PRIMARY KEY CLUSTERED 
(
	[MedalID] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[yaf_group_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_group_list](@BoardID int,@GroupID int=null) as
begin
        if @GroupID is null
        select * from [dbo].[yaf_Group] where BoardID=@BoardID order by SortOrder 
    else
        select * from [dbo].[yaf_Group] where BoardID=@BoardID and GroupID=@GroupID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_group_eventlogaccesslist]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_group_eventlogaccesslist](@BoardID int = null) as
begin
        if @BoardID is null
        select g.*,b.Name as BoardName from [dbo].[yaf_Group] g
        join [dbo].[yaf_Board] b on b.BoardID = g.BoardID order by g.SortOrder 
    else
        select g.*,b.Name as BoardName from [dbo].[yaf_Group] g
        join [dbo].[yaf_Board] b on b.BoardID = g.BoardID where g.BoardID=@BoardID  order by g.SortOrder
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_category_simplelist]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_category_simplelist](
                @StartID INT  = 0,
                @Limit   INT  = 500)
AS
    BEGIN       
        SELECT TOP(@Limit) c.[CategoryID],
                 c.[Name]
        FROM     [dbo].[yaf_Category] c
        WHERE    c.[CategoryID] >= @StartID
        AND c.[CategoryID] < (@StartID + @Limit)
        ORDER BY c.[CategoryID]       
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_category_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_category_save]
(
    @BoardID    INT,
    @CategoryID INT,
    @Name       NVARCHAR(128),	
    @SortOrder  SMALLINT,
    @CategoryImage NVARCHAR(255) = NULL
)
AS
BEGIN
        IF @CategoryID > 0
    BEGIN
        UPDATE [dbo].[yaf_Category]
        SET    Name = @Name,
               CategoryImage = @CategoryImage,
               SortOrder = @SortOrder
        WHERE  CategoryID = @CategoryID
        SELECT CategoryID = @CategoryID
    END
    ELSE
    BEGIN
        INSERT INTO [dbo].[yaf_Category]
                   (BoardID,
                    [Name],
                    [CategoryImage],
                    SortOrder)
        VALUES     (@BoardID,
                    @Name,
                    @CategoryImage,
                    @SortOrder)
        SELECT CategoryID = Scope_identity()
    END
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_extension_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_extension_list] (@BoardID int, @Extension nvarchar(10)) as
BEGIN
    
    -- If an extension is passed, then we want to check for THAT extension
    IF LEN(@Extension) > 0
        BEGIN
            SELECT
                a.*
            FROM
                [dbo].[yaf_Extension] a
            WHERE
                a.BoardID = @BoardID AND a.Extension=@Extension
            ORDER BY
                a.Extension
        END

    ELSE
        -- Otherwise, just get a list for the given @BoardId
        BEGIN
            SELECT
                a.*
            FROM
                [dbo].[yaf_Extension] a
            WHERE
                a.BoardID = @BoardID	
            ORDER BY
                a.Extension
        END
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_bbcode_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_bbcode_save]
(
    @BBCodeID int = null,
    @BoardID int,
    @Name nvarchar(255),
    @Description nvarchar(4000) = null,
    @OnClickJS nvarchar(1000) = null,
    @DisplayJS ntext = null,
    @EditJS ntext = null,
    @DisplayCSS ntext = null,
    @SearchRegEx ntext,
    @ReplaceRegEx ntext,
    @Variables nvarchar(1000) = null,
    @UseModule bit = null,
    @ModuleClass nvarchar(255) = null,	
    @ExecOrder int = 1
)
AS
BEGIN
        
    IF @BBCodeID IS NOT NULL BEGIN
        UPDATE
            [dbo].[yaf_BBCode]
        SET
            [Name] = @Name,
            [Description] = @Description,
            [OnClickJS] = @OnClickJS,
            [DisplayJS] = @DisplayJS,
            [EditJS] = @EditJS,
            [DisplayCSS] = @DisplayCSS,
            [SearchRegEx] = @SearchRegEx,
            [ReplaceRegEx] = @ReplaceRegEx,
            [Variables] = @Variables,
            [UseModule] = @UseModule,
            [ModuleClass] = @ModuleClass,			
            [ExecOrder] = @ExecOrder
        WHERE
            BBCodeID = @BBCodeID
    END
    ELSE BEGIN
        IF NOT EXISTS(SELECT 1 FROM [dbo].[yaf_BBCode] WHERE BoardID = @BoardID AND [Name] = @Name)
            INSERT INTO
                [dbo].[yaf_BBCode] ([BoardID],[Name],[Description],[OnClickJS],[DisplayJS],[EditJS],[DisplayCSS],[SearchRegEx],[ReplaceRegEx],[Variables],[UseModule],[ModuleClass],[ExecOrder])
            VALUES (@BoardID,@Name,@Description,@OnClickJS,@DisplayJS,@EditJS,@DisplayCSS,@SearchRegEx,@ReplaceRegEx,@Variables,@UseModule,@ModuleClass,@ExecOrder)
    END
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_bbcode_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_bbcode_list]
(
    @BoardID int,
    @BBCodeID int = null
)
AS
BEGIN
        
    IF @BBCodeID IS NULL
        SELECT * FROM [dbo].[yaf_BBCode] WHERE BoardID = @BoardID ORDER BY ExecOrder, [Name] DESC
    ELSE
        SELECT * FROM [dbo].[yaf_BBCode] WHERE BBCodeID = @BBCodeID ORDER BY ExecOrder
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_bbcode_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- BBCode

CREATE PROCEDURE [dbo].[yaf_bbcode_delete]
(
    @BBCodeID int = NULL
)
AS
BEGIN
        
    IF @BBCodeID IS NOT NULL
        DELETE FROM [dbo].[yaf_BBCode] WHERE BBCodeID = @BBCodeID
    ELSE
        DELETE FROM [dbo].[yaf_BBCode]
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_bannedname_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_bannedname_save](@ID int=null,@BoardID int,@Mask varchar(255), @Reason nvarchar(128), @UTCTIMESTAMP datetime) as
begin
    if (@ID is null or @ID = 0 ) 
    begin
        declare @ExistsRow int
        select @ExistsRow = count(1) from [dbo].[yaf_BannedName] where BoardID=@BoardID and Mask=@Mask;
        if (@ExistsRow  is null or @ExistsRow = 0)
        begin
            insert into [dbo].[yaf_BannedName](BoardID,Mask,Since,Reason) values(@BoardID,@Mask,@UTCTIMESTAMP,@Reason)
        end
    end
    else begin
        update [dbo].[yaf_BannedName] set Mask = @Mask,Reason = @Reason where ID = @ID
    end
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_bannedname_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_bannedname_list](@BoardID int,@ID int=null,@PageIndex int=null, @PageSize int=null) as
begin
declare @TotalRows int
declare @FirstSelectRowNumber int
declare @LastSelectRowNumber int
 if @ID is null
        begin       
           set @PageIndex = @PageIndex + 1;
           set @FirstSelectRowNumber = 0;  
           set @LastSelectRowNumber = 0;  
           set @TotalRows = 0;
           
           select @TotalRows = count(1) from [dbo].[yaf_BannedName] where BoardID=@BoardID;
           select @FirstSelectRowNumber = (@PageIndex - 1) * @PageSize + 1;
           select @LastSelectRowNumber = (@PageIndex - 1) * @PageSize +  @PageSize;
           
           with BannedNames  as 
           (
             select ROW_NUMBER() over (order by Mask) as RowNum, Mask 
             from  [dbo].[yaf_BannedName] where BoardID=@BoardID
           )
           select
            a.*,
            @TotalRows as TotalRows
            from
            BannedNames c
            inner join [dbo].[yaf_BannedName] a	
            on 	c.Mask = a.Mask	
            where c.RowNum between (@FirstSelectRowNumber) and (@LastSelectRowNumber)
            order by c.RowNum asc
  end
  else
  select * from [dbo].[yaf_BannedName] where ID=@ID and BoardID=@BoardID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_bannedname_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_bannedname_delete](@ID int) as
begin
        delete from [dbo].[yaf_BannedName] where ID = @ID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_bannedemail_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_bannedemail_save](@ID int=null,@BoardID int,@Mask varchar(255), @Reason nvarchar(128), @UTCTIMESTAMP datetime) as
begin
    if (@ID is null or @ID = 0 ) 
    begin
        declare @ExistsRow int
        select @ExistsRow = count(1) from [dbo].[yaf_BannedEmail] where BoardID=@BoardID and Mask=@Mask;
        if (@ExistsRow  is null or @ExistsRow = 0)
        begin
            insert into [dbo].[yaf_BannedEmail](BoardID,Mask,Since,Reason) values(@BoardID,@Mask,@UTCTIMESTAMP,@Reason)
        end
    end
    else begin
        update [dbo].[yaf_BannedEmail] set Mask = @Mask,Reason = @Reason where ID = @ID
    end
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_bannedemail_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_bannedemail_list](@BoardID int,@ID int=null,@PageIndex int=null, @PageSize int=null) as
begin
declare @TotalRows int
declare @FirstSelectRowNumber int
declare @LastSelectRowNumber int
 if @ID is null
        begin       
           set @PageIndex = @PageIndex + 1;
           set @FirstSelectRowNumber = 0;  
           set @LastSelectRowNumber = 0;  
           set @TotalRows = 0;
           
           select @TotalRows = count(1) from [dbo].[yaf_BannedEmail] where BoardID=@BoardID;
           select @FirstSelectRowNumber = (@PageIndex - 1) * @PageSize + 1;
           select @LastSelectRowNumber = (@PageIndex - 1) * @PageSize +  @PageSize;
           
           with BannedEmails  as 
           (
             select ROW_NUMBER() over (order by Mask) as RowNum, Mask 
             from  [dbo].[yaf_BannedEmail] where BoardID=@BoardID
           )
           select
            a.*,
            @TotalRows as TotalRows
            from
            BannedEmails c
            inner join [dbo].[yaf_BannedEmail] a	
            on 	c.Mask = a.Mask	
            where c.RowNum between (@FirstSelectRowNumber) and (@LastSelectRowNumber)
            order by c.RowNum asc
  end
  else
  select * from [dbo].[yaf_BannedEmail] where ID=@ID and BoardID=@BoardID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_bannedemail_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_bannedemail_delete](@ID int) as
begin
        delete from [dbo].[yaf_BannedEmail] where ID = @ID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_bannedip_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_bannedip_save](@ID int=null,@BoardID int,@Mask varchar(57), @Reason nvarchar(128), @UserID int, @UTCTIMESTAMP datetime) as
begin
    if (@ID is null or @ID = 0 ) 
    begin
        declare @IPExistsRow int
        select @IPExistsRow = count(1) from [dbo].[yaf_BannedIP] where BoardID=@BoardID and Mask=@Mask;
        if (@IPExistsRow  is null or @IPExistsRow = 0)
        begin
            insert into [dbo].[yaf_BannedIP](BoardID,Mask,Since,Reason,UserID) values(@BoardID,@Mask,@UTCTIMESTAMP,@Reason,@UserID)
        end
    end
    else begin
        update [dbo].[yaf_BannedIP] set Mask = @Mask,Reason = @Reason, UserID = @UserID where ID = @ID
    end
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_bannedip_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_bannedip_list](@BoardID int,@ID int=null,@PageIndex int=null, @PageSize int=null) as
begin
declare @TotalRows int
declare @FirstSelectRowNumber int
declare @LastSelectRowNumber int
 if @ID is null
        begin       
           set @PageIndex = @PageIndex + 1;
           set @FirstSelectRowNumber = 0;  
           set @LastSelectRowNumber = 0;  
           set @TotalRows = 0;
           
           select @TotalRows = count(1) from [dbo].[yaf_BannedIP] where BoardID=@BoardID;
           select @FirstSelectRowNumber = (@PageIndex - 1) * @PageSize + 1;
           select @LastSelectRowNumber = (@PageIndex - 1) * @PageSize +  @PageSize;
           
           with BannedIps  as 
           (
             select ROW_NUMBER() over (order by Mask) as RowNum, Mask 
             from  [dbo].[yaf_BannedIP] where BoardID=@BoardID
           )
           select
            a.*,
            @TotalRows as TotalRows
            from
            BannedIps c
            inner join [dbo].[yaf_BannedIP] a	
            on 	c.Mask = a.Mask	
            where c.RowNum between (@FirstSelectRowNumber) and (@LastSelectRowNumber)
            order by c.RowNum asc
  end
  else
  select * from [dbo].[yaf_BannedIP] where ID=@ID and BoardID=@BoardID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_bannedip_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_bannedip_delete](@ID int) as
begin
        delete from [dbo].[yaf_BannedIP] where ID = @ID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_accessmask_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_accessmask_save](
    @AccessMaskID		int=null,
    @BoardID			int,
    @Name				nvarchar(50),
    @ReadAccess			bit,
    @PostAccess			bit,
    @ReplyAccess		bit,
    @PriorityAccess		bit,
    @PollAccess			bit,
    @VoteAccess			bit,
    @ModeratorAccess	bit,
    @EditAccess			bit,
    @DeleteAccess		bit,
    @UploadAccess		bit,
    @DownloadAccess		bit,
    @SortOrder          smallint
) as
begin
        declare @Flags	int
    
    set @Flags = 0
    if @ReadAccess<>0 set @Flags = @Flags | 1
    if @PostAccess<>0 set @Flags = @Flags | 2
    if @ReplyAccess<>0 set @Flags = @Flags | 4
    if @PriorityAccess<>0 set @Flags = @Flags | 8
    if @PollAccess<>0 set @Flags = @Flags | 16
    if @VoteAccess<>0 set @Flags = @Flags | 32
    if @ModeratorAccess<>0 set @Flags = @Flags | 64
    if @EditAccess<>0 set @Flags = @Flags | 128
    if @DeleteAccess<>0 set @Flags = @Flags | 256
    if @UploadAccess<>0 set @Flags = @Flags | 512
    if @DownloadAccess<>0 set @Flags = @Flags | 1024

    if @AccessMaskID is null
        insert into [dbo].[yaf_AccessMask](Name,BoardID,Flags,SortOrder)
        values(@Name,@BoardID,@Flags,@SortOrder)
    else
        update [dbo].[yaf_AccessMask] set
            Name			= @Name,
            Flags			= @Flags,
            SortOrder       = @SortOrder
        where AccessMaskID=@AccessMaskID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_accessmask_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_accessmask_list](@BoardID int,@AccessMaskID int=null,@ExcludeFlags int = 0) as
begin
        if @AccessMaskID is null
        select 
            a.* 
        from 
            [dbo].[yaf_AccessMask] a 
        where
            a.BoardID = @BoardID and
            (a.Flags & @ExcludeFlags) = 0
        order by 
            a.SortOrder
    else
        select 
            a.* 
        from 
            [dbo].[yaf_AccessMask] a 
        where
            a.BoardID = @BoardID and
            a.AccessMaskID = @AccessMaskID
        order by 
            a.SortOrder
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_album_getstats]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_album_getstats]
    @UserID INT = NULL,
    @AlbumID INT = NULL,
    @AlbumNumber INT = NULL OUTPUT,
    @ImageNumber BIGINT = NULL OUTPUT
as 
    BEGIN
        IF @AlbumID IS NOT NULL 
            SET @ImageNumber = ( SELECT COUNT(ImageID)
                                 FROM   [dbo].[yaf_UserAlbumImage]
                                 WHERE  AlbumID = @AlbumID
                               )
        ELSE 
            BEGIN
                SET @AlbumNumber = ( SELECT COUNT(AlbumID)
                                     FROM   [dbo].[yaf_UserAlbum]
                                     WHERE  UserID = @UserID
                                   )
                SET @ImageNumber = ( SELECT COUNT(ImageID)
                                     FROM   [dbo].[yaf_UserAlbumImage]
                                     WHERE  AlbumID in (
                                            SELECT  AlbumID
                                            FROM    [dbo].[yaf_UserAlbum]
                                            WHERE   UserID = @UserID )
                                   )
            END
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_album_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_album_delete] ( @AlbumID int )
as 
    BEGIN
        DELETE  FROM [dbo].[yaf_UserAlbumImage]
        WHERE   AlbumID = @AlbumID
        DELETE  FROM [dbo].[yaf_UserAlbum]
        WHERE   AlbumID = @AlbumID       
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_album_images_by_user]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_album_images_by_user](@UserID INT = null)
as 
    BEGIN
        SELECT      a.*
        FROM    [dbo].[yaf_UserAlbumImage] a
                    INNER JOIN [dbo].[yaf_UserAlbum] b ON b.AlbumID = a.AlbumID
        WHERE  b.UserID = @UserID
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_album_image_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_album_image_save]
    (
      @ImageID INT = NULL,
      @AlbumID INT = null,
      @Caption NVARCHAR(255) = null,
      @FileName NVARCHAR(255) = null,
      @Bytes INT = null,
      @ContentType NVARCHAR(50) = null,
      @UTCTIMESTAMP datetime
    )
as 
    BEGIN
        IF @ImageID is not null 
            UPDATE  [dbo].[yaf_UserAlbumImage]
            SET     Caption = @Caption
            WHERE   ImageID = @ImageID
        ELSE
            INSERT  INTO [dbo].[yaf_UserAlbumImage]
                    (
                      AlbumID,
                      Caption,
                      [FileName],
                      Bytes,
                      ContentType,
                      Uploaded,
                      Downloads
                    )
            VALUES  (
                      @AlbumID,
                      @Caption,
                      @FileName,
                      @Bytes,
                      @ContentType,
                      @UTCTIMESTAMP ,
                      0
                    )
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_album_image_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_album_image_list]
    (
      @AlbumID INT = NULL,
      @ImageID INT = null
    )
as 
    BEGIN
        IF @AlbumID IS NOT null 
            SELECT  *
            FROM    [dbo].[yaf_UserAlbumImage]
            WHERE   AlbumID = @AlbumID
            ORDER BY Uploaded DESC
        ELSE 
            SELECT  a.*,
                    b.UserID
            FROM    [dbo].[yaf_UserAlbumImage] a
                    INNER JOIN [dbo].[yaf_UserAlbum] b ON b.AlbumID = a.AlbumID
            WHERE   ImageID = @ImageID
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_album_image_download]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_album_image_download] ( @ImageID INT )
as 
    BEGIN
        UPDATE  [dbo].[yaf_UserAlbumImage]
        SET     Downloads = Downloads + 1
        WHERE   ImageID = @ImageID
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_album_image_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_album_image_delete] ( @ImageID INT )
as 
    BEGIN
        DELETE  FROM [dbo].[yaf_UserAlbumImage]
        WHERE   ImageID = @ImageID
        UPDATE  [dbo].[yaf_UserAlbum]
        SET     CoverImageID = NULL
        WHERE   CoverImageID = @ImageID
        UPDATE  [dbo].[yaf_UserAlbum]
        SET     CoverImageID = NULL
        WHERE   CoverImageID = @ImageID
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_role_removeuserfromrole]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_role_removeuserfromrole]
(
@ApplicationName nvarchar(256),
@UserName nvarchar(256),
@Rolename nvarchar(256)
)
AS
BEGIN
    	DECLARE @UserID nvarchar(64)
	DECLARE @RoleID uniqueidentifier
	DECLARE @ApplicationID uniqueidentifier

	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT	
	
	SET @RoleID = (SELECT RoleID FROM [dbo].[yaf_prov_Role] r WHERE r.RolenameLwd = LOWER(@Rolename) AND r.ApplicationID = @ApplicationID)
	SET @UserID = (SELECT UserID FROM [dbo].[yaf_prov_Membership] m WHERE m.UsernameLwd=LOWER(@UserName) AND m.ApplicationID = @ApplicationID)
	
	DELETE FROM [dbo].[yaf_prov_RoleMembership] WHERE RoleID = @RoleID AND UserID=@UserID
	
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_role_isuserinrole]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_role_isuserinrole]
(
@ApplicationName nvarchar(256),
@UserName nvarchar(256),
@Rolename nvarchar(256)
)
AS
BEGIN
    	DECLARE @ApplicationID uniqueidentifier

	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT

	SELECT m.* FROM [dbo].[yaf_prov_RoleMembership] rm 
		INNER JOIN [dbo].[yaf_prov_Membership] m ON rm.UserID = m.UserID
		INNER JOIN [dbo].[yaf_prov_Role] r ON rm.RoleID = r.RoleID
		WHERE m.UsernameLwd=LOWER(@UserName) AND r.RolenameLwd =LOWER(@Rolename) AND r.ApplicationID = @ApplicationID;
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_role_getroles]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_role_getroles]
(
@ApplicationName nvarchar(256),
@UserName nvarchar(256) = null
)
AS
BEGIN
    	DECLARE @ApplicationID uniqueidentifier
	
 	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT

	IF (@UserName is null)
		SELECT r.* FROM [dbo].[yaf_prov_Role] r WHERE r.ApplicationID = @ApplicationID
	ELSE
		SELECT
			r.*
		FROM
			[dbo].[yaf_prov_Role] r
		INNER JOIN
			[dbo].[yaf_prov_RoleMembership] rm ON r.RoleID = rm.RoleID
		INNER JOIN
			[dbo].[yaf_prov_Membership] m ON m.UserID = rm.UserID
		WHERE
			r.ApplicationID  = @ApplicationID
			AND m.UsernameLwd = LOWER(@UserName)
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_role_findusersinrole]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_role_findusersinrole]
(
@ApplicationName nvarchar(256),
@Rolename nvarchar(256)
)
AS
BEGIN
    	DECLARE @RoleID uniqueidentifier
	DECLARE @ApplicationID uniqueidentifier
	
	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT

	SET @RoleID = (SELECT RoleID FROM [dbo].[yaf_prov_Role] r INNER JOIN [dbo].[yaf_prov_Application] a ON r.ApplicationID = a.ApplicationID WHERE r.RolenameLwd=LOWER(@Rolename) AND a.ApplicationID = @ApplicationID)

	SELECT m.* FROM [dbo].[yaf_prov_Membership] m INNER JOIN [dbo].[yaf_prov_RoleMembership] rm ON m.UserID = rm.UserID WHERE rm.RoleID = @RoleID
		
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_role_exists]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_role_exists]
(
@ApplicationName nvarchar(256),
@Rolename nvarchar(256)
)
AS
BEGIN
    	DECLARE @ApplicationID uniqueidentifier

	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT
	
	SELECT COUNT(1) FROM [dbo].[yaf_prov_Role]
		WHERE RolenameLwd = LOWER(@Rolename) AND ApplicationID = @ApplicationID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_role_deleterole]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_role_deleterole]
(
@ApplicationName nvarchar(256),
@Rolename nvarchar(256),
@DeleteOnlyIfRoleIsEmpty bit
)
AS
BEGIN
    	DECLARE @RoleID uniqueidentifier
	DECLARE @ErrorCode int
	DECLARE @ApplicationID uniqueidentifier
	
	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT	
	
	SET @ErrorCode = 0
	SET @RoleID = (SELECT RoleID FROM [dbo].[yaf_prov_Role] r WHERE r.RolenameLwd=LOWER(@Rolename) AND r.ApplicationID = @ApplicationID)
	
	IF (@DeleteOnlyIfRoleIsEmpty <> 0)
	BEGIN
		IF (EXISTS (SELECT 1 FROM [dbo].[yaf_prov_RoleMembership] rm WHERE rm.RoleID=@RoleID))
			SELECT @ErrorCode = 2
	ELSE
		DELETE FROM [dbo].[yaf_prov_RoleMembership] WHERE RoleID=@RoleID
	END	

	IF (@ErrorCode = 0)
		DELETE FROM [dbo].[yaf_prov_Role] WHERE RoleID=@RoleID
    
    RETURN @ErrorCode	
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_role_createrole]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_role_createrole]
(
@ApplicationName nvarchar(256),
@Rolename nvarchar(256)
)
AS
BEGIN
    	DECLARE @ApplicationID uniqueidentifier
	
	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT
	
	IF (NOT EXISTS(SELECT 1 FROM [dbo].[yaf_prov_Role] r WHERE r.ApplicationID = @ApplicationID AND r.RolenameLwd = LOWER(@Rolename)))
		INSERT INTO [dbo].[yaf_prov_Role] (RoleID, ApplicationID, RoleName, RoleNameLwd) VALUES (NEWID(),@ApplicationID, @Rolename,LOWER(@Rolename));		
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_role_addusertorole]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Roles Create Procedures
-- =============================================

CREATE PROCEDURE [dbo].[yaf_prov_role_addusertorole]
(
@ApplicationName nvarchar(256),
@UserName nvarchar(256),
@Rolename nvarchar(256)
)
AS
BEGIN
	DECLARE @UserID nvarchar(64)
	DECLARE @RoleID uniqueidentifier
	DECLARE @ApplicationID uniqueidentifier
	
	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT

	SET @UserID = (SELECT UserID FROM [dbo].[yaf_prov_Membership] m WHERE m.UsernameLwd=LOWER(@UserName) AND m.ApplicationID = @ApplicationID)
	SET @RoleID = (SELECT RoleID FROM [dbo].[yaf_prov_Role] r WHERE r.RolenameLwd=LOWER(@Rolename) AND r.ApplicationID = @ApplicationID)

	IF (@UserID IS NULL OR @RoleID IS NULL)
		RETURN;
	
	IF (NOT EXISTS(SELECT 1 FROM [dbo].[yaf_prov_RoleMembership] rm WHERE rm.UserID=@UserID AND rm.RoleID=@RoleID))
		INSERT INTO [dbo].[yaf_prov_RoleMembership] (RoleID, UserID) VALUES (@RoleID, @UserID);
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_resetpassword]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_resetpassword]
(
@ApplicationName nvarchar(256),
@UserName nvarchar(256),
@Password nvarchar(256),
@PasswordSalt nvarchar(256),
@PasswordFormat nvarchar(256),
@MaxInvalidAttempts int,
@PasswordAttemptWindow int,
@CurrentTimeUtc datetime
)
AS
BEGIN
    	DECLARE @ApplicationID uniqueidentifier

	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT
	
	UPDATE [dbo].[yaf_prov_Membership] SET
	[Password] = @Password,
	PasswordSalt = @PasswordSalt,
	PasswordFormat = @PasswordFormat,
	LastPasswordChange = @CurrentTimeUtc
	WHERE ApplicationID = @ApplicationID AND
	UsernameLwd = LOWER(@UserName);

END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_profile_getprofiles]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_profile_getprofiles]
(
	@ApplicationName        nvarchar(256),
	@PageIndex              int,
	@PageSize               int,
	@UserNameToMatch        nvarchar(256) = NULL,
	@InactiveSinceDate      datetime      = NULL
)
AS
BEGIN
    	DECLARE @ApplicationID uniqueidentifier

	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexID int IDENTITY (0, 1) NOT NULL,
        UserID nvarchar(64) collate database_default
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserID)
        SELECT  m.UserID
        FROM    [dbo].[yaf_prov_Membership] m, [dbo].[yaf_prov_Profile] p
        WHERE   ApplicationID = @ApplicationID
            AND m.UserID = p.UserID
            AND (@InactiveSinceDate IS NULL OR LastActivity <= @InactiveSinceDate)
            AND (@UserNameToMatch IS NULL OR m.UserNameLwd LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName


    SELECT  m.UserName, m.LastActivity, p.*
    FROM    [dbo].[yaf_prov_Membership] m, [dbo].[yaf_prov_Profile] p, #PageIndexForUsers i
    WHERE   m.UserId = p.UserId AND p.UserId = i.UserID AND i.IndexID >= @PageLowerBound AND i.IndexID <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_profile_getnumberinactiveprofiles]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_profile_getnumberinactiveprofiles]
    @ApplicationName        nvarchar(256),
    @InactiveSinceDate      datetime
AS
BEGIN
    	DECLARE @ApplicationID uniqueidentifier

	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT

    SELECT  COUNT(*)
    FROM    [dbo].[yaf_prov_Membership] m, [dbo].[yaf_prov_Profile] p
    WHERE   ApplicationID = @ApplicationID
        AND m.UserID = p.UserID
        AND (LastActivity <= @InactiveSinceDate)
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_profile_deleteprofiles]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_profile_deleteprofiles]
(
@ApplicationName nvarchar(256),
@UserNames nvarchar(4000)
)
AS
BEGIN
    	DECLARE @ApplicationID uniqueidentifier
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0

	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0

			DELETE FROM [dbo].[yaf_prov_Profile] WHERE UserID IN (SELECT UserID FROM [dbo].[yaf_prov_Membership] WHERE UsernameLwd = LOWER(@UserName) AND ApplicationID = @ApplicationID)

            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Error
            END
            IF (@@ROWCOUNT <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END

    SELECT @NumDeleted

    RETURN 0

Error:

    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_profile_deleteinactive]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Profiles Create Procedures
-- =============================================

CREATE PROCEDURE [dbo].[yaf_prov_profile_deleteinactive]
(
@ApplicationName nvarchar(256),
@InactiveSinceDate datetime
)
AS
BEGIN
    	DECLARE @ApplicationID uniqueidentifier

	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT

    DELETE
    FROM    [dbo].[yaf_prov_Profile]
    WHERE   UserID IN
            (   SELECT  UserID
                FROM    [dbo].[yaf_prov_Membership] m
                WHERE   ApplicationID = @ApplicationID
                        AND (LastActivity <= @InactiveSinceDate)
            )

    SELECT  @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_getusernamebyemail]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_getusernamebyemail]
(
@ApplicationName nvarchar(256),
@Email nvarchar(256)
)
AS
BEGIN
    	DECLARE @ApplicationID uniqueidentifier
	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT

	SELECT m.Username FROM [dbo].[yaf_prov_Membership] m INNER JOIN [dbo].[yaf_prov_Application] a ON m.ApplicationID = a.ApplicationID  WHERE a.ApplicationID = @ApplicationID AND m.EmailLwd = LOWER(@Email);
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_getuser]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_getuser]
(
@ApplicationName nvarchar(256),
@UserName nvarchar(256) = null,
@UserKey nvarchar(64) = null,
@UserIsOnline bit,
@UTCTIMESTAMP datetime
)
AS
BEGIN
    	DECLARE @ApplicationID uniqueidentifier

	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT
	
	IF (@UserKey IS NULL)
		SELECT m.* FROM [dbo].[yaf_prov_Membership] m WHERE m.UsernameLwd = LOWER(@UserName) and m.ApplicationID = @ApplicationID
	ELSE
		SELECT m.* FROM [dbo].[yaf_prov_Membership] m WHERE m.UserID = @UserKey and m.ApplicationID = @ApplicationID
	
	-- IF USER IS ONLINE DO AN UPDATE USER	
	IF (@UserIsOnline = 1)
	BEGIN
		UPDATE [dbo].[yaf_prov_Membership] SET LastActivity = @UTCTIMESTAMP  WHERE UsernameLwd = LOWER(@UserName) and ApplicationID = @ApplicationID
	END		
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_getnumberofusersonline]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_getnumberofusersonline]
(
@ApplicationName nvarchar(256),
@TimeWindow int,
@CurrentTimeUtc DateTime
)
AS
BEGIN
    	DECLARE @ActivityDate DateTime
	SET @ActivityDate = DATEADD(n, - @TimeWindow, @CurrentTimeUtc)

	DECLARE @ApplicationID uniqueidentifier
	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT
	
	DECLARE @NumberActive int
	SET @NumberActive = (SELECT COUNT(1) FROM [dbo].[yaf_prov_Membership] m INNER JOIN [dbo].[yaf_prov_Application] a ON m.ApplicationID = a.ApplicationID  WHERE a.ApplicationID = @ApplicationID AND m.LastLogin >= @ActivityDate)
    
    RETURN @NumberActive

END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_getallusers]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_getallusers]
(
@ApplicationName nvarchar(256),
@PageIndex int,
@PageSize int
)
AS
BEGIN
    
    -- Set the page bounds
	DECLARE @ApplicationID uniqueidentifier

	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT

    DECLARE @PagingLowerBoundary int
    DECLARE @PagingUpperBoundary int
    DECLARE @TotalRecords   int
    SET @PagingLowerBoundary = @PageSize * @PageIndex
    SET @PagingUpperBoundary = @PageSize - 1 + @PagingLowerBoundary
    
	CREATE TABLE #RowNumber (RowNumber int IDENTITY (1, 1),  UserID nvarchar(64) collate database_default)
	
	INSERT INTO #RowNumber (UserID) SELECT m.UserID FROM [dbo].[yaf_prov_Membership] m INNER JOIN [dbo].[yaf_prov_Application] a ON m.ApplicationID = a.ApplicationID WHERE a.ApplicationID = @ApplicationID

	SELECT m.*, r.RowNumber FROM [dbo].[yaf_prov_Membership] m INNER JOIN #RowNumber r ON m.UserID = r.UserID WHERE r.RowNumber >= @PagingLowerBoundary AND r.RowNumber <= @PagingUpperBoundary;
    
	SET @TotalRecords = (SELECT COUNT(RowNumber) FROM #RowNumber)
	DROP TABLE #RowNumber
	RETURN @TotalRecords
   
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_findusersbyname]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_findusersbyname]
(
@ApplicationName nvarchar(256),
@UserName nvarchar(256),
@PageIndex int,
@PageSize int
)
AS
BEGIN
    
    -- Set the page bounds
	DECLARE @ApplicationID uniqueidentifier

	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT

    DECLARE @PagingLowerBoundary int
    DECLARE @PagingUpperBoundary int
    DECLARE @TotalRecords   int
    SET @PagingLowerBoundary = @PageSize * @PageIndex
    SET @PagingUpperBoundary = @PageSize - 1 + @PagingLowerBoundary
    
	CREATE TABLE #RowNumber (RowNumber int IDENTITY (1, 1),  UserID nvarchar(64) collate database_default)
	
	INSERT INTO #RowNumber (UserID) SELECT m.UserID FROM [dbo].[yaf_prov_Membership] m INNER JOIN [dbo].[yaf_prov_Application] a ON m.ApplicationID = a.ApplicationID WHERE a.ApplicationID = @ApplicationID AND m.UsernameLwd LIKE '%' + LOWER(@UserName) + '%'

	SELECT m.*, r.RowNumber FROM [dbo].[yaf_prov_Membership] m INNER JOIN #RowNumber r ON m.UserID = r.UserID WHERE r.RowNumber >= @PagingLowerBoundary AND r.RowNumber <= @PagingUpperBoundary;
    
	SET @TotalRecords = (SELECT COUNT(RowNumber) FROM #RowNumber)
	DROP TABLE #RowNumber
	RETURN @TotalRecords
   
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_findusersbyemail]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_findusersbyemail]
(
@ApplicationName nvarchar(256),
@EmailAddress nvarchar(256),
@PageIndex int,
@PageSize int
)
AS
BEGIN
    
    -- Set the page bounds
	DECLARE @ApplicationID uniqueidentifier

	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT

    DECLARE @PagingLowerBoundary int
    DECLARE @PagingUpperBoundary int
    DECLARE @TotalRecords   int
    SET @PagingLowerBoundary = @PageSize * @PageIndex
    SET @PagingUpperBoundary = @PageSize - 1 + @PagingLowerBoundary
    
	CREATE TABLE #RowNumber (RowNumber int IDENTITY (1, 1), UserID nvarchar(64) collate database_default)
	
	INSERT INTO #RowNumber (UserID) SELECT m.UserID FROM [dbo].[yaf_prov_Membership] m INNER JOIN [dbo].[yaf_prov_Application] a ON m.ApplicationID = a.ApplicationID  WHERE a.ApplicationID = @ApplicationID AND m.EmailLwd = LOWER(@EmailAddress)

	SELECT m.*, r.RowNumber FROM [dbo].[yaf_prov_Membership] m INNER JOIN #RowNumber r ON m.UserID = r.UserID WHERE r.RowNumber >= @PagingLowerBoundary AND r.RowNumber <= @PagingUpperBoundary;
    
	SET @TotalRecords = (SELECT COUNT(RowNumber) FROM #RowNumber)
	DROP TABLE #RowNumber
	RETURN @TotalRecords
   
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_deleteuser]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_deleteuser]
(
@ApplicationName nvarchar(256),
@UserName nvarchar(256),
@DeleteAllRelated bit
)
AS
BEGIN
    	DECLARE @ApplicationID uniqueidentifier, @UserID nvarchar(64)
	
	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT

	-- get the userID
	SELECT @UserID = UserID FROM [dbo].[yaf_prov_Membership] WHERE ApplicationID = @ApplicationID AND UsernameLwd = LOWER(@UserName);

	IF (@UserID IS NOT NULL)
	BEGIN
		-- Delete records from membership
		DELETE FROM [dbo].[yaf_prov_Membership] WHERE UserID = @UserID
		-- Delete from Role table
		DELETE FROM [dbo].[yaf_prov_RoleMembership] WHERE UserID = @UserID
		-- Delete from Profile table
		DELETE FROM [dbo].[yaf_prov_Profile] WHERE UserID = @UserID
	END	
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_createuser]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_createuser]
(
@ApplicationName nvarchar(256),
@UserName nvarchar(256),
@Password nvarchar(256),
@PasswordSalt nvarchar(256) = null,
@PasswordFormat nvarchar(256) = null,
@Email nvarchar(256) = null,
@PasswordQuestion nvarchar(256) = null,
@PasswordAnswer nvarchar(256) = null,
@IsApproved bit = null,
@UTCTIMESTAMP datetime,
@UserKey nvarchar(64) = null out
)
AS
BEGIN
    	DECLARE @ApplicationID uniqueidentifier
	
	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT
	IF @UserKey IS NULL
		SET @UserKey = NEWID()
		
	INSERT INTO [dbo].[yaf_prov_Membership] (UserID,ApplicationID,Joined,Username,UsernameLwd,[Password],PasswordSalt,PasswordFormat,Email,EmailLwd,PasswordQuestion,PasswordAnswer,IsApproved)
		VALUES (@UserKey, @ApplicationID, @UTCTIMESTAMP ,@UserName, LOWER(@UserName), @Password, @PasswordSalt, @PasswordFormat, @Email, LOWER(@Email), @PasswordQuestion, @PasswordAnswer, @IsApproved);
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_poll_update]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_poll_update](
    @PollID		int,
    @Question	nvarchar(50),
    @Closes 	datetime = null,
    @QuestionObjectPath nvarchar(255), 
    @QuestionMimeType varchar(50),
    @IsBounded  bit,
    @IsClosedBounded  bit,
    @AllowMultipleChoices bit,
    @ShowVoters bit,
    @AllowSkipVote bit

) as
begin
    declare @pgid int
    declare @flags int

        update [dbo].[yaf_Poll]
        set Flags	= 0 where PollID = @PollID AND Flags IS NULL;

        SELECT @flags = Flags FROM [dbo].[yaf_Poll]		
        where PollID = @PollID

        -- is closed bound flag
        SET @flags = (CASE				
        WHEN @IsClosedBounded > 0 AND (@flags & 4) <> 4 THEN @flags | 4		
        WHEN @IsClosedBounded <= 0 AND (@flags & 4) = 4  THEN @flags ^ 4
        ELSE @flags END)

        -- allow multiple choices flag
        SET @flags = (CASE				
        WHEN @AllowMultipleChoices > 0 AND (@flags & 8) <> 8 THEN @flags | 8		
        WHEN @AllowMultipleChoices <= 0 AND (@flags & 8) = 8  THEN @flags ^ 8
        ELSE @flags END)
        
        -- show who's voted for a poll flag
        SET @flags = (CASE				
        WHEN @ShowVoters > 0 AND (@flags & 16) <> 16 THEN @flags | 16		
        WHEN @ShowVoters <= 0 AND (@flags & 16) = 16  THEN @flags ^ 16
        ELSE @flags END)

        -- allow users don't vote and see results
        SET @flags = (CASE				
        WHEN @AllowSkipVote > 0 AND (@flags & 32) <> 32 THEN @flags | 32		
        WHEN @AllowSkipVote <= 0 AND (@flags & 32) = 32  THEN @flags ^ 32
        ELSE @flags END)

      update [dbo].[yaf_Poll]
        set Question	=	@Question,
            Closes		=	@Closes,
            ObjectPath = @QuestionObjectPath,
            MimeType = @QuestionMimeType,
            Flags	= @flags
        where PollID = @PollID

      SELECT  @pgid = PollGroupID FROM [dbo].[yaf_Poll]
      where PollID = @PollID
   
    update [dbo].[yaf_PollGroupCluster]
        set Flags	= (CASE 
        WHEN @IsBounded > 0 AND (Flags & 2) <> 2 THEN Flags | 2 		
        WHEN @IsBounded <= 0 AND (Flags & 2) = 2 THEN Flags ^ 2 		
        ELSE Flags END)		
        where PollGroupID = @pgid
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_changepasswordquestionandanswer]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_changepasswordquestionandanswer]
(
@ApplicationName nvarchar(256),
@UserName nvarchar(256),
@PasswordQuestion nvarchar(256),
@PasswordAnswer nvarchar(256)
)
AS
BEGIN
    	DECLARE @ApplicationID uniqueidentifier
	
	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT
	
	UPDATE [dbo].[yaf_prov_Membership] SET PasswordQuestion=@PasswordQuestion, PasswordAnswer=@PasswordAnswer
	WHERE UsernameLwd=LOWER(@UserName) and ApplicationID=@ApplicationID;

END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_changepassword]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_changepassword]
(
@ApplicationName nvarchar(256),
@UserName nvarchar(256),
@Password nvarchar(256),
@PasswordSalt nvarchar(256),
@PasswordFormat nvarchar(256),
@PasswordAnswer nvarchar(256)
)
AS
BEGIN
    	DECLARE @ApplicationID uniqueidentifier

	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT
	
	UPDATE [dbo].[yaf_prov_Membership] SET [Password]=@Password, PasswordSalt=@PasswordSalt,
		PasswordFormat=@PasswordFormat, PasswordAnswer=@PasswordAnswer
	WHERE UsernameLwd=LOWER(@UserName) and ApplicationID=@ApplicationID;

END
GO
/****** Object:  StoredProcedure [dbo].[yaf_pollgroup_attach]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_pollgroup_attach](@PollGroupID int, @TopicID int = null, @ForumID int = null, @CategoryID int = null, @BoardID int = null) as
begin
                   -- this deletes possible polls without choices it should not normally happen
                   DECLARE @tablett table (PollID int) 
                   INSERT INTO @tablett(PollID)
                   SELECT PollID FROM [dbo].[yaf_Poll] WHERE PollGroupID = NULL
                  
                   DELETE FROM [dbo].[yaf_PollVote] WHERE PollID IN (select PollID FROM @tablett)
                   DELETE FROM [dbo].[yaf_Choice] WHERE PollID IN (select PollID FROM @tablett)
                   DELETE FROM [dbo].[yaf_Poll] WHERE PollID IN (select PollID FROM @tablett)
                                   
                   if NOT EXISTS (SELECT top 1 1 FROM @tablett)
                   begin
                   if @TopicID > 0
                   begin
                   if exists (select top 1 1 from [dbo].[yaf_Topic] where TopicID = @TopicID  and PollID is not null)
                   begin
                   SELECT 1
                   end
                   else
                   begin
                   Update [dbo].[yaf_Topic] set PollID = @PollGroupID where TopicID = @TopicID 
                   SELECT 0
                   end
                   end              
                  
                   if @ForumID > 0
                   begin
                   if exists (select top 1 1 from [dbo].[yaf_Forum] where ForumID = @ForumID and PollGroupID is not null)
                   begin
                   SELECT 1
                   end
                   else
                   begin
                   Update [dbo].[yaf_Forum] set PollGroupID = @PollGroupID where ForumID = @ForumID
                   SELECT 0
                   end
                   end

                   if @CategoryID > 0
                   begin
                   if exists (select top 1 1 from [dbo].[yaf_Category] where CategoryID = @CategoryID and PollGroupID is null)
                   begin
                   SELECT 1
                   end
                   else
                   begin
                   Update [dbo].[yaf_Category] set PollGroupID = @PollGroupID where CategoryID = @CategoryID
                   SELECT 0
                   end
                   end
                   end
                   SELECT 1
                       

end
GO
/****** Object:  StoredProcedure [dbo].[yaf_poll_remove]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_poll_remove](
    @PollGroupID int, @PollID int = null, @BoardID int = null, @RemoveCompletely bit)
as
begin
declare @groupcount int
    
    if @RemoveCompletely = 1 
    begin
    -- delete vote records first
    delete from [dbo].[yaf_PollVote] where PollID = @PollID
    -- delete choices 
    delete from [dbo].[yaf_Choice] where PollID = @PollID
    -- delete poll
    Update [dbo].[yaf_Poll] set PollGroupID = NULL where PollID = @PollID
    delete from [dbo].[yaf_Poll] where PollID = @PollID 	
    if  NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[yaf_Poll] where PollGroupID = @PollGroupID) 
        begin	
              
                   Update [dbo].[yaf_Topic] set PollID = NULL where PollID = @PollGroupID                 
                  
                   
                   Update [dbo].[yaf_Forum] set PollGroupID = NULL where PollGroupID = @PollGroupID
              
    
                   Update [dbo].[yaf_Category] set PollGroupID = NULL where PollGroupID = @PollGroupID                
        
              
        
       
         
        DELETE FROM  [dbo].[yaf_PollGroupCluster] WHERE PollGroupID = @PollGroupID	
        end  	
    end
    else
    begin    
    Update [dbo].[yaf_Poll] set PollGroupID = NULL where PollID = @PollID	                         
    end

end
GO
/****** Object:  StoredProcedure [dbo].[yaf_pollgroup_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_pollgroup_list](@UserID int, @ForumID int = null, @BoardID int) as
begin
    select distinct(p.Question), p.PollGroupID from [dbo].[yaf_Poll] p
    LEFT JOIN 	[dbo].[yaf_PollGroupCluster] pgc ON pgc.PollGroupID = p.PollGroupID
    WHERE p.PollGroupID is not null
    -- WHERE p.Closes IS NULL OR p.Closes > @UTCTIMESTAMP
    order by Question asc
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_watchtopic_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_watchtopic_list](@UserID int) as
begin
        select
        a.*,
        TopicName = b.Topic,
        Replies = (select count(1) from [dbo].[yaf_Message] x where x.TopicID=b.TopicID) -1,
		b.ForumID,
        b.[Views],
        b.LastPosted,
        b.LastMessageID,
        b.LastUserID,
        LastUserName = IsNull(b.LastUserName,(select x.Name from [dbo].[yaf_User] x where x.UserID=b.LastUserID)),
        LastUserDisplayName = IsNull(b.LastUserDisplayName,(select x.DisplayName from [dbo].[yaf_User] x where x.UserID=b.LastUserID))
    from
        [dbo].[yaf_WatchTopic] a
        inner join [dbo].[yaf_Topic] b on b.TopicID = a.TopicID
    where
        a.UserID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_watchforum_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_watchforum_list](@UserID int) as
begin
    
    select
        a.*,
        ForumName = b.Name,
        [Messages] = (select count(1) from [dbo].[yaf_Topic] x join [dbo].[yaf_Message] y on y.TopicID=x.TopicID where x.ForumID=a.ForumID),
        Topics = (select count(1) from [dbo].[yaf_Topic] x where x.ForumID=a.ForumID and x.TopicMovedID is null),
        b.LastPosted,
        b.LastMessageID,
        LastTopicID = (select TopicID from [dbo].[yaf_Message] x where x.MessageID=b.LastMessageID),
        b.LastUserID,
        LastUserName = IsNull(b.LastUserName,(select x.Name from [dbo].[yaf_User] x where x.UserID=b.LastUserID)),
        LastUserDisplayName = IsNull(b.LastUserDisplayName,(select x.DisplayName from [dbo].[yaf_User] x where x.UserID=b.LastUserID))
    from
        [dbo].[yaf_WatchForum] a
        inner join [dbo].[yaf_Forum] b on b.ForumID = a.ForumID
    where
        a.UserID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_userforum_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_userforum_list](@UserID int=null,@ForumID int=null) as 
begin
    
    select 
        a.*,
        b.AccessMaskID,
        b.Accepted,
        Access = c.Name
    from
        [dbo].[yaf_User] a
        join [dbo].[yaf_UserForum] b on b.UserID=a.UserID
        join [dbo].[yaf_AccessMask] c on c.AccessMaskID=b.AccessMaskID
    where
        (@UserID is null or a.UserID=@UserID) and
        (@ForumID is null or b.ForumID=@ForumID)
    order by
        a.Name	
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_user_save](
    @UserID				int,
    @BoardID			int,
    @UserName			nvarchar(255) = null,
    @DisplayName		nvarchar(255) = null,
    @Email				nvarchar(255) = null,
    @TimeZone			int,
    @LanguageFile		nvarchar(50) = null,
    @Culture		    varchar(10) = null,
    @ThemeFile			nvarchar(50) = null,
    @TextEditor			nvarchar(50) = null,
    @OverrideDefaultTheme	bit = null,
    @Approved			bit = null,
    @PMNotification		bit = null,
    @AutoWatchTopics    bit = null,	
    @ProviderUserKey	nvarchar(64) = null,
    @DSTUser            bit = null,
    @HideUser           bit = null,
    @NotificationType	int = null,
    @UTCTIMESTAMP datetime)
AS
begin
    
    declare @RankID int
    declare @Flags int	
    declare @OldDisplayName nvarchar(255)		
        
    if @DSTUser is null SET @DSTUser = 0
    if @HideUser is null SET @HideUser = 0
    if @PMNotification is null SET @PMNotification = 1
    if @AutoWatchTopics is null SET @AutoWatchTopics = 0
    if @OverrideDefaultTheme is null SET @OverrideDefaultTheme=0

    if @UserID is null or @UserID<1 begin
        
        if @Approved<>0 set @Flags = @Flags | 2	
        if @Email = '' set @Email = null
        
        select @RankID = RankID from [dbo].[yaf_Rank] where (Flags & 1)<>0 and BoardID=@BoardID

        insert into [dbo].[yaf_User](BoardID,RankID,[Name],DisplayName,Password,Email,Joined,LastVisit,NumPosts,TimeZone,Flags,PMNotification,AutoWatchTopics,NotificationType,ProviderUserKey) 
        values(@BoardID,@RankID,@UserName,@DisplayName,'-',@Email,@UTCTIMESTAMP ,@UTCTIMESTAMP ,0,@TimeZone, @Flags,@PMNotification,@AutoWatchTopics,@NotificationType,@ProviderUserKey)		
    
        set @UserID = SCOPE_IDENTITY()

        insert into [dbo].[yaf_UserGroup](UserID,GroupID) select @UserID,GroupID from [dbo].[yaf_Group] where BoardID=@BoardID and (Flags & 4)<>0
    end
    else begin
        SELECT @Flags = Flags, @OldDisplayName = DisplayName FROM [dbo].[yaf_User] where UserID = @UserID
        
        -- set user dirty 
        set @Flags = @Flags	| 64
        
        IF ((@DSTUser<>0) AND (@Flags & 32) <> 32)		
        SET @Flags = @Flags | 32
        ELSE IF ((@DSTUser=0) AND (@Flags & 32) = 32)
        SET @Flags = @Flags ^ 32
            
        IF ((@HideUser<>0) AND ((@Flags & 16) <> 16)) 
        SET @Flags = @Flags | 16 
        ELSE IF ((@HideUser=0) AND ((@Flags & 16) = 16)) 
        SET @Flags = @Flags ^ 16
        
        update [dbo].[yaf_User] set
            TimeZone = @TimeZone,
            LanguageFile = @LanguageFile,
            ThemeFile = @ThemeFile,
            Culture = @Culture,
            TextEditor = @TextEditor,
            OverrideDefaultThemes = @OverrideDefaultTheme,
            PMNotification = (CASE WHEN (@PMNotification is not null) THEN  @PMNotification ELSE PMNotification END),
            AutoWatchTopics = (CASE WHEN (@AutoWatchTopics is not null) THEN  @AutoWatchTopics ELSE AutoWatchTopics END),
            NotificationType =  (CASE WHEN (@NotificationType is not null) THEN  @NotificationType ELSE NotificationType END),
            Flags = (CASE WHEN @Flags<>Flags THEN  @Flags ELSE Flags END),
            DisplayName = (CASE WHEN (@DisplayName is not null) THEN  @DisplayName ELSE DisplayName END),
            Email = (CASE WHEN (@Email is not null) THEN  @Email ELSE Email END) 
        where UserID = @UserID	
        -- here we sync a new display name everywhere
        if (@DisplayName IS NOT NULL AND COALESCE(@OldDisplayName,'') != COALESCE(@DisplayName,''))
        begin
        -- sync display names everywhere - can run a long time on large forums
        update [dbo].[yaf_Forum] set LastUserDisplayName = @DisplayName where LastUserID = @UserID  AND (LastUserDisplayName IS NULL OR LastUserDisplayName = @OldDisplayName)
        update [dbo].[yaf_Topic] set LastUserDisplayName = @DisplayName where LastUserID = @UserID AND (LastUserDisplayName IS NULL OR LastUserDisplayName = @OldDisplayName)
        update [dbo].[yaf_Topic] set UserDisplayName = @DisplayName where UserID = @UserID AND (UserDisplayName IS NULL OR UserDisplayName = @OldDisplayName)
        update [dbo].[yaf_Message] set UserDisplayName = @DisplayName where UserID = @UserID AND (UserDisplayName IS NULL OR UserDisplayName = @OldDisplayName)
        update [dbo].[yaf_ShoutboxMessage] set UserDisplayName = @DisplayName where UserID = @UserID AND (UserDisplayName IS NULL OR UserDisplayName = @OldDisplayName)
        end
        
    end
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_nntp]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_nntp](@BoardID int,@UserName nvarchar(255),@Email nvarchar(255),@TimeZone int, @UTCTIMESTAMP datetime) as
begin	
    
    declare @UserID int

    set @UserName = @UserName + ' (NNTP)'

    select
        @UserID=UserID
    from
        [dbo].[yaf_User]
    where
        BoardID=@BoardID and
        Name=@UserName

    if @@ROWCOUNT<1
    begin
        exec [dbo].[yaf_user_save] null,@BoardID,@UserName,@UserName,@Email,@TimeZone,null,null,null,null,null, 1, null, null, null, 0, 0,@UTCTIMESTAMP 
        
        -- The next one is not safe, but this procedure is only used for testing
        select @UserID = @@IDENTITY
    end

    select UserID=@UserID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_topics_byuser]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_topics_byuser]
(   @BoardID int,
    @CategoryID int=null,
    @PageUserID int,		
    @SinceDate datetime=null,
    @ToDate datetime,
    @PageIndex int = 1, 
    @PageSize int = 0, 
    @StyledNicks bit = 0,	
    @FindLastRead bit = 0
)
AS
begin
  declare @TotalRows int
   declare @FirstSelectRowNumber int
   declare @LastSelectRowNumber int
   -- find total returned count
   select  @TotalRows = count(1)		
        from
        [dbo].[yaf_Topic] c
        join [dbo].[yaf_User] b on b.UserID=c.UserID
        join [dbo].[yaf_Forum] d on d.ForumID=c.ForumID
        join [dbo].[yaf_ActiveAccess] x  with(nolock) on x.ForumID=d.ForumID
        join [dbo].[yaf_Category] cat on cat.CategoryID=d.CategoryID
    where
        (c.LastPosted between @SinceDate and @ToDate) and
        x.UserID = @PageUserID and
        CONVERT(int,x.ReadAccess) <> 0 and
        cat.BoardID = @BoardID and
        (@CategoryID is null or cat.CategoryID=@CategoryID) and
        c.IsDeleted = 0
        and	c.TopicMovedID is null
        and c.TopicID = (SELECT TOP 1 mess.TopicID FROM [dbo].[yaf_Message] mess WHERE mess.UserID=@PageUserID AND mess.TopicID=c.TopicID)	
    
    select @PageIndex = @PageIndex+1;
    select @FirstSelectRowNumber = (@PageIndex - 1) * @PageSize + 1;
    select @LastSelectRowNumber = (@PageIndex - 1) * @PageSize + @PageSize;
    
    with TopicIds  as
     (
     select ROW_NUMBER() over (order by cat.SortOrder asc, d.SortOrder asc, c.LastPosted desc) as RowNum, c.TopicID
     from  [dbo].[yaf_Topic] c
        join [dbo].[yaf_Forum] d on d.ForumID=c.ForumID
        join [dbo].[yaf_ActiveAccess] x  with(nolock) on x.ForumID=d.ForumID
        join [dbo].[yaf_Category] cat on cat.CategoryID=d.CategoryID
  where
        (c.LastPosted between @SinceDate and @ToDate) and
        x.UserID = @PageUserID and
        CONVERT(int,x.ReadAccess) <> 0 and
        cat.BoardID = @BoardID and
        (@CategoryID is null or cat.CategoryID=@CategoryID) and
        c.IsDeleted = 0
        and	c.TopicMovedID is null
        and c.TopicID = (SELECT TOP 1 mess.TopicID FROM [dbo].[yaf_Message] mess WHERE mess.UserID=@PageUserID AND mess.TopicID=c.TopicID)	
      )	  
      select
        c.ForumID,
		ForumName = d.Name,
        c.TopicID,
        c.TopicMovedID,		
        c.Posted,
        LinkTopicID = IsNull(c.TopicMovedID,c.TopicID),
        [Subject] = c.Topic,
        [Description] = c.Description,
        [Status] = c.Status,
        [Styles] = c.Styles,
        c.UserID,
        Starter = IsNull(c.UserName,b.Name),
        StarterDisplay = IsNull(c.UserDisplayName, b.DisplayName),
        NumPostsDeleted = (SELECT COUNT(1) FROM [dbo].[yaf_Message] mes WHERE mes.TopicID = c.TopicID AND mes.IsDeleted = 1 AND mes.IsApproved = 1 AND ((@PageUserID IS NOT NULL AND mes.UserID = @PageUserID) OR (@PageUserID IS NULL)) ),
        Replies = (select count(1) from [dbo].[yaf_Message] x where x.TopicID=c.TopicID and x.IsDeleted=0) - 1,
        [Views] = c.[Views],
        LastPosted = c.LastPosted,
        LastUserID = c.LastUserID,
        LastUserName = IsNull(c.LastUserName,(select x.Name from [dbo].[yaf_User] x where x.UserID=c.LastUserID)),
        LastUserDisplayName = IsNull(c.LastUserDisplayName,(select x.DisplayName from [dbo].[yaf_User] x where x.UserID=c.LastUserID)),
        LastMessageID = c.LastMessageID,
        LastMessageFlags = c.LastMessageFlags,
        LastTopicID = c.TopicID,
        TopicFlags = c.Flags,
        FirstMessage = (SELECT TOP 1 CAST([Message] as nvarchar(1000)) FROM [dbo].[yaf_Message] mes2 where mes2.TopicID = IsNull(c.TopicMovedID,c.TopicID) AND mes2.Position = 0),
        FavoriteCount = (SELECT COUNT(ID) as [FavoriteCount] FROM [dbo].[yaf_FavoriteTopic] WHERE TopicId = IsNull(c.TopicMovedID,c.TopicID)),
        c.Priority,
        c.PollID,
        ForumName = d.Name,
        c.TopicMovedID,
        ForumFlags = d.Flags,
        FirstMessage = (SELECT TOP 1 CAST([Message] as nvarchar(1000)) FROM [dbo].[yaf_Message] mes2 where mes2.TopicID = IsNull(c.TopicMovedID,c.TopicID) AND mes2.Position = 0),
        StarterStyle = case(@StyledNicks)
            when 1 then  b.UserStyle
            else ''	 end,
        LastUserStyle= case(@StyledNicks)
            when 1 then  (select top 1 usr.[UserStyle] from [dbo].[yaf_User] usr with(nolock) where usr.UserID = c.LastUserID)
            else ''	 end,
        LastForumAccess = case(@FindLastRead)
             when 1 then
               (SELECT top 1 LastAccessDate FROM [dbo].[yaf_ForumReadTracking] x WHERE x.ForumID=d.ForumID AND x.UserID = @PageUserID)
             else ''	 end,
        LastTopicAccess = case(@FindLastRead)
             when 1 then
               (SELECT top 1 LastAccessDate FROM [dbo].[yaf_TopicReadTracking] y WHERE y.TopicID=c.TopicID AND y.UserID = @PageUserID)
             else ''	 end,  
        TotalRows = @TotalRows,
        PageIndex = @PageIndex
    from
        TopicIds ti
        inner join [dbo].[yaf_Topic] c on c.TopicID = ti.TopicID
        join [dbo].[yaf_User] b on b.UserID=c.UserID
        join [dbo].[yaf_Forum] d on d.ForumID=c.ForumID 
    where ti.RowNum between @FirstSelectRowNumber and @LastSelectRowNumber
        order by
            RowNum ASC       
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_unread]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_topic_unread]
(   @BoardID int,
    @CategoryID int=null,
    @PageUserID int,		
    @SinceDate datetime=null,
    @ToDate datetime,
    @PageIndex int = 1, 
    @PageSize int = 0, 
    @StyledNicks bit = 0,	
    @FindLastRead bit = 0
)
AS
begin
   declare @post_totalrowsnumber int 
   declare @firstselectrownum int   
   declare @firstselectposted datetime
  -- declare @ceiling decimal  
  -- declare @offset int 

    set nocount on	

    -- find total returned count
        select
        @post_totalrowsnumber = count(1)		
        from
        [dbo].[yaf_Topic] c
        join [dbo].[yaf_User] b on b.UserID=c.UserID
        join [dbo].[yaf_Forum] d on d.ForumID=c.ForumID
        join [dbo].[yaf_ActiveAccess] x  with(nolock) on x.ForumID=d.ForumID
        join [dbo].[yaf_Category] cat on cat.CategoryID=d.CategoryID
    where
        (c.LastPosted between @SinceDate and @ToDate) and
        x.UserID = @PageUserID and
        CONVERT(int,x.ReadAccess) <> 0 and
        cat.BoardID = @BoardID and
        (@CategoryID is null or cat.CategoryID=@CategoryID) and
        c.IsDeleted = 0
        and	c.TopicMovedID is null	

      select @PageIndex = @PageIndex+1;
      select @firstselectrownum = (@PageIndex - 1) * @PageSize + 1 
        -- find first selectedrowid 
   if (@firstselectrownum > 0)   
   set rowcount @firstselectrownum
   else
   -- should not be 0
   set rowcount 1
    
   select		
        @firstselectposted = c.LastPosted		
    from
            [dbo].[yaf_Topic] c
        join [dbo].[yaf_User] b on b.UserID=c.UserID
        join [dbo].[yaf_Forum] d on d.ForumID=c.ForumID
        join [dbo].[yaf_ActiveAccess] x  with(nolock) on x.ForumID=d.ForumID
        join [dbo].[yaf_Category] cat on cat.CategoryID=d.CategoryID
    where
        (c.LastPosted between @SinceDate and @ToDate) and
        x.UserID = @PageUserID and
        CONVERT(int,x.ReadAccess) <> 0 and
        cat.BoardID = @BoardID and
        (@CategoryID is null or cat.CategoryID=@CategoryID) and
        c.IsDeleted = 0
        and	c.TopicMovedID is null	
    order by
        c.LastPosted desc,
        cat.SortOrder asc,
        d.SortOrder asc,
        d.Name asc,
        c.Priority desc		
    
    set rowcount @PageSize	
            select
        c.ForumID,
        c.TopicID,
        c.TopicMovedID,
        c.Posted,
        LinkTopicID = IsNull(c.TopicMovedID,c.TopicID),
        [Subject] = c.Topic,
        [Description] = c.Description,
        [Status] = c.Status,
        [Styles] = c.Styles,
        c.UserID,
        Starter = IsNull(c.UserName,b.Name),		
        StarterDisplay = IsNull(c.UserDisplayName,b.DisplayName),		
        NumPostsDeleted = (SELECT COUNT(1) FROM [dbo].[yaf_Message] mes WHERE mes.TopicID = c.TopicID AND mes.IsDeleted = 1 AND mes.IsApproved = 1 AND ((@PageUserID IS NOT NULL AND mes.UserID = @PageUserID) OR (@PageUserID IS NULL)) ),
        Replies = (select count(1) from [dbo].[yaf_Message] x where x.TopicID=c.TopicID and x.IsDeleted=0) - 1,
        [Views] = c.[Views],
        LastPosted = c.LastPosted,
        LastUserID = c.LastUserID,
        LastUserName = IsNull(c.LastUserName,(select x.Name from [dbo].[yaf_User] x where x.UserID=c.LastUserID)),
        LastUserDisplayName = IsNull(c.LastUserDisplayName,(select x.DisplayName from [dbo].[yaf_User] x where x.UserID=c.LastUserID)),
        LastMessageID = c.LastMessageID,
        LastMessageFlags = c.LastMessageFlags,
        LastTopicID = c.TopicID,
        TopicFlags = c.Flags,
        FavoriteCount = (SELECT COUNT(ID) as [FavoriteCount] FROM [dbo].[yaf_FavoriteTopic] WHERE TopicId = IsNull(c.TopicMovedID,c.TopicID)),
        c.Priority,
        c.PollID,
        ForumName = d.Name,
        c.TopicMovedID,
        ForumFlags = d.Flags,
        FirstMessage = (SELECT TOP 1 CAST([Message] as nvarchar(1000)) FROM [dbo].[yaf_Message] mes2 where mes2.TopicID = IsNull(c.TopicMovedID,c.TopicID) AND mes2.Position = 0),
        StarterStyle = case(@StyledNicks)
            when 1 then  b.UserStyle
            else ''	 end,
        LastUserStyle= case(@StyledNicks)
            when 1 then  (select top 1 usr.[UserStyle] from [dbo].[yaf_User] usr with(nolock) where usr.UserID = c.LastUserID)
            else ''	 end,
        LastForumAccess = case(@FindLastRead)
             when 1 then
               (SELECT top 1 LastAccessDate FROM [dbo].[yaf_ForumReadTracking] x WHERE x.ForumID=d.ForumID AND x.UserID = @PageUserID)
             else ''	 end,
        LastTopicAccess = case(@FindLastRead)
             when 1 then
               (SELECT top 1 LastAccessDate FROM [dbo].[yaf_TopicReadTracking] y WHERE y.TopicID=c.TopicID AND y.UserID = @PageUserID)
             else ''	 end,
        TotalRows = @post_totalrowsnumber,
        PageIndex = @PageIndex
    from
        [dbo].[yaf_Topic] c
        join [dbo].[yaf_User] b on b.UserID=c.UserID
        join [dbo].[yaf_Forum] d on d.ForumID=c.ForumID
        join [dbo].[yaf_ActiveAccess] x  with(nolock) on x.ForumID=d.ForumID
        join [dbo].[yaf_Category] cat on cat.CategoryID=d.CategoryID
    where
        c.LastPosted <= @firstselectposted and
        x.UserID = @PageUserID and
        CONVERT(int,x.ReadAccess) <> 0 and
        cat.BoardID = @BoardID and
        (@CategoryID is null or cat.CategoryID=@CategoryID) and
        c.IsDeleted = 0
        and	c.TopicMovedID is null
    order by
        c.LastPosted desc,
        cat.SortOrder asc,
        d.SortOrder asc,
        d.Name asc,
        c.Priority desc	

        SET ROWCOUNT 0		
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_unanswered]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_topic_unanswered]
(   @BoardID int,
    @CategoryID int=null,
    @PageUserID int,		
    @SinceDate datetime=null,
    @ToDate datetime,
    @PageIndex int = 1, 
    @PageSize int = 0, 
    @StyledNicks bit = 0,	
    @FindLastRead bit = 0
)
AS
begin
  declare @TotalRows int
   declare @FirstSelectRowNumber int
   declare @LastSelectRowNumber int

   -- find total returned count
   select  @TotalRows = count(1)		
        from
        [dbo].[yaf_Topic] c
        join [dbo].[yaf_User] b on b.UserID=c.UserID
        join [dbo].[yaf_Forum] d on d.ForumID=c.ForumID
        join [dbo].[yaf_ActiveAccess] x  with(nolock) on x.ForumID=d.ForumID
        join [dbo].[yaf_Category] cat on cat.CategoryID=d.CategoryID
    where
        c.LastPosted IS NOT NULL and (c.LastPosted between @SinceDate and @ToDate) and
        x.UserID = @PageUserID and
        CONVERT(int,x.ReadAccess) <> 0 and
        cat.BoardID = @BoardID and
        (@CategoryID is null or cat.CategoryID=@CategoryID) and
        c.IsDeleted = 0 and	
        c.TopicMovedID is null and
        c.NumPosts = 1
    
    select @PageIndex = @PageIndex+1;
    select @FirstSelectRowNumber = (@PageIndex - 1) * @PageSize + 1;
    select @LastSelectRowNumber = (@PageIndex - 1) * @PageSize + @PageSize;
    
    with TopicIds  as
     (
     select ROW_NUMBER() over (order by cat.SortOrder asc, d.SortOrder asc, c.LastPosted desc) as RowNum, c.TopicID
     from  [dbo].[yaf_Topic] c
        join [dbo].[yaf_Forum] d on d.ForumID=c.ForumID
        join [dbo].[yaf_ActiveAccess] x  with(nolock) on x.ForumID=d.ForumID
        join [dbo].[yaf_Category] cat on cat.CategoryID=d.CategoryID
    where
        c.LastPosted IS NOT NULL and (c.LastPosted between @SinceDate and @ToDate) and
        x.UserID = @PageUserID and
        CONVERT(int,x.ReadAccess) <> 0 and
        cat.BoardID = @BoardID and
        (@CategoryID is null or cat.CategoryID=@CategoryID) and
        c.IsDeleted = 0 and	
        c.TopicMovedID is null and
        c.NumPosts = 1
      )	  
      select
        c.ForumID,
        c.TopicID,
        c.TopicMovedID,		
        c.Posted,
        LinkTopicID = IsNull(c.TopicMovedID,c.TopicID),
        [Subject] = c.Topic,
        [Description] = c.Description,
        [Status] = c.Status,
        [Styles] = c.Styles,
        c.UserID,
        Starter = IsNull(c.UserName,b.Name),
        StarterDisplay = IsNull(c.UserDisplayName, b.DisplayName),
        NumPostsDeleted = (SELECT COUNT(1) FROM [dbo].[yaf_Message] mes WHERE mes.TopicID = c.TopicID AND mes.IsDeleted = 1 AND mes.IsApproved = 1 AND ((@PageUserID IS NOT NULL AND mes.UserID = @PageUserID) OR (@PageUserID IS NULL)) ),
        Replies = (select count(1) from [dbo].[yaf_Message] x where x.TopicID=c.TopicID and x.IsDeleted=0) - 1,
        [Views] = c.[Views],
        LastPosted = c.LastPosted,
        LastUserID = c.LastUserID,
        LastUserName = IsNull(c.LastUserName,(select x.Name from [dbo].[yaf_User] x where x.UserID=c.LastUserID)),
        LastUserDisplayName = IsNull(c.LastUserDisplayName,(select x.DisplayName from [dbo].[yaf_User] x where x.UserID=c.LastUserID)),
        LastMessageID = c.LastMessageID,
        LastMessageFlags = c.LastMessageFlags,
        LastTopicID = c.TopicID,
        TopicFlags = c.Flags,
        FirstMessage = (SELECT TOP 1 CAST([Message] as nvarchar(1000)) FROM [dbo].[yaf_Message] mes2 where mes2.TopicID = IsNull(c.TopicMovedID,c.TopicID) AND mes2.Position = 0),
        FavoriteCount = (SELECT COUNT(ID) as [FavoriteCount] FROM [dbo].[yaf_FavoriteTopic] WHERE TopicId = IsNull(c.TopicMovedID,c.TopicID)),
        c.Priority,
        c.PollID,
        ForumName = d.Name,
        c.TopicMovedID,
        ForumFlags = d.Flags,
        FirstMessage = (SELECT TOP 1 CAST([Message] as nvarchar(1000)) FROM [dbo].[yaf_Message] mes2 where mes2.TopicID = IsNull(c.TopicMovedID,c.TopicID) AND mes2.Position = 0),
        StarterStyle = case(@StyledNicks)
            when 1 then  b.UserStyle
            else ''	 end,
        LastUserStyle= case(@StyledNicks)
            when 1 then  (select top 1 usr.[UserStyle] from [dbo].[yaf_User] usr with(nolock) where usr.UserID = c.LastUserID)
            else ''	 end,
        LastForumAccess = case(@FindLastRead)
             when 1 then
               (SELECT top 1 LastAccessDate FROM [dbo].[yaf_ForumReadTracking] x WHERE x.ForumID=d.ForumID AND x.UserID = @PageUserID)
             else ''	 end,
        LastTopicAccess = case(@FindLastRead)
             when 1 then
               (SELECT top 1 LastAccessDate FROM [dbo].[yaf_TopicReadTracking] y WHERE y.TopicID=c.TopicID AND y.UserID = @PageUserID)
             else ''	 end,  
        TotalRows = @TotalRows,
        PageIndex = @PageIndex
    from
        TopicIds ti
        inner join [dbo].[yaf_Topic] c on c.TopicID = ti.TopicID
        join [dbo].[yaf_User] b on b.UserID=c.UserID
        join [dbo].[yaf_Forum] d on d.ForumID=c.ForumID      
    where ti.RowNum between @FirstSelectRowNumber and @LastSelectRowNumber
        order by
            RowNum ASC 

end
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_similarlist]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_topic_similarlist](
                @PageUserID int,
                @Topic   nvarchar(100),
				@TopicID int,
                @Count   int,
                @StyledNicks bit = 0)
as
    begin
        select top(@Count) 
		t.Topic,
        t.TopicID,
        t.ForumID,
        ForumName = f.Name,
        t.UserID,
        StarterName = u.Name,
        StarterDisplayName = u.DisplayName,
        StarterStyle = case(@StyledNicks)
            when 1 then  u.UserStyle
            else ''	 end,
        t.Posted
        from     [dbo].[yaf_Topic] t
		inner join [dbo].[yaf_Forum] f on t.ForumID= f.ForumID
        inner join [dbo].[yaf_User] u on t.UserID = u.UserID
        join [dbo].[yaf_ActiveAccess] x  with(nolock) on x.ForumID=f.ForumID
        where    t.[Topic] like '%' + @Topic + '%'
        and t.[TopicID] != @TopicID
        and x.UserID = @PageUserID
        and CONVERT(int,x.ReadAccess) <> 0
        order by t.[Posted] DESC
    end
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_topic_save](
    @ForumID	int,
    @Subject	nvarchar(100),
    @UserID		int,
    @Message	ntext,
    @Description	nvarchar(255)=null,
    @Status 	nvarchar(255)=null,
    @Styles 	nvarchar(255)=null,
    @Priority	smallint,
    @UserName	nvarchar(255)=null,
    @IP			varchar(39),
    @Posted		datetime=null,
    @BlogPostID	nvarchar(50),
    @Flags		int, 
    @UTCTIMESTAMP datetime
) as
begin
        declare @TopicID int
    declare @MessageID int, @OverrideDisplayName BIT, @ReplaceName nvarchar(255)

    if @Posted is null set @Posted = @UTCTIMESTAMP 
        -- this check is for guest user only to not override replace name 
    if (SELECT Name FROM [dbo].[yaf_User] WHERE UserID = @UserID) != @UserName
    begin
    SET @OverrideDisplayName = 1
    end	
    SET @ReplaceName = (CASE WHEN @OverrideDisplayName = 1 THEN @UserName ELSE (SELECT DisplayName FROM [dbo].[yaf_User] WHERE UserID = @UserID) END);
    -- create the topic
    insert into [dbo].[yaf_Topic](ForumID,Topic,UserID,Posted,[Views],[Priority],UserName,UserDisplayName,NumPosts, [Description], [Status], [Styles])
    values(@ForumID,@Subject,@UserID,@Posted,0,@Priority,@UserName,@ReplaceName, 0,@Description, @Status, @Styles)

    -- get its id
    set @TopicID = SCOPE_IDENTITY()
    
    -- add message to the topic
    exec [dbo].[yaf_message_save] @TopicID,@UserID,@Message,@UserName,@IP,@Posted,null,@BlogPostID,null,null,@Flags,@UTCTIMESTAMP,@MessageID output

    select TopicID = @TopicID, MessageID = @MessageID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_listmessages]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_topic_listmessages](@TopicID int) as
begin
   select 
        a.MessageID,
        a.UserID,
        UserName = b.Name,
        UserDisplayName = b.DisplayName,
        a.[Message],
        c.TopicID,
        c.ForumID,
        c.Topic,
        c.Priority,
        c.Description,
        c.Status,
        c.Styles,
        a.Flags,
        c.UserID AS TopicOwnerID,
        Edited = IsNull(a.Edited,a.Posted),
        TopicFlags = c.Flags,
        ForumFlags = d.Flags,
        a.EditReason,
        a.Position,
        a.IsModeratorChanged,
        a.DeleteReason,
        a.BlogPostID,
        c.PollID,
        a.IP,
        a.ReplyTo,
        a.ExternalMessageId,
        a.ReferenceMessageId  
    from 
        [dbo].[yaf_Message] a
        inner join [dbo].[yaf_User] b on b.UserID = a.UserID
        inner join [dbo].[yaf_Topic] c on a.TopicID = c.TopicID
        inner join [dbo].[yaf_Forum] d on c.ForumID = d.ForumID
    where a.TopicID = @TopicID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_topic_list]
(
    @ForumID int,
    @UserID int = null,
    @Date datetime=null,
    @ToDate datetime=null,
    @PageIndex int = 1, 
    @PageSize int = 0, 
    @StyledNicks bit = 0,
    @ShowMoved  bit = 0,
    @FindLastRead bit = 0
)
AS
begin   
   declare @TotalRows int
   declare @FirstSelectRowNumber int
   declare @LastSelectRowNumber int
   
   -- find total returned count
   select  @TotalRows = COUNT(c.TopicID)
   FROM [dbo].[yaf_Topic] c 
   WHERE c.ForumID = @ForumID
   AND	((c.Priority = 1) OR (c.Priority <=0 AND c.LastPosted>=@Date )) 
   AND	c.IsDeleted = 0
    AND	(c.TopicMovedID IS NOT NULL OR c.NumPosts > 0) 
    AND
    (@ShowMoved = 1 or (@ShowMoved <> 1 AND  c.TopicMovedID IS NULL))
    
    select @PageIndex = @PageIndex+1;
    select @FirstSelectRowNumber = (@PageIndex - 1) * @PageSize + 1;
    select @LastSelectRowNumber = (@PageIndex - 1) * @PageSize + @PageSize;
    
    with TopicIds  as
     (
     select ROW_NUMBER() over (order by tt.[Priority] desc,tt.LastPosted desc) as RowNum, tt.TopicID
     from  [dbo].[yaf_Topic] tt
     where tt.ForumID = @ForumID and (tt.[Priority] = 1 OR (tt.[Priority] <=0 AND tt.LastPosted >=@Date))
      AND	tt.IsDeleted = 0
      AND	((tt.TopicMovedID IS NOT NULL) OR (tt.NumPosts > 0))
      AND
      (@ShowMoved = 1 or (@ShowMoved <> 1 AND  TopicMovedID IS NULL))
      )	  
      select
            c.ForumID,
            c.TopicID,
            c.Posted,
            LinkTopicID = IsNull(c.TopicMovedID,c.TopicID),
            c.TopicMovedID,
            FavoriteCount = (SELECT COUNT(1) as [FavoriteCount] FROM [dbo].[yaf_FavoriteTopic] WHERE TopicId = IsNull(c.TopicMovedID,c.TopicID)),
            [Subject] = c.Topic,
            c.[Description],
            c.[Status],
            c.[Styles],
            c.UserID,
            Starter = IsNull(c.UserName,b.Name),
            StarterDisplay = IsNull(c.UserDisplayName,b.DisplayName),
            Replies = c.NumPosts - 1,
            NumPostsDeleted = (SELECT COUNT(1) FROM [dbo].[yaf_Message] mes WHERE mes.TopicID = c.TopicID AND mes.IsDeleted = 1 AND mes.IsApproved = 1 AND ((@UserID IS NOT NULL AND mes.UserID = @UserID) OR (@UserID IS NULL)) ),			
            [Views] = c.[Views],
            LastPosted = c.LastPosted,
            LastUserID = c.LastUserID,
            LastUserName = IsNull(c.LastUserName,(SELECT x.Name FROM [dbo].[yaf_User] x where x.UserID=c.LastUserID)),
            LastUserDisplayName = IsNull(c.LastUserDisplayName,(SELECT x.DisplayName FROM [dbo].[yaf_User] x where x.UserID=c.LastUserID)),
            LastMessageID = c.LastMessageID,
            LastTopicID = c.TopicID,
            LinkDate = c.LinkDate,
            TopicFlags = c.Flags,
            c.Priority,
            c.PollID,
            ForumFlags = d.Flags,
            FirstMessage = (SELECT TOP 1 CAST([Message] as nvarchar(1000)) FROM [dbo].[yaf_Message] mes2 where mes2.TopicID = IsNull(c.TopicMovedID,c.TopicID) AND mes2.Position = 0),
            StarterStyle = case(@StyledNicks)
            when 1 then  b.UserStyle
            else ''	 end,
            LastUserStyle= case(@StyledNicks)
            when 1 then  (select top 1 usr.[UserStyle] from [dbo].[yaf_User] usr with(nolock) where usr.UserID = c.LastUserID)
            else ''	 end,
            LastForumAccess = case(@FindLastRead)
             when 1 then
               (SELECT top 1 LastAccessDate FROM [dbo].[yaf_ForumReadTracking] x WHERE x.ForumID=c.ForumID AND x.UserID = @UserID)
             else ''	 end,
            LastTopicAccess = case(@FindLastRead)
             when 1 then
               (SELECT top 1 LastAccessDate FROM [dbo].[yaf_TopicReadTracking] y WHERE y.TopicID=c.TopicID AND y.UserID = @UserID)
             else ''	 end,
             c.TopicImage,         
            0 as HasAttachments,          
            PageIndex = @PageIndex,   	
            @TotalRows as TotalRows			       
            from
            TopicIds ti
            inner join [dbo].[yaf_Topic] c	
            ON c.TopicID = ti.TopicID
            JOIN [dbo].[yaf_User] b 
            ON b.UserID=c.UserID
            join [dbo].[yaf_Forum] d on d.ForumID=c.ForumID
            WHERE ti.RowNum between @FirstSelectRowNumber and @LastSelectRowNumber
        order by
            RowNum ASC    
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_latest_in_category]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_topic_latest_in_category]
(
    @BoardID int,
    @CategoryID int,
	@NumPosts int,
    @PageUserID int,
    @StyledNicks bit = 0,
    @ShowNoCountPosts  bit = 0,
    @FindLastRead bit = 0
)
AS
BEGIN  
  
    SELECT TOP(@NumPosts)
        t.LastPosted,
        t.ForumID,
        f.Name as Forum,
        t.Topic,
        t.Status,
        t.Styles,
        t.TopicID,
        t.TopicMovedID,
        t.UserID,
        UserName = IsNull(t.UserName,(select x.[Name] from [dbo].[yaf_User] x where x.UserID = t.UserID)),
        UserDisplayName = IsNull(t.UserDisplayName,(select x.[DisplayName] from [dbo].[yaf_User] x where x.UserID = t.UserID)),		
        t.LastMessageID,
        t.LastMessageFlags,
        t.LastUserID,
        t.NumPosts,
		t.Views,
        t.Posted,	
		LastMessage = (select m.Message from [dbo].[yaf_Message] m where m.MessageID = t.LastMessageID),
        LastUserName = IsNull(t.LastUserName,(select x.[Name] from [dbo].[yaf_User] x where x.UserID = t.LastUserID)),
        LastUserDisplayName = IsNull(t.LastUserDisplayName,(select x.[DisplayName] from [dbo].[yaf_User] x where x.UserID = t.LastUserID)),
        LastUserStyle = case(@StyledNicks)
            when 1 then  (select top 1 usr.[UserStyle] from [dbo].[yaf_User] usr with(nolock) where usr.UserID = t.LastUserID)
            else ''	 end,
        LastForumAccess = case(@FindLastRead)
             when 1 then
               (SELECT top 1 LastAccessDate FROM [dbo].[yaf_ForumReadTracking] x WHERE x.ForumID=f.ForumID AND x.UserID = @PageUserID)
             else ''	 end,
        LastTopicAccess = case(@FindLastRead)
             when 1 then
               (SELECT top 1 LastAccessDate FROM [dbo].[yaf_TopicReadTracking] y WHERE y.TopicID=t.TopicID AND y.UserID = @PageUserID)
             else ''	 end
            
    FROM	
        [dbo].[yaf_Topic] t 
    INNER JOIN
        [dbo].[yaf_Forum] f ON t.ForumID = f.ForumID	
    INNER JOIN
        [dbo].[yaf_Category] c ON c.CategoryID = f.CategoryID
    JOIN
        [dbo].[yaf_ActiveAccess] v  with(nolock) ON v.ForumID=f.ForumID
    WHERE	
	    c.BoardID = @BoardID
        AND c.CategoryID = @CategoryID
        AND t.TopicMovedID is NULL
        AND v.UserID=@PageUserID
        AND (CONVERT(int,v.ReadAccess) <> 0)
        AND t.IsDeleted != 1
        AND t.LastPosted IS NOT NULL
        AND
        f.Flags & 4 <> (CASE WHEN @ShowNoCountPosts > 0 THEN -1 ELSE 4 END)
    ORDER BY
        t.LastPosted DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_latest]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_topic_latest]
(
    @BoardID int,
    @NumPosts int,
    @PageUserID int,
    @StyledNicks bit = 0,
    @ShowNoCountPosts  bit = 0,
    @FindLastRead bit = 0
)
AS
BEGIN  
  
    SELECT TOP(@NumPosts)
        t.LastPosted,
        t.ForumID,
        f.Name as Forum,
        t.Topic,
        t.Status,
        t.Styles,
        t.TopicID,
        t.TopicMovedID,
        t.UserID,
        UserName = IsNull(t.UserName,(select x.[Name] from [dbo].[yaf_User] x where x.UserID = t.UserID)),
        UserDisplayName = IsNull(t.UserDisplayName,(select x.[DisplayName] from [dbo].[yaf_User] x where x.UserID = t.UserID)),		
        t.LastMessageID,
        t.LastMessageFlags,
        t.LastUserID,
        t.NumPosts,
		t.Views,
        t.Posted,	
		LastMessage = (select m.Message from [dbo].[yaf_Message] m where m.MessageID = t.LastMessageID),
        LastUserName = IsNull(t.LastUserName,(select x.[Name] from [dbo].[yaf_User] x where x.UserID = t.LastUserID)),
        LastUserDisplayName = IsNull(t.LastUserDisplayName,(select x.[DisplayName] from [dbo].[yaf_User] x where x.UserID = t.LastUserID)),
        LastUserStyle = case(@StyledNicks)
            when 1 then  (select top 1 usr.[UserStyle] from [dbo].[yaf_User] usr with(nolock) where usr.UserID = t.LastUserID)
            else ''	 end,
        LastForumAccess = case(@FindLastRead)
             when 1 then
               (SELECT top 1 LastAccessDate FROM [dbo].[yaf_ForumReadTracking] x WHERE x.ForumID=f.ForumID AND x.UserID = @PageUserID)
             else ''	 end,
        LastTopicAccess = case(@FindLastRead)
             when 1 then
               (SELECT top 1 LastAccessDate FROM [dbo].[yaf_TopicReadTracking] y WHERE y.TopicID=t.TopicID AND y.UserID = @PageUserID)
             else ''	 end
            
    FROM	
        [dbo].[yaf_Topic] t 
    INNER JOIN
        [dbo].[yaf_Forum] f ON t.ForumID = f.ForumID	
    INNER JOIN
        [dbo].[yaf_Category] c ON c.CategoryID = f.CategoryID
    JOIN
        [dbo].[yaf_ActiveAccess] v  with(nolock) ON v.ForumID=f.ForumID
    WHERE	
        c.BoardID = @BoardID
        AND t.TopicMovedID is NULL
        AND v.UserID=@PageUserID
        AND (CONVERT(int,v.ReadAccess) <> 0)
        AND t.IsDeleted != 1
        AND t.LastPosted IS NOT NULL
        AND
        f.Flags & 4 <> (CASE WHEN @ShowNoCountPosts > 0 THEN -1 ELSE 4 END)
    ORDER BY
        t.LastPosted DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_favorite_details]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_topic_favorite_details]
(   @BoardID int,
    @CategoryID int=null,
    @PageUserID int,		
    @SinceDate datetime=null,
    @ToDate datetime,
    @PageIndex int = 1, 
    @PageSize int = 0, 
    @StyledNicks bit = 0,	
    @FindLastRead bit = 0
)
AS
begin
   declare @TotalRows int
   declare @FirstSelectRowNumber int
   declare @LastSelectRowNumber int

   -- find total returned count
   select  @TotalRows = count(1)		
        from
        [dbo].[yaf_Topic] c
        join [dbo].[yaf_User] b on b.UserID=c.UserID
        join [dbo].[yaf_Forum] d on d.ForumID=c.ForumID
        join [dbo].[yaf_ActiveAccess] x  with(nolock) on x.ForumID=d.ForumID
        join [dbo].[yaf_Category] cat on cat.CategoryID=d.CategoryID
        JOIN [dbo].[yaf_FavoriteTopic] z ON z.TopicID=c.TopicID AND z.UserID=@PageUserID
    where
        (c.LastPosted between @SinceDate and @ToDate) and
        x.UserID = @PageUserID and
        CONVERT(int,x.ReadAccess) <> 0 and
        cat.BoardID = @BoardID and
        (@CategoryID is null or cat.CategoryID=@CategoryID) and
        c.IsDeleted = 0
    
    select @PageIndex = @PageIndex+1;
    select @FirstSelectRowNumber = (@PageIndex - 1) * @PageSize + 1;
    select @LastSelectRowNumber = (@PageIndex - 1) * @PageSize + @PageSize;
    
    with TopicIds  as
     (
     select ROW_NUMBER() over (order by cat.SortOrder asc, d.SortOrder asc, c.LastPosted desc) as RowNum, c.TopicID
     from  [dbo].[yaf_Topic] c
        join [dbo].[yaf_Forum] d on d.ForumID=c.ForumID
        join [dbo].[yaf_ActiveAccess] x  with(nolock) on x.ForumID=d.ForumID
        join [dbo].[yaf_Category] cat on cat.CategoryID=d.CategoryID
        JOIN [dbo].[yaf_FavoriteTopic] z ON z.TopicID=c.TopicID AND z.UserID=@PageUserID
    where
        (c.LastPosted between @SinceDate and @ToDate) and
        x.UserID = @PageUserID and
        CONVERT(int,x.ReadAccess) <> 0 and
        cat.BoardID = @BoardID and
        (@CategoryID is null or cat.CategoryID=@CategoryID) and
        c.IsDeleted = 0
      )	  
      select
        c.ForumID,
        c.TopicID,
        c.TopicMovedID,		
        c.Posted,
        LinkTopicID = IsNull(c.TopicMovedID,c.TopicID),
        [Subject] = c.Topic,
        [Description] = c.Description,
        [Status] = c.Status,
        [Styles] = c.Styles,
        c.UserID,
        Starter = IsNull(c.UserName,b.Name),
        StarterDisplay = IsNull(c.UserDisplayName, b.DisplayName),
        NumPostsDeleted = (SELECT COUNT(1) FROM [dbo].[yaf_Message] mes WHERE mes.TopicID = c.TopicID AND mes.IsDeleted = 1 AND mes.IsApproved = 1 AND ((@PageUserID IS NOT NULL AND mes.UserID = @PageUserID) OR (@PageUserID IS NULL)) ),
        Replies = (select count(1) from [dbo].[yaf_Message] x where x.TopicID=c.TopicID and x.IsDeleted=0) - 1,
        [Views] = c.[Views],
        LastPosted = c.LastPosted,
        LastUserID = c.LastUserID,
        LastUserName = IsNull(c.LastUserName,(select x.Name from [dbo].[yaf_User] x where x.UserID=c.LastUserID)),
        LastUserDisplayName = IsNull(c.LastUserDisplayName,(select x.DisplayName from [dbo].[yaf_User] x where x.UserID=c.LastUserID)),
        LastMessageID = c.LastMessageID,
        LastMessageFlags = c.LastMessageFlags,
        LastTopicID = c.TopicID,
        TopicFlags = c.Flags,
        FirstMessage = (SELECT TOP 1 CAST([Message] as nvarchar(1000)) FROM [dbo].[yaf_Message] mes2 where mes2.TopicID = IsNull(c.TopicMovedID,c.TopicID) AND mes2.Position = 0),
        FavoriteCount = (SELECT COUNT(ID) as [FavoriteCount] FROM [dbo].[yaf_FavoriteTopic] WHERE TopicId = IsNull(c.TopicMovedID,c.TopicID)),
        c.Priority,
        c.PollID,
        ForumName = d.Name,
        c.TopicMovedID,
        ForumFlags = d.Flags,
        FirstMessage = (SELECT TOP 1 CAST([Message] as nvarchar(1000)) FROM [dbo].[yaf_Message] mes2 where mes2.TopicID = IsNull(c.TopicMovedID,c.TopicID) AND mes2.Position = 0),
        StarterStyle = case(@StyledNicks)
            when 1 then  b.UserStyle
            else ''	 end,
        LastUserStyle= case(@StyledNicks)
            when 1 then  (select top 1 usr.[UserStyle] from [dbo].[yaf_User] usr with(nolock) where usr.UserID = c.LastUserID)
            else ''	 end,
        LastForumAccess = case(@FindLastRead)
             when 1 then
               (SELECT top 1 LastAccessDate FROM [dbo].[yaf_ForumReadTracking] x WHERE x.ForumID=d.ForumID AND x.UserID = @PageUserID)
             else ''	 end,
        LastTopicAccess = case(@FindLastRead)
             when 1 then
               (SELECT top 1 LastAccessDate FROM [dbo].[yaf_TopicReadTracking] y WHERE y.TopicID=c.TopicID AND y.UserID = @PageUserID)
             else ''	 end,          
        TotalRows = @TotalRows,
        PageIndex = @PageIndex
    from
        TopicIds ti
        inner join [dbo].[yaf_Topic] c on c.TopicID = ti.TopicID
        join [dbo].[yaf_User] b on b.UserID=c.UserID
        join [dbo].[yaf_Forum] d on d.ForumID=c.ForumID     
    where ti.RowNum between @FirstSelectRowNumber and @LastSelectRowNumber
        order by
            RowNum ASC   
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_topic_active]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_topic_active]
(   @BoardID int,
    @CategoryID int=null,
    @PageUserID int,		
    @SinceDate datetime,
    @ToDate datetime,
    @PageIndex int = 1, 
    @PageSize int = 0, 
    @StyledNicks bit = 0,	
    @FindLastRead bit = 0
)
AS
begin
   declare @TotalRows int
   declare @FirstSelectRowNumber int
   declare @LastSelectRowNumber int
   
   -- find total returned count
   select  @TotalRows = count(1)		
        from
        [dbo].[yaf_Topic] c
        join [dbo].[yaf_User] b on b.UserID=c.UserID
        join [dbo].[yaf_Forum] d on d.ForumID=c.ForumID
        join [dbo].[yaf_ActiveAccess] x  with(nolock) on x.ForumID=d.ForumID
        join [dbo].[yaf_Category] cat on cat.CategoryID=d.CategoryID
    where
        (c.LastPosted between @SinceDate and @ToDate) and
        x.UserID = @PageUserID and
        CONVERT(int,x.ReadAccess) <> 0 and
        cat.BoardID = @BoardID and
        (@CategoryID is null or cat.CategoryID=@CategoryID) and
        c.IsDeleted = 0
        and	c.TopicMovedID is null	
    
    select @PageIndex = @PageIndex+1;
    select @FirstSelectRowNumber = (@PageIndex - 1) * @PageSize + 1;
    select @LastSelectRowNumber = (@PageIndex - 1) * @PageSize + @PageSize;
    
    with TopicIds  as
     (
     select ROW_NUMBER() over (order by cat.SortOrder asc, d.SortOrder asc, c.LastPosted desc) as RowNum, c.TopicID
     from  [dbo].[yaf_Topic] c
        join [dbo].[yaf_Forum] d on d.ForumID=c.ForumID
        join [dbo].[yaf_ActiveAccess] x  with(nolock) on x.ForumID=d.ForumID
        join [dbo].[yaf_Category] cat on cat.CategoryID=d.CategoryID
     where
        (c.LastPosted between @SinceDate and @ToDate) and
        x.UserID = @PageUserID and
        CONVERT(int,x.ReadAccess) <> 0 and
        cat.BoardID = @BoardID and
        (@CategoryID is null or cat.CategoryID=@CategoryID) and
        c.IsDeleted = 0
        and	c.TopicMovedID is null	
      )	  
      select
        c.ForumID,
        c.TopicID,
        c.TopicMovedID,		
        c.Posted,
        LinkTopicID = IsNull(c.TopicMovedID,c.TopicID),
        [Subject] = c.Topic,
        [Description] = c.Description,
        [Status] = c.Status,
        [Styles] = c.Styles,
        c.UserID,
        Starter = IsNull(c.UserName,b.Name),
        StarterDisplay = IsNull(c.UserDisplayName, b.DisplayName),
        NumPostsDeleted = (SELECT COUNT(1) FROM [dbo].[yaf_Message] mes WHERE mes.TopicID = c.TopicID AND mes.IsDeleted = 1 AND mes.IsApproved = 1 AND ((@PageUserID IS NOT NULL AND mes.UserID = @PageUserID) OR (@PageUserID IS NULL)) ),
        Replies = (select count(1) from [dbo].[yaf_Message] x where x.TopicID=c.TopicID and x.IsDeleted=0) - 1,
        [Views] = c.[Views],
        LastPosted = c.LastPosted,
        LastUserID = c.LastUserID,
        LastUserName = IsNull(c.LastUserName,(select x.Name from [dbo].[yaf_User] x where x.UserID=c.LastUserID)),
        LastUserDisplayName = IsNull(c.LastUserDisplayName,(select x.DisplayName from [dbo].[yaf_User] x where x.UserID=c.LastUserID)),
        LastMessageID = c.LastMessageID,
        LastMessageFlags = c.LastMessageFlags,
        LastTopicID = c.TopicID,
        TopicFlags = c.Flags,
        FavoriteCount = (SELECT COUNT(ID) as [FavoriteCount] FROM [dbo].[yaf_FavoriteTopic] WHERE TopicId = IsNull(c.TopicMovedID,c.TopicID)),
        c.Priority,
        c.PollID,
        ForumName = d.Name,
        c.TopicMovedID,
        ForumFlags = d.Flags,
        FirstMessage = (SELECT TOP 1 CAST([Message] as nvarchar(1000)) FROM [dbo].[yaf_Message] mes2 where mes2.TopicID = IsNull(c.TopicMovedID,c.TopicID) AND mes2.Position = 0),
        StarterStyle = case(@StyledNicks)
            when 1 then  b.UserStyle
            else ''	 end,
        LastUserStyle= case(@StyledNicks)
            when 1 then  (select top 1 usr.[UserStyle] from [dbo].[yaf_User] usr with(nolock) where usr.UserID = c.LastUserID)
            else ''	 end,
        LastForumAccess = case(@FindLastRead)
             when 1 then
               (SELECT top 1 LastAccessDate FROM [dbo].[yaf_ForumReadTracking] x WHERE x.ForumID=d.ForumID AND x.UserID = @PageUserID)
             else ''	 end,
        LastTopicAccess = case(@FindLastRead)
             when 1 then
               (SELECT top 1 LastAccessDate FROM [dbo].[yaf_TopicReadTracking] y WHERE y.TopicID=c.TopicID AND y.UserID = @PageUserID)
             else ''	 end,
        TotalRows = @TotalRows,
        PageIndex = @PageIndex
    from
        TopicIds ti
        inner join [dbo].[yaf_Topic] c on c.TopicID = ti.TopicID
        join [dbo].[yaf_User] b on b.UserID=c.UserID
        join [dbo].[yaf_Forum] d on d.ForumID=c.ForumID       
    where ti.RowNum between @FirstSelectRowNumber and @LastSelectRowNumber
        order by
            RowNum ASC   	
    
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_rss_topic_latest]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_rss_topic_latest]
(
    @BoardID int,
    @NumPosts int,
    @PageUserID int,
    @StyledNicks bit = 0,
    @ShowNoCountPosts  bit = 0
)
AS
BEGIN 
    SELECT TOP(@NumPosts)
        LastMessage = m.[Message],
        t.LastPosted,
        t.ForumID,
        f.Name as Forum,
        t.Topic,
        t.TopicID,
        t.TopicMovedID,
        t.UserID,
        t.UserName,
        t.UserDisplayName,
        StarterIsGuest = (select x.IsGuest from [dbo].[yaf_User] x where x.UserID=t.UserID),		
        t.LastMessageID,
        t.LastMessageFlags,
        t.LastUserID,			
        LastUserName = IsNull(t.LastUserName,(select x.[Name] from [dbo].[yaf_User] x where x.UserID = t.LastUserID)),
        LastUserDisplayName = IsNull(t.LastUserName,(select x.[DisplayName] from [dbo].[yaf_User] x where x.UserID = t.LastUserID)),
        LastUserIsGuest = (select x.IsGuest from [dbo].[yaf_User] x where x.UserID=t.LastUserID),	
        t.Posted					
    FROM
        [dbo].[yaf_Message] m 
    INNER JOIN	
        [dbo].[yaf_Topic] t  ON t.LastMessageID = m.MessageID
    INNER JOIN
        [dbo].[yaf_Forum] f ON t.ForumID = f.ForumID	
    INNER JOIN
        [dbo].[yaf_Category] c ON c.CategoryID = f.CategoryID
    JOIN
        [dbo].[yaf_ActiveAccess] v  with(nolock) ON v.ForumID=f.ForumID
    WHERE	
        c.BoardID = @BoardID
        AND t.TopicMovedID is NULL
        AND v.UserID=@PageUserID
        AND (CONVERT(int,v.ReadAccess) <> 0)
        AND t.IsDeleted != 1
        AND t.LastPosted IS NOT NULL
        AND
        f.Flags & 4 <> (CASE WHEN @ShowNoCountPosts > 0 THEN -1 ELSE 4 END)
    ORDER BY
        t.LastPosted DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_post_list_reverse10]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_post_list_reverse10](@TopicID int) as
begin
        set nocount on

    select top 10
        a.Posted,
        [Subject] = d.Topic,
        a.[Message],
        a.UserID,
        a.Flags,
        UserName = IsNull(a.UserName,b.Name),
        DisplayName = IsNull(a.UserDisplayName,b.DisplayName),
        Style = b.UserStyle,
        b.[Signature]
    from
        [dbo].[yaf_Message] a 
        inner join [dbo].[yaf_User] b on b.UserID = a.UserID
        inner join [dbo].[yaf_Topic] d on d.TopicID = a.TopicID
    where
        (a.Flags & 24)=16 and
        a.TopicID = @TopicID
    order by
        a.Posted desc
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_post_alluser]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_post_alluser](@BoardID int,@UserID int,@PageUserID int,@topCount int = 0) as
begin
        IF (@topCount IS NULL) SET @topCount = 0;		
        SET NOCOUNT ON
        SET ROWCOUNT @topCount

    select
        a.MessageID,
        a.Posted,
        [Subject] = c.Topic,
        a.[Message],		
        a.IP,
        a.UserID,
        a.Flags,
        UserName = IsNull(a.UserName,b.Name),
        UserDisplayName = IsNull(a.UserDisplayName, b.DisplayName),
        b.[Signature],
        c.TopicID
    from
        [dbo].[yaf_Message] a
        join [dbo].[yaf_User] b on b.UserID=a.UserID
        join [dbo].[yaf_Topic] c on c.TopicID=a.TopicID
        join [dbo].[yaf_Forum] d on d.ForumID=c.ForumID
        join [dbo].[yaf_Category] e on e.CategoryID=d.CategoryID
        join [dbo].[yaf_ActiveAccess] x  with(nolock) on x.ForumID=d.ForumID
    where
        a.UserID = @UserID and
        x.UserID = @PageUserID and
        CONVERT(int,x.ReadAccess) <> 0 and
        e.BoardID = @BoardID and
        (a.Flags & 24)=16 and
        c.IsDeleted=0
    order by
        a.Posted desc
        
    SET ROWCOUNT 0;
     SET NOCOUNT OFF
end
GO
/****** Object:  UserDefinedFunction [dbo].[yaf_registry_value]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[yaf_registry_value] (
    @Name NVARCHAR(64)
    ,@BoardID INT = NULL
    )
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @returnValue NVARCHAR(MAX)

    IF @BoardID IS NOT NULL AND EXISTS(SELECT 1 FROM [dbo].[yaf_Registry] WHERE LOWER([Name]) = LOWER(@Name) AND [BoardID] = @BoardID)
    BEGIN
        SET @returnValue = (
            SELECT CAST([Value] AS NVARCHAR(MAX))
            FROM [dbo].[yaf_Registry]
            WHERE LOWER([Name]) = LOWER(@Name) AND [BoardID] = @BoardID)
    END
    ELSE
    BEGIN
        SET @returnValue = (
            SELECT CAST([Value] AS NVARCHAR(MAX))
            FROM [dbo].[yaf_Registry]
            WHERE LOWER([Name]) = LOWER(@Name) AND [BoardID] IS NULL)
    END

    RETURN @returnValue
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_active_updatemaxstats]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_active_updatemaxstats]
(
    @BoardID int, @UTCTIMESTAMP datetime
)
AS
BEGIN
        DECLARE @count int, @max int, @maxStr nvarchar(255), @countStr nvarchar(255), @dtStr nvarchar(255)
    
    SET @count = ISNULL((SELECT COUNT(DISTINCT IP + '.' + CAST(UserID as varchar(10))) FROM [dbo].[yaf_Active] WITH (NOLOCK) WHERE BoardID = @BoardID),0)
    SET @maxStr = (SELECT ISNULL([dbo].[yaf_registry_value](N'maxusers', @BoardID), '1'))
    SET @max = CAST(@maxStr AS int)
    SET @countStr = CAST(@count AS nvarchar)
    SET @dtStr = CONVERT(nvarchar,@UTCTIMESTAMP,126)

    IF NOT EXISTS ( SELECT 1 FROM [dbo].[yaf_Registry] WHERE BoardID = @BoardID and [Name] = N'maxusers')
    BEGIN 
        INSERT INTO [dbo].[yaf_Registry](BoardID,[Name],[Value]) VALUES (@BoardID,N'maxusers',CAST(@countStr AS ntext))
        INSERT INTO [dbo].[yaf_Registry](BoardID,[Name],[Value]) VALUES (@BoardID,N'maxuserswhen',CAST(@dtStr AS ntext))
    END
    ELSE IF (@count > @max)	
    BEGIN
        UPDATE [dbo].[yaf_Registry] SET [Value] = CAST(@countStr AS ntext) WHERE BoardID = @BoardID AND [Name] = N'maxusers'
        UPDATE [dbo].[yaf_Registry] SET [Value] = CAST(@dtStr AS ntext) WHERE BoardID = @BoardID AND [Name] = N'maxuserswhen'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_pageload]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_pageload](
    @SessionID	nvarchar(24),
    @BoardID	int,
    @UserKey	nvarchar(64),
    @IP			varchar(39),
    @Location	nvarchar(255),
    @ForumPage  nvarchar(255) = null,
    @Browser	nvarchar(50),
    @Platform	nvarchar(50),
    @CategoryID	int = null,
    @ForumID	int = null,
    @TopicID	int = null,
    @MessageID	int = null,
    @IsCrawler	bit = 0,
    @IsMobileDevice	bit = 0,
    @DontTrack	bit = 0,
    @UTCTIMESTAMP datetime
) as
begin
    declare @UserID			int
    declare @UserBoardID	int
    declare @IsGuest		tinyint	
    declare @rowcount		int
    declare @PreviousVisit	datetime
    declare @ActiveUpdate   tinyint	
    declare @ActiveFlags	int
    declare @GuestID        int
    
    set implicit_transactions off	
    -- set IsActiveNow ActiveFlag - it's a default
    set @ActiveFlags = 1;

      -- find a guest id should do it every time to be sure that guest access rights are in ActiveAccess table
    select top 1 @GuestID = UserID from [dbo].[yaf_User] WITH(NOLOCK) where BoardID=@BoardID and (Flags & 4)=4 ORDER BY Joined DESC
        set @rowcount=@@rowcount
        if (@rowcount > 1)
        begin
            raiserror('Found %d possible guest users. There should be one and only one user marked as guest.',16,1,@rowcount)
            end	
        if (@rowcount = 0)
        begin
            raiserror('No candidates for a guest were found for the board %d.',16,1,@BoardID)
            end
  
    
             
    if @UserKey is null
    begin
    -- this is a guest	
        SET @UserID = @GuestID
        set @IsGuest = 1
        -- set IsGuest ActiveFlag  1 | 2
        set @ActiveFlags = 3
        set @UserBoardID = @BoardID
        -- crawlers are always guests 
        if	@IsCrawler = 1
            begin
                -- set IsCrawler ActiveFlag
                set @ActiveFlags =  @ActiveFlags | 8
            end 
    end 
    else	
    begin
        select @UserID = UserID, @UserBoardID = BoardID from [dbo].[yaf_User] with(nolock) where BoardID=@BoardID and ProviderUserKey=@UserKey
        set @IsGuest = 0
        -- make sure that registered users are not crawlers
        set @IsCrawler = 0
        -- set IsRegistered ActiveFlag
        set @ActiveFlags = @ActiveFlags | 4
    end    

    -- Check valid ForumID
    if @ForumID is not null and not exists(select 1 from [dbo].[yaf_Forum] where ForumID=@ForumID) begin
        set @ForumID = null
    end
    -- Check valid CategoryID
    if @CategoryID is not null and not exists(select 1 from [dbo].[yaf_Category] where CategoryID=@CategoryID) begin
        set @CategoryID = null
    end
    -- Check valid MessageID
    if @MessageID is not null and not exists(select 1 from [dbo].[yaf_Message] where MessageID=@MessageID) begin
        set @MessageID = null
    end
    -- Check valid TopicID
    if @TopicID is not null and not exists(select 1 from [dbo].[yaf_Topic] where TopicID=@TopicID) begin
        set @TopicID = null
    end	

    -- find missing ForumID/TopicID
    if @MessageID is not null begin
        select
            @CategoryID = c.CategoryID,
            @ForumID = b.ForumID,
            @TopicID = b.TopicID
        from
            [dbo].[yaf_Message] a
            inner join [dbo].[yaf_Topic] b on b.TopicID = a.TopicID
            inner join [dbo].[yaf_Forum] c on c.ForumID = b.ForumID
            inner join [dbo].[yaf_Category] d on d.CategoryID = c.CategoryID
        where
            a.MessageID = @MessageID and
            d.BoardID = @BoardID
    end
    else if @TopicID is not null begin
        select 
            @CategoryID = b.CategoryID,
            @ForumID = a.ForumID 
        from 
            [dbo].[yaf_Topic] a
            inner join [dbo].[yaf_Forum] b on b.ForumID = a.ForumID
            inner join [dbo].[yaf_Category] c on c.CategoryID = b.CategoryID
        where 
            a.TopicID = @TopicID and
            c.BoardID = @BoardID
    end
    else if @ForumID is not null begin
        select
            @CategoryID = a.CategoryID
        from
            [dbo].[yaf_Forum] a
            inner join [dbo].[yaf_Category] b on b.CategoryID = a.CategoryID
        where
            a.ForumID = @ForumID and
            b.BoardID = @BoardID
    end

        
    
    -- update active access
    -- ensure that access right are in place		
        if not exists (select top 1
            UserID	
            from [dbo].[yaf_ActiveAccess] WITH(NOLOCK) 
            where UserID = @UserID )		
            begin
            insert into [dbo].[yaf_ActiveAccess](
            UserID,
            BoardID,
            ForumID,
            IsAdmin, 
            IsForumModerator,
            IsModerator,
            IsGuestX,
            LastActive, 
            ReadAccess,
            PostAccess,
            ReplyAccess,
            PriorityAccess,
            PollAccess,
            VoteAccess,	
            ModeratorAccess,
            EditAccess,
            DeleteAccess,
            UploadAccess,
            DownloadAccess)
            select 
            UserID, 
            @BoardID, 
            ForumID, 
            IsAdmin,
            IsForumModerator,
            IsModerator,
            @IsGuest,
            @UTCTIMESTAMP,
            ReadAccess,
            (CONVERT([bit],sign([PostAccess]&(2)),(0))),
            ReplyAccess,
            PriorityAccess,
            PollAccess,
            VoteAccess,
            ModeratorAccess,
            EditAccess,
            DeleteAccess,
            UploadAccess,
            DownloadAccess			
            from [dbo].[yaf_vaccess] 
            where UserID = @UserID 
            end

                -- ensure that guest access right are in place		
        if @UserID != @GuestID and not exists (select top 1
            UserID	
            from [dbo].[yaf_ActiveAccess] WITH(NOLOCK) 
            where UserID = @GuestID )		
            begin
            insert into [dbo].[yaf_ActiveAccess](
            UserID,
            BoardID,
            ForumID,
            IsAdmin, 
            IsForumModerator,
            IsModerator,
            IsGuestX,
            LastActive, 
            ReadAccess,
            PostAccess,
            ReplyAccess,
            PriorityAccess,
            PollAccess,
            VoteAccess,	
            ModeratorAccess,
            EditAccess,
            DeleteAccess,
            UploadAccess,
            DownloadAccess)
            select 
            UserID, 
            @BoardID, 
            ForumID, 
            IsAdmin,
            IsForumModerator,
            IsModerator,
            @IsGuest,
            @UTCTIMESTAMP,
            ReadAccess,
            (CONVERT([bit],sign([PostAccess]&(2)),(0))),
            ReplyAccess,
            PriorityAccess,
            PollAccess,
            VoteAccess,
            ModeratorAccess,
            EditAccess,
            DeleteAccess,
            UploadAccess,
            DownloadAccess			
            from [dbo].[yaf_vaccess] 
            where UserID = @GuestID 
            end

        if exists (select top 1
            UserID	
            from [dbo].[yaf_ActiveAccess] WITH(NOLOCK) 
            where UserID = @UserID and ForumID= ISNULL(@ForumID,0) and (ISNULL(@ForumID,0) = 0 OR ReadAccess = 1))		
            begin
                 -- verify that there's not the sane session for other board and drop it if required. Test code for portals with many boards
     delete from [dbo].[yaf_Active] where (SessionID=@SessionID  and (BoardID <> @BoardID or UserID <> @UserID))
    -- get previous visit
    if  @IsGuest = 0	 begin
        select @PreviousVisit = LastVisit from [dbo].[yaf_User] where UserID = @UserID
    end
    
    -- update last visit
    update [dbo].[yaf_User] set 
        LastVisit = @UTCTIMESTAMP,
        IP = @IP
    where UserID = @UserID
    
    if @DontTrack != 1 and @UserID is not null and @UserBoardID=@BoardID begin
      if exists(select 1 from [dbo].[yaf_Active] where (SessionID=@SessionID OR ( Browser = @Browser AND (Flags & 8) = 8 )) and BoardID=@BoardID)
        begin
          -- user is not a crawler - use his session id
          if @IsCrawler <> 1
          begin		   
            update [dbo].[yaf_Active] set
                UserID = @UserID,
                IP = @IP,
                LastActive = @UTCTIMESTAMP ,
                Location = @Location,
                ForumID = @ForumID,
                TopicID = @TopicID,
                Browser = @Browser,
                [Platform] = @Platform,
                ForumPage = @ForumPage,
                Flags = @ActiveFlags		
            where SessionID = @SessionID AND BoardID=@BoardID			
                -- cache will be updated every time set @ActiveUpdate = 1		
            end
            else
            begin
            -- search crawler by other parameters then session id
            update [dbo].[yaf_Active] set
                UserID = @UserID,
                IP = @IP,
                LastActive = @UTCTIMESTAMP ,
                Location = @Location,
                ForumID = @ForumID,
                TopicID = @TopicID,
                Browser = @Browser,
                [Platform] = @Platform,
                ForumPage = @ForumPage,
                Flags = @ActiveFlags		
            where Browser = @Browser AND IP = @IP AND BoardID=@BoardID
            -- trace crawler: the cache is reset every time crawler moves to next page ? Disabled as cache reset will overload server 
                -- set @ActiveUpdate = 1				 
            end
        end
        else 
        begin				
             -- we set @ActiveFlags ready flags 	
            insert into [dbo].[yaf_Active](
            SessionID,
            BoardID,
            UserID,
            IP,
            Login,
            LastActive,
            Location,
            ForumID,
            TopicID,
            Browser,
            [Platform],
            Flags)
            values(
            @SessionID,
            @BoardID,
            @UserID,
            @IP,
            @UTCTIMESTAMP,
            @UTCTIMESTAMP,
            @Location,
            @ForumID,
            @TopicID,
            @Browser,
            @Platform,
            @ActiveFlags)			
            
            -- update max user stats
            exec [dbo].[yaf_active_updatemaxstats] @BoardID, @UTCTIMESTAMP
            -- parameter to update active users cache if this is a new user
            if @IsGuest=0
                  begin
                  set @ActiveUpdate = 1
            end
            
        end
        -- remove duplicate users
        if @IsGuest=0
        begin
            -- ensure that no duplicates 
            delete from [dbo].[yaf_Active] where UserID=@UserID and BoardID=@BoardID and SessionID<>@SessionID	    
        
        end
        
    end
    end
    -- return information
    select top 1
        ActiveUpdate        = ISNULL(@ActiveUpdate,0),
        PreviousVisit		= @PreviousVisit,	   
        x.*,	
        IsModeratorAny      = ISNULL((select top 1 aa.ModeratorAccess from [dbo].[yaf_ActiveAccess] aa where aa.UserID = @UserID and aa.ModeratorAccess = 1),0),
        IsCrawler           = @IsCrawler,
        IsMobileDevice      = @IsMobileDevice,
        CategoryID			= @CategoryID,
        CategoryName		= (select Name from [dbo].[yaf_Category] where CategoryID = @CategoryID),
        ForumName			= (select Name from [dbo].[yaf_Forum] where ForumID = @ForumID),
        TopicID				= @TopicID,
        TopicName			= (select Topic from [dbo].[yaf_Topic] where TopicID = @TopicID),
        ForumTheme			= (select ThemeURL from [dbo].[yaf_Forum] where ForumID = @ForumID)	 
    from
     [dbo].[yaf_ActiveAccess] x  with(nolock)
    where
        x.UserID = @UserID and x.ForumID=IsNull(@ForumID,0)
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_pageaccess_path]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_pageaccess_path](
    @SessionID	nvarchar(24),
    @BoardID	int,
    @UserKey	nvarchar(64),
    @IP			varchar(39),
    @Location	nvarchar(255),
    @ForumPage  nvarchar(255) = null,
    @Browser	nvarchar(50),
    @Platform	nvarchar(50),
    @CategoryID	int = null,
    @ForumID	int = null,
    @TopicID	int = null,
    @MessageID	int = null,
    @IsCrawler	bit = 0,
    @IsMobileDevice	bit = 0,
    @DontTrack	bit = 0,
    @UTCTIMESTAMP datetime
) as
begin
    declare @UserID			int
    declare @UserBoardID	int
    declare @IsGuest		tinyint	
    declare @rowcount		int
    declare @PreviousVisit	datetime
    declare @ActiveUpdate   tinyint	
    declare @ActiveFlags	int
    declare @GuestID        int
    
    set implicit_transactions off	
    -- set IsActiveNow ActiveFlag - it's a default
    set @ActiveFlags = 1;


    -- find a guest id should do it every time to be sure that guest access rights are in ActiveAccess table
    select top 1 @GuestID = UserID from [dbo].[yaf_User] where BoardID=@BoardID and (Flags & 4)=4 ORDER BY Joined DESC
        set @rowcount=@@rowcount
        if (@rowcount > 1)
        begin
            raiserror('Found %d possible guest users. There should be one and only one user marked as guest.',16,1,@rowcount)
            end	
        if (@rowcount = 0)
        begin
            raiserror('No candidates for a guest were found for the board %d.',16,1,@BoardID)
            end
     -- verify that there's not the sane session for other board and drop it if required. Test code for portals with many boards
     delete from [dbo].[yaf_Active] where (SessionID=@SessionID  and BoardID <> @BoardID)
             
    if @UserKey is null
    begin
    -- this is a guest
        SET @UserID = @GuestID
        set @IsGuest = 1
        -- set IsGuest ActiveFlag  1 | 2
        set @ActiveFlags = 3
        set @UserBoardID = @BoardID
        -- crawlers are always guests 
        if	@IsCrawler = 1
            begin
                -- set IsCrawler ActiveFlag
                set @ActiveFlags =  @ActiveFlags | 8
            end 
    end 
    else	
    begin
        select @UserID = UserID, @UserBoardID = BoardID from [dbo].[yaf_User] with(nolock) where BoardID=@BoardID and ProviderUserKey=@UserKey
        set @IsGuest = 0
        -- make sure that registered users are not crawlers
        set @IsCrawler = 0
        -- set IsRegistered ActiveFlag
        set @ActiveFlags = @ActiveFlags | 4
    end

    
    -- Check valid ForumID
    if @ForumID is not null and not exists(select 1 from [dbo].[yaf_Forum] where ForumID=@ForumID) begin
        set @ForumID = null
    end
    -- Check valid CategoryID
    if @CategoryID is not null and not exists(select 1 from [dbo].[yaf_Category] where CategoryID=@CategoryID) begin
        set @CategoryID = null
    end
    -- Check valid MessageID
    if @MessageID is not null and not exists(select 1 from [dbo].[yaf_Message] where MessageID=@MessageID) begin
        set @MessageID = null
    end
    -- Check valid TopicID
    if @TopicID is not null and not exists(select 1 from [dbo].[yaf_Topic] where TopicID=@TopicID) begin
        set @TopicID = null
    end	
    
    -- get previous visit
    if  @IsGuest = 0	 begin
        select @PreviousVisit = LastVisit from [dbo].[yaf_User] where UserID = @UserID
    end
    
    -- update last visit
    update [dbo].[yaf_User] set 
        LastVisit = @UTCTIMESTAMP,
        IP = @IP
    where UserID = @UserID

    -- find missing ForumID/TopicID
    if @MessageID is not null begin
        select
            @CategoryID = c.CategoryID,
            @ForumID = b.ForumID,
            @TopicID = b.TopicID
        from
            [dbo].[yaf_Message] a
            inner join [dbo].[yaf_Topic] b on b.TopicID = a.TopicID
            inner join [dbo].[yaf_Forum] c on c.ForumID = b.ForumID
            inner join [dbo].[yaf_Category] d on d.CategoryID = c.CategoryID
        where
            a.MessageID = @MessageID and
            d.BoardID = @BoardID
    end
    else if @TopicID is not null begin
        select 
            @CategoryID = b.CategoryID,
            @ForumID = a.ForumID 
        from 
            [dbo].[yaf_Topic] a
            inner join [dbo].[yaf_Forum] b on b.ForumID = a.ForumID
            inner join [dbo].[yaf_Category] c on c.CategoryID = b.CategoryID
        where 
            a.TopicID = @TopicID and
            c.BoardID = @BoardID
    end
    else if @ForumID is not null begin
        select
            @CategoryID = a.CategoryID
        from
            [dbo].[yaf_Forum] a
            inner join [dbo].[yaf_Category] b on b.CategoryID = a.CategoryID
        where
            a.ForumID = @ForumID and
            b.BoardID = @BoardID
    end
    
    if @DontTrack != 1 and @UserID is not null and @UserBoardID=@BoardID begin
      if exists(select 1 from [dbo].[yaf_Active] where (SessionID=@SessionID OR ( Browser = @Browser AND (Flags & 8) = 8 )) and BoardID=@BoardID)
        begin
          -- user is not a crawler - use his session id
          if @IsCrawler <> 1
          begin		   
            update [dbo].[yaf_Active] set
                UserID = @UserID,
                IP = @IP,
                LastActive = @UTCTIMESTAMP ,
                Location = @Location,
                ForumID = @ForumID,
                TopicID = @TopicID,
                Browser = @Browser,
                [Platform] = @Platform,
                ForumPage = @ForumPage		
            where SessionID = @SessionID AND BoardID=@BoardID			
            end
            else
            begin
            -- search crawler by other parameters then session id
            update [dbo].[yaf_Active] set
                UserID = @UserID,
                IP = @IP,
                LastActive = @UTCTIMESTAMP ,
                Location = @Location,
                ForumID = @ForumID,
                TopicID = @TopicID,
                Browser = @Browser,
                [Platform] = @Platform,
                ForumPage = @ForumPage	
            where Browser = @Browser AND IP = @IP AND BoardID=@BoardID
            -- trace crawler: the cache is reset every time crawler moves to next page ? Disabled as cache reset will overload server 
            -- set @ActiveUpdate = 1			
            end
        end
        else 
        begin				
             -- we set @ActiveFlags ready flags 	
            insert into [dbo].[yaf_Active](
            SessionID,
            BoardID,
            UserID,
            IP,
            Login,
            LastActive,
            Location,
            ForumID,
            TopicID,
            Browser,
            [Platform],
            Flags)
            values(
            @SessionID,
            @BoardID,
            @UserID,
            @IP,
            @UTCTIMESTAMP,
            @UTCTIMESTAMP,
            @Location,
            @ForumID,
            @TopicID,
            @Browser,
            @Platform,
            @ActiveFlags)			

            -- update max user stats
            exec [dbo].[yaf_active_updatemaxstats] @BoardID,@UTCTIMESTAMP 
            -- parameter to update active users cache if this is a new user
            if @IsGuest=0
                  begin
                  set @ActiveUpdate = 1
            end
            
        end
        -- remove duplicate users
        if @IsGuest=0
        begin
            -- ensure that no duplicates 
            delete from [dbo].[yaf_Active] where UserID=@UserID and BoardID=@BoardID and SessionID<>@SessionID	    
        
        end
        
    end
    -- return information
    select 
        ActiveUpdate        = ISNULL(@ActiveUpdate,0),
        PreviousVisit		= @PreviousVisit,	
        IsCrawler           = @IsCrawler,
        IsMobileDevice      = @IsMobileDevice,
        CategoryID			= @CategoryID,
        CategoryName		= (select Name from [dbo].[yaf_Category] where CategoryID = @CategoryID),
        ForumName			= (select Name from [dbo].[yaf_Forum] where ForumID = @ForumID),
        TopicID				= @TopicID,
        TopicName			= (select Topic from [dbo].[yaf_Topic] where TopicID = @TopicID),
        ForumTheme			= (select ThemeURL from [dbo].[yaf_Forum] where ForumID = @ForumID)
    
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_messagehistory_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_messagehistory_list] (@MessageID INT, @DaysToClean INT,
      @UTCTIMESTAMP datetime)
as 
    BEGIN             
     -- delete all message variants older then DaysToClean days Flags reserved for possible pms   
     delete from [dbo].[yaf_MessageHistory]
     where DATEDIFF(day,Edited,@UTCTIMESTAMP ) > @DaysToClean	
              
     SELECT mh.*, m.UserID, m.UserName, IsNull(m.UserDisplayName,(SELECT u.DisplayName FROM [dbo].[yaf_User] u where u.UserID = m.UserID)) AS UserDisplayName, t.ForumID, t.TopicID, t.Topic, m.Posted
     FROM [dbo].[yaf_MessageHistory] mh
     LEFT JOIN [dbo].[yaf_Message] m ON m.MessageID = mh.MessageID
     LEFT JOIN [dbo].[yaf_Topic] t ON t.TopicID = m.TopicID
     LEFT JOIN [dbo].[yaf_User] u ON u.UserID = t.UserID
     WHERE mh.MessageID = @MessageID
     order by mh.Edited, mh.MessageID
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_unapproved]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_message_unapproved](@ForumID int) as begin
        select
        MessageID	= b.MessageID,
        UserID		= b.UserID,
        UserName	= IsNull(b.UserName,c.Name),
        UserDisplayName = IsNull(b.UserDisplayName, c.DisplayName),		
        Posted		= b.Posted,
        TopicID		= a.TopicID,
        Topic		= a.Topic,
        MessageCount = a.NumPosts,
        [Message]	= b.[Message],
        [Flags]		= b.Flags,
        [IsModeratorChanged] = b.IsModeratorChanged
    from
        [dbo].[yaf_Topic] a
        inner join [dbo].[yaf_Message] b on b.TopicID = a.TopicID
        inner join [dbo].[yaf_User] c on c.UserID = b.UserID
    where
        a.ForumID = @ForumID and
        b.IsApproved=0 and
        a.IsDeleted =0 and
        b.IsDeleted=0
    order by
        a.Posted
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_secdata]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_message_secdata]( @PageUserID int, @MessageID int ) AS
BEGIN
-- BoardID=@BoardID and
if (@PageUserID is null)
select top 1 @PageUserID = UserID from [dbo].[yaf_User] where  (Flags & 4)<>0 ORDER BY Joined DESC
SELECT
        m.MessageID,
        m.UserID,
        IsNull(t.UserName, u.Name) as Name,
        IsNull(t.UserDisplayName, u.DisplayName) as DisplayName,
        m.[Message],
        m.Posted,
        t.TopicID,
        t.ForumID,
        t.Topic,
        t.Priority,
        m.Flags,
        t.UserID,
        Edited = IsNull(m.Edited,m.Posted),
        EditedBy = IsNull(m.EditedBy,m.UserID), 
        TopicFlags = t.Flags,		
        m.EditReason,
        m.Position,
        m.IsModeratorChanged,
        m.DeleteReason,
        m.BlogPostID,
        t.PollID,
        m.IP
    FROM		
        [dbo].[yaf_Topic] t 
        join  [dbo].[yaf_Message] m ON m.TopicID = t.TopicID
        join  [dbo].[yaf_User] u ON u.UserID = t.UserID
        left join [dbo].[yaf_ActiveAccess] x  with(nolock) on x.ForumID=IsNull(t.ForumID,0)
    WHERE
        m.MessageID = @MessageID AND x.UserID=@PageUserID  AND  CONVERT(int,x.ReadAccess) > 0
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_reply_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_message_reply_list](@MessageID int) as
begin
        set nocount on
    select
        a.MessageID,
        a.UserID,
        UserName = b.Name,
        UserDisplayName = b.DisplayName,
        a.Posted,
        a.[Message],
        c.TopicID,
        c.ForumID,
        c.Topic,
        c.Priority,
        c.Description,
        c.Status,
        c.Styles,
        a.Flags,
        c.UserID AS TopicOwnerID,
        Edited = IsNull(a.Edited,a.Posted),
        a.EditReason,
        a.Position,
        a.Indent,
        a.IsModeratorChanged,
        a.DeleteReason,
        a.BlogPostID,
        c.PollID,
        a.IP,
        a.ReplyTo,
        a.ExternalMessageId,
        a.ReferenceMessageId
    from
        [dbo].[yaf_Message] a
        inner join [dbo].[yaf_User] b on b.UserID = a.UserID
        inner join [dbo].[yaf_Topic] c on c.TopicID = a.TopicID
    where
        a.IsApproved = 1 and
        a.ReplyTo = @MessageID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_listreported]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_message_listreported](@ForumID int) AS
BEGIN
        SELECT
        a.*,
        OriginalMessage = b.[Message],
        b.[Flags],
        b.[IsModeratorChanged],	
        UserName	= IsNull(b.UserName,d.Name),
        UserDisplayName	= IsNull(b.UserDisplayName,d.DisplayName),
        UserID = b.UserID,
        Posted		= b.Posted,
        TopicID = b.TopicID,
        Topic		= c.Topic,		
        NumberOfReports = (SELECT count(LogID) FROM [dbo].[yaf_MessageReportedAudit] WHERE [dbo].[yaf_MessageReportedAudit].MessageID = a.MessageID)
    FROM
        [dbo].[yaf_MessageReported] a
    INNER JOIN
        [dbo].[yaf_Message] b ON a.MessageID = b.MessageID
    INNER JOIN
        [dbo].[yaf_Topic] c ON b.TopicID = c.TopicID
    INNER JOIN
        [dbo].[yaf_User] d ON b.UserID = d.UserID
    WHERE
        c.ForumID = @ForumID and
        (c.Flags & 16)=0 and
        b.IsDeleted=0 and
        c.IsDeleted=0 and
        (b.Flags & 128)=128
    ORDER BY
        b.TopicID DESC, b.Posted DESC
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_message_list](@MessageID int) AS
BEGIN
        SELECT
        a.MessageID,
        a.UserID,
        UserName = b.Name,
        UserDisplayName = b.DisplayName,
        a.[Message],
        c.TopicID,
        c.ForumID,
        c.Topic,
        c.Priority,
        c.Description,
        c.Status,
        c.Styles,
        a.Flags,
        c.UserID AS TopicOwnerID,
        Edited = IsNull(a.Edited,a.Posted),
        TopicFlags = c.Flags,
        ForumFlags = d.Flags,
        a.EditReason,
        a.Position,
        a.IsModeratorChanged,
        a.DeleteReason,
        a.BlogPostID,
        c.PollID,
        a.IP,
        a.ReplyTo,
        a.ExternalMessageId,
        a.ReferenceMessageId
    FROM
        [dbo].[yaf_Message] a
        inner join [dbo].[yaf_User] b on b.UserID = a.UserID
        inner join [dbo].[yaf_Topic] c on c.TopicID = a.TopicID
        inner join [dbo].[yaf_Forum] d on c.ForumID = d.ForumID
    WHERE
        a.MessageID = @MessageID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_deleteundelete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_message_deleteundelete](@MessageID int, @isModeratorChanged bit, @DeleteReason nvarchar(100), @isDeleteAction int) as
begin
    
    declare @TopicID		int
    declare @ForumID		int
    declare @MessageCount	int
    declare @LastMessageID	int
    declare @UserID			int

    -- Find TopicID and ForumID
    select @TopicID=b.TopicID,@ForumID=b.ForumID,@UserID = a.UserID 
    from 
        [dbo].[yaf_Message] a
        inner join [dbo].[yaf_Topic] b on b.TopicID=a.TopicID
    where 
        a.MessageID=@MessageID

    -- Update LastMessageID in Topic and Forum
    update [dbo].[yaf_Topic] set
        LastPosted = null,
        LastMessageID = null,
        LastUserID = null,
        LastUserName = null,
        LastUserDisplayName = null,
        LastMessageFlags = null
    where LastMessageID = @MessageID

    update [dbo].[yaf_Forum] set
        LastPosted = null,
        LastTopicID = null,
        LastMessageID = null,
        LastUserID = null,
        LastUserName = null,
        LastUserDisplayName = null
    where LastMessageID = @MessageID

    -- "Delete" message
    update [dbo].[yaf_Message]
     set IsModeratorChanged = @isModeratorChanged, DeleteReason = @DeleteReason, Flags = Flags ^ 8
     where MessageID = @MessageID and ((Flags & 8) <> @isDeleteAction*8)
    
    -- update num posts for user now that the delete/undelete status has been toggled...
    if exists(select top 1 1 from [dbo].[yaf_Forum] where ForumID=@ForumID and (Flags & 4)=0)
    begin
	    UPDATE [dbo].[yaf_User] SET NumPosts = (SELECT count(MessageID) FROM [dbo].[yaf_Message] WHERE UserID = @UserID AND IsDeleted = 0 AND IsApproved = 1) WHERE UserID = @UserID
	end

    -- Delete topic if there are no more messages
    select @MessageCount = count(1) from [dbo].[yaf_Message] where TopicID = @TopicID and IsDeleted=0
    if @MessageCount=0 exec [dbo].[yaf_topic_delete] @TopicID
    -- update lastpost
    exec [dbo].[yaf_topic_updatelastpost] @ForumID,@TopicID
    exec [dbo].[yaf_forum_updatestats] @ForumID
    -- update topic numposts
    update [dbo].[yaf_Topic] set
        NumPosts = (select count(1) from [dbo].[yaf_Message] x where x.TopicID=[dbo].[yaf_Topic].TopicID and x.IsApproved = 1 and x.IsDeleted = 0 )
    where TopicID = @TopicID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_mail_createwatch]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_mail_createwatch]
(
    @TopicID int,
    @From nvarchar(255),
    @FromName nvarchar(255) = NULL,
    @Subject nvarchar(100),
    @Body ntext,
    @BodyHtml ntext = null,
    @UserID int,
    @UTCTIMESTAMP datetime
)
AS
BEGIN
    insert into [dbo].[yaf_Mail](FromUser,FromUserName,ToUser,ToUserName,Created,[Subject],Body,BodyHtml)
    select
        @From,
        @FromName,
        b.Email,
        b.Name,
        @UTCTIMESTAMP ,
        @Subject,
        @Body,
        @BodyHtml
    from
        [dbo].[yaf_WatchTopic] a
        inner join [dbo].[yaf_User] b on b.UserID=a.UserID
    where
        b.UserID <> @UserID and
        b.NotificationType NOT IN (10, 20) AND
        a.TopicID = @TopicID and
        (a.LastMail is null or a.LastMail < b.LastVisit)
    
    insert into [dbo].[yaf_Mail](FromUser,FromUserName,ToUser,ToUserName,Created,Subject,Body,BodyHtml)
    select
        @From,
        @FromName,
        b.Email,
        b.Name,
        @UTCTIMESTAMP,
        @Subject,
        @Body,
        @BodyHtml
    from
        [dbo].[yaf_WatchForum] a
        inner join [dbo].[yaf_User] b on b.UserID=a.UserID
        inner join [dbo].[yaf_Topic] c on c.ForumID=a.ForumID
    where
        b.UserID <> @UserID and
        b.NotificationType NOT IN (10, 20) AND
        c.TopicID = @TopicID and
        (a.LastMail is null or a.LastMail < b.LastVisit) and
        not exists(select 1 from [dbo].[yaf_WatchTopic] x where x.UserID=b.UserID and x.TopicID=c.TopicID)

    update [dbo].[yaf_WatchTopic] set LastMail = @UTCTIMESTAMP
    where TopicID = @TopicID
    and UserID <> @UserID
    
    update [dbo].[yaf_WatchForum] set LastMail = @UTCTIMESTAMP  
    where ForumID = (select ForumID from [dbo].[yaf_Topic] where TopicID = @TopicID)
    and UserID <> @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_forum_listread]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_forum_listread](@BoardID int,@UserID int,@CategoryID int=null,@ParentID int=null, @StyledNicks bit=null,	@FindLastRead bit = 0) as
begin
declare @tbl1 table
( ForumID int, ParentID int)
declare @tbl table
( ForumID int, ParentID int)
-- get parent forums list first
insert into @tbl1(ForumID,ParentID)
select 	
        b.ForumID,
        b.ParentID		
    from 
        [dbo].[yaf_Category] a with(nolock) 
        join [dbo].[yaf_Forum] b  with(nolock) on b.CategoryID=a.CategoryID
        join [dbo].[yaf_ActiveAccess] x  with(nolock) on x.ForumID=b.ForumID	
    where 
        a.BoardID = @BoardID and
        ((b.Flags & 2)=0 or x.ReadAccess<>0) and
        (@CategoryID is null or a.CategoryID=@CategoryID) and
        ((@ParentID is null and b.ParentID is null) or b.ParentID=@ParentID) and
        x.UserID = @UserID
            order by
        a.SortOrder,
        b.SortOrder
            
-- child forums
insert into @tbl(ForumID,ParentID)
select 	
        b.ForumID,
        b.ParentID		
    from 
        [dbo].[yaf_Category] a  with(nolock)
        join [dbo].[yaf_Forum] b  with(nolock) on b.CategoryID=a.CategoryID
        join [dbo].[yaf_ActiveAccess] x  with(nolock) on x.ForumID=b.ForumID		
    where 
        a.BoardID = @BoardID and
        ((b.Flags & 2)=0 or x.ReadAccess<>0) and
        (@CategoryID is null or a.CategoryID=@CategoryID) and
        (b.ParentID IN (SELECT ForumID FROM @tbl1)) and
        x.UserID = @UserID
        order by
        a.SortOrder,
        b.SortOrder

 insert into @tbl(ForumID,ParentID)
 select * FROM @tbl1
 -- more childrens can be added to display as a tree

        select 
        a.CategoryID, 
        Category		= a.Name, 
        ForumID			= b.ForumID,
        Forum			= b.Name, 
        b.[Description],
        b.ImageUrl,
        b.Styles,
        b.ParentID,
        b.PollGroupID,
        Topics			= [dbo].[yaf_forum_topics](b.ForumID),
        Posts			= [dbo].[yaf_forum_posts](b.ForumID),		
        LastPosted		= t.LastPosted,
        LastMessageID	= t.LastMessageID,
        LastMessageFlags = t.LastMessageFlags,
        LastUserID		= t.LastUserID,
        LastUser		= IsNull(t.LastUserName,(select x.[Name] from [dbo].[yaf_User] x with(nolock) where x.UserID=t.LastUserID)),
        LastUserDisplayName	= IsNull(t.LastUserDisplayName,(select x.[DisplayName] from [dbo].[yaf_User] x with(nolock) where x.UserID=t.LastUserID)),
        LastTopicID		= t.TopicID,
        TopicMovedID    = t.TopicMovedID,
        LastTopicName	= t.Topic,
        LastTopicStatus = t.Status,
        LastTopicStyles = t.Styles,
        b.Flags,
        Viewing			= (select count(1) from [dbo].[yaf_Active] x with(nolock) JOIN [dbo].[yaf_User] usr with(nolock) ON x.UserID = usr.UserID where x.ForumID=b.ForumID AND usr.IsActiveExcluded = 0),
        b.RemoteURL,		
        ReadAccess = CONVERT(int,x.ReadAccess),
        Style = case(@StyledNicks)
            when 1 then  (select top 1 usr.[UserStyle] from [dbo].[yaf_User] usr with(nolock) where usr.UserID = t.LastUserID)
            else ''	 end,
        LastForumAccess = case(@FindLastRead)
             when 1 then
               (SELECT top 1 LastAccessDate FROM [dbo].[yaf_ForumReadTracking] x with(nolock) WHERE x.ForumID=b.ForumID AND x.UserID = @UserID)
             else ''	 end,
        LastTopicAccess = case(@FindLastRead)
             when 1 then
               (SELECT top 1 LastAccessDate FROM [dbo].[yaf_TopicReadTracking] y with(nolock) WHERE y.TopicID=t.TopicID AND y.UserID = @UserID)
             else ''	 end 					
    from 
        [dbo].[yaf_Category] a with(nolock)
        join [dbo].[yaf_Forum] b with(nolock) on b.CategoryID=a.CategoryID
        join [dbo].[yaf_ActiveAccess] x with(nolock) on x.ForumID=b.ForumID
        left outer join [dbo].[yaf_Topic] t with(nolock) ON t.TopicID = [dbo].[yaf_forum_lasttopic](b.ForumID,@UserID,b.LastTopicID,b.LastPosted)
    where 		
        (@CategoryID is null or a.CategoryID=@CategoryID) and		
         x.UserID = @UserID and		
        (b.ForumID IN (SELECT ForumID FROM @tbl) )
    order by
        a.SortOrder,
        b.SortOrder
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_forum_initdisplayname]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_forum_initdisplayname] as
 
begin
    declare @tmpUserName nvarchar(255)
    declare @tmpUserDisplayName nvarchar(255)
    declare @tmpLastUserName nvarchar(255)
    declare @tmpLastUserDisplayName nvarchar(255)
    declare @tmp int
    declare @tmpUserID int
    declare @tmpLastUserID int
 
     update d
      set    d.LastUserDisplayName = ISNULL((select top 1 f.LastUserDisplayName FROM [dbo].[yaf_Forum] f
          join [dbo].[yaf_User] u on u.UserID = f.UserID where u.UserID = d.UserID), 
           (select top 1 f.LastUserName FROM [dbo].[yaf_Forum] f
          join [dbo].[yaf_User] u on u.UserID = f.UserID where u.UserID = d.UserID ))      
       from  [dbo].[yaf_Forum] d where d.LastUserDisplayName IS NULL OR d.LastUserDisplayName = d.LastUserName;
         
        /* declare fc cursor for
        select ForumID, LastUserID from [dbo].[yaf_Forum]
        where (LastUserDisplayName IS NULL OR LastUserName IS NULL) and LastUserID IS NOT NULL
        FOR UPDATE     
        open fc
         
        fetch next from fc into @tmp,@tmpLastUserID
        while @@FETCH_STATUS = 0
        begin
        select @tmpLastUserDisplayName = u.DisplayName,  @tmpLastUserName = u.Name FROM [dbo].[yaf_User] u WHERE u.UserID = @tmpLastUserID
        update [dbo].[yaf_Forum] set LastUserDisplayName = @tmpLastUserDisplayName, LastUserName = @tmpLastUserName where [dbo].[yaf_Forum].ForumID = @tmp    
        fetch next from fc into @tmp,@tmpLastUserID
        end
        close fc
        deallocate fc */
 
        update d
       set    d.UserDisplayName = ISNULL((select top 1 f.UserDisplayName FROM [dbo].[yaf_ShoutboxMessage] f
          join [dbo].[yaf_User] u on u.UserID = f.UserID where u.UserID = d.UserID), 
           (select top 1 f.UserName FROM [dbo].[yaf_ShoutboxMessage] f
          join [dbo].[yaf_User] u on u.UserID = f.UserID where u.UserID = d.UserID ))      
       from  [dbo].[yaf_ShoutboxMessage] d where d.UserDisplayName IS NULL OR d.UserDisplayName = d.UserName;
         
    /*  declare sbc cursor for
        select ShoutBoxMessageID,UserID from [dbo].[yaf_ShoutboxMessage]
        where UserDisplayName IS NULL
        FOR UPDATE     
        open sbc
         
        fetch next from sbc into @tmp,@tmpUserID
        while @@FETCH_STATUS = 0
        begin
        select @tmpUserDisplayName = u.DisplayName,  @tmpUserName = u.Name FROM [dbo].[yaf_User] u WHERE u.UserID = @tmpUserID
        update [dbo].[yaf_ShoutboxMessage] set UserDisplayName = @tmpUserDisplayName,UserName = @tmpUserName where [dbo].[yaf_ShoutboxMessage].ShoutBoxMessageID = @tmp
        fetch next from sbc into @tmp,@tmpUserID
        end
        close sbc
        deallocate sbc  
        */  
         
            update d
       set    d.UserDisplayName = ISNULL((select top 1 m.UserDisplayName FROM [dbo].[yaf_Message] m
          join [dbo].[yaf_User] u on u.UserID = m.UserID where u.UserID = d.UserID), 
           (select top 1 m.UserName FROM [dbo].[yaf_Message] m
          join [dbo].[yaf_User] u on u.UserID = m.UserID where u.UserID = d.UserID ))      
       from  [dbo].[yaf_Message] d where d.UserDisplayName IS NULL OR d.UserDisplayName = d.UserName;  
         
    /*  declare mc cursor for
        select MessageID,UserID from [dbo].[yaf_Message]
        where UserDisplayName IS NULL
        FOR UPDATE
                 
        open mc
         
        fetch next from mc into @tmp,@tmpUserID
        while @@FETCH_STATUS = 0
        begin
        select @tmpUserDisplayName = u.DisplayName,  @tmpUserName = u.Name FROM [dbo].[yaf_User] u WHERE u.UserID = @tmpUserID     
        update [dbo].[yaf_Message]  set UserDisplayName = @tmpUserDisplayName, UserName = @tmpUserName where MessageID = @tmp
        fetch next from mc into @tmp,@tmpUserID
        end
        close mc
        deallocate mc
        */      
         
            update d
       set    d.UserDisplayName = ISNULL((select top 1 t.UserDisplayName FROM [dbo].[yaf_Topic] t
          join [dbo].[yaf_User] u on u.UserID = t.UserID where u.UserID = d.UserID), 
           (select top 1 t.UserName FROM [dbo].[yaf_Topic] t
          join [dbo].[yaf_User] u on u.UserID = t.UserID where u.UserID = d.UserID ))      
       from  [dbo].[yaf_Message] d where d.UserDisplayName IS NULL OR d.UserDisplayName = d.UserName;  
 
    /*  declare tc cursor for
        select TopicID,UserID,LastUserID from [dbo].[yaf_Topic]
        where (UserDisplayName IS NULL OR LastUserDisplayName IS NULL) and LastUserID IS NOT NULL
        FOR UPDATE
                 
        open tc
         
        fetch next from tc into @tmp,@tmpUserID,@tmpLastUserID
        while @@FETCH_STATUS = 0
        begin  
        select @tmpUserDisplayName = u.DisplayName,  @tmpUserName = u.Name FROM [dbo].[yaf_User] u WHERE u.UserID = @tmpUserID 
        select @tmpLastUserDisplayName = u.DisplayName,  @tmpLastUserName = u.Name FROM [dbo].[yaf_User] u WHERE u.UserID = @tmpLastUserID     
        update [dbo].[yaf_Topic] set UserDisplayName = @tmpUserDisplayName, UserName = @tmpUserName  where TopicID = @tmp
        update [dbo].[yaf_Topic] set LastUserDisplayName = @tmpLastUserDisplayName, LastUserName = @tmpLastUserName where TopicID = @tmp           
 
        fetch next from tc into @tmp,@tmpUserID,@tmpLastUserID
        end
        close tc
        deallocate tc   */      
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_board_stats]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_board_stats]
    @BoardID	int = null
as 
begin
        if (@BoardID is null) begin
        select
            NumPosts	= (select count(1) from [dbo].[yaf_Message] where IsApproved = 1 AND IsDeleted = 0),
            NumTopics	= (select count(1) from [dbo].[yaf_Topic] where IsDeleted = 0),
            NumUsers	= (select count(1) from [dbo].[yaf_User] where IsApproved = 1),
            BoardStart	= (select min(Joined) from [dbo].[yaf_User])
    end
    else begin
        select
            NumPosts	= (select count(1)	
                                from [dbo].[yaf_Message] a
                                join [dbo].[yaf_Topic] b ON a.TopicID=b.TopicID
                                join [dbo].[yaf_Forum] c ON b.ForumID=c.ForumID
                                join [dbo].[yaf_Category] d ON c.CategoryID=d.CategoryID
                                where a.IsApproved = 1 AND a.IsDeleted = 0 and b.IsDeleted = 0 AND d.BoardID=@BoardID
                            ),
            NumTopics	= (select count(1) 
                                from [dbo].[yaf_Topic] a
                                join [dbo].[yaf_Forum] b ON a.ForumID=b.ForumID
                                join [dbo].[yaf_Category] c ON b.CategoryID=c.CategoryID
                                where c.BoardID=@BoardID AND a.IsDeleted = 0
                            ),
            NumUsers	= (select count(1) from [dbo].[yaf_User] where IsApproved = 1 and BoardID=@BoardID),
            BoardStart	= (select min(Joined) from [dbo].[yaf_User] where BoardID=@BoardID)
    end
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_board_poststats]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_board_poststats](@BoardID int, @StyledNicks bit = 0, @ShowNoCountPosts bit = 0, @GetDefaults bit = 0 ) as
BEGIN

-- vzrus: while  a new installation or like this we don't have the row and should return a dummy data
IF @GetDefaults <= 0
BEGIN
        SELECT TOP 1 
        Posts = (select count(1) from [dbo].[yaf_Message] a join [dbo].[yaf_Topic] b on b.TopicID=a.TopicID join [dbo].[yaf_Forum] c on c.ForumID=b.ForumID join [dbo].[yaf_Category] d on d.CategoryID=c.CategoryID where d.BoardID=@BoardID AND (a.Flags & 24)=16),
        Topics = (select count(1) from [dbo].[yaf_Topic] a join [dbo].[yaf_Forum] b on b.ForumID=a.ForumID join [dbo].[yaf_Category] c on c.CategoryID=b.CategoryID where c.BoardID=@BoardID AND a.IsDeleted = 0),
        Forums = (select count(1) from [dbo].[yaf_Forum] a join [dbo].[yaf_Category] b on b.CategoryID=a.CategoryID where b.BoardID=@BoardID),	
        LastPostInfoID	= 1,
        LastPost	= a.Posted,
        LastUserID	= a.UserID,
        LastUser	= e.Name,
        LastUserDisplayName	= e.DisplayName,
        LastUserStyle =  case(@StyledNicks)
            when 1 then  (select top 1 usr.[UserStyle] from [dbo].[yaf_User] usr with(nolock) where usr.UserID = a.UserID)
            else ''	 end
            FROM 
                [dbo].[yaf_Message] a 
				join [dbo].[yaf_Topic] b on b.TopicID=a.TopicID
                join [dbo].[yaf_Forum] c on c.ForumID=b.ForumID 
                join [dbo].[yaf_Category] d on d.CategoryID=c.CategoryID 
                join [dbo].[yaf_User] e on e.UserID=a.UserID						
            WHERE 
                (a.Flags & 24) = 16
                AND b.IsDeleted = 0 
                AND d.BoardID = @BoardID 
                AND c.[IsNoCount] <> (CASE WHEN @ShowNoCountPosts > 0 THEN -1 ELSE 1 END)
            ORDER BY
                a.Posted DESC
        END
        ELSE
        BEGIN
        SELECT
        Posts = 0,
        Topics = 0,
        Forums = 1,	
        LastPostInfoID	= 1,
        LastPost	= null,
        LastUserID	= null,
        LastUser	= null,
        LastUserDisplayName	= null,
        LastUserStyle = ''
        END
        -- this can be in any very rare updatable cached place 
        DELETE FROM [dbo].[yaf_Topic] where TopicMovedID IS NOT NULL AND LinkDate IS NOT NULL AND LinkDate < GETUTCDATE()
        
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_announcements_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_announcements_list]
(
    @ForumID int,
    @UserID int = null,
    @Date datetime=null,
    @ToDate datetime=null,
    @PageIndex int = 1, 
    @PageSize int = 0, 
    @StyledNicks bit = 0,
    @ShowMoved  bit = 0,
    @FindLastRead bit = 0
)
AS
begin
   declare @TotalRows int
   declare @FirstSelectRowNumber int
   declare @LastSelectRowNumber int
   
   -- find total returned count
   select  @TotalRows = COUNT(c.TopicID)
   FROM [dbo].[yaf_Topic] c 
   WHERE c.ForumID = @ForumID
   AND	c.[Priority] = 2
   AND	c.IsDeleted = 0
    AND	(c.TopicMovedID IS NOT NULL OR c.NumPosts > 0) 
    AND
    (@ShowMoved = 1 or (@ShowMoved <> 1 AND  c.TopicMovedID IS NULL))
    
    select @PageIndex = @PageIndex+1;
    select @FirstSelectRowNumber = (@PageIndex - 1) * @PageSize + 1;
    select @LastSelectRowNumber = (@PageIndex - 1) * @PageSize + @PageSize;
    
    with TopicIds  as
     (
     select ROW_NUMBER() over (order by tt.[Priority] desc,tt.LastPosted desc) as RowNum, tt.TopicID
     from  [dbo].[yaf_Topic] tt
     where tt.ForumID = @ForumID and tt.[Priority] = 2
      AND	tt.IsDeleted = 0
      AND	((tt.TopicMovedID IS NOT NULL) OR (tt.NumPosts > 0))
      AND
      (@ShowMoved = 1 or (@ShowMoved <> 1 AND  TopicMovedID IS NULL))
      )	  
      select
            c.ForumID,
            c.TopicID,
            c.Posted,
            LinkTopicID = IsNull(c.TopicMovedID,c.TopicID),
            c.TopicMovedID,
            FavoriteCount = (SELECT COUNT(1) as [FavoriteCount] FROM [dbo].[yaf_FavoriteTopic] WHERE TopicId = IsNull(c.TopicMovedID,c.TopicID)),
            [Subject] = c.Topic,
            c.[Description],
            c.[Status],
            c.[Styles],
            c.UserID,
            Starter = IsNull(c.UserName,b.Name),
            StarterDisplay = IsNull(c.UserDisplayName,b.DisplayName),
            Replies = c.NumPosts - 1,
            NumPostsDeleted = (SELECT COUNT(1) FROM [dbo].[yaf_Message] mes WHERE mes.TopicID = c.TopicID AND mes.IsDeleted = 1 AND mes.IsApproved = 1 AND ((@UserID IS NOT NULL AND mes.UserID = @UserID) OR (@UserID IS NULL)) ),			
            [Views] = c.[Views],
            LastPosted = c.LastPosted,
            LastUserID = c.LastUserID,
            LastUserName = IsNull(c.LastUserName,(SELECT x.Name FROM [dbo].[yaf_User] x where x.UserID=c.LastUserID)),
            LastUserDisplayName = IsNull(c.LastUserDisplayName,(SELECT x.DisplayName FROM [dbo].[yaf_User] x where x.UserID=c.LastUserID)),
            LastMessageID = c.LastMessageID,
            LastTopicID = c.TopicID,
            LinkDate = c.LinkDate,
            TopicFlags = c.Flags,
            c.Priority,
            c.PollID,
            ForumFlags = d.Flags,
            FirstMessage = (SELECT TOP 1 CAST([Message] as nvarchar(1000)) FROM [dbo].[yaf_Message] mes2 where mes2.TopicID = IsNull(c.TopicMovedID,c.TopicID) AND mes2.Position = 0),
            StarterStyle = case(@StyledNicks)
            when 1 then  b.UserStyle
            else ''	 end,
            LastUserStyle= case(@StyledNicks)
            when 1 then  (select top 1 usr.[UserStyle] from [dbo].[yaf_User] usr with(nolock) where usr.UserID = c.LastUserID)
            else ''	 end,
            LastForumAccess = case(@FindLastRead)
             when 1 then
               (SELECT top 1 LastAccessDate FROM [dbo].[yaf_ForumReadTracking] x WHERE x.ForumID=c.ForumID AND x.UserID = @UserID)
             else ''	 end,
            LastTopicAccess = case(@FindLastRead)
             when 1 then
               (SELECT top 1 LastAccessDate FROM [dbo].[yaf_TopicReadTracking] y WHERE y.TopicID=c.TopicID AND y.UserID = @UserID)
             else ''	 end,         
             c.TopicImage,           
             0 as HasAttachments,           
            PageIndex = @PageIndex,   	
            @TotalRows as TotalRows			       
            from
            TopicIds ti
            inner join [dbo].[yaf_Topic] c	
            ON c.TopicID = ti.TopicID
            JOIN [dbo].[yaf_User] b 
            ON b.UserID=c.UserID
            join [dbo].[yaf_Forum] d on d.ForumID=c.ForumID
            WHERE ti.RowNum between @FirstSelectRowNumber and @LastSelectRowNumber
        order by
            RowNum ASC 
    
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_admin_pageaccesslist]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_admin_pageaccesslist](@BoardID int = null, @StyledNicks bit = null,@UTCTIMESTAMP datetime) as
begin
         select 
        a.UserID,
        a.BoardID,
        b.Name AS BoardName,
        a.[Name],
        a.[DisplayName],
        a.[Culture],
            a.NumPosts,
            CultureUser = a.Culture,
            Style = case(@StyledNicks)
            when 1 then  a.UserStyle
            else ''	 end
        from 
            [dbo].[yaf_User] a
            JOIN
            [dbo].[yaf_Board] b	
            ON b.BoardID = a.BoardID			
            left join [dbo].[yaf_vaccess] c 
            on c.UserID=a.UserID
        where 			
            (@BoardID IS NULL OR a.BoardID = @BoardID) and
            -- is admin 
            (IsNull(c.IsAdmin,0) <> 0) and
            c.ForumID = 0 and 			
            -- is not host admin 
            IsNull(a.Flags & 1,0) = 0 
        order by 
            a.DisplayName
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_admin_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_admin_list](@BoardID int = null, @StyledNicks bit = null,@UTCTIMESTAMP datetime) as
begin
         select 
        a.UserID,
        a.BoardID,
        b.Name AS BoardName,
        a.ProviderUserKey,
        a.[Name],
        a.[DisplayName],
        a.[Password],
        a.[Email],
        a.Joined,
        a.LastVisit,
        a.IP,
        a.NumPosts,
        a.TimeZone,
        a.Avatar,
        a.[Signature],
        a.AvatarImage,
        a.AvatarImageType,
        a.RankID,
        a.Suspended,
        a.LanguageFile,
        a.ThemeFile,
        a.TextEditor,
        a.OverrideDefaultThemes,
        a.[PMNotification],
        a.[AutoWatchTopics],
        a.[DailyDigest],
        a.[NotificationType],
        a.[Flags],
        a.[Points],		
        a.[IsApproved],
        a.[IsGuest],
        a.[IsCaptchaExcluded],
        a.[IsActiveExcluded],
        a.[IsDST],
        a.[IsDirty],
        a.[IsFacebookUser],
        a.[IsTwitterUser],
        a.[IsGoogleUser],
        a.[Culture],
            a.NumPosts,
            CultureUser = a.Culture,			
            r.RankID,						
            RankName = r.Name,
            Style = case(@StyledNicks)
            when 1 then  a.UserStyle
            else ''	 end, 
            NumDays = datediff(d,a.Joined,@UTCTIMESTAMP )+1,
            NumPostsForum = (select count(1) from [dbo].[yaf_Message] x where x.IsApproved = 1 and x.IsDeleted = 0),
            HasAvatarImage = (select count(1) from [dbo].[yaf_User] x where x.UserID=a.UserID and AvatarImage is not null),
            IsAdmin	= IsNull(c.IsAdmin,0),			
            IsHostAdmin	= IsNull(a.Flags & 1,0)
        from 
            [dbo].[yaf_User] a
            JOIN
            [dbo].[yaf_Board] b	
            ON b.BoardID = a.BoardID			
            JOIN
            [dbo].[yaf_Rank] r	
            ON r.RankID = a.RankID		
            left join [dbo].[yaf_vaccess] c on c.UserID=a.UserID
        where 			
            (@BoardID IS NULL OR a.BoardID = @BoardID) and
            -- is not guest 
            IsNull(a.Flags & 4,0) = 0 and
            c.ForumID = 0 and
            -- is admin 
            (IsNull(c.IsAdmin,0) <> 0) 
        order by 
            a.DisplayName
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_active_listtopic]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_active_listtopic](@TopicID int,@StyledNicks bit = 0) as
begin   
        select
        UserID		= a.UserID,
        UserName	= b.Name,
        UserDisplayName = b.DisplayName,
        IsHidden = ( b.IsActiveExcluded ),		
        IsCrawler	= Convert(int,a.Flags & 8),
        Style = case(@StyledNicks)
            when 1 then  b.UserStyle
            else ''	 end, 	
        UserCount   = (SELECT COUNT(ac.UserID) from
        [dbo].[yaf_Active] ac with(nolock) where ac.UserID = a.UserID and ac.TopicID = @TopicID),
        Browser = a.Browser
    from
        [dbo].[yaf_Active] a with(nolock)
        join [dbo].[yaf_User] b on b.UserID=a.UserID		
    where
        a.TopicID = @TopicID
    group by
        a.UserID,
        b.DisplayName,
        b.Name,
        b.IsActiveExcluded,
        b.UserID,
        b.UserStyle,
        a.Flags,
        a.Browser		
    order by
        b.Name
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_active_listforum]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_active_listforum](@ForumID int, @StyledNicks bit = 0) as
begin
        select
        UserID		= a.UserID,
        UserName	= b.Name,
        UserDisplayName = b.DisplayName,
        IsHidden	= ( b.IsActiveExcluded ),
        IsCrawler	= Convert(int,a.Flags & 8),		
        Style = case(@StyledNicks)
        when 1 then  b.UserStyle
        else ''	 end, 			
        UserCount   = (SELECT COUNT(ac.UserID) from
        [dbo].[yaf_Active] ac with(nolock) where ac.UserID = a.UserID and ac.ForumID = @ForumID),
        Browser = a.Browser
    from
        [dbo].[yaf_Active] a 
        join [dbo].[yaf_User] b on b.UserID=a.UserID
    where
        a.ForumID = @ForumID
    group by
        a.UserID,
        b.DisplayName,
        b.Name,
        b.IsActiveExcluded,
        b.UserID,
        b.UserStyle,
        a.Flags,
        a.Browser
    order by
        b.Name
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_registry_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_registry_save](
    @Name nvarchar(50),
    @Value ntext = NULL,
    @BoardID int = null
) AS
BEGIN
        if @BoardID is null
    begin
        if exists(select 1 from [dbo].[yaf_Registry] where lower(Name)=lower(@Name))
            update [dbo].[yaf_Registry] set Value = @Value where lower(Name)=lower(@Name) and BoardID is null
        else
        begin
            insert into [dbo].[yaf_Registry](Name,Value) values(lower(@Name),@Value)
        end
    end else
    begin
        if exists(select 1 from [dbo].[yaf_Registry] where lower(Name)=lower(@Name) and BoardID=@BoardID)
            update [dbo].[yaf_Registry] set Value = @Value where lower(Name)=lower(@Name) and BoardID=@BoardID
        else
        begin
            insert into [dbo].[yaf_Registry](Name,Value,BoardID) values(lower(@Name),@Value,@BoardID)
        end
    end
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_board_create]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_board_create](
    @BoardName 		nvarchar(50),
    @Culture varchar(10),
    @LanguageFile 	nvarchar(50),
    @MembershipAppName nvarchar(50),
    @RolesAppName nvarchar(50),
    @UserName		nvarchar(255),
    @UserEmail		nvarchar(255),
    @UserKey		nvarchar(64),
    @IsHostAdmin	bit,
    @RolePrefix     nvarchar(255),
    @UTCTIMESTAMP datetime
) as 
begin
    declare @BoardID				int
    declare @TimeZone				int
    declare @ForumEmail				nvarchar(50)
    declare	@GroupIDAdmin			int
    declare	@GroupIDGuest			int
    declare @GroupIDMember			int
    declare	@AccessMaskIDAdmin		int
    declare @AccessMaskIDModerator	int
    declare @AccessMaskIDMember		int
    declare	@AccessMaskIDReadOnly	int
    declare @UserIDAdmin			int
    declare @UserIDGuest			int
    declare @RankIDAdmin			int
    declare @RankIDGuest			int
    declare @RankIDNewbie			int
    declare @RankIDMember			int
    declare @RankIDAdvanced			int
    declare	@CategoryID				int
    declare	@ForumID				int
    declare @UserFlags				int

    -- Board
    INSERT INTO [dbo].[yaf_Board](Name, AllowThreaded, MembershipAppName, RolesAppName ) values(@BoardName,0, @MembershipAppName, @RolesAppName)
    SET @BoardID = SCOPE_IDENTITY()

    SET @TimeZone = (SELECT ISNULL(CAST([dbo].[yaf_registry_value](N'TimeZone', @BoardID) as int), 0))
    SET @ForumEmail = (SELECT [dbo].[yaf_registry_value](N'ForumEmail', @BoardID))
    
    EXEC [dbo].[yaf_registry_save] 'culture',@Culture,@BoardID
    EXEC [dbo].[yaf_registry_save] 'language',@LanguageFile,@BoardID
    
    -- Rank
    INSERT INTO [dbo].[yaf_Rank](BoardID,Name,Flags,MinPosts,PMLimit,Style,SortOrder) VALUES (@BoardID,'Administration',0,null,2147483647,'default!font-size: 8pt; color: #811334/yafpro!font-size: 8pt; color:blue',0)
    SET @RankIDAdmin = SCOPE_IDENTITY()
    INSERT INTO [dbo].[yaf_Rank](BoardID,Name,Flags,MinPosts,PMLimit,SortOrder) VALUES(@BoardID,'Guest',0,null,0,100)
    SET @RankIDGuest = SCOPE_IDENTITY()
    INSERT INTO [dbo].[yaf_Rank](BoardID,Name,Flags,MinPosts,PMLimit,SortOrder) VALUES(@BoardID,'Newbie',3,0,10,3)
    SET @RankIDNewbie = SCOPE_IDENTITY()
    INSERT INTO [dbo].[yaf_Rank](BoardID,Name,Flags,MinPosts,PMLimit,SortOrder) VALUES(@BoardID,'Member',2,10,30,2)
    SET @RankIDMember = SCOPE_IDENTITY()
    INSERT INTO [dbo].[yaf_Rank](BoardID,Name,Flags,MinPosts,PMLimit,SortOrder) VALUES(@BoardID,'Advanced Member',2,30,100,1)
    SET @RankIDAdvanced = SCOPE_IDENTITY()

    -- AccessMask
    INSERT INTO [dbo].[yaf_AccessMask](BoardID,Name,Flags,SortOrder)
    VALUES(@BoardID,'Admin Access',1023 + 1024,4)
    SET @AccessMaskIDAdmin = SCOPE_IDENTITY()
    INSERT INTO [dbo].[yaf_AccessMask](BoardID,Name,Flags,SortOrder)
    VALUES(@BoardID,'Moderator Access',487 + 1024,3)
    SET @AccessMaskIDModerator = SCOPE_IDENTITY()
    INSERT INTO [dbo].[yaf_AccessMask](BoardID,Name,Flags,SortOrder)
    VALUES(@BoardID,'Member Access',423 + 1024,2)
    SET @AccessMaskIDMember = SCOPE_IDENTITY()
    INSERT INTO [dbo].[yaf_AccessMask](BoardID,Name,Flags,SortOrder)
    VALUES(@BoardID,'Read Only Access',1,1)
    SET @AccessMaskIDReadOnly = SCOPE_IDENTITY()
    INSERT INTO [dbo].[yaf_AccessMask](BoardID,Name,Flags,SortOrder)
    VALUES(@BoardID,'No Access',0,0)

    -- Group
    INSERT INTO [dbo].[yaf_Group](BoardID,Name,Flags,PMLimit,Style,SortOrder,UsrSigChars,UsrSigBBCodes,UsrAlbums,UsrAlbumImages) values(@BoardID, ISNULL(@RolePrefix,'') + 'Administrators',1,2147483647,'default!font-size: 8pt; color: red/yafpro!font-size: 8pt; color:blue',0,256,'URL,IMG,SPOILER,QUOTE',10,120)
    set @GroupIDAdmin = SCOPE_IDENTITY()
    INSERT INTO [dbo].[yaf_Group](BoardID,Name,Flags,PMLimit,Style,SortOrder,UsrSigChars,UsrSigBBCodes,UsrAlbums,UsrAlbumImages) values(@BoardID,'Guests',2,0,'default!font-size: 8pt; font-style: italic; font-weight: bold; color: #0c7333/yafpro!font-size: 8pt; color: #6e1987',1,0,null,0,0)
    SET @GroupIDGuest = SCOPE_IDENTITY()
    INSERT INTO [dbo].[yaf_Group](BoardID,Name,Flags,PMLimit,SortOrder,UsrSigChars,UsrSigBBCodes,UsrAlbums,UsrAlbumImages) values(@BoardID,ISNULL(@RolePrefix,'') + 'Registered',4,100,1,128,'URL,IMG,SPOILER,QUOTE',5,30)
    SET @GroupIDMember = SCOPE_IDENTITY()	
    
    -- User (GUEST)
    INSERT INTO [dbo].[yaf_User](BoardID,RankID,[Name],DisplayName,[Password],Joined,LastVisit,NumPosts,TimeZone,Email,Flags)
    VALUES(@BoardID,@RankIDGuest,'Guest','Guest','na',@UTCTIMESTAMP ,@UTCTIMESTAMP ,0,@TimeZone,@ForumEmail,6)
    SET @UserIDGuest = SCOPE_IDENTITY()	
    
    SET @UserFlags = 2
    if @IsHostAdmin<>0 SET @UserFlags = 3
    
    -- User (ADMIN)
    INSERT INTO [dbo].[yaf_User](BoardID,RankID,[Name],DisplayName, [Password], Email,ProviderUserKey, Joined,LastVisit,NumPosts,TimeZone,Flags)
    VALUES(@BoardID,@RankIDAdmin,@UserName,@UserName,'na',@UserEmail,@UserKey,@UTCTIMESTAMP ,@UTCTIMESTAMP ,0,@TimeZone,@UserFlags)
    SET @UserIDAdmin = SCOPE_IDENTITY()

    -- UserGroup
    INSERT INTO [dbo].[yaf_UserGroup](UserID,GroupID) VALUES(@UserIDAdmin,@GroupIDAdmin)
    INSERT INTO [dbo].[yaf_UserGroup](UserID,GroupID) VALUES(@UserIDGuest,@GroupIDGuest)

    -- Category
    INSERT INTO [dbo].[yaf_Category](BoardID,Name,SortOrder) VALUES(@BoardID,'Test Category',1)
    set @CategoryID = SCOPE_IDENTITY()
    
    -- Forum
    INSERT INTO [dbo].[yaf_Forum](CategoryID,Name,Description,SortOrder,NumTopics,NumPosts,Flags)
    VALUES(@CategoryID,'Test Forum','A test forum',1,0,0,4)
    set @ForumID = SCOPE_IDENTITY()

    -- ForumAccess
    INSERT INTO [dbo].[yaf_ForumAccess](GroupID,ForumID,AccessMaskID) VALUES(@GroupIDAdmin,@ForumID,@AccessMaskIDAdmin)
    INSERT INTO [dbo].[yaf_ForumAccess](GroupID,ForumID,AccessMaskID) VALUES(@GroupIDGuest,@ForumID,@AccessMaskIDReadOnly)
    INSERT INTO [dbo].[yaf_ForumAccess](GroupID,ForumID,AccessMaskID) VALUES(@GroupIDMember,@ForumID,@AccessMaskIDMember)

    SELECT @BoardID;
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_system_initialize]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_system_initialize](
    @Name		nvarchar(50),
    @TimeZone	int,
    @Culture	varchar(10),
    @LanguageFile nvarchar(50),
    @ForumEmail	nvarchar(50),
	@ForumBaseUrlMask	nvarchar(255),
    @SmtpServer	nvarchar(50),
    @User		nvarchar(255),
    @UserEmail	nvarchar(255),
    @UserKey	nvarchar(64),
    @RolePrefix nvarchar(255),
    @UTCTIMESTAMP datetime
    
) as 
begin
        DECLARE @tmpValue AS nvarchar(100)

    -- initalize required 'registry' settings
    EXEC [dbo].[yaf_registry_save] 'version','1'
    EXEC [dbo].[yaf_registry_save] 'versionname','1.0.0'
    SET @tmpValue = CAST(@TimeZone AS nvarchar(100))
    EXEC [dbo].[yaf_registry_save] 'timezone', @tmpValue
    EXEC [dbo].[yaf_registry_save] 'culture', @Culture
    EXEC [dbo].[yaf_registry_save] 'language', @LanguageFile
    EXEC [dbo].[yaf_registry_save] 'smtpserver', @SmtpServer
    EXEC [dbo].[yaf_registry_save] 'forumemail', @ForumEmail
	EXEC [dbo].[yaf_registry_save] 'baseurlmask', @ForumBaseUrlMask
    
    -- initalize new board
    EXEC [dbo].[yaf_board_create] @Name, @Culture, @LanguageFile, '','',@User,@UserEmail,@UserKey,1,@RolePrefix,@UTCTIMESTAMP
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_registry_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_registry_list](@Name nvarchar(50) = null,@BoardID int = null) as
BEGIN
        if @BoardID is null
    begin
        IF @Name IS NULL OR @Name = ''
        BEGIN
            SELECT * FROM [dbo].[yaf_Registry] where BoardID is null
        END ELSE
        BEGIN
            SELECT * FROM [dbo].[yaf_Registry] WHERE LOWER(Name) = LOWER(@Name) and BoardID is null
        END
    end else 
    begin
        IF @Name IS NULL OR @Name = ''
        BEGIN
            SELECT * FROM [dbo].[yaf_Registry] where BoardID=@BoardID
        END ELSE
        BEGIN
            SELECT * FROM [dbo].[yaf_Registry] WHERE LOWER(Name) = LOWER(@Name) and BoardID=@BoardID
        END
    end
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_updateuser]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_updateuser]
(
@ApplicationName nvarchar(256),
@UserKey nvarchar(64),
@UserName nvarchar(256),
@Email nvarchar(256),
@Comment text,
@IsApproved bit,
@LastLogin datetime,
@LastActivity datetime,
@UniqueEmail bit
)
AS
BEGIN
    	DECLARE @ApplicationID uniqueidentifier

	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT
	
		-- Check UserKey
	IF (@UserKey IS NULL)
        RETURN(1) -- 

	-- Check for UniqueEmail
	IF (@UniqueEmail = 1)
	BEGIN
		IF (EXISTS (SELECT 1 FROM [dbo].[yaf_prov_Membership] m WHERE m.UserID != @UserKey AND m.EmailLwd=LOWER(@Email) AND m.ApplicationID=@ApplicationID) )
			RETURN (2)
	END
	
	UPDATE [dbo].[yaf_prov_Membership] SET
	Username = @UserName,
	UsernameLwd = LOWER(@UserName),
	Email = @Email,
	EmailLwd = LOWER(@Email),
	IsApproved = @IsApproved,
	LastLogin = @LastLogin,
	LastActivity = @LastActivity,
	Comment = @Comment
	WHERE ApplicationID = @ApplicationID AND
	UserID = @UserKey;

	-- Return successful
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_prov_unlockuser]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_prov_unlockuser]
(
@ApplicationName nvarchar(256),
@UserName nvarchar(256)
)
AS
BEGIN
    	DECLARE @ApplicationID uniqueidentifier

	EXEC [dbo].[yaf_prov_CreateApplication] @ApplicationName, @ApplicationID OUTPUT
	
	UPDATE [dbo].[yaf_prov_Membership] SET
	IsLockedOut = 0,
	FailedPasswordAttempts = 0
	WHERE ApplicationID = @ApplicationID AND
	UsernameLwd = LOWER(@UserName);

END
GO
/****** Object:  StoredProcedure [dbo].[yaf_rank_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_rank_list](@BoardID int,@RankID int=null) as begin
        if @RankID is null
        select
            a.*
        from
            [dbo].[yaf_Rank] a
        where
            a.BoardID=@BoardID
        order by
            a.SortOrder,
            a.Name
    else
        select
            a.*
        from
            [dbo].[yaf_Rank] a
        where
            a.RankID = @RankID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_rank_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_rank_delete](@RankID int) as begin
        delete from [dbo].[yaf_Rank] where RankID = @RankID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_smiley_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_smiley_save](@SmileyID int=null,@BoardID int,@Code nvarchar(10),@Icon nvarchar(50),@Emoticon nvarchar(50),@SortOrder tinyint,@Replace smallint=0) as begin
        if @SmileyID is not null begin
        update [dbo].[yaf_Smiley] set Code = @Code, Icon = @Icon, Emoticon = @Emoticon, SortOrder = @SortOrder where SmileyID = @SmileyID
    end
    else begin
        if @Replace>0
            delete from [dbo].[yaf_Smiley] where Code=@Code

        if not exists(select 1 from [dbo].[yaf_Smiley] where BoardID=@BoardID and Code=@Code)
            insert into [dbo].[yaf_Smiley](BoardID,Code,Icon,Emoticon,SortOrder) values(@BoardID,@Code,@Icon,@Emoticon,@SortOrder)
    end
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_smiley_resort]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_smiley_resort](@BoardID int,@SmileyID int,@Move int) as
begin
        declare @Position int

    SELECT @Position=SortOrder FROM [dbo].[yaf_Smiley] WHERE BoardID=@BoardID and SmileyID=@SmileyID

    if (@Position is null) return

    if (@Move > 0) begin
        update [dbo].[yaf_Smiley]
            set SortOrder=SortOrder-1
            where BoardID=@BoardID and 
                SortOrder between @Position and (@Position + @Move) and
                SortOrder between 1 and 255
    end
    else if (@Move < 0) begin
        update [dbo].[yaf_Smiley]
            set SortOrder=SortOrder+1
            where BoardID=@BoardID and 
                SortOrder between (@Position+@Move) and @Position and
                SortOrder between 0 and 254
    end

    SET @Position = @Position + @Move

    if (@Position>255) SET @Position = 255
    else if (@Position<0) SET @Position = 0

    update [dbo].[yaf_Smiley]
        set SortOrder=@Position
        where BoardID=@BoardID and 
            SmileyID=@SmileyID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_smiley_listunique]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_smiley_listunique](@BoardID int) as
begin
        select 
        Icon, 
        Emoticon,
        Code = (select top 1 Code from [dbo].[yaf_Smiley] x where x.Icon=[dbo].[yaf_Smiley].Icon),
        SortOrder = (select top 1 SortOrder from [dbo].[yaf_Smiley] x where x.Icon=[dbo].[yaf_Smiley].Icon order by x.SortOrder asc)
    from 
        [dbo].[yaf_Smiley]
    where
        BoardID=@BoardID
    group by
        Icon,
        Emoticon
    order by
        SortOrder,
        Code
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_smiley_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_smiley_list](@BoardID int,@SmileyID int=null) as
begin
        if @SmileyID is null
        select
        SmileyID,
        BoardID,
        Code,
        Icon,
        Emoticon,
        SortOrder = CONVERT(int,SortOrder)	 
        from [dbo].[yaf_Smiley] where BoardID=@BoardID order by SortOrder, LEN(Code) desc
    else
        select 	
        SmileyID,
        BoardID,
        Code,
        Icon,
        Emoticon,
        SortOrder = CONVERT(int,SortOrder)	 
        from [dbo].[yaf_Smiley] where SmileyID=@SmileyID order by SortOrder
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_smiley_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_smiley_delete](@SmileyID int=null) as begin
        if @SmileyID is not null
        delete from [dbo].[yaf_Smiley] where SmileyID=@SmileyID
    else
        delete from [dbo].[yaf_Smiley]
end
GO
/****** Object:  Table [dbo].[yaf_UserProfile]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_UserProfile](
	[UserID] [int] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[LastActivity] [datetime] NULL,
	[ApplicationName] [nvarchar](255) NOT NULL,
	[IsAnonymous] [bit] NOT NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[Gender] [int] NULL,
	[Blog] [nvarchar](255) NULL,
	[RealName] [nvarchar](255) NULL,
	[Interests] [nvarchar](400) NULL,
	[Skype] [nvarchar](255) NULL,
	[Facebook] [nvarchar](400) NULL,
	[Location] [nvarchar](255) NULL,
	[BlogServiceUrl] [nvarchar](255) NULL,
	[Birthday] [datetime] NULL,
	[LastSyncedWithDNN] [datetime] NULL,
	[ICQ] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[MSN] [nvarchar](255) NULL,
	[TwitterId] [nvarchar](400) NULL,
	[Twitter] [nvarchar](400) NULL,
	[BlogServicePassword] [nvarchar](255) NULL,
	[Country] [nvarchar](2) NULL,
	[Occupation] [nvarchar](400) NULL,
	[Region] [nvarchar](255) NULL,
	[AIM] [nvarchar](255) NULL,
	[XMPP] [nvarchar](255) NULL,
	[YIM] [nvarchar](255) NULL,
	[Google] [nvarchar](400) NULL,
	[BlogServiceUsername] [nvarchar](255) NULL,
	[GoogleId] [nvarchar](255) NULL,
	[Homepage] [nvarchar](255) NULL,
	[FacebookId] [nvarchar](400) NULL,
 CONSTRAINT [PK_yaf_UserProfile] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_yaf_UserProfile] UNIQUE NONCLUSTERED 
(
	[UserID] ASC,
	[ApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[yaf_UserProfile] ([UserID], [LastUpdatedDate], [LastActivity], [ApplicationName], [IsAnonymous], [UserName], [Gender], [Blog], [RealName], [Interests], [Skype], [Facebook], [Location], [BlogServiceUrl], [Birthday], [LastSyncedWithDNN], [ICQ], [City], [MSN], [TwitterId], [Twitter], [BlogServicePassword], [Country], [Occupation], [Region], [AIM], [XMPP], [YIM], [Google], [BlogServiceUsername], [GoogleId], [Homepage], [FacebookId]) VALUES (31, CAST(0x0000A4900110FD77 AS DateTime), CAST(0x0000A4900110FD77 AS DateTime), N'YetAnotherForum', 0, N'ST Project Team', 0, N'', N'', N'', N'', N'', N'Richmond', N'', CAST(0x0000044700000000 AS DateTime), NULL, N'', N'Watertown', N'', NULL, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', NULL, N'', NULL)
/****** Object:  StoredProcedure [dbo].[yaf_user_update_single_sign_on_status]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_update_single_sign_on_status](@UserID int,@IsFacebookUser bit,@IsTwitterUser bit,@IsGoogleUser bit) as
begin
    
    update [dbo].[yaf_User] set IsFacebookUser = @IsFacebookUser , IsTwitterUser = @IsTwitterUser, IsGoogleUser = @IsGoogleUser where UserID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_setrole]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_setrole](@BoardID int,@ProviderUserKey nvarchar(64),@Role nvarchar(255)) as
begin
    
    declare @UserID int, @GroupID int
    
    select @UserID=UserID from [dbo].[yaf_User] where BoardID=@BoardID and ProviderUserKey=@ProviderUserKey

    if @Role is null
    begin
        delete from [dbo].[yaf_UserGroup] where UserID=@UserID
    end else
    begin
        if not exists(select 1 from [dbo].[yaf_Group] where BoardID=@BoardID and Name=@Role)
        begin
            insert into [dbo].[yaf_Group](Name,BoardID,Flags)
            values(@Role,@BoardID,0);
            set @GroupID = SCOPE_IDENTITY()

            insert into [dbo].[yaf_ForumAccess](GroupID,ForumID,AccessMaskID)
            select
                @GroupID,
                a.ForumID,
                min(a.AccessMaskID)
            from
                [dbo].[yaf_ForumAccess] a
                join [dbo].[yaf_Group] b on b.GroupID=a.GroupID
            where
                b.BoardID=@BoardID and
                (b.Flags & 4)=4
            group by
                a.ForumID
        end else
        begin
            select @GroupID = GroupID from [dbo].[yaf_Group] where BoardID=@BoardID and Name=@Role
        end
        -- user already can be in the group even if Role isn't null, an extra check is required 
        if not exists(select 1 from [dbo].[yaf_UserGroup] where UserID=@UserID and GroupID=@GroupID)
        begin
        insert into [dbo].[yaf_UserGroup](UserID,GroupID) values(@UserID,@GroupID)
        end
    end
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_list](@BoardID int,@UserID int=null,@Approved bit=null,@GroupID int=null,@RankID int=null,@StyledNicks bit = null, @UTCTIMESTAMP datetime) as
begin	
    if @UserID is not null
        select 
        a.UserID,
        a.BoardID,
        a.ProviderUserKey,
        a.[Name],
        a.[DisplayName],
        a.[Password],
        a.[Email],
        a.Joined,
        a.LastVisit,
        a.IP,
        a.NumPosts,
        a.TimeZone,
        a.Avatar,
        a.[Signature],
        a.AvatarImage,
        a.AvatarImageType,
        a.RankID,
        a.Suspended,
        a.LanguageFile,
        a.ThemeFile,
        a.TextEditor,
        a.OverrideDefaultThemes,
        a.[PMNotification],
        a.[AutoWatchTopics],
        a.[DailyDigest],
        a.[NotificationType],
        a.[Flags],
        a.[Points],		
        a.[IsApproved],
        a.[IsGuest],
        a.[IsCaptchaExcluded],
        a.[IsActiveExcluded],
        a.[IsDST],
        a.[IsDirty],
        a.[IsFacebookUser],
        a.[IsTwitterUser],
        a.[IsGoogleUser],
        a.[Culture],		
            CultureUser = a.Culture,						
            RankName = b.Name,
            Style = case(@StyledNicks)
            when 1 then a.UserStyle
            else ''	 end, 
            NumDays = datediff(d,a.Joined,@UTCTIMESTAMP )+1,
            NumPostsForum = (select count(1) from [dbo].[yaf_Message] x where x.IsApproved = 1 and x.IsDeleted = 0),
            HasAvatarImage = (select count(1) from [dbo].[yaf_User] x where x.UserID=a.UserID and AvatarImage is not null),
            IsAdmin	= IsNull(c.IsAdmin,0),
            IsGuest	= IsNull(a.Flags & 4,0),
            IsHostAdmin	= IsNull(a.Flags & 1,0),
            IsForumModerator	= IsNull(c.IsForumModerator,0),
            IsModerator		= IsNull(c.IsModerator,0)
        from 
            [dbo].[yaf_User] a
            join [dbo].[yaf_Rank] b on b.RankID=a.RankID			
            left join [dbo].[yaf_vaccess] c on c.UserID=a.UserID
        where 
            a.UserID = @UserID and
            a.BoardID = @BoardID and
            IsNull(c.ForumID,0) = 0 and
            (@Approved is null or (@Approved=0 and (a.Flags & 2)=0) or (@Approved=1 and (a.Flags & 2)=2))
        order by 
            a.Name 

    else if @GroupID is null and @RankID is null
        select 
        a.UserID,
        a.BoardID,
        a.ProviderUserKey,
        a.[Name],
        a.[DisplayName],
        a.[Password],
        a.[Email],
        a.Joined,
        a.LastVisit,
        a.IP,
        a.NumPosts,
        a.TimeZone,
        a.Avatar,
        a.[Signature],
        a.AvatarImage,
        a.AvatarImageType,
        a.RankID,
        a.Suspended,
        a.LanguageFile,
        a.ThemeFile,
        a.TextEditor,
        a.OverrideDefaultThemes,
        a.[PMNotification],
        a.[AutoWatchTopics],
        a.[DailyDigest],
        a.[NotificationType],
        a.[Flags],
        a.[Points],		
        a.[IsApproved],
        a.[IsGuest],
        a.[IsCaptchaExcluded],
        a.[IsActiveExcluded],
        a.[IsDST],
        a.[IsDirty],
        a.[IsFacebookUser],
        a.[IsTwitterUser],
        a.[IsGoogleUser],
        a.[Culture],			
            CultureUser = a.Culture,	
            Style = case(@StyledNicks)
            when 1 then a.UserStyle
            else ''	 end, 	
            IsAdmin = (select count(1) from [dbo].[yaf_UserGroup] x join [dbo].[yaf_Group] y on y.GroupID=x.GroupID where x.UserID=a.UserID and (y.Flags & 1)<>0),
            IsGuest	= IsNull(a.Flags & 4,0),
            IsHostAdmin	= IsNull(a.Flags & 1,0),		
            RankName = b.Name
        from 
            [dbo].[yaf_User] a
            join [dbo].[yaf_Rank] b on b.RankID=a.RankID			
        where 
            a.BoardID = @BoardID and
            (@Approved is null or (@Approved=0 and (a.Flags & 2)=0) or (@Approved=1 and (a.Flags & 2)=2))
        order by 
            a.Name
    else
        select 
        a.UserID,
        a.BoardID,
        a.ProviderUserKey,
        a.[Name],
        a.[DisplayName],
        a.[Password],
        a.[Email],
        a.Joined,
        a.LastVisit,
        a.IP,
        a.NumPosts,
        a.TimeZone,
        a.Avatar,
        a.[Signature],
        a.AvatarImage,
        a.AvatarImageType,
        a.RankID,
        a.Suspended,
        a.LanguageFile,
        a.ThemeFile,
        a.TextEditor,
        a.OverrideDefaultThemes,
        a.[PMNotification],
        a.[AutoWatchTopics],
        a.[DailyDigest],
        a.[NotificationType],
        a.[Flags],
        a.[Points],		
        a.[IsApproved],
        a.[IsGuest],
        a.[IsCaptchaExcluded],
        a.[IsActiveExcluded],
        a.[IsDST],
        a.[IsDirty],
        a.[IsFacebookUser],
        a.[IsTwitterUser],
        a.[IsGoogleUser],
        a.[Culture],		
            CultureUser = a.Culture,
            IsAdmin = (select count(1) from [dbo].[yaf_UserGroup] x join [dbo].[yaf_Group] y on y.GroupID=x.GroupID where x.UserID=a.UserID and (y.Flags & 1)<>0),
            IsGuest	= IsNull(a.Flags & 4,0),
            IsHostAdmin	= IsNull(a.Flags & 1,0),			
            RankName = b.Name,
            Style = case(@StyledNicks)
            when 1 then  a.UserStyle
            else ''	 end 
        from 
            [dbo].[yaf_User] a
            join [dbo].[yaf_Rank] b on b.RankID=a.RankID			
        where 
            a.BoardID = @BoardID and
            (@Approved is null or (@Approved=0 and (a.Flags & 2)=0) or (@Approved=1 and (a.Flags & 2)=2)) and
            (@GroupID is null or exists(select 1 from [dbo].[yaf_UserGroup] x where x.UserID=a.UserID and x.GroupID=@GroupID)) and
            (@RankID is null or a.RankID=@RankID)
        order by 
            a.Name
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_activity_rank]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_user_activity_rank]
(
    @BoardID AS int,
    @DisplayNumber AS int,
    @StartDate AS datetime
)
AS
BEGIN
        
    DECLARE @GuestUserID int  

    SET @GuestUserID =
    (SELECT top 1
        a.UserID
    from
        [dbo].[yaf_User] a
        inner join [dbo].[yaf_UserGroup] b on b.UserID = a.UserID
        inner join [dbo].[yaf_Group] c on b.GroupID = c.GroupID
    where
        a.BoardID = @BoardID and
        (c.Flags & 2)<>0
    )

    SELECT TOP(@DisplayNumber)
        counter.[ID],
        u.[Name],
        counter.[NumOfPosts]
    FROM
        [dbo].[yaf_User] u inner join
        (
            SELECT m.UserID as ID, Count(m.UserID) as NumOfPosts FROM [dbo].[yaf_Message] m
            WHERE m.Posted >= @StartDate
            GROUP BY m.UserID
        ) AS counter ON u.UserID = counter.ID
    WHERE
        u.BoardID = @BoardID and u.UserID != @GuestUserID
    ORDER BY
        NumOfPosts DESC  
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_accessmasks]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_accessmasks](@BoardID int,@UserID int) as
begin
        
    select * from(
        select
            AccessMaskID	= e.AccessMaskID,
            AccessMaskName	= e.Name,
            ForumID			= f.ForumID,
            ForumName		= f.Name,
            CategoryID		= f.CategoryID,
            ParentID		= f.ParentID
        from
            [dbo].[yaf_User] a 
            join [dbo].[yaf_UserGroup] b on b.UserID=a.UserID
            join [dbo].[yaf_Group] c on c.GroupID=b.GroupID
            join [dbo].[yaf_ForumAccess] d on d.GroupID=c.GroupID
            join [dbo].[yaf_AccessMask] e on e.AccessMaskID=d.AccessMaskID
            join [dbo].[yaf_Forum] f on f.ForumID=d.ForumID
        where
            a.UserID=@UserID and
            c.BoardID=@BoardID
        group by
            e.AccessMaskID,
            e.Name,
            f.ForumID,
            f.ParentID,
            f.CategoryID,
            f.Name
        
        union
            
        select
            AccessMaskID	= c.AccessMaskID,
            AccessMaskName	= c.Name,
            ForumID			= d.ForumID,
            ForumName		= d.Name,
            CategoryID		= d.CategoryID,
            ParentID		= d.ParentID
        from
            [dbo].[yaf_User] a 
            join [dbo].[yaf_UserForum] b on b.UserID=a.UserID
            join [dbo].[yaf_AccessMask] c on c.AccessMaskID=b.AccessMaskID
            join [dbo].[yaf_Forum] d on d.ForumID=b.ForumID
        where
            a.UserID=@UserID and
            c.BoardID=@BoardID
        group by
            c.AccessMaskID,
            c.Name,
            d.ForumID,
            d.ParentID,
            d.CategoryID,
            d.Name
    ) as x
    order by
        ForumName, AccessMaskName
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_group_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_group_delete](@GroupID int) as
begin
    delete from [dbo].[yaf_EventLogGroupAccess] where GroupID = @GroupID
    delete from [dbo].[yaf_ForumAccess] where GroupID = @GroupID
    delete from [dbo].[yaf_UserGroup] where GroupID = @GroupID
    delete from [dbo].[yaf_Group] where GroupID = @GroupID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_forum_moderators]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_forum_moderators] (@StyledNicks bit) as
BEGIN
        select
        ForumID = a.ForumID, 
        ForumName = f.Name,
        ModeratorID = a.GroupID, 
        ModeratorName = b.Name,	
        ModeratorEmail = '',
        ModeratorAvatar = '',
        ModeratorAvatarImage = CAST(0 as bit),
        ModeratorDisplayName = b.Name,
        Style = case(@StyledNicks)
            when 1 then b.Style  
            else ''	 end,						
        IsGroup=1
    from
        [dbo].[yaf_Forum] f WITH(NOLOCK) 
        INNER JOIN [dbo].[yaf_ForumAccess] a WITH(NOLOCK) ON a.ForumID = f.ForumID
        INNER JOIN [dbo].[yaf_Group] b WITH(NOLOCK) ON b.GroupID = a.GroupID
        INNER JOIN [dbo].[yaf_AccessMask] c WITH(NOLOCK) ON c.AccessMaskID = a.AccessMaskID
    where
        (c.Flags & 64)<>0
    union all
    select 
        ForumID = access.ForumID,
        ForumName = f.Name,
        ModeratorID = usr.UserID, 
        ModeratorName = usr.Name,
        ModeratorEmail = usr.Email,
        ModeratorAvatar = ISNULL(usr.Avatar, ''),
        ModeratorAvatarImage = CAST((select count(1) from [dbo].[yaf_User] x where x.UserID=usr.UserID and AvatarImage is not null)as bit),
        ModeratorDisplayName = usr.DisplayName,
        Style = case(@StyledNicks)
            when 1 then  usr.UserStyle
            else ''	 end,						
        IsGroup=0
    from
        [dbo].[yaf_User] usr WITH(NOLOCK)
        INNER JOIN (
            select
                UserID				= a.UserID,
                ForumID				= x.ForumID,
                ModeratorAccess		= MAX(ModeratorAccess)						
            from
                [dbo].[yaf_vaccessfull] as x WITH(NOLOCK)		       				
                INNER JOIN [dbo].[yaf_UserGroup] a WITH(NOLOCK) on a.UserID=x.UserID
                INNER JOIN [dbo].[yaf_Group] b WITH(NOLOCK) on b.GroupID=a.GroupID
            WHERE 
                ModeratorAccess <> 0 AND x.AdminGroup = 0
            GROUP BY a.UserId, x.ForumID
        ) access ON usr.UserID = access.UserID
        JOIN    [dbo].[yaf_Forum] f WITH(NOLOCK) 
        ON f.ForumID = access.ForumID
                   
        JOIN [dbo].[yaf_Rank] r
        ON r.RankID = usr.RankID
    where
        access.ModeratorAccess<>0
    order by
        IsGroup desc,
        ModeratorName asc
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_board_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_board_delete](@BoardID int) as
begin
        declare @tmpForumID int;
    declare forum_cursor cursor for
        select ForumID 
        from [dbo].[yaf_Forum] a join [dbo].[yaf_Category] b on a.CategoryID=b.CategoryID
        where b.BoardID=@BoardID
        order by ForumID desc
    
    open forum_cursor
    fetch next from forum_cursor into @tmpForumID
    while @@FETCH_STATUS = 0
    begin
        exec [dbo].[yaf_forum_delete] @tmpForumID;
        fetch next from forum_cursor into @tmpForumID
    end
    close forum_cursor
    deallocate forum_cursor

    delete from [dbo].[yaf_ForumAccess] where exists(select 1 from [dbo].[yaf_Group] x where x.GroupID=[dbo].[yaf_ForumAccess].GroupID and x.BoardID=@BoardID)
    delete from [dbo].[yaf_Forum] where exists(select 1 from [dbo].[yaf_Category] x where x.CategoryID=[dbo].[yaf_Forum].CategoryID and x.BoardID=@BoardID)
    delete from [dbo].[yaf_UserGroup] where exists(select 1 from [dbo].[yaf_User] x where x.UserID=[dbo].[yaf_UserGroup].UserID and x.BoardID=@BoardID)
    delete from [dbo].[yaf_Category] where BoardID=@BoardID
    delete from [dbo].[yaf_ActiveAccess] where BoardID=@BoardID
    delete from [dbo].[yaf_Active] where BoardID=@BoardID
    delete from [dbo].[yaf_User] where BoardID=@BoardID
    delete from [dbo].[yaf_Rank] where BoardID=@BoardID
    delete from [dbo].[yaf_Group] where BoardID=@BoardID
    delete from [dbo].[yaf_AccessMask] where BoardID=@BoardID	
    delete from [dbo].[yaf_BBCode] where BoardID=@BoardID
    delete from [dbo].[yaf_Extension] where BoardID=@BoardID
    delete from [dbo].[yaf_ShoutboxMessage] where BoardID=@BoardID
    delete from [dbo].[yaf_Medal] where BoardID=@BoardID
    delete from [dbo].[yaf_Smiley] where BoardID=@BoardID
    delete from [dbo].[yaf_Replace_Words] where BoardID=@BoardID
	delete from [dbo].[yaf_Spam_Words] where BoardID=@BoardID
    delete from [dbo].[yaf_NntpServer] where BoardID=@BoardID
    delete from [dbo].[yaf_BannedIP] where BoardID=@BoardID
    delete from [dbo].[yaf_Registry] where BoardID=@BoardID
    delete from [dbo].[yaf_Board] where BoardID=@BoardID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_active_stats]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_active_stats](@BoardID int) as
begin
        select
        ActiveUsers = (select count(1) from [dbo].[yaf_Active] x JOIN [dbo].[yaf_User] usr ON x.UserID = usr.UserID where x.BoardID = @BoardID AND usr.IsActiveExcluded = 0),
        ActiveMembers = (select count(1) from [dbo].[yaf_Active] x JOIN [dbo].[yaf_User] usr ON x.UserID = usr.UserID where x.BoardID = @BoardID and exists(select 1 from [dbo].[yaf_UserGroup] y inner join [dbo].[yaf_Group] z on y.GroupID=z.GroupID where y.UserID=x.UserID and (z.Flags & 2)=0  AND usr.IsActiveExcluded = 0)),
        ActiveGuests = (select count(1) from [dbo].[yaf_Active] x where x.BoardID = @BoardID and exists(select 1 from [dbo].[yaf_UserGroup] y inner join [dbo].[yaf_Group] z on y.GroupID=z.GroupID where y.UserID=x.UserID and (z.Flags & 2)<>0)),
        ActiveHidden = (select count(1) from [dbo].[yaf_Active] x JOIN [dbo].[yaf_User] usr ON x.UserID = usr.UserID where x.BoardID = @BoardID and exists(select 1 from [dbo].[yaf_UserGroup] y inner join [dbo].[yaf_Group] z on y.GroupID=z.GroupID where y.UserID=x.UserID and (z.Flags & 2)=0  AND usr.IsActiveExcluded = 1))
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_active_list_user]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_active_list_user](@BoardID int, @UserID int, @Guests bit=0, @ShowCrawlers bit = 0, @ActiveTime int,@StyledNicks bit=0) as
begin
    -- select active
    if @Guests<>0
        select
            a.UserID,
            UserName = a.Name,
            UserDisplayName = a.DisplayName,
            c.IP,
            c.SessionID,
            c.ForumID,
            HasForumAccess = CONVERT(int,x.ReadAccess),			
            c.TopicID,
            ForumName = (select [Name] from [dbo].[yaf_Forum] x where x.ForumID=c.ForumID),
            TopicName = (select Topic from [dbo].[yaf_Topic] x where x.TopicID=c.TopicID),
            IsGuest = ISNULL((select 1 from [dbo].[yaf_UserGroup] x inner join [dbo].[yaf_Group] y on y.GroupID=x.GroupID where x.UserID=a.UserID and (y.Flags & 2)<>0),0),
            IsCrawler = CONVERT(int, SIGN((c.Flags & 8))),
            IsHidden = ( a.IsActiveExcluded ),
            Style = case(@StyledNicks)
            when 1 then  a.UserStyle
            else ''	 end, 				
            UserCount = 1,
            c.[Login],
            c.LastActive,
            c.Location,		
            Active = DATEDIFF(minute,c.Login,c.LastActive),
            c.Browser,
            c.[Platform],
            c.ForumPage
        from
            [dbo].[yaf_User] a
            JOIN [dbo].[yaf_Rank] r on r.RankID=a.RankID
            inner join [dbo].[yaf_Active] c 
            ON c.UserID = a.UserID
            inner join [dbo].[yaf_ActiveAccess] x  with(nolock)
            ON (x.ForumID = ISNULL(c.ForumID,0))						
        where		
            c.BoardID = @BoardID AND x.UserID = @UserID		
        order by
            c.LastActive desc
        else if @ShowCrawlers = 1 and @Guests = 0 
            select
            a.UserID,
            UserName = a.Name,
            UserDisplayName = a.DisplayName,
            c.IP,
            c.SessionID,
            c.ForumID,
            HasForumAccess = CONVERT(int,x.ReadAccess),			
            c.TopicID,
            ForumName = (select [Name] from [dbo].[yaf_Forum] x where x.ForumID=c.ForumID),
            TopicName = (select Topic from [dbo].[yaf_Topic] x where x.TopicID=c.TopicID),
            IsGuest = ISNULL((select 1 from [dbo].[yaf_UserGroup] x inner join [dbo].[yaf_Group] y on y.GroupID=x.GroupID where x.UserID=a.UserID and (y.Flags & 2)<>0),0),
            IsCrawler = CONVERT(int, SIGN((c.Flags & 8))),
            IsHidden = ( a.IsActiveExcluded ),
            Style = case(@StyledNicks)
            when 1 then  a.UserStyle
            else ''	 end, 					
            UserCount = 1,
            c.[Login],
            c.LastActive,
            c.Location,
            Active = DATEDIFF(minute,c.Login,c.LastActive),
            c.Browser,
            c.[Platform],
            c.ForumPage
        from
            [dbo].[yaf_User] a
            JOIN [dbo].[yaf_Rank] r on r.RankID=a.RankID
            inner join [dbo].[yaf_Active] c 
            ON c.UserID = a.UserID
            inner join [dbo].[yaf_ActiveAccess] x  with(nolock)
            ON (x.ForumID = ISNULL(c.ForumID,0))						
        where		
            c.BoardID = @BoardID AND x.UserID = @UserID	     
            -- is registered or (is crawler and is registered 	
               and ((c.Flags & 4) = 4 OR (c.Flags & 8) = 8)		
        order by
            c.LastActive desc
    else
        select
            a.UserID,
            UserName = a.Name,
            UserDisplayName = a.DisplayName,
            c.IP,
            c.SessionID,
            c.ForumID,
            HasForumAccess = CONVERT(int,x.ReadAccess),			
            c.TopicID,
            ForumName = (select Name from [dbo].[yaf_Forum] x where x.ForumID=c.ForumID),
            TopicName = (select Topic from [dbo].[yaf_Topic] x where x.TopicID=c.TopicID),
            IsGuest = (select 1 from [dbo].[yaf_UserGroup] x inner join [dbo].[yaf_Group] y on y.GroupID=x.GroupID where x.UserID=a.UserID and (y.Flags & 2)<>0),
            IsCrawler = CONVERT(int, SIGN((c.Flags & 8))),
            IsHidden = ( a.IsActiveExcluded ),
            Style = case(@StyledNicks)
            when 1 then  a.UserStyle
            else ''	 end, 					
            UserCount = 1,
            c.[Login],
            c.LastActive,
            c.Location,
            Active = DATEDIFF(minute,c.Login,c.LastActive),
            c.Browser,
            c.[Platform],
            c.ForumPage
        from
            [dbo].[yaf_User] a	
            JOIN [dbo].[yaf_Rank] r on r.RankID=a.RankID
            INNER JOIN [dbo].[yaf_Active] c 
            ON c.UserID = a.UserID
            inner join [dbo].[yaf_ActiveAccess] x  with(nolock)
            ON (x.ForumID = ISNULL(c.ForumID,0))
            where		
            c.BoardID = @BoardID  AND x.UserID = @UserID				      
         and
            not exists(
                select 1 
                    from [dbo].[yaf_UserGroup] x
                        inner join [dbo].[yaf_Group] y ON y.GroupID=x.GroupID 
                    where x.UserID=a.UserID and (y.Flags & 2)<>0
                )
        order by
            c.LastActive desc
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_active_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_active_list](@BoardID int,@Guests bit=0,@ShowCrawlers bit=0,@ActiveTime int,@StyledNicks bit=0,@UTCTIMESTAMP datetime) as
begin
    delete from [dbo].[yaf_Active] where DATEDIFF(minute,LastActive,@UTCTIMESTAMP )>@ActiveTime 
    -- we don't delete guest access
    delete from [dbo].[yaf_ActiveAccess] where DATEDIFF(minute,LastActive,@UTCTIMESTAMP )>@ActiveTime AND  IsGuestX = 0
    -- select active	
    if @Guests<>0 
        select
            a.UserID,
            UserName = a.Name,
            UserDisplayName = a.DisplayName,
            c.IP,
            c.SessionID,
            c.ForumID,
            c.TopicID,
            ForumName = (select Name from [dbo].[yaf_Forum] x where x.ForumID=c.ForumID),
            TopicName = (select Topic from [dbo].[yaf_Topic] x where x.TopicID=c.TopicID),
            IsGuest = (select 1 from [dbo].[yaf_UserGroup] x inner join [dbo].[yaf_Group] y on y.GroupID=x.GroupID where x.UserID=a.UserID and (y.Flags & 2)<>0),
            IsCrawler = CONVERT(int, SIGN((c.Flags & 8))),
            IsHidden = ( a.IsActiveExcluded ),				
            Style = case(@StyledNicks)
            when 1 then  a.UserStyle
            else ''	 end, 			
            UserCount = 1,
            c.[Login],
            c.LastActive,
            c.Location,
            Active = DATEDIFF(minute,c.Login,c.LastActive),
            c.Browser,
            c.[Platform],
            c.ForumPage
        from
            [dbo].[yaf_User] a	
            JOIN [dbo].[yaf_Rank] r on r.RankID=a.RankID	
            INNER JOIN [dbo].[yaf_Active] c ON c.UserID = a.UserID
        where
            c.BoardID = @BoardID 	
                
        order by 
            c.LastActive desc
    else if @ShowCrawlers = 1 and @Guests = 0 
        select
            a.UserID,
            UserName = a.Name,
            UserDisplayName = a.DisplayName,
            c.IP,
            c.SessionID,
            c.ForumID,
            c.TopicID,
            ForumName = (select Name from [dbo].[yaf_Forum] x where x.ForumID=c.ForumID),
            TopicName = (select Topic from [dbo].[yaf_Topic] x where x.TopicID=c.TopicID),
            IsGuest = (select 1 from [dbo].[yaf_UserGroup] x inner join [dbo].[yaf_Group] y on y.GroupID=x.GroupID where x.UserID=a.UserID and (y.Flags & 2)<>0),
            IsCrawler = CONVERT(int, SIGN((c.Flags & 8))),
            IsHidden = ( a.IsActiveExcluded ),		
            Style = case(@StyledNicks)
            when 1 then  a.UserStyle
            else ''	 end, 	 						
            UserCount = 1,
            c.[Login],
            c.LastActive,
            c.Location,
            Active = DATEDIFF(minute,c.Login,c.LastActive),
            c.Browser,
            c.[Platform],
            c.ForumPage
        from
            [dbo].[yaf_User] a	
            JOIN [dbo].[yaf_Rank] r on r.RankID=a.RankID	
            INNER JOIN [dbo].[yaf_Active] c ON c.UserID = a.UserID							  
        where
            c.BoardID = @BoardID 
               -- is registered or is crawler 
               and ((c.Flags & 4) = 4 OR (c.Flags & 8) = 8)			  
        order by 
            c.LastActive desc
    else
        select
            a.UserID,
            UserName = a.Name,
            UserDisplayName = a.DisplayName,
            c.IP,
            c.SessionID,
            c.ForumID,
            c.TopicID,
            ForumName = (select Name from [dbo].[yaf_Forum] x where x.ForumID=c.ForumID),
            TopicName = (select Topic from [dbo].[yaf_Topic] x where x.TopicID=c.TopicID),
            IsGuest = (select 1 from [dbo].[yaf_UserGroup] x inner join [dbo].[yaf_Group] y on y.GroupID=x.GroupID where x.UserID=a.UserID and (y.Flags & 2)<>0),
            IsCrawler = CONVERT(int, SIGN((c.Flags & 8))),
            IsHidden = ( a.IsActiveExcluded ),
            Style = case(@StyledNicks)
            when 1 then  a.UserStyle
            else ''	 end, 				
            UserCount = 1,
            c.[Login],
            c.LastActive,
            c.Location,
            Active = DATEDIFF(minute,c.Login,c.LastActive),
            c.Browser,
            c.[Platform],
            c.ForumPage
        from
            [dbo].[yaf_User] a	
            JOIN [dbo].[yaf_Rank] r on r.RankID=a.RankID
            INNER JOIN [dbo].[yaf_Active] c ON c.UserID = a.UserID							  
        where
            c.BoardID = @BoardID and
            -- no guests
            not exists(				
                select 1 
                    from [dbo].[yaf_UserGroup] x
                        inner join [dbo].[yaf_Group] y ON y.GroupID=x.GroupID 
                    where x.UserID=a.UserID and (y.Flags & 2)<>0
                )
        order by
            c.LastActive desc
end
GO
/****** Object:  Table [dbo].[yaf_UserMedal]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_UserMedal](
	[UserID] [int] NOT NULL,
	[MedalID] [int] NOT NULL,
	[Message] [nvarchar](100) NULL,
	[Hide] [bit] NOT NULL,
	[OnlyRibbon] [bit] NOT NULL,
	[SortOrder] [tinyint] NOT NULL,
	[DateAwarded] [datetime] NOT NULL,
 CONSTRAINT [PK_yaf_UserMedal] PRIMARY KEY CLUSTERED 
(
	[MedalID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_savesignature]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_savesignature](@UserID int,@Signature ntext) as
begin
    
    update [dbo].[yaf_User] set Signature = @Signature where UserID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_savepassword]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_savepassword](@UserID int,@Password nvarchar(32)) as
begin
    
    update [dbo].[yaf_User] set Password = @Password where UserID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_savenotification]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_user_savenotification](
    @UserID				int,
    @PMNotification		bit = null,
    @AutoWatchTopics    bit = null,
    @NotificationType	int = null,
    @DailyDigest		bit = null
)
AS
BEGIN

        UPDATE
            [dbo].[yaf_User]
        SET
            PMNotification = (CASE WHEN (@PMNotification is not null) THEN  @PMNotification ELSE PMNotification END),
            AutoWatchTopics = (CASE WHEN (@AutoWatchTopics is not null) THEN  @AutoWatchTopics ELSE AutoWatchTopics END),
            NotificationType =  (CASE WHEN (@NotificationType is not null) THEN  @NotificationType ELSE NotificationType END),
            DailyDigest = (CASE WHEN (@DailyDigest is not null) THEN  @DailyDigest ELSE DailyDigest END)
        WHERE
            UserID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_saveavatar]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_user_saveavatar]
(
    @UserID int,
    @Avatar nvarchar(255) = NULL,
    @AvatarImage image = NULL,
    @AvatarImageType nvarchar(50) = NULL
)
AS
BEGIN
    
    IF @Avatar IS NOT NULL 
    BEGIN
        UPDATE
            [dbo].[yaf_User]
        SET
            Avatar = @Avatar,
            AvatarImage = null,
            AvatarImageType = null
        WHERE
            UserID = @UserID
    END
    ELSE IF @AvatarImage IS NOT NULL 
    BEGIN
        UPDATE
            [dbo].[yaf_User]
        SET
            AvatarImage = @AvatarImage,
            AvatarImageType = @AvatarImageType,
            Avatar = null
        WHERE
            UserID = @UserID
    END
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_recoverpassword]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_recoverpassword](@BoardID int,@UserName nvarchar(255),@Email nvarchar(250)) as
begin
    
    declare @UserID int
    select @UserID = UserID from [dbo].[yaf_User] where BoardID = @BoardID and Name = @UserName and Email = @Email
    if @UserID is null begin
        select UserID = convert(int,null)
        return
    end else
    begin
        select UserID = @UserID
    end
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_suspend]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_suspend](@UserID int,@Suspend datetime=null) as
begin
    
    update [dbo].[yaf_User] set Suspended = @Suspend where UserID=@UserID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_simplelist]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_user_simplelist](
                @StartID INT  = 0,
                @Limit   INT  = 500)
AS
    BEGIN               
       
        SELECT TOP(@Limit)  a.[UserID],
                 a.[Name],
				 a.[DisplayName]
        FROM     [dbo].[yaf_User] a
        WHERE    a.[UserID] >= @StartID
        AND a.[UserID] < (@StartID + @Limit)
        ORDER BY a.[UserID]     
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_resetpoints]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_user_resetpoints] AS
BEGIN
    
    UPDATE [dbo].[yaf_User] SET Points = NumPosts * 3
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_setpoints]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_user_setpoints] (@UserID int,@Points int) AS
BEGIN
    
    UPDATE [dbo].[yaf_User] SET Points = @Points WHERE UserID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_setnotdirty]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_setnotdirty](@UserID int) as
begin	
    update [dbo].[yaf_User] set Flags = Flags ^ 64 where UserID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_login]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_login](@BoardID int,@Name nvarchar(255),@Password nvarchar(32)) as
begin
    
    declare @UserID int

    -- Try correct board first
    if exists(select UserID from [dbo].[yaf_User] where Name=@Name and Password=@Password and BoardID=@BoardID and (Flags & 2)=2)
    begin
        select UserID from [dbo].[yaf_User] where Name=@Name and Password=@Password and BoardID=@BoardID and (Flags & 2)=2
        return
    end

    if not exists(select UserID from [dbo].[yaf_User] where Name=@Name and Password=@Password and (BoardID=@BoardID or (Flags & 3)=3))
        set @UserID=null
    else
        select 
            @UserID=UserID 
        from 
            [dbo].[yaf_User]
        where 
            Name=@Name and 
            [Password]=@Password and 
            (BoardID=@BoardID or (Flags & 1)=1) and
            (Flags & 2)=2

    select @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_migrate]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_user_migrate]
(
    @UserID int,
    @ProviderUserKey nvarchar(64),
    @UpdateProvider bit = 0
)
AS
BEGIN
    
    DECLARE @Password nvarchar(255), @IsApproved bit, @LastActivity datetime, @Joined datetime
    
    UPDATE [dbo].[yaf_User] SET ProviderUserKey = @ProviderUserKey where UserID = @UserID

    IF (@UpdateProvider = 1)
    BEGIN
        SELECT
            @Password = [Password],
            @IsApproved = (CASE (Flags & 2) WHEN 2 THEN 1 ELSE 0 END),
            @LastActivity = LastVisit,
            @Joined = Joined
        FROM
            [dbo].[yaf_User]
        WHERE
            UserID = @UserID
        
        UPDATE
            [dbo].[yaf_prov_Membership]
        SET
            [Password] = @Password,
            PasswordFormat = '1',
            LastActivity = @LastActivity,
            IsApproved = @IsApproved,
            Joined = @Joined
        WHERE
            UserID = @ProviderUserKey
    END
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_getsignature]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_getsignature](@UserID int) as
begin
    
    select [Signature] from [dbo].[yaf_User] where UserID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_getpoints]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_user_getpoints] (@UserID int) AS
BEGIN
    
    SELECT Points FROM [dbo].[yaf_User] WHERE UserID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_changepassword]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_user_changepassword](@UserID int,@OldPassword nvarchar(32),@NewPassword nvarchar(32)) as
begin
    
    declare @CurrentOld nvarchar(32)
    select @CurrentOld = Password from [dbo].[yaf_User] where UserID = @UserID
    if @CurrentOld<>@OldPassword begin
        select Success = convert(bit,0)
        return
    end
    update [dbo].[yaf_User] set Password = @NewPassword where UserID = @UserID
    select Success = convert(bit,1)
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_avatarimage]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_user_avatarimage]
(
    @UserID int
)
AS
BEGIN
    
    SELECT
        UserID,
        AvatarImage,
        AvatarImageType
    FROM
        [dbo].[yaf_User]
    WHERE
        UserID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_aspnet]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_user_aspnet](@BoardID int,@UserName nvarchar(255),@DisplayName nvarchar(255) = null,@Email nvarchar(255),@ProviderUserKey nvarchar(64),@IsApproved bit,@UTCTIMESTAMP datetime) as
BEGIN
        SET NOCOUNT ON

    DECLARE @UserID int, @RankID int, @approvedFlag int, @TimeZone int

    SET @approvedFlag = 0;
    IF (@IsApproved = 1) SET @approvedFlag = 2;	
    
    IF EXISTS(SELECT 1 FROM [dbo].[yaf_User] where BoardID=@BoardID and ([ProviderUserKey]=@ProviderUserKey OR [Name] = @UserName))
    BEGIN
        SELECT TOP 1 @UserID = UserID FROM [dbo].[yaf_User] WHERE [BoardID]=@BoardID and ([ProviderUserKey]=@ProviderUserKey OR [Name] = @UserName)
        
        IF (@DisplayName IS NULL) 
        BEGIN
            SELECT TOP 1 @DisplayName = DisplayName FROM [dbo].[yaf_User] WHERE UserId = @UserID
        END

        UPDATE [dbo].[yaf_User] SET 
            DisplayName = @DisplayName,
            Email = @Email,
            [ProviderUserKey] = @ProviderUserKey,
            Flags = Flags | @approvedFlag
        WHERE
            UserID = @UserID
    END ELSE
    BEGIN
        SELECT @RankID = RankID from [dbo].[yaf_Rank] where (Flags & 1)<>0 and BoardID=@BoardID
        
        IF (@DisplayName IS NULL) 
        BEGIN
            SET @DisplayName = @UserName
        END		

        SET @TimeZone = (SELECT ISNULL(CAST([dbo].[yaf_registry_value]('TimeZone', @BoardID) as int), 0))

        INSERT INTO [dbo].[yaf_User](BoardID,RankID,[Name],DisplayName,Password,Email,Joined,LastVisit,NumPosts,TimeZone,Flags,ProviderUserKey) 
        VALUES(@BoardID,@RankID,@UserName,@DisplayName,'-',@Email,@UTCTIMESTAMP ,@UTCTIMESTAMP ,0, @TimeZone,@approvedFlag,@ProviderUserKey)
    
        SET @UserID = SCOPE_IDENTITY()	
    END
    
    SELECT UserID=@UserID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_deleteavatar]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_user_deleteavatar](@UserID int) as begin
    
    UPDATE
        [dbo].[yaf_User]
    SET
        AvatarImage = null,
        Avatar = null,
        AvatarImageType = null
    WHERE
        UserID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_adminsave]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_adminsave]
(@BoardID int,@UserID int,@Name nvarchar(255),@DisplayName nvarchar(255), @Email nvarchar(255),@Flags int,@RankID int) as
begin
        
    update [dbo].[yaf_User] set
        Name = @Name,
        DisplayName = @DisplayName,
        Email = @Email,
        RankID = @RankID,
        Flags = @Flags
    where UserID = @UserID
    select UserID = @UserID
end
GO
/****** Object:  Table [dbo].[yaf_ReputationVote]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_ReputationVote](
	[ReputationFromUserID] [int] NOT NULL,
	[ReputationToUserID] [int] NOT NULL,
	[VoteDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yaf_ReputationVote] PRIMARY KEY CLUSTERED 
(
	[ReputationFromUserID] ASC,
	[ReputationToUserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[yaf_shoutbox_savemessage]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_shoutbox_savemessage](
    @UserName		nvarchar(255)=null,
    @BoardId		int,
    @UserID			int,
    @Message		ntext,
    @Date			datetime=null,
    @IP				varchar(39),
    @UTCTIMESTAMP datetime
)
AS
BEGIN
DECLARE @OverrideDisplayName BIT, @ReplaceName nvarchar(255)
        IF @Date IS NULL
        SET @Date = @UTCTIMESTAMP 
        -- this check is for guest user only to not override replace name 
if (SELECT Name FROM [dbo].[yaf_User] WHERE UserID = @UserID) != @UserName
    begin
    SET @OverrideDisplayName = 1
    end	
    SET @ReplaceName = (CASE WHEN @OverrideDisplayName = 1 THEN @UserName ELSE (SELECT DisplayName FROM [dbo].[yaf_User] WHERE UserID = @UserID) END);
    INSERT [dbo].[yaf_ShoutboxMessage] (UserName,UserDisplayName,BoardId, UserID, Message, Date, IP)
    VALUES (@UserName,@ReplaceName, @BoardId, @UserID, @Message, @Date, @IP)
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_shoutbox_getmessages]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************************************
//  Original code by: DLESKTECH at http://www.dlesktech.com/support.aspx
//  Modifications by: KASL Technologies at www.kasltechnologies.com
//  Modifications for integration into YAF/Conventions by Jaben Cargman
*****************************************************************************************************/

CREATE PROCEDURE [dbo].[yaf_shoutbox_getmessages]
(
  @BoardId int,
  @NumberOfMessages int, @StyledNicks bit = 0
)  
AS
BEGIN

    SELECT TOP(@NumberOfMessages)
        sh.[ShoutBoxMessageID],
        sh.Username,
        sh.UserID,
        sh.[Message],
        sh.[Date], 
        Style= case(@StyledNicks)
            when 1 then  usr.UserStyle
            else ''	 end
                
    FROM
        [dbo].[yaf_ShoutboxMessage] sh
        JOIN [dbo].[yaf_User] usr on usr.UserID = sh.UserID
    WHERE 
        sh.BoardId = @BoardId
    ORDER BY sh.Date DESC
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_pollvote_check]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_pollvote_check](@PollID int, @UserID int = NULL,@RemoteIP varchar(39) = NULL) AS
        IF @UserID IS NULL
    BEGIN
        IF @RemoteIP IS NOT NULL
        BEGIN
            -- check by remote IP
            SELECT PollVoteID FROM [dbo].[yaf_PollVote] WHERE PollID = @PollID AND RemoteIP = @RemoteIP
        END
    END
    ELSE
    BEGIN
        -- check by userid or remote IP
        SELECT PollVoteID FROM [dbo].[yaf_PollVote] WHERE PollID = @PollID AND (UserID = @UserID OR RemoteIP = @RemoteIP)
    END
GO
/****** Object:  Table [dbo].[yaf_Thanks]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_Thanks](
	[ThanksID] [int] IDENTITY(1,1) NOT NULL,
	[ThanksFromUserID] [int] NOT NULL,
	[ThanksToUserID] [int] NOT NULL,
	[MessageID] [int] NOT NULL,
	[ThanksDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_yaf_Thanks] PRIMARY KEY CLUSTERED 
(
	[ThanksID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_Thanks_MessageID] ON [dbo].[yaf_Thanks] 
(
	[MessageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_Thanks_ThanksFromUserID] ON [dbo].[yaf_Thanks] 
(
	[ThanksFromUserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_Thanks_ThanksToUserID] ON [dbo].[yaf_Thanks] 
(
	[ThanksToUserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_viewallthanks]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_user_viewallthanks] @UserID int, @PageUserID int
AS 
    BEGIN
        SELECT  t.ThanksFromUserID,
                t.ThanksToUserID,
                c.MessageID,
                a.ForumID,
                a.TopicID,
                a.Topic,
                b.UserID,
                c.MessageID,
                c.Posted,
                c.[Message],
                c.Flags
        FROM   
                [dbo].[yaf_Thanks] t
                join [dbo].[yaf_Message] c  on c.MessageID = t.MessageID		 
                join [dbo].[yaf_Topic] a on a.TopicID = c.TopicID
                join [dbo].[yaf_User] b on c.UserID = b.UserID
                join [dbo].[yaf_ActiveAccess] x with(nolock) on x.ForumID = a.ForumID
        WHERE	
                c.IsDeleted = 0
                AND c.IsApproved = 1     				
                AND (t.ThanksFromUserID = @UserID OR t.thankstouserID = @UserID)
                AND a.TopicMovedID IS NULL
                AND a.IsDeleted = 0     
                AND x.UserID = @PageUserID	      
                AND x.ReadAccess <> 0
        ORDER BY c.Posted DESC
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_removethanks]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_message_removethanks] 
    @FromUserID int,
    @MessageID int,
    @UseDisplayName bit=0,
    @paramOutput nvarchar(255) = null out
AS
BEGIN
    DELETE FROM [dbo].[yaf_Thanks] WHERE (ThanksFromUserID=@FromUserID AND MessageID=@MessageID)
    DECLARE @ToUserID int
    SET @ToUserID = (SELECT UserID FROM [dbo].[yaf_Message] WHERE (MessageID = @MessageID))
    IF @UseDisplayName = 1
            SET @paramOutput = (SELECT [DisplayName] FROM [dbo].[yaf_User] WHERE (UserID=@ToUserID))
    ELSE
            SET @paramOutput = (SELECT [Name] FROM [dbo].[yaf_User] WHERE (UserID=@ToUserID))
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_getallthanks]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_message_getallthanks] 
    @MessageIDs varchar(max)
AS
BEGIN
-- vzrus says: the server version > 2000 ntext works too slowly with substring in the 2005 
DECLARE @ParsedMessageIDs TABLE
      (
            MessageID int
      )
      
DECLARE @MessageID varchar(11), @Pos INT      

SET @Pos = CHARINDEX(',', @MessageIDs, 1)
-- check here if the value is not empty
IF REPLACE(@MessageIDs, ',', '') <> ''
BEGIN
 WHILE @Pos > 0
                  BEGIN
                        SET @MessageID = LTRIM(RTRIM(LEFT(@MessageIDs, @Pos - 1)))
                        IF @MessageID <> ''
                        BEGIN
                              INSERT INTO @ParsedMessageIDs (MessageID) VALUES (CAST(@MessageID AS int)) --Use Appropriate conversion
                        END
                        SET @MessageIDs = RIGHT(@MessageIDs, LEN(@MessageIDs) - @Pos)
                        SET @Pos = CHARINDEX(',', @MessageIDs, 1)
                  END
                     -- to be sure that last value is inserted
                    IF (LEN(@MessageIDs) > 0)
                           INSERT INTO @ParsedMessageIDs (MessageID) VALUES (CAST(@MessageIDs AS int)) 
END 
    SELECT a.MessageID, b.ThanksFromUserID AS FromUserID, b.ThanksDate,
    (SELECT COUNT(ThanksID) FROM [dbo].[yaf_Thanks] b WHERE b.ThanksFromUserID=d.UserID) AS ThanksFromUserNumber,
    (SELECT COUNT(ThanksID) FROM [dbo].[yaf_Thanks] b WHERE b.ThanksToUserID=d.UserID) AS ThanksToUserNumber,
    (SELECT COUNT(DISTINCT(MessageID)) FROM [dbo].[yaf_Thanks] b WHERE b.ThanksToUserID=d.userID) AS ThanksToUserPostsNumber
    FROM @ParsedMessageIDs a
    INNER JOIN [dbo].[yaf_Message] d ON (d.MessageID=a.MessageID)
    LEFT JOIN [dbo].[yaf_Thanks] b ON (b.MessageID = a.MessageID)
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_addthanks]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************************************************************/
/***** BEGIN CREATE PROCEDURES ******/
/*****************************************************************************************************************************/

/* Procedures for "Thanks" Mod */
CREATE PROCEDURE [dbo].[yaf_message_addthanks] 
    @FromUserID int,
    @MessageID int,
    @UTCTIMESTAMP datetime,
    @UseDisplayName bit=0,
    @paramOutput nvarchar(255) = null out
AS
BEGIN
IF not exists (SELECT top 1 ThanksID FROM [dbo].[yaf_Thanks] WHERE (MessageID = @MessageID AND ThanksFromUserID=@FromUserID))
BEGIN
DECLARE @ToUserID int
    SET @ToUserID = (SELECT UserID FROM [dbo].[yaf_Message] WHERE (MessageID = @MessageID))
    INSERT INTO [dbo].[yaf_Thanks] (ThanksFromUserID, ThanksToUserID, MessageID, ThanksDate) Values 
                                (@FromUserID, @ToUserId, @MessageID, @UTCTIMESTAMP )
    
    IF @UseDisplayName = 1
            SET @paramOutput = (SELECT [DisplayName] FROM [dbo].[yaf_User] WHERE (UserID=@ToUserID))
    ELSE
            SET @paramOutput = (SELECT [Name] FROM [dbo].[yaf_User] WHERE (UserID=@ToUserID))
END
ELSE
    SET @paramOutput = ''
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_system_updateversion]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_system_updateversion]
(
    @Version		int,
    @VersionName	nvarchar(50)
) 
AS
BEGIN
        DECLARE @tmpValue AS nvarchar(100)
    SET @tmpValue = CAST(@Version AS nvarchar(100))
    EXEC [dbo].[yaf_registry_save] 'version', @tmpValue
    EXEC [dbo].[yaf_registry_save] 'versionname',@VersionName

END
GO
/****** Object:  StoredProcedure [dbo].[yaf_pollgroup_votecheck]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_pollgroup_votecheck](@PollGroupID int, @UserID int = NULL,@RemoteIP varchar(39) = NULL) AS
    IF @UserID IS NULL
      BEGIN
        IF @RemoteIP IS NOT NULL
        BEGIN
            -- check by remote IP
            SELECT PollID, ChoiceID FROM [dbo].[yaf_PollVote] WHERE PollID IN ( SELECT PollID FROM [dbo].[yaf_Poll] WHERE PollGroupID = @PollGroupID) AND RemoteIP = @RemoteIP
        END
        ELSE
        BEGIN
        -- to get structure
            SELECT pv.PollID, pv.ChoiceID, usr.Name as UserName 
            FROM [dbo].[yaf_PollVote] pv 
            JOIN [dbo].[yaf_User] usr ON usr.UserID = pv.UserID
            WHERE pv.PollID IN ( SELECT PollID FROM [dbo].[yaf_Poll] WHERE PollGroupID = @PollGroupID)
        END
      END
    ELSE
      BEGIN
        -- check by userid or remote IP
        SELECT PollID, ChoiceID FROM [dbo].[yaf_PollVote] WHERE PollID IN ( SELECT PollID FROM [dbo].[yaf_Poll] WHERE PollGroupID = @PollGroupID) AND (UserID = @UserID OR RemoteIP = @RemoteIP)
       END
GO
/****** Object:  StoredProcedure [dbo].[yaf_pollgroup_stats]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_pollgroup_stats](@PollGroupID int) AS
BEGIN
        SELECT		
        GroupUserID = pg.UserID,	
        a.PollID,
        b.PollGroupID,
        b.Question,
        b.Closes,
        a.ChoiceID,		
        a.Choice,
        a.Votes,
        a.ObjectPath,
        a.MimeType,
        QuestionObjectPath = b.[ObjectPath],
        QuestionMimeType = b.[MimeType],
        pg.IsBound,
        b.IsClosedBound,		
        b.AllowMultipleChoices,
        b.ShowVoters,
        b.AllowSkipVote,
        (select sum(x.Votes) from [dbo].[yaf_Choice] x where  x.PollID = a.PollID) as [Total],
        [Stats] = (select 100 * a.Votes / case sum(x.Votes) when 0 then 1 else sum(x.Votes) end from [dbo].[yaf_Choice] x where x.PollID=a.PollID)
    FROM
        [dbo].[yaf_Choice] a		
    INNER JOIN 
        [dbo].[yaf_Poll] b ON b.PollID = a.PollID
    INNER JOIN  
        [dbo].[yaf_PollGroupCluster] pg ON pg.PollGroupID = b.PollGroupID	  
    WHERE
        pg.PollGroupID = @PollGroupID
        ORDER BY b.PollGroupID
    --	GROUP BY a.PollID, b.Question, b.Closes, a.ChoiceID, a.Choice,a.Votes
        END
GO
/****** Object:  Table [dbo].[yaf_PMessage]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_PMessage](
	[PMessageID] [int] IDENTITY(1,1) NOT NULL,
	[FromUserID] [int] NOT NULL,
	[ReplyTo] [int] NULL,
	[Created] [datetime] NOT NULL,
	[Subject] [nvarchar](100) NOT NULL,
	[Body] [ntext] NOT NULL,
	[Flags] [int] NOT NULL,
 CONSTRAINT [PK_yaf_PMessage] PRIMARY KEY CLUSTERED 
(
	[PMessageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[yaf_poll_stats]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_poll_stats](@PollID int = null) AS
BEGIN

    SELECT
            
        a.PollID,
        b.Question,
        b.Closes,
        b.UserID,		
        a.[ObjectPath],
        a.[MimeType],
        QuestionObjectPath = b.[ObjectPath],
        QuestionMimeType = b.[MimeType],
        a.ChoiceID,
        a.Choice,
        a.Votes,
        pg.IsBound, 
        b.IsClosedBound, 	
        b.AllowMultipleChoices,
        b.ShowVoters,
        b.AllowSkipVote,
        (select sum(x.Votes) from [dbo].[yaf_Choice] x where  x.PollID = a.PollID) as [Total],
        [Stats] = (select 100 * a.Votes / case sum(x.Votes) when 0 then 1 else sum(x.Votes) end from [dbo].[yaf_Choice] x where x.PollID=a.PollID)
    FROM
        [dbo].[yaf_Choice] a		
    INNER JOIN 
        [dbo].[yaf_Poll] b ON b.PollID = a.PollID
    INNER JOIN  
        [dbo].[yaf_PollGroupCluster] pg ON pg.PollGroupID = b.PollGroupID	
        WHERE
        b.PollID = @PollID

END
GO
/****** Object:  StoredProcedure [dbo].[yaf_post_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_post_list](
                 @TopicID int,
                 @PageUserID int,
                 @AuthorUserID int,
                 @UpdateViewCount smallint=1, 
                 @ShowDeleted bit = 1, 
                 @StyledNicks bit = 0,
                 @ShowReputation bit = 0,
                 @SincePostedDate datetime, 
                 @ToPostedDate datetime, 
                 @SinceEditedDate datetime, 
                 @ToEditedDate datetime, 
                 @PageIndex int = 1, 
                 @PageSize int = 0, 
                 @SortPosted int = 2, 
                 @SortEdited int = 0,
                 @SortPosition int = 0,				
                 @ShowThanks bit = 0,
                 @MessagePosition int = 0,
                 @UTCTIMESTAMP datetime) as
begin
   declare @TotalPages int
   declare @TotalRows int
   declare @FirstSelectRowNumber int
   declare @LastSelectRowNumber int
  
   declare @firstselectrownum int 

   declare @floor decimal
   declare @ceiling decimal
  
   declare @offset int   
 
   declare @pageshift int;

    if @UpdateViewCount>0
        update [dbo].[yaf_Topic] set [Views] = [Views] + 1 where TopicID = @TopicID
    -- find total returned count
        select
        @TotalRows = COUNT(m.MessageID)
    from
        [dbo].[yaf_Message] m
    where
        m.TopicID = @TopicID
        AND m.IsApproved = 1
         -- is deleted
       AND (@ShowDeleted = 1 OR m.IsDeleted = 0 OR (@AuthorUserID > 0 AND m.UserID = @AuthorUserID))
        AND m.Posted BETWEEN
        @SincePostedDate AND @ToPostedDate
         /*
        AND 
        m.Edited >= SinceEditedDate
        */ 

    select @TotalPages = CEILING(CONVERT(decimal,@TotalRows)/@PageSize);
    
	-- check if page index is bigger then Total pages
    if (@PageIndex > @TotalPages -1)
    begin
      set @PageIndex = @TotalPages -1
    end

 if (@MessagePosition > 0)
 begin

       -- round to ceiling - total number of pages  
       SELECT @ceiling = CEILING(CONVERT(decimal,@TotalRows)/@PageSize) 
       -- round to floor - a number of full pages
       SELECT @floor = FLOOR(CONVERT(decimal,@TotalRows)/@PageSize)

       SET @pageshift = @MessagePosition - (@TotalRows - @floor*@PageSize)
            if  @pageshift < 0
               begin
                  SET @pageshift = 0
                     end   
   -- here pageshift converts to full pages 
   if (@pageshift <= 0)
   begin    
   set @pageshift = 0
   end
   else 
   begin
   set @pageshift = CEILING(CONVERT(decimal,@pageshift)/@PageSize) 
   end   
   
   SET @PageIndex = @ceiling - @pageshift 
   if @ceiling != @floor
   SET @PageIndex = @PageIndex - 1	 
  
   select @FirstSelectRowNumber = @PageIndex * @PageSize + 1;
   select @LastSelectRowNumber = @FirstSelectRowNumber + @PageSize - 1;  
 end  
 else
 begin
   select @PageIndex = @PageIndex+1;
   select @FirstSelectRowNumber = (@PageIndex - 1) * @PageSize + 1;
   select @LastSelectRowNumber = (@PageIndex - 1) * @PageSize + @PageSize;
 end; 	
    with MessageIds  as
     (
     select ROW_NUMBER() over (order by (case 
        when @SortPosition = 1 then tt.Position end) ASC,	
        (case 
        when @SortPosted = 2 then tt.Posted end) DESC,
        (case 
        when @SortPosted = 1 then tt.Posted end) ASC, 
        (case 
        when @SortEdited = 2 then tt.Edited end) DESC,
        (case 
        when @SortEdited = 1 then tt.Edited end) ASC) as RowNum, tt.MessageID, tt.Position, tt.Posted, tt.Edited
     from  [dbo].[yaf_Message] tt
     where    tt.TopicID = @TopicID
        AND tt.IsApproved = 1
       AND (@ShowDeleted = 1 OR tt.IsDeleted = 0 OR (@AuthorUserID > 0 AND tt.UserID = @AuthorUserID))
        AND (tt.Posted is null OR (tt.Posted is not null AND
        tt.Posted between @SincePostedDate and @ToPostedDate)) 
        /*
        AND (m.Edited is null OR (m.Edited is not null AND
        (m.Edited >= (case 
        when @SortEdited = 1 then @firstselectedited end) 
        OR m.Edited <= (case 
        when @SortEdited = 2 then @firstselectedited end) OR
        m.Edited >= (case 
        when @SortEdited = 0 then 0
        end)))) 
        */	
      )	  
         select
        d.TopicID,
        d.Topic,
        d.Priority,
        d.Description,
        d.Status,
        d.Styles,
        d.PollID,
        d.UserID AS TopicOwnerID,
        TopicFlags	= d.Flags,
        ForumFlags	= g.Flags,
        m.MessageID,
        m.Posted,		
        [Message] = m.Message, 
        m.UserID,
        m.Position,
        m.Indent,
        m.IP,		
        m.Flags,
        m.EditReason,
        m.IsModeratorChanged,
        m.IsDeleted,
        m.DeleteReason,
        m.BlogPostID,
        m.ExternalMessageId,
        m.ReferenceMessageId,
        UserName = IsNull(m.UserName,b.Name),
        DisplayName =IsNull(m.UserDisplayName,b.DisplayName),
        b.Suspended,
        b.Joined,
        b.Avatar,
        b.[Signature],
        Posts		= b.NumPosts,
        b.Points,
        ReputationVoteDate = (CASE WHEN @ShowReputation = 1 THEN CAST(ISNULL((select top 1 VoteDate from [dbo].[yaf_ReputationVote] repVote where repVote.ReputationToUserID=b.UserID and repVote.ReputationFromUserID=@PageUserID), null) as datetime) ELSE @UTCTIMESTAMP END),
        IsGuest	= CONVERT(bit,IsNull(SIGN(b.Flags & 4),0)),
        d.[Views],
        d.ForumID,
        RankName = c.Name,		
        c.RankImage,
        c.Style as RankStyle,
        Style = case(@StyledNicks)
            when 1 then  b.UserStyle
            else ''	 end, 
        Edited = IsNull(m.Edited,m.Posted),
        HasAttachments	= ISNULL((select top 1 1 from [dbo].[yaf_Attachment] x where x.MessageID=m.MessageID),0),
        HasAvatarImage = ISNULL((select top 1 1 from [dbo].[yaf_User] x where x.UserID=b.UserID and AvatarImage is not null),0),
        TotalRows = @TotalRows,
        PageIndex = @PageIndex,
        up.*
    from
        MessageIds ti
        inner join [dbo].[yaf_Message] m
        ON m.MessageID = ti.MessageID
        join [dbo].[yaf_User] b on b.UserID=m.UserID
        left join [dbo].[yaf_UserProfile] up on up.UserID=b.UserID
        join [dbo].[yaf_Topic] d on d.TopicID=m.TopicID
        join [dbo].[yaf_Forum] g on g.ForumID=d.ForumID
        join [dbo].[yaf_Category] h on h.CategoryID=g.CategoryID
        join [dbo].[yaf_Rank] c on c.RankID=b.RankID        

        WHERE ti.RowNum between @FirstSelectRowNumber and @LastSelectRowNumber
        order by
            RowNum ASC  
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_message_delete](@MessageID int, @EraseMessage bit = 0) as
begin
    
    declare @TopicID		int
    declare @ForumID		int
    declare @MessageCount	int
    declare @LastMessageID	int
    declare @UserID			int

    -- Find TopicID and ForumID
    select @TopicID=b.TopicID,@ForumID=b.ForumID,@UserID = a.UserID 
        from 
            [dbo].[yaf_Message] a
            inner join [dbo].[yaf_Topic] b on b.TopicID=a.TopicID
        where
            a.MessageID=@MessageID
   

    -- Update LastMessageID in Topic
    update [dbo].[yaf_Topic] set 
        LastPosted = null,
        LastMessageID = null,
        LastUserID = null,
        LastUserName = null,
        LastUserDisplayName = null,
        LastMessageFlags = null
    where LastMessageID = @MessageID

    -- Update LastMessageID in Forum
    update [dbo].[yaf_Forum] set 
        LastPosted = null,
        LastTopicID = null,
        LastMessageID = null,
        LastUserID = null,
        LastUserName = null,
        LastUserDisplayName = null
    where LastMessageID = @MessageID

    -- should it be physically deleter or not?
    if (@EraseMessage = 1) begin
        delete [dbo].[yaf_Attachment] where MessageID = @MessageID
        delete [dbo].[yaf_MessageReportedAudit] where MessageID = @MessageID
        delete [dbo].[yaf_MessageReported] where MessageID = @MessageID        
        --delete thanks related to this message
        delete [dbo].[yaf_Thanks] where MessageID = @MessageID
        delete [dbo].[yaf_MessageHistory] where MessageID = @MessageID
        delete [dbo].[yaf_Message] where MessageID = @MessageID
        
    end
    else begin
        -- "Delete" it only by setting deleted flag message
        update [dbo].[yaf_Message] set Flags = Flags | 8 where MessageID = @MessageID
    end
    
    -- update user post count
    if exists(select top 1 1 from [dbo].[yaf_Forum] where ForumID=@ForumID and (Flags & 4)=0)
    begin
	     UPDATE [dbo].[yaf_User] SET NumPosts = (SELECT count(MessageID) FROM [dbo].[yaf_Message] WHERE UserID = @UserID AND IsDeleted = 0 AND IsApproved = 1) WHERE UserID = @UserID
    end
    
    -- Delete topic if there are no more messages
    select @MessageCount = count(1) from [dbo].[yaf_Message] where TopicID = @TopicID and IsDeleted=0
    if @MessageCount=0 exec [dbo].[yaf_topic_delete] @TopicID, 1, @EraseMessage

    -- update lastpost
    exec [dbo].[yaf_topic_updatelastpost] @ForumID,@TopicID
    exec [dbo].[yaf_forum_updatestats] @ForumID

    -- update topic numposts
    update [dbo].[yaf_Topic] set
        NumPosts = (select count(1) from [dbo].[yaf_Message] x where x.TopicID=[dbo].[yaf_Topic].TopicID and x.IsApproved = 1 and x.IsDeleted = 0)
    where TopicID = @TopicID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_attachment_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_attachment_list](@MessageID int=null,@UserID int=null,@AttachmentID int=null,@BoardID int=null,@PageIndex int = null, @PageSize int = 0) as begin
declare @TotalRows int
declare @FirstSelectRowNumber int
declare @FirstSelectRowID int		
   if @MessageID is not null
        select 
            a.*,
            e.BoardID
        from
            [dbo].[yaf_Attachment] a
            inner join [dbo].[yaf_Message] b on b.MessageID = a.MessageID
            inner join [dbo].[yaf_Topic] c on c.TopicID = b.TopicID
            inner join [dbo].[yaf_Forum] d on d.ForumID = c.ForumID
            inner join [dbo].[yaf_Category] e on e.CategoryID = d.CategoryID
            inner join [dbo].[yaf_Board] brd on brd.BoardID = e.BoardID
        where
            a.MessageID=@MessageID
    else if @AttachmentID is not null
        select 
            a.*
        from
            [dbo].[yaf_Attachment] a
        where 
            a.AttachmentID=@AttachmentID
    else if @UserID is not null
        begin
           set @PageIndex = @PageIndex + 1
           set @TotalRows = 0
           
           select @TotalRows = count(1) from [dbo].[yaf_Attachment]
		   		
           select top (@PageSize)
               *
                   from
                   (
				       select 
					       *,
					       TotalRows = @TotalRows ,
					       ROW_NUMBER() over (order by AttachmentID desc) as RowNum
				       from 
					       [dbo].[yaf_Attachment] a
				       where 
					       UserID=@UserID
                   ) as Attachments
           where
               RowNum > ((@PageIndex -1) * @PageSize)
           order by 
               AttachmentID desc
        end
    else
        begin
           set @PageIndex = @PageIndex + 1
           set @TotalRows = 0
           
           select @TotalRows = count(1) from [dbo].[yaf_Attachment] a
		                                     inner join [dbo].[yaf_Message] b on b.MessageID = a.MessageID
		                                     inner join [dbo].[yaf_Topic] c on c.TopicID = b.TopicID
		                                     inner join [dbo].[yaf_Forum] d on d.ForumID = c.ForumID
		                                     inner join [dbo].[yaf_Category] e on e.CategoryID = d.CategoryID			
									    where
		                                     e.BoardID = @BoardID
		   		
           select top (@PageSize)
               *
                   from
                   (
				       select 
					       a.*,
					       BoardID		= @BoardID,
					       Posted		= b.Posted,
					       ForumID		= d.ForumID,
					       ForumName	= d.Name,
					       TopicID		= c.TopicID,
					       TopicName	= c.Topic,
					       TotalRows  = @TotalRows,
					       ROW_NUMBER() over (order by AttachmentID desc) as RowNum
				       from 
					       [dbo].[yaf_Attachment] a
					       inner join [dbo].[yaf_Message] b on b.MessageID = a.MessageID
					       inner join [dbo].[yaf_Topic] c on c.TopicID = b.TopicID
					       inner join [dbo].[yaf_Forum] d on d.ForumID = c.ForumID
					       inner join [dbo].[yaf_Category] e on e.CategoryID = d.CategoryID			
				       where 
					       e.BoardID=BoardID
                   ) as Attachments
           where
               RowNum > ((@PageIndex -1) * @PageSize)
           order by 
               AttachmentID desc
        end
end
GO
/****** Object:  Table [dbo].[yaf_AdminPageUserAccess]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_AdminPageUserAccess](
	[UserID] [int] NOT NULL,
	[PageName] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_yaf_AdminPageUserAccess] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[PageName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yaf_Buddy]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_Buddy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FromUserID] [int] NOT NULL,
	[ToUserID] [int] NOT NULL,
	[Approved] [bit] NOT NULL,
	[Requested] [datetime] NOT NULL,
 CONSTRAINT [PK_yaf_Buddy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_yaf_Buddy] UNIQUE NONCLUSTERED 
(
	[FromUserID] ASC,
	[ToUserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_Buddy_UserID] ON [dbo].[yaf_Buddy] 
(
	[FromUserID] ASC,
	[ToUserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[yaf_board_userstats]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_board_userstats](@BoardID int) as
BEGIN
        SELECT		
        Members = (select count(1) from [dbo].[yaf_User] a where a.BoardID=@BoardID AND (Flags & 2) = 2 AND (a.Flags & 4) = 0),
        MaxUsers = (SELECT [dbo].[yaf_registry_value](N'maxusers', @BoardID)),
        MaxUsersWhen = (SELECT [dbo].[yaf_registry_value](N'maxuserswhen', @BoardID)),
        LastMemberInfo.*
    FROM
        (
            SELECT TOP 1 
                LastMemberInfoID= 1,
                LastMemberID	= UserID,
                LastMember	= [Name],
                LastMemberDisplayName	= [DisplayName]
            FROM 
                [dbo].[yaf_User]
            WHERE 
               -- is approved
                (Flags & 2) = 2
                -- is not a guest
                AND (Flags & 4) <> 4
                AND BoardID = @BoardID 
            ORDER BY 
                Joined DESC
        ) as LastMemberInfo
        
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_eventloggroupaccess_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_eventloggroupaccess_save] (@GroupID int, @EventTypeID int, @EventTypeName nvarchar(128), @DeleteAccess bit = 0) as
begin
    if not exists (select top 1 1 from [dbo].[yaf_EventLogGroupAccess] where GroupID = @GroupID and EventTypeName = @EventTypeName) 
        begin
        insert into [dbo].[yaf_EventLogGroupAccess]  (GroupID,EventTypeID,EventTypeName,DeleteAccess) 
        values(@GroupID,@EventTypeID,@EventTypeName,@DeleteAccess)
    end	
    else
    begin
        update [dbo].[yaf_EventLogGroupAccess]  set DeleteAccess = @DeleteAccess
        where GroupID = @GroupID and EventTypeID = @EventTypeID
    end
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_eventloggroupaccess_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_eventloggroupaccess_list] (@GroupID int, @EventTypeID int = null) as
begin 
-- TODO - exclude host admins from list   
if @EventTypeID is null   
        select e.*, g.Name as GroupName from [dbo].[yaf_EventLogGroupAccess] e 
        join [dbo].[yaf_Group] g on g.GroupID = e.GroupID where  e.GroupID = @GroupID
        else
        select e.*, g.Name as GroupName from [dbo].[yaf_EventLogGroupAccess] e 
        join [dbo].[yaf_Group] g on g.GroupID = e.GroupID where  e.GroupID = @GroupID and e.EventTypeID = @EventTypeID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_eventloggroupaccess_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_eventloggroupaccess_delete] (@GroupID int, @EventTypeID int, @EventTypeName nvarchar(128)) as
begin
    if @EventTypeName is not null 
    begin
        delete from [dbo].[yaf_EventLogGroupAccess]  where GroupID = @GroupID and EventTypeID = @EventTypeID
    end	
    else
    begin
    -- delete all access rights
        delete from [dbo].[yaf_EventLogGroupAccess]  where GroupID = @GroupID 
    end
end
GO
/****** Object:  Table [dbo].[yaf_CheckEmail]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_CheckEmail](
	[CheckEmailID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Hash] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_yaf_CheckEmail] PRIMARY KEY CLUSTERED 
(
	[CheckEmailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_yaf_CheckEmail] UNIQUE NONCLUSTERED 
(
	[Hash] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[yaf_CheckEmail] ON
INSERT [dbo].[yaf_CheckEmail] ([CheckEmailID], [UserID], [Email], [Created], [Hash]) VALUES (14, 18, N'lachermollie@bfusa.com', CAST(0x0000A4880102E033 AS DateTime), N'68EBA9FFDC70830D79E1B6EFF1B1D409')
INSERT [dbo].[yaf_CheckEmail] ([CheckEmailID], [UserID], [Email], [Created], [Hash]) VALUES (21, 25, N'test@aol.com', CAST(0x0000A48E0168A073 AS DateTime), N'C4F9CCFFD6B4F7680E8FB08A24B8014C')
INSERT [dbo].[yaf_CheckEmail] ([CheckEmailID], [UserID], [Email], [Created], [Hash]) VALUES (29, 31, N'jack@jackboris.com', CAST(0x0000A4900110E978 AS DateTime), N'70EE8302B10A5D60BE62C83A33F8D430')
INSERT [dbo].[yaf_CheckEmail] ([CheckEmailID], [UserID], [Email], [Created], [Hash]) VALUES (30, 31, N'jack@jackboris.com', CAST(0x0000A4900110FD73 AS DateTime), N'1813C7C4CE75C35B06F8FD816A426D6D')
SET IDENTITY_INSERT [dbo].[yaf_CheckEmail] OFF
/****** Object:  StoredProcedure [dbo].[yaf_board_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_board_save](@BoardID int,@Name nvarchar(50), @LanguageFile nvarchar(50),@Culture varchar(10), @AllowThreaded bit) as
begin

        EXEC [dbo].[yaf_registry_save] 'culture', @Culture, @BoardID
        EXEC [dbo].[yaf_registry_save] 'language', @LanguageFile, @BoardID
        update [dbo].[yaf_Board] set
        Name = @Name,
        AllowThreaded = @AllowThreaded
    where BoardID=@BoardID
    select @BoardID 
end
GO
/****** Object:  Table [dbo].[yaf_EventLog]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_EventLog](
	[EventLogID] [int] IDENTITY(1,1) NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[UserID] [int] NULL,
	[UserName] [nvarchar](100) NULL,
	[Source] [nvarchar](50) NOT NULL,
	[Description] [ntext] NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_yaf_EventLog] PRIMARY KEY CLUSTERED 
(
	[EventLogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[yaf_EventLog] ON
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (1, CAST(0x0000A450010B4E8A AS DateTime), NULL, NULL, N'YAF.Core.ServiceLocatorEventRaiser', N'Exception Raising Event to Handler: MembershipUpgradeEvent
System.Data.SqlClient.SqlException (0x80131904): Login failed for user ''IIS APPPOOL\Project7102-cms''.
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.TdsParser.Run(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj)
   at System.Data.SqlClient.SqlInternalConnectionTds.CompleteLogin(Boolean enlistOK)
   at System.Data.SqlClient.SqlInternalConnectionTds.AttemptOneLogin(ServerInfo serverInfo, String newPassword, SecureString newSecurePassword, Boolean ignoreSniOpenTimeout, TimeoutTimer timeout, Boolean withFailover)
   at System.Data.SqlClient.SqlInternalConnectionTds.LoginNoFailover(ServerInfo serverInfo, String newPassword, SecureString newSecurePassword, Boolean redirectedUserInstance, SqlConnectionString connectionOptions, SqlCredential credential, TimeoutTimer timeout)
   at System.Data.SqlClient.SqlInternalConnectionTds.OpenLoginEnlist(TimeoutTimer timeout, SqlConnectionString connectionOptions, SqlCredential credential, String newPassword, SecureString newSecurePassword, Boolean redirectedUserInstance)
   at System.Data.SqlClient.SqlInternalConnectionTds..ctor(DbConnectionPoolIdentity identity, SqlConnectionString connectionOptions, SqlCredential credential, Object providerInfo, String newPassword, SecureString newSecurePassword, Boolean redirectedUserInstance, SqlConnectionString userConnectionOptions)
   at System.Data.SqlClient.SqlConnectionFactory.CreateConnection(DbConnectionOptions options, DbConnectionPoolKey poolKey, Object poolGroupProviderInfo, DbConnectionPool pool, DbConnection owningConnection, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionFactory.CreatePooledConnection(DbConnectionPool pool, DbConnectionOptions options, DbConnectionPoolKey poolKey, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionPool.CreateObject(DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionPool.UserCreateRequest(DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, UInt32 waitForMultipleObjectsTimeout, Boolean allowCreate, Boolean onlyOneCheckConnection, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionFactory.TryGetConnection(DbConnection owningConnection, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.Open()
   at YAF.Types.Interfaces.Data.IDbAccessExtensions.CreateConnectionOpen(IDbAccess dbAccess)
   at YAF.Core.Data.DbAccessBase.Execute[T](Func`2 execFunc, IDbCommand cmd, IDbTransaction dbTransaction)
   at YAF.Providers.Membership.DB.UpgradeMembership(Int32 previousVersion, Int32 newVersion)
   at YAF.Core.ServiceLocatorEventRaiser.RaiseIssolated[T](T eventObject, Action`2 logExceptionAction)
ClientConnectionId:a28587a9-8cef-4b11-a79a-6dbbb8972a0f', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (2, CAST(0x0000A450010EA69C AS DateTime), NULL, NULL, N'YAF.Types.Interfaces.IHandleEvent`1[[YAF.Typ...', N'Failure Initializing User/Page (URL: http://7102-cms.padillastaging.com/forum/Default.aspx?g=).
System.ApplicationException: Sql Exception with error number 50000 (Tries=0) ---> System.Data.SqlClient.SqlException: No candidates for a guest were found for the board 1.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.Fill(DataSet dataSet, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.Fill(DataSet dataSet)
   at YAF.Types.Interfaces.Data.IDbAccessExtensions.<>c__DisplayClass7.<GetDataset>b__6(IDbCommand c)
   at YAF.Core.Data.DbAccessBase.Execute[T](Func`2 execFunc, IDbCommand cmd, IDbTransaction dbTransaction)
   at YAF.Types.Interfaces.Data.IDbAccessExtensions.GetData(IDbAccess dbAccess, IDbCommand cmd, IDbTransaction dbTransaction)
   at YAF.Classes.Data.LegacyDb.pageload(Object sessionID, Object boardID, Object userKey, Object ip, Object location, Object forumPage, Object browser, Object platform, Object categoryID, Object forumID, Object topicID, Object messageID, Object isCrawler, Object isMobileDevice, Object donttrack)
   --- End of inner exception stack trace ---
   at YAF.Classes.Data.LegacyDb.pageload(Object sessionID, Object boardID, Object userKey, Object ip, Object location, Object forumPage, Object browser, Object platform, Object categoryID, Object forumID, Object topicID, Object messageID, Object isCrawler, Object isMobileDevice, Object donttrack)
   at CallSite.Target(Closure , CallSite , Type , String , Int32 , Object , String , String , String , Object , Object , Object , Object , Object , Object , Object , Object , Object )
   at YAF.Core.LoadPageFromDatabase.Handle(InitPageLoadEvent event)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (3, CAST(0x0000A450010EA6D5 AS DateTime), NULL, NULL, N'YAF.Types.Interfaces.IHandleEvent`1[[YAF.Typ...', N'Failure Initializing User/Page (URL: http://7102-cms.padillastaging.com/forum/Default.aspx?g=info&i=7).
System.ApplicationException: Sql Exception with error number 50000 (Tries=0) ---> System.Data.SqlClient.SqlException: No candidates for a guest were found for the board 1.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.Fill(DataSet dataSet, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.Fill(DataSet dataSet)
   at YAF.Types.Interfaces.Data.IDbAccessExtensions.<>c__DisplayClass7.<GetDataset>b__6(IDbCommand c)
   at YAF.Core.Data.DbAccessBase.Execute[T](Func`2 execFunc, IDbCommand cmd, IDbTransaction dbTransaction)
   at YAF.Types.Interfaces.Data.IDbAccessExtensions.GetData(IDbAccess dbAccess, IDbCommand cmd, IDbTransaction dbTransaction)
   at YAF.Classes.Data.LegacyDb.pageload(Object sessionID, Object boardID, Object userKey, Object ip, Object location, Object forumPage, Object browser, Object platform, Object categoryID, Object forumID, Object topicID, Object messageID, Object isCrawler, Object isMobileDevice, Object donttrack)
   --- End of inner exception stack trace ---
   at YAF.Classes.Data.LegacyDb.pageload(Object sessionID, Object boardID, Object userKey, Object ip, Object location, Object forumPage, Object browser, Object platform, Object categoryID, Object forumID, Object topicID, Object messageID, Object isCrawler, Object isMobileDevice, Object donttrack)
   at YAF.Core.LoadPageFromDatabase.Handle(InitPageLoadEvent event)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (4, CAST(0x0000A450010EA6D8 AS DateTime), NULL, NULL, N'YAF.Types.Interfaces.IHandleEvent`1[[YAF.Typ...', N'Failure Initializing User/Page (URL: http://7102-cms.padillastaging.com/forum/Default.aspx?g=info&i=7).
System.ApplicationException: Sql Exception with error number 50000 (Tries=0) ---> System.Data.SqlClient.SqlException: No candidates for a guest were found for the board 1.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.Fill(DataSet dataSet, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.Fill(DataSet dataSet)
   at YAF.Types.Interfaces.Data.IDbAccessExtensions.<>c__DisplayClass7.<GetDataset>b__6(IDbCommand c)
   at YAF.Core.Data.DbAccessBase.Execute[T](Func`2 execFunc, IDbCommand cmd, IDbTransaction dbTransaction)
   at YAF.Types.Interfaces.Data.IDbAccessExtensions.GetData(IDbAccess dbAccess, IDbCommand cmd, IDbTransaction dbTransaction)
   at YAF.Classes.Data.LegacyDb.pageload(Object sessionID, Object boardID, Object userKey, Object ip, Object location, Object forumPage, Object browser, Object platform, Object categoryID, Object forumID, Object topicID, Object messageID, Object isCrawler, Object isMobileDevice, Object donttrack)
   --- End of inner exception stack trace ---
   at YAF.Classes.Data.LegacyDb.pageload(Object sessionID, Object boardID, Object userKey, Object ip, Object location, Object forumPage, Object browser, Object platform, Object categoryID, Object forumID, Object topicID, Object messageID, Object isCrawler, Object isMobileDevice, Object donttrack)
   at YAF.Core.LoadPageFromDatabase.Handle(InitPageLoadEvent event)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (5, CAST(0x0000A45001280D54 AS DateTime), NULL, N'Guest', N'YAF.Controls', N'Exception
System.ApplicationException: reCAPTCHA needs to be configured with a site & secret key.
   at YAF.Controls.RecaptchaControl.OnInit(EventArgs e)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.AddedControl(Control control, Int32 index)
   at System.Web.UI.WebControls.Wizard.TableWizardRendering.CreateControlHierarchy_CreateStepArea(Table mainContentTable)
   at System.Web.UI.WebControls.CreateUserWizard.TableWizardRendering.CreateControlHierarchy()
   at System.Web.UI.WebControls.Wizard.CreateChildControls()
   at System.Web.UI.WebControls.CreateUserWizard.CreateChildControls()
   at System.Web.UI.Control.EnsureChildControls()
   at System.Web.UI.WebControls.Wizard.OnInit(EventArgs e)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.AddedControl(Control control, Int32 index)
   at YAF.Forum.OnLoad(EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (6, CAST(0x0000A450012900C9 AS DateTime), NULL, N'Guest', N'YAF.Controls', N'Exception
System.ApplicationException: reCAPTCHA needs to be configured with a site & secret key.
   at YAF.Controls.RecaptchaControl.OnInit(EventArgs e)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.AddedControl(Control control, Int32 index)
   at System.Web.UI.WebControls.Wizard.TableWizardRendering.CreateControlHierarchy_CreateStepArea(Table mainContentTable)
   at System.Web.UI.WebControls.CreateUserWizard.TableWizardRendering.CreateControlHierarchy()
   at System.Web.UI.WebControls.Wizard.CreateChildControls()
   at System.Web.UI.WebControls.CreateUserWizard.CreateChildControls()
   at System.Web.UI.Control.EnsureChildControls()
   at System.Web.UI.WebControls.Wizard.OnInit(EventArgs e)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.AddedControl(Control control, Int32 index)
   at YAF.Forum.OnLoad(EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (7, CAST(0x0000A450012953A3 AS DateTime), NULL, N'Guest', N'YAF.Controls', N'Exception
System.ApplicationException: reCAPTCHA needs to be configured with a site & secret key.
   at YAF.Controls.RecaptchaControl.OnInit(EventArgs e)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.AddedControl(Control control, Int32 index)
   at System.Web.UI.WebControls.Wizard.TableWizardRendering.CreateControlHierarchy_CreateStepArea(Table mainContentTable)
   at System.Web.UI.WebControls.CreateUserWizard.TableWizardRendering.CreateControlHierarchy()
   at System.Web.UI.WebControls.Wizard.CreateChildControls()
   at System.Web.UI.WebControls.CreateUserWizard.CreateChildControls()
   at System.Web.UI.Control.EnsureChildControls()
   at System.Web.UI.WebControls.Wizard.OnInit(EventArgs e)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.AddedControl(Control control, Int32 index)
   at YAF.Forum.OnLoad(EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (8, CAST(0x0000A45001295B80 AS DateTime), NULL, N'Guest', N'YAF.Controls', N'Exception
System.ApplicationException: reCAPTCHA needs to be configured with a site & secret key.
   at YAF.Controls.RecaptchaControl.OnInit(EventArgs e)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.AddedControl(Control control, Int32 index)
   at System.Web.UI.WebControls.Wizard.TableWizardRendering.CreateControlHierarchy_CreateStepArea(Table mainContentTable)
   at System.Web.UI.WebControls.CreateUserWizard.TableWizardRendering.CreateControlHierarchy()
   at System.Web.UI.WebControls.Wizard.CreateChildControls()
   at System.Web.UI.WebControls.CreateUserWizard.CreateChildControls()
   at System.Web.UI.Control.EnsureChildControls()
   at System.Web.UI.WebControls.Wizard.OnInit(EventArgs e)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.AddedControl(Control control, Int32 index)
   at YAF.Forum.OnLoad(EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (9, CAST(0x0000A450012969FB AS DateTime), NULL, N'Guest', N'YAF.Controls', N'Exception
System.ApplicationException: reCAPTCHA needs to be configured with a site & secret key.
   at YAF.Controls.RecaptchaControl.OnInit(EventArgs e)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.AddedControl(Control control, Int32 index)
   at System.Web.UI.WebControls.Wizard.TableWizardRendering.CreateControlHierarchy_CreateStepArea(Table mainContentTable)
   at System.Web.UI.WebControls.CreateUserWizard.TableWizardRendering.CreateControlHierarchy()
   at System.Web.UI.WebControls.Wizard.CreateChildControls()
   at System.Web.UI.WebControls.CreateUserWizard.CreateChildControls()
   at System.Web.UI.Control.EnsureChildControls()
   at System.Web.UI.WebControls.Wizard.OnInit(EventArgs e)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.AddedControl(Control control, Int32 index)
   at YAF.Forum.OnLoad(EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (10, CAST(0x0000A4500129708D AS DateTime), NULL, N'Guest', N'YAF.Controls', N'Exception
System.ApplicationException: reCAPTCHA needs to be configured with a site & secret key.
   at YAF.Controls.RecaptchaControl.OnInit(EventArgs e)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.AddedControl(Control control, Int32 index)
   at System.Web.UI.WebControls.Wizard.TableWizardRendering.CreateControlHierarchy_CreateStepArea(Table mainContentTable)
   at System.Web.UI.WebControls.CreateUserWizard.TableWizardRendering.CreateControlHierarchy()
   at System.Web.UI.WebControls.Wizard.CreateChildControls()
   at System.Web.UI.WebControls.CreateUserWizard.CreateChildControls()
   at System.Web.UI.Control.EnsureChildControls()
   at System.Web.UI.WebControls.Wizard.OnInit(EventArgs e)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.AddedControl(Control control, Int32 index)
   at YAF.Forum.OnLoad(EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (11, CAST(0x0000A4500129A45D AS DateTime), NULL, N'Guest', N'YAF.Controls', N'Exception
System.ApplicationException: reCAPTCHA needs to be configured with a site & secret key.
   at YAF.Controls.RecaptchaControl.OnInit(EventArgs e)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.AddedControl(Control control, Int32 index)
   at System.Web.UI.WebControls.Wizard.TableWizardRendering.CreateControlHierarchy_CreateStepArea(Table mainContentTable)
   at System.Web.UI.WebControls.CreateUserWizard.TableWizardRendering.CreateControlHierarchy()
   at System.Web.UI.WebControls.Wizard.CreateChildControls()
   at System.Web.UI.WebControls.CreateUserWizard.CreateChildControls()
   at System.Web.UI.Control.EnsureChildControls()
   at System.Web.UI.WebControls.Wizard.OnInit(EventArgs e)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.AddedControl(Control control, Int32 index)
   at YAF.Forum.OnLoad(EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (12, CAST(0x0000A450012A20AD AS DateTime), NULL, N'Guest', N'YAF.Controls', N'Exception
System.ApplicationException: reCAPTCHA needs to be configured with a site & secret key.
   at YAF.Controls.RecaptchaControl.OnInit(EventArgs e)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.AddedControl(Control control, Int32 index)
   at System.Web.UI.WebControls.Wizard.TableWizardRendering.CreateControlHierarchy_CreateStepArea(Table mainContentTable)
   at System.Web.UI.WebControls.CreateUserWizard.TableWizardRendering.CreateControlHierarchy()
   at System.Web.UI.WebControls.Wizard.CreateChildControls()
   at System.Web.UI.WebControls.CreateUserWizard.CreateChildControls()
   at System.Web.UI.Control.EnsureChildControls()
   at System.Web.UI.WebControls.Wizard.OnInit(EventArgs e)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.AddedControl(Control control, Int32 index)
   at YAF.Forum.OnLoad(EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (13, CAST(0x0000A450012F4F45 AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User testuser was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (14, CAST(0x0000A4500130C64D AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User testuser was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (15, CAST(0x0000A4500133F94C AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User testuser was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (16, CAST(0x0000A45001359840 AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User testuser was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (17, CAST(0x0000A450013DFC55 AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User testuser was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (18, CAST(0x0000A45001404396 AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User testuser was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (19, CAST(0x0000A450017897DF AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User testuser was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (20, CAST(0x0000A45001797D66 AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User testuser was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (21, CAST(0x0000A4500182053C AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User joebob was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (22, CAST(0x0000A4510162211C AS DateTime), NULL, N'jdawg', N'ASP.pages_cp_editalbumimages_ascx', N'Exception
System.Threading.ThreadAbortException: Thread was being aborted.
   at System.Threading.Thread.AbortInternal()
   at System.Threading.Thread.Abort(Object stateInfo)
   at System.Web.HttpResponse.AbortCurrentThread()
   at YAF.Pages.cp_editalbumimages.SaveAttachment(HtmlInputFile file)
   at YAF.Pages.cp_editalbumimages.Upload_Click(Object sender, EventArgs e)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (23, CAST(0x0000A45101633B11 AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User testuser was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (24, CAST(0x0000A48300F57003 AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User jdawg was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (25, CAST(0x0000A48E015B1825 AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User jboris was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (26, CAST(0x0000A48E015B1830 AS DateTime), NULL, N'admin', N'YAF.Pages.Admin.admin', N'User 21 was deleted by 2.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (27, CAST(0x0000A48E01601B1B AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User newUser was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (28, CAST(0x0000A48E01601B1D AS DateTime), NULL, N'admin', N'YAF.Pages.Admin.admin', N'User 20 was deleted by 2.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (29, CAST(0x0000A48E0160B7CD AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User jboris was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (30, CAST(0x0000A48E01629BFB AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (31, CAST(0x0000A48E016307A3 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (32, CAST(0x0000A48E01633704 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (33, CAST(0x0000A48E01635BB1 AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User testModerator was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (34, CAST(0x0000A48E01641A85 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (35, CAST(0x0000A48E01647378 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (36, CAST(0x0000A48E0164926D AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (37, CAST(0x0000A48E0164BE93 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (38, CAST(0x0000A48E0164EB69 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (39, CAST(0x0000A48E0164FE4C AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (40, CAST(0x0000A48E0165F5AA AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (41, CAST(0x0000A48E0166D979 AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User jamxi was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (42, CAST(0x0000A48E0166D97A AS DateTime), NULL, N'admin', N'YAF.Pages.Admin.admin', N'User 24 was deleted by 2.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (43, CAST(0x0000A48E0166E606 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (44, CAST(0x0000A48E01670500 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (45, CAST(0x0000A48E01670D76 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (46, CAST(0x0000A48E0167145F AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (47, CAST(0x0000A48E01672082 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (48, CAST(0x0000A48E0167FF11 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (49, CAST(0x0000A48E01689FE4 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (50, CAST(0x0000A48E0168B441 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (51, CAST(0x0000A48E016A90AF AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (52, CAST(0x0000A48E016AB001 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (53, CAST(0x0000A48E016AB935 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (54, CAST(0x0000A48E016AE215 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (55, CAST(0x0000A48E016B1339 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Pages.Admin.eventlog.GetCulture()
   at YAF.Pages.Admin.eventlog.Page_Load(Object sender, EventArgs e)
   at System.EventHandler.Invoke(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (56, CAST(0x0000A48E016B22D0 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Pages.Admin.eventlog.GetCulture()
   at YAF.Pages.Admin.eventlog.Page_Load(Object sender, EventArgs e)
   at System.EventHandler.Invoke(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (57, CAST(0x0000A48E016B4337 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Pages.Admin.eventlog.GetCulture()
   at YAF.Pages.Admin.eventlog.Page_Load(Object sender, EventArgs e)
   at System.EventHandler.Invoke(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (58, CAST(0x0000A48E016B6158 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Pages.Admin.eventlog.GetCulture()
   at YAF.Pages.Admin.eventlog.Page_Load(Object sender, EventArgs e)
   at System.EventHandler.Invoke(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (59, CAST(0x0000A48E016C3DCD AS DateTime), NULL, N'admin', N'.Net SqlClient Data Provider', N'Exception
System.Data.SqlClient.SqlException (0x80131904): Violation of UNIQUE KEY constraint ''IX_yaf_Group''. Cannot insert duplicate key in object ''dbo.yaf_Group''. The duplicate key value is (1, ForumModeratorRole1).
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at YAF.Core.Data.DbAccessBase.Execute[T](Func`2 execFunc, IDbCommand cmd, IDbTransaction dbTransaction)
   at YAF.Classes.Data.LegacyDb.group_save(Object groupID, Object boardID, Object name, Object isAdmin, Object isGuest, Object isStart, Object isModerator, Object accessMaskID, Object pmLimit, Object style, Object sortOrder, Object description, Object usrSigChars, Object usrSigBBCodes, Object usrSigHTMLTags, Object usrAlbums, Object usrAlbumImages)
   at YAF.Pages.Admin.editgroup.Save_Click(Object sender, EventArgs e)
   at System.Web.UI.WebControls.Button.RaisePostBackEvent(String eventArgument)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
ClientConnectionId:4e2312cc-f794-4871-aa0d-7d330bb40b57', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (60, CAST(0x0000A48E016C86C2 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (61, CAST(0x0000A48E016CB863 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (62, CAST(0x0000A48E016CDA04 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (63, CAST(0x0000A48E016DD477 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (64, CAST(0x0000A48E016DEF66 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Pages.Admin.eventlog.GetCulture()
   at YAF.Pages.Admin.eventlog.Page_Load(Object sender, EventArgs e)
   at System.EventHandler.Invoke(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (65, CAST(0x0000A48E016E1EA8 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (66, CAST(0x0000A48E016E29B5 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Pages.Admin.eventlog.GetCulture()
   at YAF.Pages.Admin.eventlog.Page_Load(Object sender, EventArgs e)
   at System.EventHandler.Invoke(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (67, CAST(0x0000A48E016E7D18 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.Cultures()
   at YAF.Pages.Admin.languages.BindData()
   at System.EventHandler.Invoke(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (68, CAST(0x0000A48E01709EE8 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.Cultures()
   at YAF.Pages.Admin.languages.BindData()
   at System.EventHandler.Invoke(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (69, CAST(0x0000A48E0171CAD6 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.Cultures()
   at YAF.Pages.Admin.languages.BindData()
   at System.EventHandler.Invoke(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (70, CAST(0x0000A48E0171EC36 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.Cultures()
   at YAF.Pages.Admin.languages.BindData()
   at System.EventHandler.Invoke(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (71, CAST(0x0000A48E01730369 AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (72, CAST(0x0000A48E0173404F AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (73, CAST(0x0000A48E01735FEF AS DateTime), NULL, N'admin', N'YAF.Core', N'Exception
System.NullReferenceException: Object reference not set to an instance of an object.
   at YAF.Core.Helpers.StaticDataHelper.<>c__DisplayClass9.<CultureDefaultFromFile>b__8(CultureInfo ci)
   at System.Linq.Enumerable.WhereArrayIterator`1.MoveNext()
   at YAF.Core.Helpers.StaticDataHelper.CultureDefaultFromFile(String fileName)
   at YAF.Controls.EditUsersProfile.GetCulture(Boolean overrideByPageUserCulture)
   at YAF.Controls.EditUsersProfile.get_CurrentCultureInfo()
   at YAF.Controls.EditUsersProfile.BindData()
   at YAF.Controls.EditUsersProfile.Page_Load(Object sender, EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (74, CAST(0x0000A48E017385D9 AS DateTime), NULL, N'admin', N'System.Xml', N'Exception
System.Xml.XmlException: Data at the root level is invalid. Line 1, position 1.
   at System.Xml.XmlTextReaderImpl.Throw(String res, String arg)
   at System.Xml.XmlTextReaderImpl.ParseRootLevelWhitespace()
   at System.Xml.XmlTextReaderImpl.ParseDocumentContent()
   at System.Xml.XmlLoader.Load(XmlDocument doc, XmlReader reader, Boolean preserveWhitespace)
   at System.Xml.XmlDocument.Load(XmlReader reader)
   at System.Xml.XmlDocument.Load(String filename)
   at YAF.Core.LoadSerializedXmlFile`1.GetEncodingForXmlFile(String xmlFileName)
   at YAF.Core.LoadSerializedXmlFile`1.FromFile(String xmlFileName, String cacheName, Action`1 transformResource)
   at YAF.Core.Services.Localization.Localizer.LoadFile()
   at YAF.Core.Services.Localization.Localizer..ctor(String fileName)
   at YAF.Core.Services.Localization.YafLocalization.LoadTranslation(String fileName)
   at YAF.Core.Services.Localization.YafLocalization.GetLocalizedTextInternal(String page, String tag)
   at YAF.Core.Services.Localization.YafLocalization.GetText(String page, String tag)
   at YAF.Modules.PagePopupForumModule.AddErrorPopup()
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (75, CAST(0x0000A48E017393B7 AS DateTime), NULL, N'admin', N'System.Xml', N'Exception
System.Xml.XmlException: Data at the root level is invalid. Line 1, position 1.
   at System.Xml.XmlTextReaderImpl.Throw(String res, String arg)
   at System.Xml.XmlTextReaderImpl.ParseRootLevelWhitespace()
   at System.Xml.XmlTextReaderImpl.ParseDocumentContent()
   at System.Xml.XmlLoader.Load(XmlDocument doc, XmlReader reader, Boolean preserveWhitespace)
   at System.Xml.XmlDocument.Load(XmlReader reader)
   at System.Xml.XmlDocument.Load(String filename)
   at YAF.Core.LoadSerializedXmlFile`1.GetEncodingForXmlFile(String xmlFileName)
   at YAF.Core.LoadSerializedXmlFile`1.FromFile(String xmlFileName, String cacheName, Action`1 transformResource)
   at YAF.Core.Services.Localization.Localizer.LoadFile()
   at YAF.Core.Services.Localization.Localizer..ctor(String fileName)
   at YAF.Core.Services.Localization.YafLocalization.LoadTranslation(String fileName)
   at YAF.Core.Services.Localization.YafLocalization.GetLocalizedTextInternal(String page, String tag)
   at YAF.Core.Services.Localization.YafLocalization.GetText(String page, String tag)
   at YAF.Modules.PagePopupForumModule.AddErrorPopup()
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (76, CAST(0x0000A48E01748FBC AS DateTime), NULL, N'Guest', N'System.Xml', N'Exception
System.Xml.XmlException: Data at the root level is invalid. Line 1, position 1.
   at System.Xml.XmlTextReaderImpl.Throw(String res, String arg)
   at System.Xml.XmlTextReaderImpl.ParseRootLevelWhitespace()
   at System.Xml.XmlTextReaderImpl.ParseDocumentContent()
   at System.Xml.XmlLoader.Load(XmlDocument doc, XmlReader reader, Boolean preserveWhitespace)
   at System.Xml.XmlDocument.Load(XmlReader reader)
   at System.Xml.XmlDocument.Load(String filename)
   at YAF.Core.LoadSerializedXmlFile`1.GetEncodingForXmlFile(String xmlFileName)
   at YAF.Core.LoadSerializedXmlFile`1.FromFile(String xmlFileName, String cacheName, Action`1 transformResource)
   at YAF.Core.Services.Localization.Localizer.LoadFile()
   at YAF.Core.Services.Localization.Localizer..ctor(String fileName)
   at YAF.Core.Services.Localization.YafLocalization.LoadTranslation(String fileName)
   at YAF.Core.Services.Localization.YafLocalization.GetLocalizedTextInternal(String page, String tag)
   at YAF.Core.Services.Localization.YafLocalization.GetText(String page, String tag)
   at YAF.Modules.PagePopupForumModule.AddErrorPopup()
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Control.InitRecursive(Control namingContainer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)', 0)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (77, CAST(0x0000A48F00F5E2A1 AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User jboris was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (78, CAST(0x0000A48F00F5E2A3 AS DateTime), NULL, N'admin', N'YAF.Pages.Admin.admin', N'User 23 was deleted by 2.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (79, CAST(0x0000A48F00FB230D AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User jboris was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (80, CAST(0x0000A48F00FB230E AS DateTime), NULL, N'admin', N'YAF.Pages.Admin.admin', N'User 26 was deleted by 2.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (81, CAST(0x0000A48F00FB927A AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User jboris was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (82, CAST(0x0000A48F00FB927A AS DateTime), NULL, N'admin', N'YAF.Pages.Admin.admin', N'User 27 was deleted by 2.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (83, CAST(0x0000A48F00FCBCAB AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User jboris was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (84, CAST(0x0000A48F00FCBCAC AS DateTime), NULL, N'admin', N'YAF.Pages.Admin.admin', N'User 28 was deleted by 2.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (85, CAST(0x0000A48F00FDDF32 AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User jboris was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (86, CAST(0x0000A48F00FDDF32 AS DateTime), NULL, N'admin', N'YAF.Pages.Admin.admin', N'User 29 was deleted by 2.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (87, CAST(0x0000A48F00FFD979 AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User jboris was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (88, CAST(0x0000A48F00FFD97B AS DateTime), NULL, N'admin', N'YAF.Pages.Admin.admin', N'User 30 was deleted by 2.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (89, CAST(0x0000A490010B976D AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User jboris was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (90, CAST(0x0000A490010B977C AS DateTime), NULL, N'admin', N'YAF.Pages.Admin.admin', N'User 32 was deleted by 2.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (91, CAST(0x0000A4900118B3BC AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User jboris was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (92, CAST(0x0000A4900118B3BD AS DateTime), NULL, N'admin', N'YAF.Pages.Admin.admin', N'User 33 was deleted by 2.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (93, CAST(0x0000A4900119E9E3 AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User jboris was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (94, CAST(0x0000A4900119E9E5 AS DateTime), NULL, N'admin', N'YAF.Pages.Admin.admin', N'User 34 was deleted by 2.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (95, CAST(0x0000A49001686D5C AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User jborisx was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (96, CAST(0x0000A4950140E57A AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User KCanning was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (97, CAST(0x0000A4960102A854 AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User jborisx was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (98, CAST(0x0000A49601063188 AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User jborisx was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (99, CAST(0x0000A4980146E0E5 AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User jborisx was deleted by admin.
', 1002)
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (100, CAST(0x0000A49801573C65 AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User jborisx was deleted by admin.
', 1002)
GO
print 'Processed 100 total records'
INSERT [dbo].[yaf_EventLog] ([EventLogID], [EventTime], [UserID], [UserName], [Source], [Description], [Type]) VALUES (101, CAST(0x0000A49900F84C74 AS DateTime), NULL, N'admin', N'UserMembershipHelper.DeleteUser', N'User jborisx was deleted by admin.
', 1002)
SET IDENTITY_INSERT [dbo].[yaf_EventLog] OFF
/****** Object:  StoredProcedure [dbo].[yaf_choice_vote]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_choice_vote](@ChoiceID int,@UserID int = NULL, @RemoteIP varchar(39) = NULL) AS
BEGIN
        DECLARE @PollID int

    SET @PollID = (SELECT PollID FROM [dbo].[yaf_Choice] WHERE ChoiceID = @ChoiceID)

    IF @UserID = NULL
    BEGIN
        IF @RemoteIP != NULL
        BEGIN
            INSERT INTO [dbo].[yaf_PollVote] (PollID, UserID, RemoteIP, ChoiceID) VALUES (@PollID,NULL,@RemoteIP, @ChoiceID)	
        END
    END
    ELSE
    BEGIN
        INSERT INTO [dbo].[yaf_PollVote] (PollID, UserID, RemoteIP, ChoiceID) VALUES (@PollID,@UserID,@RemoteIP,@ChoiceID)
    END

    UPDATE [dbo].[yaf_Choice] SET Votes = Votes + 1 WHERE ChoiceID = @ChoiceID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_choice_update]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_choice_update](
    @ChoiceID	int,
    @Choice		nvarchar(50),
    @ObjectPath nvarchar(255),
    @MimeType nvarchar(50)
) as
begin
    
    update [dbo].[yaf_Choice]
        set Choice = @Choice, ObjectPath =  @ObjectPath, MimeType = @MimeType
        where ChoiceID = @ChoiceID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_choice_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_choice_delete](
    @ChoiceID	int
) as
begin
    
    delete from [dbo].[yaf_Choice]
        where ChoiceID = @ChoiceID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_choice_add]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- polls

CREATE procedure [dbo].[yaf_choice_add](
    @PollID		int,
    @Choice		nvarchar(50),
    @ObjectPath nvarchar(255),
    @MimeType nvarchar(50)
) as
begin
    
    insert into [dbo].[yaf_Choice]
        (PollID, Choice, Votes, ObjectPath, MimeType)
        values
        (@PollID, @Choice, 0, @ObjectPath, @MimeType)
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_listreporters]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_message_listreporters](@MessageID int, @UserID int = null) AS
BEGIN
    IF ( @UserID > 0 )
    BEGIN
    SELECT b.UserID, UserName = a.Name,UserDisplayName = a.DisplayName, b.ReportedNumber, b.ReportText  
    FROM [dbo].[yaf_User] a,			
    [dbo].[yaf_MessageReportedAudit] b		
    WHERE   a.UserID = b.UserID  AND b.MessageID = @MessageID AND b.UserID = @UserID 
    END
    ELSE
    BEGIN
    SELECT b.UserID, UserName = a.Name,UserDisplayName = a.DisplayName, b.ReportedNumber, b.ReportText  
    FROM [dbo].[yaf_User] a,			
    [dbo].[yaf_MessageReportedAudit] b		
    WHERE   a.UserID = b.UserID  AND b.MessageID = @MessageID
    END
    
    
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_group_medal_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[yaf_group_medal_save]
   @GroupID int,
   @MedalID int,
   @Message nvarchar(100) = NULL,
   @Hide bit,
   @OnlyRibbon bit,
   @SortOrder tinyint
as begin
    
    if exists(select 1 from [dbo].[yaf_GroupMedal] where [GroupID]=@GroupID and [MedalID]=@MedalID) begin
        update [dbo].[yaf_GroupMedal]
        set
            [Message] = @Message,
            [Hide] = @Hide,
            [OnlyRibbon] = @OnlyRibbon,
            [SortOrder] = @SortOrder
        where 
            [GroupID]=@GroupID and 
            [MedalID]=@MedalID
    end
    else begin

        insert into [dbo].[yaf_GroupMedal]
            ([GroupID],[MedalID],[Message],[Hide],[OnlyRibbon],[SortOrder])
        values
            (@GroupID,@MedalID,@Message,@Hide,@OnlyRibbon,@SortOrder)
    end

end
GO
/****** Object:  StoredProcedure [dbo].[yaf_group_medal_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[yaf_group_medal_list]
    @GroupID int = null,
    @MedalID int = null
as begin
    
    select 
        a.[MedalID],
        a.[Name],
        a.[MedalURL],
        a.[RibbonURL],
        a.[SmallMedalURL],
        a.[SmallRibbonURL],
        a.[SmallMedalWidth],
        a.[SmallMedalHeight],
        a.[SmallRibbonWidth],
        a.[SmallRibbonHeight],
        b.[SortOrder],
        a.[Flags],
        c.[Name] as [GroupName],
        b.[GroupID],
        isnull(b.[Message],a.[Message]) as [Message],
        b.[Message] as [MessageEx],
        b.[Hide],
        b.[OnlyRibbon],
        b.[SortOrder] as CurrentSortOrder
    from
        [dbo].[yaf_Medal] a
        inner join [dbo].[yaf_GroupMedal] b on b.[MedalID] = a.[MedalID]
        inner join [dbo].[yaf_Group] c on  c.[GroupID] = b.[GroupID]
    where
        (@GroupID is null or b.[GroupID] = @GroupID) and
        (@MedalID is null or b.[MedalID] = @MedalID)		
    order by
        c.[Name] ASC,
        b.[SortOrder] ASC

end
GO
/****** Object:  StoredProcedure [dbo].[yaf_group_medal_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- medals

create proc [dbo].[yaf_group_medal_delete]
    @GroupID int,
    @MedalID int
as begin
    
    delete from [dbo].[yaf_GroupMedal] where [GroupID]=@GroupID and [MedalID]=@MedalID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_thanksnumber]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_message_thanksnumber] 
    @MessageID int
AS
BEGIN
RETURN (SELECT Count(1) from [dbo].[yaf_Thanks] WHERE (MessageID=@MessageID))
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_medal_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[yaf_medal_delete]
    @BoardID	int = null,
    @MedalID	int = null,
    @Category	nvarchar(50) = null
as begin
    
    if not @MedalID is null begin
        delete from [dbo].[yaf_GroupMedal] where [MedalID] = @MedalID
        delete from [dbo].[yaf_UserMedal] where [MedalID] = @MedalID

        delete from [dbo].[yaf_Medal] where [MedalID]=@MedalID
    end
    else if not @Category is null and not @BoardID is null begin
        delete from [dbo].[yaf_GroupMedal] 
            where [MedalID] in (SELECT [MedalID] FROM [dbo].[yaf_Medal] where [Category]=@Category and [BoardID]=@BoardID)

        delete from [dbo].[yaf_UserMedal] 
            where [MedalID] in (SELECT [MedalID] FROM [dbo].[yaf_Medal] where [Category]=@Category and [BoardID]=@BoardID)

        delete from [dbo].[yaf_Medal] where [Category]=@Category
    end
    else if not @BoardID is null begin
        delete from [dbo].[yaf_GroupMedal] 
            where [MedalID] in (SELECT [MedalID] FROM [dbo].[yaf_Medal] where [BoardID]=@BoardID)

        delete from [dbo].[yaf_UserMedal] 
            where [MedalID] in (SELECT [MedalID] FROM [dbo].[yaf_Medal] where [BoardID]=@BoardID)

        delete from [dbo].[yaf_Medal] where [BoardID]=@BoardID
    end

end
GO
/****** Object:  StoredProcedure [dbo].[yaf_group_member]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_group_member](@BoardID int,@UserID int) as
begin
        select 
        a.GroupID,
        a.Name,
        Member = (select count(1) from [dbo].[yaf_UserGroup] x where x.UserID=@UserID and x.GroupID=a.GroupID)
    from
        [dbo].[yaf_Group] a
    where
        a.BoardID=@BoardID  
    order by
        a.Name
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_medal_listusers]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[yaf_medal_listusers]
    @MedalID	int
as begin
        (select 
        a.UserID, a.Name
    from 
        [dbo].[yaf_User] a
        inner join [dbo].[yaf_UserMedal] b on a.[UserID] = b.[UserID]
    where
        b.[MedalID]=@MedalID) 
    
    union	

    (select 
        a.UserID, a.Name
    from 
        [dbo].[yaf_User] a
        inner join [dbo].[yaf_UserGroup] b on a.[UserID] = b.[UserID]
        inner join [dbo].[yaf_GroupMedal] c on b.[GroupID] = c.[GroupID]
    where
        c.[MedalID]=@MedalID) 


end
GO
/****** Object:  StoredProcedure [dbo].[yaf_eventlog_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_eventlog_list](@BoardID int, @PageUserID int, @MaxRows int, @MaxDays int,  @PageIndex int,
   @PageSize int, @SinceDate datetime, @ToDate datetime, @EventIDs varchar(8000) = null,
@UTCTIMESTAMP datetime) as
begin
   declare @TotalRows int 
   declare @FirstSelectRowNumber int 
   declare @FirstSelectRowID int
   DECLARE @ParsedEventIDs TABLE
      (
            EventID int
      )
      
DECLARE @EventID varchar(11), @Pos INT      
SET @Pos = CHARINDEX(',', @EventIDs, 1)
-- check here if the value is not empty
IF REPLACE(@EventIDs, ',', '') <> ''
BEGIN
 WHILE @Pos > 0
                  BEGIN
                        SET @EventID = LTRIM(RTRIM(LEFT(@EventIDs, @Pos - 1)))
                        IF @EventID <> ''
                        BEGIN
                              INSERT INTO @ParsedEventIDs (EventID) VALUES (CAST(@EventID AS int)) --Use Appropriate conversion
                        END
                        SET @EventIDs = RIGHT(@EventIDs, LEN(@EventIDs) - @Pos)
                        SET @Pos = CHARINDEX(',', @EventIDs, 1)
                  END
                     -- to be sure that last value is inserted
                    IF (LEN(@EventIDs) > 0)
                           INSERT INTO @ParsedEventIDs (EventID) VALUES (CAST(@EventIDs AS int)) 
END

-- delete entries older than 10 days
    delete from [dbo].[yaf_EventLog] where EventTime+@MaxDays<@UTCTIMESTAMP 

    -- or if there are more then 1000	
    if ((select count(1) from [dbo].[yaf_eventlog]) >= @MaxRows + 50)
    begin		
        delete from [dbo].[yaf_EventLog] WHERE EventLogID IN (SELECT TOP 100 EventLogID FROM [dbo].[yaf_EventLog] ORDER BY EventTime)
    end	

    set nocount on
     set @PageIndex = @PageIndex + 1
    if (exists (select top 1 1 from [dbo].[yaf_User] where ((Flags & 1) = 1 and UserID = @PageUserID)))		
    begin
      set @FirstSelectRowNumber = 0
      set @FirstSelectRowID = 0
      set @TotalRows = 0

        select @TotalRows = count(1) from
        [dbo].[yaf_EventLog] a		
        left join [dbo].[yaf_User] b on b.UserID=a.UserID
        where	   
        (b.UserID IS NULL or b.BoardID = @BoardID)	and ((@EventIDs IS NULL )  OR  a.[Type] IN (select * from @ParsedEventIDs))  and EventTime between @SinceDate and @ToDate
    
        select @FirstSelectRowNumber = (@PageIndex - 1) * @PageSize + 1

    if (@FirstSelectRowNumber <= @TotalRows)
        begin
           -- find first selectedrowid 
  
    set rowcount @FirstSelectRowNumber
   end
   else
   begin   
   set rowcount 1
   end
       
        select @FirstSelectRowID = EventLogID 
       from
        [dbo].[yaf_EventLog] a		
        left join [dbo].[yaf_User] b on b.UserID=a.UserID
        where	   
        (b.UserID IS NULL or b.BoardID = @BoardID) and (@EventIDs IS NULL OR  a.[Type] IN (select * from @ParsedEventIDs))  and a.EventTime between @SinceDate and @ToDate
        order by a.EventLogID desc

      set rowcount @PageSize
      select
        a.*,		
        ISNULL(b.[Name],'System') as [Name],
        TotalRows = @TotalRows
    from
        [dbo].[yaf_EventLog] a		
        left join [dbo].[yaf_User] b on b.UserID=a.UserID
      where EventLogID <= @FirstSelectRowID  and (b.UserID IS NULL or b.BoardID = @BoardID)	and (@EventIDs IS NULL OR  a.[Type] IN (select * from @ParsedEventIDs)) -- and a.EventTime between @SinceDate and @ToDate
      order by a.EventLogID   desc   
   end  
else
begin
        select @TotalRows = count(1)  from
        [dbo].[yaf_EventLog] a
        left join [dbo].[yaf_EventLogGroupAccess] e on e.EventTypeID = a.[Type]
        join [dbo].[yaf_UserGroup] ug on (ug.UserID =  @PageUserID and ug.GroupID = e.GroupID)
        left join [dbo].[yaf_User] b on b.UserID=a.UserID
    where	 
        (b.UserID IS NULL or b.BoardID = @BoardID)		and (@EventIDs IS NULL OR  a.[Type] IN (select * from @ParsedEventIDs))	 and a.EventTime between @SinceDate and @ToDate
    
        select @FirstSelectRowNumber = (@PageIndex - 1) * @PageSize + 1
                   -- find first selectedrowid 
   if (@TotalRows > 0)
   begin
    set rowcount @FirstSelectRowNumber
   end
   else
   begin   
   set rowcount 1
   end

        select @FirstSelectRowID = EventLogID 
      from
        [dbo].[yaf_EventLog] a
        left join [dbo].[yaf_EventLogGroupAccess] e on e.EventTypeID = a.[Type]
        join [dbo].[yaf_UserGroup] ug on (ug.UserID =  @PageUserID and ug.GroupID = e.GroupID)
        left join [dbo].[yaf_User] b on b.UserID=a.UserID
    where	   
        (b.UserID IS NULL or b.BoardID = @BoardID)	and (@EventIDs IS NULL OR  a.[Type] IN (select * from @ParsedEventIDs))	 and a.EventTime between @SinceDate and @ToDate
        order by  a.EventLogID   desc

      set rowcount @PageSize
      select
      a.*,		
        ISNULL(b.[Name],'System') as [Name],
        TotalRows = @TotalRows
         from
        [dbo].[yaf_EventLog] a
        left join [dbo].[yaf_EventLogGroupAccess] e on e.EventTypeID = a.[Type]
        join [dbo].[yaf_UserGroup] ug on (ug.UserID =  @PageUserID and ug.GroupID = e.GroupID)
        left join [dbo].[yaf_User] b on b.UserID=a.UserID
    where	  EventLogID <= @FirstSelectRowID and (b.UserID IS NULL or b.BoardID = @BoardID) and (@EventIDs IS NULL OR  a.[Type] IN (select * from @ParsedEventIDs)) and a.EventTime between @SinceDate and @ToDate	
      order by a.EventLogID  desc   
   end  
   set rowcount 0
 set nocount off

end
GO
/****** Object:  StoredProcedure [dbo].[yaf_eventlog_deletebyuser]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_eventlog_deletebyuser]
(	
    @BoardID int = null,
    @PageUserID int 
) as
begin
if (exists (select top 1 1 from [dbo].[yaf_User] where ((Flags & 1) = 1 and UserID = @PageUserID)))
begin
delete from [dbo].[yaf_EventLog] where
            (UserID is null or
            UserID in (select UserID from [dbo].[yaf_User] where BoardID=@BoardID))
end
else
begin
declare @tmp_evlogdelacc table (EventLogTID int);

        -- either EventLogID or BoardID must be null, not both at the same time
    insert into	@tmp_evlogdelacc(EventLogTID)
    select a.EventLogID from [dbo].[yaf_EventLog] a
        left join [dbo].[yaf_EventLogGroupAccess] e on e.EventTypeID = a.[Type] 
        join [dbo].[yaf_UserGroup] ug on (ug.UserID =  @PageUserID and ug.GroupID = e.GroupID)
        left join [dbo].[yaf_User] b on b.UserID=a.UserID
        where e.DeleteAccess = 1
        delete from [dbo].[yaf_EventLog]
        where EventLogID in (select EventLogTID from @tmp_evlogdelacc)
    end	
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_eventlog_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_eventlog_delete]
(
    @EventLogID int = null, 
    @BoardID int = null,
    @PageUserID int
) as
begin
        -- either EventLogID or BoardID must be null, not both at the same time
    if (@EventLogID is null) begin
        -- delete all events of this board
        delete from [dbo].[yaf_EventLog]
        where
            (UserID is null or
            UserID in (select UserID from [dbo].[yaf_User] where BoardID=@BoardID))
    end
    else begin
        -- delete just one event
        delete from [dbo].[yaf_EventLog] where EventLogID=@EventLogID
    end
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_eventlog_create]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_eventlog_create](@UserID int,@Source nvarchar(50),@Description ntext,@Type int,@UTCTIMESTAMP datetime) as
begin
        insert into [dbo].[yaf_EventLog](UserID,Source,[Description],[Type])
    values(@UserID,@Source,@Description,@Type)	
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_checkemail_update]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_checkemail_update](@Hash nvarchar(32)) as
begin
        declare @UserID int
    declare @CheckEmailID int
    declare @Email nvarchar(255)

    set @UserID = null

    select 
        @CheckEmailID = CheckEmailID,
        @UserID = UserID,
        @Email = Email
    from
        [dbo].[yaf_CheckEmail]
    where
        Hash = @Hash

    if @UserID is null
    begin
        select convert(nvarchar(64),NULL) as ProviderUserKey, convert(nvarchar(255),NULL) as Email
        return
    end

    -- Update new user email
    update [dbo].[yaf_User] set Email = LOWER(@Email), Flags = Flags | 2 where UserID = @UserID
    delete [dbo].[yaf_CheckEmail] where CheckEmailID = @CheckEmailID

    -- return the UserProviderKey
    SELECT ProviderUserKey, Email, UserID FROM [dbo].[yaf_User] WHERE UserID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_checkemail_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_checkemail_save]
(
    @UserID int,
    @Hash nvarchar(32),
    @Email nvarchar(255),
    @UTCTIMESTAMP datetime
)
AS
BEGIN
        INSERT INTO [dbo].[yaf_CheckEmail]
        (UserID,Email,Created,Hash)
    VALUES
        (@UserID,LOWER(@Email),@UTCTIMESTAMP ,@Hash)	
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_checkemail_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_checkemail_list]
(
    @Email nvarchar(255) = null
)
AS
BEGIN
        IF @Email IS NULL
        SELECT * FROM [dbo].[yaf_CheckEmail]
    ELSE
        SELECT * FROM [dbo].[yaf_CheckEmail] WHERE Email = LOWER(@Email)
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_buddy_remove]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_buddy_remove]
    @FromUserID INT,
    @ToUserID INT,
	@UseDisplayName BIT,
    @paramOutput NVARCHAR(255) = NULL OUT
AS 
    BEGIN
        DELETE  FROM [dbo].[yaf_Buddy]
        WHERE   ( FromUserID = @FromUserID
                  AND ToUserID = @ToUserID
                )
        SET @paramOutput = ( SELECT (CASE WHEN @UseDisplayName = 1 THEN [DisplayName] ELSE [Name] END) 
		                     FROM [dbo].[yaf_User]
							 WHERE ( UserID = @ToUserID )
                           )
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_buddy_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_buddy_list] @FromUserID INT
AS 
    BEGIN
        SELECT  a.UserID,
                a.BoardID,
                a.[Name],
                a.Joined,
                a.NumPosts,
                RankName = b.NAME,
                c.Approved,
                c.FromUserID,
                c.Requested
        FROM   [dbo].[yaf_User] a
                JOIN [dbo].[yaf_Rank] b ON b.RankID = a.RankID
                JOIN [dbo].[yaf_Buddy] c ON ( c.ToUserID = a.UserID
                                              AND c.FromUserID = @FromUserID
                                            )
        UNION
        SELECT  @FromUserID AS UserID,
                a.BoardID,
                a.[Name],
                a.Joined,
                a.NumPosts,
                RankName = b.NAME,
                c.Approved,
                c.FromUserID,
                c.Requested
        FROM    [dbo].[yaf_User] a
                JOIN [dbo].[yaf_Rank] b ON b.RankID = a.RankID
                JOIN [dbo].[yaf_Buddy] c ON ( ( c.Approved = 0 )
                                              AND ( c.ToUserID = @FromUserID )
                                              AND ( a.UserID = c.FromUserID )
                                            )
        ORDER BY a.NAME
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_buddy_denyrequest]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_buddy_denyrequest]
    @FromUserID INT,
    @ToUserID INT,
	@UseDisplayName BIT,
    @paramOutput NVARCHAR(255) = NULL OUT
AS 
    BEGIN
        DELETE  FROM [dbo].[yaf_Buddy]
        WHERE   FromUserID = @FromUserID
                AND ToUserID = @ToUserID
        SET @paramOutput = ( SELECT (CASE WHEN @UseDisplayName = 1 THEN [DisplayName] ELSE [Name] END) 
		                     FROM [dbo].[yaf_User]
							 WHERE ( UserID = @FromUserID 
							)
)
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_buddy_approverequest]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_buddy_approverequest]
    @FromUserID INT,
    @ToUserID INT,
    @Mutual BIT,
    @UTCTIMESTAMP datetime,
	@UseDisplayName BIT,
    @paramOutput NVARCHAR(255) = NULL OUT
AS 
    BEGIN
        IF EXISTS ( SELECT  ID
                    FROM    [dbo].[yaf_Buddy]
                    WHERE   ( FromUserID = @FromUserID
                              AND ToUserID = @ToUserID
                            ) ) 
            BEGIN
                UPDATE  [dbo].[yaf_Buddy]
                SET     Approved = 1
                WHERE   ( FromUserID = @FromUserID
                          AND ToUserID = @ToUserID
                        )
                SET @paramOutput = ( SELECT (CASE WHEN @UseDisplayName = 1 THEN [DisplayName] ELSE [Name] END) 
		                     FROM [dbo].[yaf_User]
							 WHERE ( UserID = @FromUserID )
                           )
                IF ( @Mutual = 1 )
                    AND ( NOT EXISTS ( SELECT   ID
                                       FROM     [dbo].[yaf_Buddy]
                                       WHERE    FromUserID = @ToUserID
                                                AND ToUserID = @FromUserID )
                        ) 
                    INSERT  INTO [dbo].[yaf_Buddy]
                            (
                              FromUserID,
                              ToUserID,
                              Approved,
                              Requested
                            )
                    VALUES  (
                              @ToUserID,
                              @FromUserID,
                              1,
                              @UTCTIMESTAMP 
                            )
            END
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_buddy_addrequest]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Stored procedures for Buddy feature */

CREATE PROCEDURE [dbo].[yaf_buddy_addrequest]
    @FromUserID INT,
    @ToUserID INT,
    @UTCTIMESTAMP datetime,
    @approved BIT = NULL OUT,
	@UseDisplayName BIT,	
    @paramOutput NVARCHAR(255) = NULL OUT
AS 
    BEGIN
        IF NOT EXISTS ( SELECT  ID
                        FROM    [dbo].[yaf_Buddy]
                        WHERE   ( FromUserID = @FromUserID
                                  AND ToUserID = @ToUserID
                                ) ) 
            BEGIN
                IF ( NOT EXISTS ( SELECT    ID
                                  FROM      [dbo].[yaf_Buddy]
                                  WHERE     ( FromUserID = @ToUserID
                                              AND ToUserID = @FromUserID
                                            ) )
                   ) 
                    BEGIN
                        INSERT  INTO [dbo].[yaf_Buddy]
                                (
                                  FromUserID,
                                 ToUserID,
                                  Approved,
                                  Requested
                                )
                        VALUES  (
                                  @FromUserID,
                                  @ToUserID,
                                  0,
                                  @UTCTIMESTAMP 
                                )
                        SET @paramOutput = ( SELECT (CASE WHEN @UseDisplayName = 1 THEN [DisplayName] ELSE [Name] END) 
		                     FROM [dbo].[yaf_User]
							 WHERE ( UserID = @ToUserID )
                           )
                        SET @approved = 0
                    END
                ELSE 
                    BEGIN
                        INSERT  INTO [dbo].[yaf_Buddy]
                                (
                                  FromUserID,
                                  ToUserID,
                                  Approved,
                                  Requested
                                )
                        VALUES  (
                                  @FromUserID,
                                  @ToUserID,
                                  1,
                                  @UTCTIMESTAMP 
                                )
                        UPDATE  [dbo].[yaf_Buddy]
                        SET     Approved = 1
                        WHERE   ( FromUserID = @ToUserID
                                  AND ToUserID = @FromUserID
                                )
                        SET @paramOutput = ( SELECT [Name]
                                             FROM   [dbo].[yaf_User]
                                             WHERE  ( UserID = @ToUserID )
                                           )
                        SET @approved = 1
                    END
            END	
        ELSE 
            BEGIN
                SET @paramOutput = ''
                SET @approved = 0
            END
    END
GO
/****** Object:  StoredProcedure [dbo].[yaf_attachment_download]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_attachment_download](@AttachmentID int) as
begin
        update [dbo].[yaf_Attachment] set Downloads=Downloads+1 where AttachmentID=@AttachmentID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_adminpageaccess_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_adminpageaccess_save] (@UserID int, @PageName nvarchar(128)) as
begin
    if not exists (select 1 from [dbo].[yaf_AdminPageUserAccess] where UserID = @UserID and PageName = @PageName) 
        begin
        insert into [dbo].[yaf_AdminPageUserAccess]  (UserID,PageName) 
        values(@UserID,@PageName)
    end	
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_adminpageaccess_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_adminpageaccess_list] (@UserID int, @PageName nvarchar(128) = null) as
begin
        if (@UserID > 0  and @PageName IS NOT NULL) 
        select ap.*, 
        u.Name as UserName, 
        u.DisplayName as UserDisplayName, 
        b.Name as BoardName
        from [dbo].[yaf_AdminPageUserAccess] ap 
        JOIN  [dbo].[yaf_User] u on ap.UserID = u.UserID 
        JOIN [dbo].[yaf_Board] b ON b.BoardID = u.BoardID 
        where u.UserID = @UserID and PageName = @PageName and (u.Flags & 1) <> 1 order by  b.BoardID,u.Name,ap.PageName;
        else if (@UserID > 0 and @PageName IS  NULL) 
        select ap.*, 
        u.Name as UserName, 
        u.DisplayName as UserDisplayName, 
        b.Name as BoardName,
        1 as ReadAccess  
         from [dbo].[yaf_AdminPageUserAccess] ap 
        JOIN  [dbo].[yaf_User] u on ap.UserID = u.UserID 
        JOIN [dbo].[yaf_Board] b ON b.BoardID = u.BoardID 
        where u.UserID = @UserID and (u.Flags & 1) <> 1 order by  b.BoardID,u.Name,ap.PageName;
        else
        select ap.*, 
        u.Name as UserName, 
        u.DisplayName as UserDisplayName, 
        b.Name as BoardName
        from [dbo].[yaf_AdminPageUserAccess] ap 
        JOIN  [dbo].[yaf_User] u on ap.UserID = u.UserID 
        JOIN [dbo].[yaf_Board] b ON b.BoardID = u.BoardID 
        where (u.Flags & 1) <> 1
        order by  b.BoardID,u.Name,ap.PageName;
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_adminpageaccess_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_adminpageaccess_delete] (@UserID int, @PageName nvarchar(128)) as
begin
        delete from [dbo].[yaf_AdminPageUserAccess]  where UserID = @UserID AND (@PageName IS NULL OR PageName = @PageName);
end
GO
/****** Object:  UserDefinedFunction [dbo].[yaf_message_getthanksinfo]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Gets the Thanks info which will be formatted and then placed in "dvThanksInfo" Div Tag in displaypost.ascx.
create function [dbo].[yaf_message_getthanksinfo]
(
@MessageID INT,
@ShowThanksDate bit
) returns VARCHAR(MAX)
BEGIN
    DECLARE @Output VARCHAR(MAX)
        SELECT @Output = COALESCE(@Output+',', '') + CAST(i.ThanksFromUserID AS varchar) + 
    CASE @ShowThanksDate WHEN 1 THEN ',' + CAST (i.ThanksDate AS varchar)  ELSE '' end
            FROM	[dbo].[yaf_Thanks] i
            WHERE	i.MessageID = @MessageID	ORDER BY i.ThanksDate
    -- Add the last comma if @Output has data.
    IF @Output <> ''
        SELECT @Output = @Output + ','
    RETURN @Output
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_message_getthanks]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_message_getthanks] 
    @MessageID int
AS
BEGIN
    SELECT a.ThanksFromUserID as UserID, a.ThanksDate, b.Name, b.DisplayName
    FROM [dbo].[yaf_Thanks] a 
    Inner Join [dbo].[yaf_User] b
    ON (a.ThanksFromUserID = b.UserID) WHERE (MessageID=@MessageID)
    ORDER BY a.ThanksDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_recent_users]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_recent_users](@BoardID int,@TimeSinceLastLogin int,@StyledNicks bit=0) as
begin  
    SELECT U.UserId,
    UserName = U.Name,
    UserDisplayName = U.DisplayName,
    IsCrawler = 0,
    UserCount = 1,
    IsHidden = (IsActiveExcluded),
    Style = CASE(@StyledNicks)
                WHEN 1 THEN U.UserStyle
                ELSE ''
            END,
    U.LastVisit
    FROM [dbo].[yaf_User] AS U
                JOIN [dbo].[yaf_Rank] R on R.RankID=U.RankID
    WHERE (U.IsApproved = '1') AND
     U.BoardID = @BoardID AND
     (DATEADD(mi, 0 - @TimeSinceLastLogin, GETDATE()) < U.LastVisit) AND
                --Excluding guests
                NOT EXISTS(             
                    SELECT 1 
                        FROM [dbo].[yaf_UserGroup] x
                            inner join [dbo].[yaf_Group] y ON y.GroupID=x.GroupID 
                        WHERE x.UserID=U.UserID and (y.Flags & 2)<>0
                    )
    ORDER BY U.LastVisit
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_addpoints]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[yaf_user_addpoints] (@UserID int,@FromUserID int = null, @UTCTIMESTAMP datetime, @Points int) AS
BEGIN
    UPDATE [dbo].[yaf_User] SET Points = Points + @Points WHERE UserID = @UserID

    IF @FromUserID IS NOT NULL 
    BEGIN
        declare	@VoteDate datetime
    set @VoteDate = (select top 1 VoteDate from [dbo].[yaf_ReputationVote] where ReputationFromUserID=@FromUserID AND ReputationToUserID=@UserID)
    IF @VoteDate is not null
    begin	     
          update [dbo].[yaf_ReputationVote] set VoteDate=@UTCTIMESTAMP where VoteDate = @VoteDate AND ReputationFromUserID=@FromUserID AND ReputationToUserID=@UserID
    end
    ELSE
      begin
          insert into [dbo].[yaf_ReputationVote](ReputationFromUserID,ReputationToUserID,VoteDate)
          values (@FromUserID, @UserID, @UTCTIMESTAMP)
      end
    END
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_approve]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_approve](@UserID int) as
begin
        
    declare @CheckEmailID int
    declare @Email nvarchar(255)

    select 
        @CheckEmailID = CheckEmailID,
        @Email = Email
    from
        [dbo].[yaf_CheckEmail]
    where
        UserID = @UserID

    -- Update new user email
    update [dbo].[yaf_User] set Email = @Email, Flags = Flags | 2 where UserID = @UserID
    delete [dbo].[yaf_CheckEmail] where CheckEmailID = @CheckEmailID
    select convert(bit,1)
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_guest]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_guest]
(
    @BoardID int,@UTCTIMESTAMP datetime
)
as
begin
    
    select top 1
        a.UserID
    from
        [dbo].[yaf_User] a
        inner join [dbo].[yaf_UserGroup] b on b.UserID = a.UserID
        inner join [dbo].[yaf_Group] c on b.GroupID = c.GroupID
    where
        a.BoardID = @BoardID and
        (c.Flags & 2)<>0
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_getthanks_to]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_user_getthanks_to] 
    @UserID			int,
    @PageUserID     int,
    @ThanksToNumber int output,
    @ThanksToPostsNumber int output
AS
BEGIN
SELECT @ThanksToNumber=(SELECT Count(1) FROM [dbo].[yaf_Thanks] WHERE ThanksToUserID=@UserID)	
SELECT @ThanksToPostsNumber=(SELECT Count(DISTINCT MessageID) FROM [dbo].[yaf_Thanks] WHERE ThanksToUserID=@UserID)	
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_getthanks_from]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_user_getthanks_from] 
    @UserID int, @PageUserID  int
AS
BEGIN
SELECT Count(1) FROM [dbo].[yaf_Thanks] 
WHERE ThanksFromUserID=@UserID
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_getsignaturedata]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_user_getsignaturedata] (@BoardID INT, @UserID INT)
as 
    BEGIN

    

DECLARE   @GroupData TABLE
(
    G_UsrSigChars int,
    G_UsrSigBBCodes nvarchar(4000),
    G_UsrSigHTMLTags nvarchar(4000)
)
   
   declare @ust int, @usbbc nvarchar(4000), 
    @ushtmlt nvarchar(4000), @rust int, @rusbbc nvarchar(4000),  
    @rushtmlt nvarchar(4000) 
          
      declare c cursor for
      SELECT ISNULL(c.UsrSigChars,0), ISNULL(c.UsrSigBBCodes,''), ISNULL(c.UsrSigHTMLTags,'')
      FROM [dbo].[yaf_User] a 
                        JOIN [dbo].[yaf_UserGroup] b
                          ON a.UserID = b.UserID
                            JOIN [dbo].[yaf_Group] c                         
                              ON b.GroupID = c.GroupID 
                              WHERE a.UserID = @UserID AND c.BoardID = @BoardID ORDER BY c.SortOrder ASC
        
        -- first check ranks
        SELECT TOP 1 @rust = ISNULL(c.UsrSigChars,0), @rusbbc = c.UsrSigBBCodes, 
        @rushtmlt = c.UsrSigHTMLTags
        FROM [dbo].[yaf_Rank] c 
                                JOIN [dbo].[yaf_User] d
                                  ON c.RankID = d.RankID
                                   WHERE d.UserID = @UserID AND c.BoardID = @BoardID 
                                   ORDER BY c.RankID DESC        
        open c
       
        fetch next from c into  @ust, @usbbc , @ushtmlt
        while @@FETCH_STATUS = 0
        begin
        if not exists (select top 1 1 from @GroupData)
        begin	

        -- insert first row and compare with ranks data
    INSERT INTO @GroupData(G_UsrSigChars,G_UsrSigBBCodes,G_UsrSigHTMLTags) 
        select (CASE WHEN @rust > ISNULL(@ust,0) THEN @rust ELSE ISNULL(@ust,0) END), 
        (COALESCE(@rusbbc + ',','') + COALESCE(@usbbc,'')) ,(COALESCE(@rushtmlt + ',','') + COALESCE(@ushtmlt, '') ) 	  
        end
        else
        begin
        update @GroupData set 
        G_UsrSigChars = (CASE WHEN G_UsrSigChars > COALESCE(@ust, 0) THEN G_UsrSigChars ELSE COALESCE(@ust, 0) END), 
        G_UsrSigBBCodes = COALESCE(@usbbc + ',','') + G_UsrSigBBCodes, 
        G_UsrSigHTMLTags = COALESCE(@ushtmlt + ',', '') + G_UsrSigHTMLTags
        end 

        fetch next from c into   @ust, @usbbc , @ushtmlt
        
        end

       close c
       deallocate c 	
                 
       
        SELECT 
        UsrSigChars = G_UsrSigChars, 
        UsrSigBBCodes = G_UsrSigBBCodes, 
        UsrSigHTMLTags = G_UsrSigHTMLTags
        FROM @GroupData 

   END
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_getalbumsdata]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_user_getalbumsdata] (@BoardID INT, @UserID INT )
as 
    BEGIN
    DECLARE 
    @OR_UsrAlbums int,     
    @OG_UsrAlbums int,
    @OR_UsrAlbumImages int,     
    @OG_UsrAlbumImages int
     -- Ugly but bullet proof - it used very rarely   
    DECLARE  @GroupData TABLE
(
    G_UsrAlbums int,
    G_UsrAlbumImages int
)
    DECLARE
   @RankData TABLE
(
    R_UsrAlbums int,
    R_UsrAlbumImages int
)

      -- REMOVED ORDER BY c.SortOrder ASC, SELECTING ALL
     
    INSERT INTO @GroupData(G_UsrAlbums,
    G_UsrAlbumImages)
    SELECT  ISNULL(c.UsrAlbums,0), ISNULL(c.UsrAlbumImages,0)   
    FROM [dbo].[yaf_User] a
                        JOIN [dbo].[yaf_UserGroup] b
                          ON a.UserID = b.UserID
                            JOIN [dbo].[yaf_Group] c                         
                              ON b.GroupID = c.GroupID
                              WHERE a.UserID = @UserID AND a.BoardID = @BoardID
     
                             
     INSERT INTO @RankData(R_UsrAlbums, R_UsrAlbumImages)
     SELECT  ISNULL(c.UsrAlbums,0), ISNULL(c.UsrAlbumImages,0)   
     FROM [dbo].[yaf_Rank] c
                                JOIN [dbo].[yaf_User] d
                                  ON c.RankID = d.RankID WHERE d.UserID = @UserID 
                                  AND d.BoardID = @BoardID
       
       -- SELECTING MAX()
       
       SET @OR_UsrAlbums = (SELECT Max(R_UsrAlbums) FROM @RankData)
       SET @OG_UsrAlbums = (SELECT Max(G_UsrAlbums) FROM @GroupData)
       SET @OR_UsrAlbumImages = (SELECT Max(R_UsrAlbumImages) FROM @RankData)
       SET @OG_UsrAlbumImages = (SELECT Max(G_UsrAlbumImages) FROM @GroupData)
       
       SELECT
        NumAlbums  = (SELECT COUNT(ua.AlbumID) FROM [dbo].[yaf_UserAlbum] ua
                      WHERE ua.UserID = @UserID),
        NumImages = (SELECT COUNT(uai.ImageID) FROM  [dbo].[yaf_UserAlbumImage] uai
                     INNER JOIN [dbo].[yaf_UserAlbum] ua
                     ON ua.AlbumID = uai.AlbumID
                     WHERE ua.UserID = @UserID),
        UsrAlbums = CASE WHEN @OG_UsrAlbums > @OR_UsrAlbums THEN @OG_UsrAlbums ELSE @OR_UsrAlbums END,
        UsrAlbumImages = CASE WHEN @OG_UsrAlbumImages > @OR_UsrAlbumImages THEN @OG_UsrAlbumImages ELSE @OR_UsrAlbumImages END
             
     
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_find]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_find](
    @BoardID int,
    @Filter bit,
    @UserName nvarchar(255)=null,
    @Email nvarchar(255)=null,
    @DisplayName nvarchar(255)=null,
    @NotificationType int = null,
    @DailyDigest bit = null
)
AS
begin
    
    if @Filter<>0
    begin
        if @UserName is not null
            set @UserName = '%' + @UserName + '%'
            
        if @DisplayName is not null
            set @DisplayName = '%' + @DisplayName + '%'			

        select 
            a.*,			
            IsAdmin = (select count(1) from [dbo].[yaf_UserGroup] x join [dbo].[yaf_Group] y on y.GroupID=x.GroupID where x.UserID=a.UserID and (y.Flags & 1)<>0)
        from 
            [dbo].[yaf_User] a
        where 
            a.BoardID=@BoardID and
            ((@UserName is not null and a.Name like @UserName) or
            (@Email is not null and Email like @Email) or
            (@DisplayName is not null and a.DisplayName like @DisplayName) or
            (@NotificationType is not null and a.NotificationType = @NotificationType) or
            (@DailyDigest is not null and a.DailyDigest = @DailyDigest))
        order by
            a.Name
    end else
    begin
        select 
            a.*,			
            IsAdmin = (select count(1) from [dbo].[yaf_UserGroup] x join [dbo].[yaf_Group] y on y.GroupID=x.GroupID where x.UserID=a.UserID and (y.Flags & 1)<>0)
        from 
            [dbo].[yaf_User] a
        where 
            a.BoardID=@BoardID and
            ((@UserName is not null and a.Name like @UserName) or
            (@Email is not null and Email like @Email) or
            (@DisplayName is not null and a.DisplayName like @DisplayName) or
            (@NotificationType is not null and a.NotificationType = @NotificationType) or
            (@DailyDigest is not null and a.DailyDigest = @DailyDigest))
    end
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_emails]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_emails](@BoardID int,@GroupID int=null) as
begin
    
    if @GroupID = 0 set @GroupID = null
    if @GroupID is null
        select 
            a.Email 
        from 
            [dbo].[yaf_User] a
        where 
            a.Email is not null and 
            a.BoardID = @BoardID and
            a.Email is not null and 
            a.Email<>''
    else
        select 
            a.Email 
        from 
            [dbo].[yaf_User] a
            join [dbo].[yaf_UserGroup] b on b.UserID=a.UserID
            join [dbo].[yaf_Group] c on c.GroupID=b.GroupID
        where 
            b.GroupID = @GroupID and 
            (c.Flags & 2)=0 and
            a.Email is not null and 
            a.Email<>''
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_deleteold]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_deleteold](@BoardID int, @Days int,@UTCTIMESTAMP datetime) as
begin
    
    declare @Since datetime

    set @Since = @UTCTIMESTAMP 

    delete from [dbo].[yaf_EventLog]  where UserID in(select UserID from [dbo].[yaf_User] where BoardID=@BoardID and IsApproved=0 and datediff(day,Joined,@Since)>@Days)
    delete from [dbo].[yaf_CheckEmail] where UserID in(select UserID from [dbo].[yaf_User] where BoardID=@BoardID and IsApproved=0 and datediff(day,Joined,@Since)>@Days)
    delete from [dbo].[yaf_UserGroup] where UserID in(select UserID from [dbo].[yaf_User] where BoardID=@BoardID and IsApproved=0 and datediff(day,Joined,@Since)>@Days)
    delete from [dbo].[yaf_User] where BoardID=@BoardID and IsApproved=0 and datediff(day,Joined,@Since)>@Days
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_medal_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[yaf_user_medal_save]
    @UserID int,
    @MedalID int,
    @Message nvarchar(100) = NULL,
    @Hide bit,
    @OnlyRibbon bit,
    @SortOrder tinyint,
    @DateAwarded datetime = NULL,
    @UTCTIMESTAMP datetime
as begin
        if exists(select 1 from [dbo].[yaf_UserMedal] where [UserID]=@UserID and [MedalID]=@MedalID) begin
        update [dbo].[yaf_UserMedal]
        set
            [Message] = @Message,
            [Hide] = @Hide,
            [OnlyRibbon] = @OnlyRibbon,
            [SortOrder] = @SortOrder
        where 
            [UserID]=@UserID and 
            [MedalID]=@MedalID
    end
    else begin

        if (@DateAwarded is null) set @DateAwarded = @UTCTIMESTAMP  

        insert into [dbo].[yaf_UserMedal]
            ([UserID],[MedalID],[Message],[Hide],[OnlyRibbon],[SortOrder],[DateAwarded])
        values
            (@UserID,@MedalID,@Message,@Hide,@OnlyRibbon,@SortOrder,@DateAwarded)
    end

end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_medal_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[yaf_user_medal_list]
    @UserID int = null,
    @MedalID int = null
as begin
        select 
        a.[MedalID],
        a.[Name],
        a.[MedalURL],
        a.[RibbonURL],
        a.[SmallMedalURL],
        a.[SmallRibbonURL],
        a.[SmallMedalWidth],
        a.[SmallMedalHeight],
        a.[SmallRibbonWidth],
        a.[SmallRibbonHeight],
        b.[SortOrder],
        a.[Flags],
        c.[Name] as [UserName],
        c.[DisplayName] as [DisplayName],
        b.[UserID],
        isnull(b.[Message],a.[Message]) as [Message],
        b.[Message] as [MessageEx],
        b.[Hide],
        b.[OnlyRibbon],
        b.[SortOrder] as [CurrentSortOrder],
        b.[DateAwarded]
    from
        [dbo].[yaf_Medal] a
        inner join [dbo].[yaf_UserMedal] b on b.[MedalID] = a.[MedalID]
        inner join [dbo].[yaf_User] c on c.[UserID] = b.[UserID]
    where
        (@UserID is null or b.[UserID] = @UserID) and
        (@MedalID is null or b.[MedalID] = @MedalID)		
    order by
        c.[Name] ASC,
        b.[SortOrder] ASC

end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_medal_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[yaf_user_medal_delete]
    @UserID int,
    @MedalID int
as begin
        delete from [dbo].[yaf_UserMedal] where [UserID]=@UserID and [MedalID]=@MedalID

end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_listmembers]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_listmembers](
                @BoardID int,
                @UserID int=null,
                @Approved bit=null,
                @GroupID int=null,
                @RankID int=null,
                @StyledNicks bit = null,
                @Literals nvarchar(255), 
                @Exclude bit = null, 
                @BeginsWith bit = null, 				
                @PageIndex int, 
                @PageSize int,
                @SortName int = 0,
                @SortRank int = 0,
                @SortJoined int = 0,
                @SortPosts int = 0,
                @SortLastVisit int = 0,
                @NumPosts int = 0,
                @NumPostsCompare int = 0) as
begin  
    declare @TotalRows int
    declare @FirstSelectRowNumber int
    declare @LastSelectRowNumber int
    -- find total returned count

    select @TotalRows = count(a.UserID) 
    from [dbo].[yaf_User] a  with(nolock) 
      join [dbo].[yaf_Rank] b with(nolock)
      on b.RankID=a.RankID 
      where
       a.BoardID = @BoardID	   
       and
        (@Approved is null or (@Approved=0 and (a.Flags & 2)=0) or (@Approved=1 and (a.Flags & 2)=2)) and
        (@GroupID is null or exists(select 1 from [dbo].[yaf_UserGroup] x where x.UserID=a.UserID and x.GroupID=@GroupID)) and
        (@RankID is null or a.RankID=@RankID) AND
        -- user is not guest
        ISNULL(a.Flags & 4,0) <> 4
            AND
        (LOWER(a.DisplayName) LIKE CASE 
            WHEN (@BeginsWith = 0 AND @Literals IS NOT NULL AND LEN(@Literals) > 0) THEN '%' + LOWER(@Literals) + '%' 
            WHEN (@BeginsWith = 1 AND @Literals IS NOT NULL AND LEN(@Literals) > 0) THEN LOWER(@Literals) + '%'
            ELSE '%' END  
            or
         LOWER(a.Name) LIKE CASE 
            WHEN (@BeginsWith = 0 AND @Literals IS NOT NULL AND LEN(@Literals) > 0) THEN '%' + LOWER(@Literals) + '%' 
            WHEN (@BeginsWith = 1 AND @Literals IS NOT NULL AND LEN(@Literals) > 0) THEN LOWER(@Literals) + '%'
            ELSE '%' END) 
        and
        (a.NumPosts >= (case 
        when @NumPostsCompare = 3 then  @NumPosts end) 
        OR a.NumPosts <= (case 
        when @NumPostsCompare = 2 then @NumPosts end) OR
        a.NumPosts = (case 
        when @NumPostsCompare = 1 then @NumPosts end)); 

    select @PageIndex = @PageIndex+1;
    select @FirstSelectRowNumber = (@PageIndex - 1) * @PageSize + 1;
    select @LastSelectRowNumber = (@PageIndex - 1) * @PageSize + @PageSize;	
    
    with UserIds  as
     (
     select ROW_NUMBER() over (order by    (case 
        when @SortName = 2 then a.[Name] end) DESC,
        (case 
        when @SortName = 1 then a.[Name] end) ASC, 
        (case 
        when @SortRank = 2 then a.RankID end) DESC,
        (case 
        when @SortRank = 1 then a.RankID end) ASC,		
        (case 
        when @SortJoined = 2 then a.Joined end) DESC,
        (case 
        when @SortJoined = 1 then a.Joined end) ASC,
        (case 
        when @SortLastVisit = 2 then a.LastVisit end) DESC,
        (case 
        when @SortLastVisit = 1 then a.LastVisit end) ASC,
        (case
         when @SortPosts = 2 then a.NumPosts end) DESC, 
        (case
         when @SortPosts = 1 then a.NumPosts end) ASC ) as RowNum, a.UserID
     from [dbo].[yaf_User] a with(nolock)
            join [dbo].[yaf_Rank] b with(nolock) on b.RankID=a.RankID	
     where
       a.BoardID = @BoardID	   
       and
        (@Approved is null or (@Approved=0 and (a.Flags & 2)=0) or (@Approved=1 and (a.Flags & 2)=2)) and
        (@GroupID is null or exists(select 1 from [dbo].[yaf_UserGroup] x where x.UserID=a.UserID and x.GroupID=@GroupID)) and
        (@RankID is null or a.RankID=@RankID) AND
        -- user is not guest
        ISNULL(a.Flags & 4,0) <> 4
            AND
        (LOWER(a.DisplayName) LIKE CASE 
            WHEN (@BeginsWith = 0 AND @Literals IS NOT NULL AND LEN(@Literals) > 0) THEN '%' + LOWER(@Literals) + '%' 
            WHEN (@BeginsWith = 1 AND @Literals IS NOT NULL AND LEN(@Literals) > 0) THEN LOWER(@Literals) + '%'
            ELSE '%' END  
            or
         LOWER(a.Name) LIKE CASE 
            WHEN (@BeginsWith = 0 AND @Literals IS NOT NULL AND LEN(@Literals) > 0) THEN '%' + LOWER(@Literals) + '%' 
            WHEN (@BeginsWith = 1 AND @Literals IS NOT NULL AND LEN(@Literals) > 0) THEN LOWER(@Literals) + '%'
            ELSE '%' END) 
        and
        (a.NumPosts >= (case 
        when @NumPostsCompare = 3 then  @NumPosts end) 
        OR a.NumPosts <= (case 
        when @NumPostsCompare = 2 then @NumPosts end) OR
        a.NumPosts = (case 
        when @NumPostsCompare = 1 then @NumPosts end))
      )	  
      select 
            a.*,			
            CultureUser = a.Culture,
            IsAdmin = (select COUNT(1) from [dbo].[yaf_UserGroup] x join [dbo].[yaf_Group] y on y.GroupID=x.GroupID where x.UserID=a.UserID and (y.Flags & 1)<>0),
            IsHostAdmin	= ISNULL(a.Flags & 1,0),
            b.RankID,
            RankName = b.Name,
            Style = case(@StyledNicks)
            when 1 then  a.UserStyle
            else ''	 end,
            TotalCount =  @TotalRows 
            from 
            UserIds ti inner join
            [dbo].[yaf_User] a with(nolock)
            on a.UserID = ti.UserID
            join [dbo].[yaf_Rank] b with(nolock) on b.RankID=a.RankID	
    
    where ti.RowNum between @FirstSelectRowNumber and @LastSelectRowNumber
        order by
            RowNum ASC;  
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_listmedals]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[yaf_user_listmedals]
    @UserID	int
as begin
        (select
        a.[MedalID],
        a.[Name],
        isnull(b.[Message], a.[Message]) as [Message],
        a.[MedalURL],
        a.[RibbonURL],
        a.[SmallMedalURL],
        isnull(a.[SmallRibbonURL], a.[SmallMedalURL]) as [SmallRibbonURL],
        a.[SmallMedalWidth],
        a.[SmallMedalHeight],
        isnull(a.[SmallRibbonWidth], a.[SmallMedalWidth]) as [SmallRibbonWidth],
        isnull(a.[SmallRibbonHeight], a.[SmallMedalHeight]) as [SmallRibbonHeight],
        [dbo].[yaf_medal_getsortorder](b.[SortOrder],a.[SortOrder],a.[Flags]) as [SortOrder],
        [dbo].[yaf_medal_gethide](b.[Hide],a.[Flags]) as [Hide],
        [dbo].[yaf_medal_getribbonsetting](a.[SmallRibbonURL],a.[Flags],b.[OnlyRibbon]) as [OnlyRibbon],
        a.[Flags],
        b.[DateAwarded]
    from
        [dbo].[yaf_Medal] a
        inner join [dbo].[yaf_UserMedal] b on a.[MedalID] = b.[MedalID]
    where
        b.[UserID] = @UserID)

    union

    (select
        a.[MedalID],
        a.[Name],
        isnull(b.[Message], a.[Message]) as [Message],
        a.[MedalURL],
        a.[RibbonURL],
        a.[SmallMedalURL],
        isnull(a.[SmallRibbonURL], a.[SmallMedalURL]) as [SmallRibbonURL],
        a.[SmallMedalWidth],
        a.[SmallMedalHeight],
        isnull(a.[SmallRibbonWidth], a.[SmallMedalWidth]) as [SmallRibbonWidth],
        isnull(a.[SmallRibbonHeight], a.[SmallMedalHeight]) as [SmallRibbonHeight],
        [dbo].[yaf_medal_getsortorder](b.[SortOrder],a.[SortOrder],a.[Flags]) as [SortOrder],
        [dbo].[yaf_medal_gethide](b.[Hide],a.[Flags]) as [Hide],
        [dbo].[yaf_medal_getribbonsetting](a.[SmallRibbonURL],a.[Flags],b.[OnlyRibbon]) as [OnlyRibbon],
        a.[Flags],
        NULL as [DateAwarded]
    from
        [dbo].[yaf_Medal] a
        inner join [dbo].[yaf_GroupMedal] b on a.[MedalID] = b.[MedalID]
        inner join [dbo].[yaf_UserGroup] c on b.[GroupID] = c.[GroupID]
    where
        c.[UserID] = @UserID)
    order by
        [OnlyRibbon] desc,
        [SortOrder] asc

end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_savestyle]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_savestyle](@GroupID int, @RankID int)  as

begin
-- loop thru users to sync styles

 /*   declare @usridtmp int 
    declare @styletmp varchar(255)      
        declare c cursor for
            select us.UserID, us.NewUserStyle from (
                select uu.UserID, uu.UserStyle, NewUserStyle = ISNULL(
                    (SELECT TOP 1 f.Style FROM [dbo].[yaf_UserGroup] e WITH (NOLOCK) join [dbo].[yaf_Group] f WITH (NOLOCK) on f.GroupID=e.GroupID WHERE e.UserID=uu.UserID AND f.Style != '' ORDER BY f.SortOrder),
                    (SELECT TOP 1 r.Style FROM [dbo].[yaf_Rank] r WITH (NOLOCK) where RankID = uu.RankID))
                from [dbo].[yaf_User] uu WITH (NOLOCK)
                JOIN [dbo].[yaf_UserGroup] ug WITH (NOLOCK) ON ug.UserID = uu.UserID
                where
                (@RankID IS NULL OR uu.RankID = @RankID) AND
                (@GroupID IS NULL OR ug.GroupID = @GroupID)) us
            where us.UserStyle != us.NewUserStyle 
        FOR UPDATE -- OF UserStyle
        open c
        
        fetch next from c into @usridtmp, @styletmp
        while @@FETCH_STATUS = 0
        begin      
            UPDATE [dbo].[yaf_User] SET UserStyle = @styletmp  WHERE UserID = @usridtmp  -- CURRENT OF c 	 			            
            fetch next from c into @usridtmp, @styletmp     
        end
        close c
        deallocate c  
        */
        update d
        set    d.UserStyle = ISNULL((select top 1 f.Style FROM [dbo].[yaf_UserGroup] e 
                                     join [dbo].[yaf_Group] f on f.GroupID=e.GroupID 
                                     WHERE f.Style IS NOT NULL and e.UserID = d.UserID order by f.SortOrder),
                                    (SELECT TOP 1 r.Style FROM [dbo].[yaf_Rank] r 
                                    join [dbo].[yaf_User] u on u.RankID = r.RankID 
                                    where u.UserID = d.UserID ))	    
        from  [dbo].[yaf_User] d; 
    
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_group_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_group_save](
    @GroupID		int,
    @BoardID		int,
    @Name			nvarchar(255),
    @IsAdmin		bit,
    @IsGuest		bit,
    @IsStart		bit,
    @IsModerator	bit,   
    @AccessMaskID	int=null,
    @PMLimit int=null,
    @Style nvarchar(255)=null,
    @SortOrder smallint,
    @Description nvarchar(128)=null,
    @UsrSigChars int=null,
    @UsrSigBBCodes	nvarchar(255)=null,
    @UsrSigHTMLTags nvarchar(255)=null,
    @UsrAlbums int=null,
    @UsrAlbumImages int=null
) as
begin
        declare @Flags	int
    
    set @Flags = 0
    if @IsAdmin<>0 set @Flags = @Flags | 1
    if @IsGuest<>0 set @Flags = @Flags | 2
    if @IsStart<>0 set @Flags = @Flags | 4
    if @IsModerator<>0 set @Flags = @Flags | 8
    if @Style IS NOT NULL AND LEN(@Style) <=2 set @Style = NULL

    if @GroupID>0 begin
        update [dbo].[yaf_Group] set
            Name = @Name,
            Flags = @Flags,
            PMLimit = @PMLimit,
            Style = @Style,
            SortOrder = @SortOrder,
            Description = @Description,
            UsrSigChars = @UsrSigChars,
            UsrSigBBCodes = @UsrSigBBCodes,
            UsrSigHTMLTags = @UsrSigHTMLTags,
            UsrAlbums = @UsrAlbums,
            UsrAlbumImages = @UsrAlbumImages 
        where GroupID = @GroupID
    end
    else begin
        insert into [dbo].[yaf_Group](Name,BoardID,Flags,PMLimit,Style, SortOrder,Description,UsrSigChars,UsrSigBBCodes,UsrSigHTMLTags,UsrAlbums,UsrAlbumImages)
        values(@Name,@BoardID,@Flags,@PMLimit,@Style,@SortOrder,@Description,@UsrSigChars,@UsrSigBBCodes,@UsrSigHTMLTags,@UsrAlbums,@UsrAlbumImages);
        set @GroupID = SCOPE_IDENTITY()
        insert into [dbo].[yaf_ForumAccess](GroupID,ForumID,AccessMaskID)
        select @GroupID,a.ForumID,@AccessMaskID from [dbo].[yaf_Forum] a join [dbo].[yaf_Category] b on b.CategoryID=a.CategoryID where b.BoardID=@BoardID
    end	 
    -- group styles override rank styles
    IF @Style IS NOT NULL AND len(@Style) > 2
      BEGIN
      EXEC [dbo].[yaf_user_savestyle] @GroupID,null
      END	
 
    
          
    select GroupID = @GroupID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_removepoints]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_user_removepoints] (@UserID int, @FromUserID int = null, @UTCTIMESTAMP datetime, @Points int) AS
BEGIN
    
    UPDATE [dbo].[yaf_User] SET Points = Points - @Points WHERE UserID = @UserID

    IF @FromUserID IS NOT NULL 
    BEGIN
        declare	@VoteDate datetime
    set @VoteDate = (select top 1 VoteDate from [dbo].[yaf_ReputationVote] where ReputationFromUserID=@FromUserID AND ReputationToUserID=@UserID)
    IF @VoteDate is not null
    begin	     
          update [dbo].[yaf_ReputationVote] set VoteDate=@UTCTIMESTAMP where VoteDate = @VoteDate AND ReputationFromUserID=@FromUserID AND ReputationToUserID=@UserID
    end
    ELSE
      begin
          insert into [dbo].[yaf_ReputationVote](ReputationFromUserID,ReputationToUserID,VoteDate)
          values (@FromUserID, @UserID, @UTCTIMESTAMP)
      end
    END
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_usergroup_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_usergroup_save](@UserID int,@GroupID int,@Member bit) as
begin
    
    if @Member=0
    begin
        delete from [dbo].[yaf_UserGroup] where UserID=@UserID and GroupID=@GroupID
    end 
    else
    begin
        insert into [dbo].[yaf_UserGroup](UserID,GroupID)
        select @UserID,@GroupID
        where not exists(select 1 from [dbo].[yaf_UserGroup] where UserID=@UserID and GroupID=@GroupID)
        UPDATE [dbo].[yaf_User] SET UserStyle= ISNULL(( SELECT TOP 1 f.Style FROM [dbo].[yaf_UserGroup] e 
        join [dbo].[yaf_Group] f on f.GroupID=e.GroupID WHERE e.UserID=@UserID AND f.Style IS NOT NULL ORDER BY f.SortOrder), (SELECT TOP 1 r.Style FROM [dbo].[yaf_Rank] r where r.RankID = [dbo].[yaf_User].RankID)) 
        WHERE UserID = @UserID    	
    end  
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_usergroup_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_usergroup_list](@UserID int) as begin
    
    select 
        b.GroupID,
        b.Name,
        b.Style
    from
        [dbo].[yaf_UserGroup] a
        join [dbo].[yaf_Group] b on b.GroupID=a.GroupID
    where
        a.UserID = @UserID
    order by
        b.Name
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_thankfromcount]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_user_thankfromcount]
(@UserID int) as
begin
        SELECT COUNT(TH.ThanksID) 
        FROM [dbo].[yaf_Thanks] AS TH WHERE (TH.ThanksToUserID=@UserID)
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_thankedmessage]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_user_thankedmessage]
(@MessageID int, @UserID int) as
begin
        SELECT COUNT(TH.ThanksID)
        FROM [dbo].[yaf_Thanks] AS TH WHERE (TH.MessageID=@MessageID) AND (TH.ThanksFromUserID = @UserID)
end
GO
/****** Object:  Table [dbo].[yaf_UserPMessage]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaf_UserPMessage](
	[UserPMessageID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PMessageID] [int] NOT NULL,
	[Flags] [int] NOT NULL,
	[IsRead]  AS (CONVERT([bit],sign([Flags]&(1)),(0))),
	[IsInOutbox]  AS (CONVERT([bit],sign([Flags]&(2)),(0))),
	[IsArchived]  AS (CONVERT([bit],sign([Flags]&(4)),(0))),
	[IsDeleted]  AS (CONVERT([bit],sign([Flags]&(8)),(0))),
	[IsReply] [bit] NOT NULL,
 CONSTRAINT [PK_yaf_UserPMessage] PRIMARY KEY CLUSTERED 
(
	[UserPMessageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_yaf_UserPMessage_UserID] ON [dbo].[yaf_UserPMessage] 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_user_delete](@UserID int) as
begin
    
    declare @GuestUserID	int
    declare @UserName		nvarchar(255)
    declare @UserDisplayName		nvarchar(255)
    declare @GuestCount		int

    select @UserName = Name, @UserDisplayName = DisplayName from [dbo].[yaf_User] where UserID=@UserID

    select top 1
        @GuestUserID = a.UserID
    from
        [dbo].[yaf_User] a
        inner join [dbo].[yaf_UserGroup] b on b.UserID = a.UserID
        inner join [dbo].[yaf_Group] c on b.GroupID = c.GroupID
    where
        (c.Flags & 2)<>0

    select 
        @GuestCount = count(1) 
    from 
        [dbo].[yaf_UserGroup] a
        join [dbo].[yaf_Group] b on b.GroupID=a.GroupID
    where
        (b.Flags & 2)<>0

    if @GuestUserID=@UserID and @GuestCount=1 begin
        return
    end

    update [dbo].[yaf_Message] set UserName=@UserName,UserDisplayName=@UserDisplayName,UserID=@GuestUserID where UserID=@UserID
    update [dbo].[yaf_Topic] set UserName=@UserName,UserDisplayName=@UserDisplayName,UserID=@GuestUserID where UserID=@UserID
    update [dbo].[yaf_Topic] set LastUserName=@UserName,LastUserDisplayName=@UserDisplayName,LastUserID=@GuestUserID where LastUserID=@UserID
    update [dbo].[yaf_Forum] set LastUserName=@UserName,LastUserDisplayName=@UserDisplayName,LastUserID=@GuestUserID where LastUserID=@UserID

    delete from [dbo].[yaf_Active] where UserID=@UserID
    delete from [dbo].[yaf_EventLog] where UserID=@UserID	
    delete from [dbo].[yaf_UserPMessage] where UserID=@UserID
    delete from [dbo].[yaf_PMessage] where FromUserID=@UserID AND PMessageID NOT IN (select PMessageID FROM [dbo].[yaf_PMessage])
    -- Delete all the thanks entries associated with this UserID.
    delete from [dbo].[yaf_Thanks] where ThanksFromUserID=@UserID OR ThanksToUserID=@UserID
    -- Delete all the FavoriteTopic entries associated with this UserID.
    delete from [dbo].[yaf_FavoriteTopic] where UserID=@UserID
    -- Delete all the Buddy relations between this user and other users.
    delete from [dbo].[yaf_Buddy] where FromUserID=@UserID   
    delete from [dbo].[yaf_Buddy] where ToUserID=@UserID	 
    -- set messages as from guest so the User can be deleted
    update [dbo].[yaf_PMessage] SET FromUserID = @GuestUserID WHERE FromUserID = @UserID
    delete from [dbo].[yaf_CheckEmail] where UserID = @UserID
    delete from [dbo].[yaf_WatchTopic] where UserID = @UserID
    delete from [dbo].[yaf_WatchForum] where UserID = @UserID
    delete from [dbo].[yaf_TopicReadTracking] where UserID = @UserID
    delete from [dbo].[yaf_ForumReadTracking] where UserID = @UserID
	delete from [dbo].[yaf_UserAlbum] where UserID = @UserID
    delete from [dbo].[yaf_ReputationVote] where ReputationFromUserID = @UserID
	delete from [dbo].[yaf_ReputationVote] where ReputationToUserID = @UserID
    delete from [dbo].[yaf_UserGroup] where UserID = @UserID
    -- ABOT CHANGED
    -- Delete UserForums entries Too 
    delete from [dbo].[yaf_UserForum] where UserID = @UserID
    delete from [dbo].[yaf_IgnoreUser] where UserID = @UserID OR IgnoredUserID = @UserID
    --END ABOT CHANGED 09.04.2004
    delete from [dbo].[yaf_AdminPageUserAccess] where UserID = @UserID
    delete from [dbo].[yaf_User] where UserID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_userpmessage_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_userpmessage_list](@UserPMessageID int) as
begin
    
    SELECT
        a.*,
        FromUser = b.Name,
        ToUserID = c.UserID,
        ToUser = c.Name,
        d.IsRead,
        d.IsReply,
        d.UserPMessageID
    FROM
        [dbo].[yaf_PMessage] a
        INNER JOIN [dbo].[yaf_UserPMessage] d ON d.PMessageID = a.PMessageID
        INNER JOIN [dbo].[yaf_User] b ON b.UserID = a.FromUserID
        inner join [dbo].[yaf_User] c ON c.UserID = d.UserID
    WHERE
        d.UserPMessageID = @UserPMessageID
    AND
        d.IsDeleted=0
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_userpmessage_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_userpmessage_delete](@UserPMessageID int) as
begin
    
    delete from [dbo].[yaf_UserPMessage] where UserPMessageID=@UserPMessageID
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_pmcount]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[yaf_user_pmcount]
    (@UserID int) 
AS
BEGIN
        DECLARE @CountIn int	
        DECLARE @CountOut int
        DECLARE @CountArchivedIn int		
        DECLARE @plimit1 int        
        DECLARE @pcount int
        
      set @plimit1 = (SELECT TOP 1 (c.PMLimit) FROM [dbo].[yaf_User] a 
                        JOIN [dbo].[yaf_UserGroup] b
                          ON a.UserID = b.UserID
                            JOIN [dbo].[yaf_Group] c                         
                              ON b.GroupID = c.GroupID WHERE a.UserID = @UserID ORDER BY c.PMLimit DESC)
      set @pcount = (SELECT TOP 1 c.PMLimit FROM [dbo].[yaf_Rank] c 
                        JOIN [dbo].[yaf_User] d
                           ON c.RankID = d.RankID WHERE d.UserID = @UserID ORDER BY c.PMLimit DESC)
      if (@plimit1 > @pcount) 
      begin
      set @pcount = @plimit1      
      end 
      
    -- get count of pm's in user's sent items
    
    SELECT 
        @CountOut=COUNT(1) 
    FROM 
        [dbo].[yaf_UserPMessage] a
    INNER JOIN [dbo].[yaf_PMessage] b ON a.PMessageID=b.PMessageID
    WHERE 
        (a.Flags & 2)<>0 AND 
        b.FromUserID = @UserID
    -- get count of pm's in user's  received items
    SELECT 
        @CountIn=COUNT(1) 
    FROM 
    [dbo].[yaf_PMessage] a
    INNER JOIN
    [dbo].[yaf_UserPMessage] b ON a.PMessageID = b.PMessageID
    WHERE b.IsDeleted = 0  
         AND b.IsArchived=0  
         -- ToUserID
         AND b.[UserID] = @UserID
    
    SELECT 
        @CountArchivedIn=COUNT(1) 
    FROM 
    [dbo].[yaf_PMessage] a
    INNER JOIN
    [dbo].[yaf_UserPMessage] b ON a.PMessageID = b.PMessageID
        WHERE
        b.IsArchived <>0 AND
        -- ToUserID
        b.[UserID] = @UserID

    -- return all pm data
    SELECT 
        NumberIn = @CountIn,
        NumberOut =  @CountOut,
        NumberTotal = @CountIn + @CountOut + @CountArchivedIn,
        NumberArchived =@CountArchivedIn,
        NumberAllowed = @pcount
            

END
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_lazydata]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_user_lazydata](
    @UserID	int,
    @BoardID int,
    @ShowPendingMails bit = 0,
    @ShowPendingBuddies bit = 0,
    @ShowUnreadPMs bit = 0,
    @ShowUserAlbums bit = 0,
    @ShowUserStyle bit = 0
    
) as
begin 
    declare 
    @G_UsrAlbums int,
    @R_UsrAlbums int,
    @R_Style varchar(255),
    @G_Style varchar(255) 	
    
        
    IF (@ShowUserAlbums > 0)
    BEGIN	
    SELECT @G_UsrAlbums = ISNULL(MAX(c.UsrAlbums),0)
    FROM [dbo].[yaf_User] a 
                        JOIN [dbo].[yaf_UserGroup] b
                          ON a.UserID = b.UserID
                            JOIN [dbo].[yaf_Group] c                         
                              ON b.GroupID = c.GroupID 
                               WHERE a.UserID = @UserID 
                                 AND a.BoardID = @BoardID
                                 
    SELECT  @R_UsrAlbums = ISNULL(MAX(c.UsrAlbums),0)
    FROM [dbo].[yaf_Rank] c 
                                JOIN [dbo].[yaf_User] d
                                  ON c.RankID = d.RankID WHERE d.UserID = @UserID 
                                    AND d.BoardID = @BoardID 
    END 	
    ELSE	
    BEGIN
    SET @G_UsrAlbums = 0
    SET @R_UsrAlbums = 0
    END
    
                                                                 

    -- return information
    select TOP 1		
        a.ProviderUserKey,
        UserFlags			= a.Flags,
        UserName			= a.Name,
        DisplayName			= a.DisplayName,
        Suspended			= a.Suspended,
        ThemeFile			= a.ThemeFile,
        LanguageFile		= a.LanguageFile,
        TextEditor		    = a.TextEditor,
        TimeZoneUser		= a.TimeZone,
        CultureUser		    = a.Culture,		
        IsGuest				= SIGN(a.IsGuest),
        IsDirty				= SIGN(a.IsDirty),
        IsFacebookUser      = a.IsFacebookUser,
        IsTwitterUser       = a.IsTwitterUser,
        MailsPending		= CASE WHEN @ShowPendingMails > 0 THEN (select count(1) from [dbo].[yaf_Mail] WHERE [ToUserName] = a.Name) ELSE 0 END,
        UnreadPrivate		= CASE WHEN @ShowUnreadPMs > 0 THEN (select count(1) from [dbo].[yaf_UserPMessage] where UserID=@UserID and IsRead=0 and IsDeleted = 0 and IsArchived = 0) ELSE 0 END,
        LastUnreadPm		= CASE WHEN @ShowUnreadPMs > 0 THEN (SELECT TOP 1 Created FROM [dbo].[yaf_PMessage] pm INNER JOIN [dbo].[yaf_UserPMessage] upm ON pm.PMessageID = upm.PMessageID WHERE upm.UserID=@UserID and upm.IsRead=0  and upm.IsDeleted = 0 and upm.IsArchived = 0 ORDER BY pm.Created DESC) ELSE NULL END,		
        PendingBuddies      = CASE WHEN @ShowPendingBuddies > 0 THEN (SELECT COUNT(ID) FROM [dbo].[yaf_Buddy] WHERE ToUserID = @UserID AND Approved = 0) ELSE 0 END,
        LastPendingBuddies	= CASE WHEN @ShowPendingBuddies > 0 THEN (SELECT TOP 1 Requested FROM [dbo].[yaf_Buddy] WHERE ToUserID=@UserID and Approved = 0 ORDER BY Requested DESC) ELSE NULL END,
        UserStyle 		    = CASE WHEN @ShowUserStyle > 0 THEN (select top 1 usr.[UserStyle] from [dbo].[yaf_User] usr with(nolock) where usr.UserID = @UserID) ELSE '' END,			
        NumAlbums  = (SELECT COUNT(1) FROM [dbo].[yaf_UserAlbum] ua
        WHERE ua.UserID = @UserID),
        UsrAlbums  = (CASE WHEN @G_UsrAlbums > @R_UsrAlbums THEN @G_UsrAlbums ELSE @R_UsrAlbums END),
        UserHasBuddies  = SIGN(ISNULL((SELECT TOP 1 1 FROM [dbo].[yaf_Buddy] WHERE [FromUserID] = @UserID OR [ToUserID] = @UserID),0)),
        -- Guest can't vote in polls attached to boards, we need some temporary access check by a criteria 
        BoardVoteAccess	= (CASE WHEN a.Flags & 4 > 0 THEN 0 ELSE 1 END),
        Reputation         = a.Points
        from
           [dbo].[yaf_User] a		
        where
        a.UserID = @UserID
     end
GO
/****** Object:  StoredProcedure [dbo].[yaf_user_approveall]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[yaf_user_approveall](@BoardID int) as
begin
        
    DECLARE userslist CURSOR FOR 
        SELECT UserID FROM [dbo].[yaf_User] WHERE BoardID=@BoardID AND (Flags & 2)=0
        FOR READ ONLY


    OPEN userslist

    DECLARE @UserID int

    FETCH userslist INTO @UserID

    WHILE @@FETCH_STATUS = 0
    BEGIN
        EXEC [dbo].[yaf_user_approve] @UserID
        FETCH userslist INTO @UserID		
    END

    CLOSE userslist

end
GO
/****** Object:  StoredProcedure [dbo].[yaf_rank_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_rank_save](
    @RankID		int,
    @BoardID	int,
    @Name		nvarchar(50),
    @IsStart	bit,
    @IsLadder	bit,
    @MinPosts	int,
    @RankImage	nvarchar(50)=null,
    @PMLimit    int,
    @Style      nvarchar(255)=null,
    @SortOrder  smallint,
    @Description nvarchar(128)=null,
    @UsrSigChars int=null,
    @UsrSigBBCodes	nvarchar(255)=null,
    @UsrSigHTMLTags nvarchar(255)=null,
    @UsrAlbums int=null,
    @UsrAlbumImages int=null  
) as
begin
        declare @Flags int

    if @IsLadder=0 set @MinPosts = null
    if @IsLadder=1 and @MinPosts is null set @MinPosts = 0
    
    set @Flags = 0
    if @IsStart<>0 set @Flags = @Flags | 1
    if @IsLadder<>0 set @Flags = @Flags | 2

    if @Style IS NOT NULL AND LEN(@Style) <=2 set @Style = NULL

    if @RankID>0 begin
        update [dbo].[yaf_Rank] set
            Name = @Name,
            Flags = @Flags,
            MinPosts = @MinPosts,
            RankImage = @RankImage,
            PMLimit = @PMLimit,
            Style = @Style,
            SortOrder = @SortOrder,
            [Description] = @Description,
            UsrSigChars = @UsrSigChars,
            UsrSigBBCodes = @UsrSigBBCodes,
            UsrSigHTMLTags = @UsrSigHTMLTags,
            UsrAlbums = @UsrAlbums,
            UsrAlbumImages = @UsrAlbumImages
        where RankID = @RankID
    end
    else begin
        insert into [dbo].[yaf_Rank](BoardID,Name,Flags,MinPosts,RankImage, PMLimit,Style,SortOrder,Description,UsrSigChars,UsrSigBBCodes,UsrSigHTMLTags,UsrAlbums,UsrAlbumImages)
        values(@BoardID,@Name,@Flags,@MinPosts,@RankImage,@PMLimit,@Style,@SortOrder,@Description,@UsrSigChars,@UsrSigBBCodes,@UsrSigHTMLTags,@UsrAlbums,@UsrAlbumImages);
        set @RankID = SCOPE_IDENTITY()
        -- select @RankID = RankID from [dbo].[yaf_Rank] where RankID = @@Identity;
    end	
        -- group styles override rank styles
 IF @Style IS NOT NULL AND len(@Style) > 2
      BEGIN
      EXEC [dbo].[yaf_user_savestyle] null,@RankID
      END	
        
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_pmessage_save]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_pmessage_save](
    @FromUserID	int,
    @ToUserID	int,
    @Subject	nvarchar(100),
    @Body		ntext,
    @Flags		int,
    @ReplyTo    int,
    @UTCTIMESTAMP datetime
) as
begin
    declare @PMessageID int
    declare @UserID int     
    
    IF @ReplyTo<0
    begin
        insert into [dbo].[yaf_PMessage](FromUserID,Created,Subject,Body,Flags)
        values(@FromUserID,@UTCTIMESTAMP ,@Subject,@Body,@Flags)
    end
    else
    begin
        insert into [dbo].[yaf_PMessage](FromUserID,Created,Subject,Body,Flags,ReplyTo)
        values(@FromUserID,@UTCTIMESTAMP ,@Subject,@Body,@Flags,@ReplyTo)

        UPDATE [dbo].[yaf_UserPMessage] SET [IsReply] = (1) WHERE PMessageID = @ReplyTo
    end

    set @PMessageID = SCOPE_IDENTITY()
    if (@ToUserID = 0)
    begin
        insert into [dbo].[yaf_UserPMessage](UserID,PMessageID,Flags)
        select
                a.UserID,@PMessageID,2
        from
                [dbo].[yaf_User] a
                join [dbo].[yaf_UserGroup] b on b.UserID=a.UserID
                join [dbo].[yaf_Group] c on c.GroupID=b.GroupID where
                (c.Flags & 2)=0 and
                c.BoardID=(select BoardID from [dbo].[yaf_User] x where x.UserID=@FromUserID) and a.UserID<>@FromUserID
        group by
                a.UserID
    end
    else
    begin
        insert into [dbo].[yaf_UserPMessage](UserID,PMessageID,Flags) values(@ToUserID,@PMessageID,2)
    end	
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_pmessage_prune]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yaf_pmessage_prune](@DaysRead int,@DaysUnread int,@UTCTIMESTAMP datetime) as
begin
        delete from [dbo].[yaf_UserPMessage]
    where IsRead<>0
    and datediff(dd,(select Created from [dbo].[yaf_PMessage] x where x.PMessageID=[dbo].[yaf_UserPMessage].PMessageID),@UTCTIMESTAMP )>@DaysRead

    delete from [dbo].[yaf_UserPMessage]
    where IsRead=0
    and datediff(dd,(select Created from [dbo].[yaf_PMessage] x where x.PMessageID=[dbo].[yaf_UserPMessage].PMessageID),@UTCTIMESTAMP )>@DaysUnread

    delete from [dbo].[yaf_PMessage]
    where not exists(select 1 from [dbo].[yaf_UserPMessage] x where x.PMessageID=[dbo].[yaf_PMessage].PMessageID)
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_pmessage_markread]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_pmessage_markread](@UserPMessageID int=null)
AS
BEGIN
        UPDATE [dbo].[yaf_UserPMessage] SET [Flags] = [Flags] | 1 WHERE UserPMessageID = @UserPMessageID AND IsRead = 0
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_pmessage_list]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_pmessage_list](@FromUserID int=null,@ToUserID int=null,@UserPMessageID int=null) AS
BEGIN				
        SELECT
    a.ReplyTo, a.PMessageID, b.UserPMessageID, a.FromUserID, d.[Name] AS FromUser, 
    b.[UserID] AS ToUserId, c.[Name] AS ToUser, a.Created, a.[Subject], 
    a.Body, a.Flags, b.IsRead,b.IsReply, b.IsInOutbox, b.IsArchived, b.IsDeleted
FROM
    [dbo].[yaf_PMessage] a
INNER JOIN
    [dbo].[yaf_UserPMessage] b ON a.PMessageID = b.PMessageID
INNER JOIN
    [dbo].[yaf_User] c ON b.UserID = c.UserID
INNER JOIN
    [dbo].[yaf_User] d ON a.FromUserID = d.UserID	
        WHERE	((@UserPMessageID IS NOT NULL AND b.UserPMessageID=@UserPMessageID) OR 
                 (@ToUserID   IS NOT NULL AND b.[UserID]  = @ToUserID) OR (@FromUserID IS NOT NULL AND a.FromUserID = @FromUserID))		
        ORDER BY Created DESC
END
GO
/****** Object:  StoredProcedure [dbo].[yaf_pmessage_info]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_pmessage_info] as
begin
        select
        NumRead	= (select count(1) from [dbo].[yaf_UserPMessage] WHERE IsRead<>0  AND IsDeleted<>1),
        NumUnread = (select count(1) from [dbo].[yaf_UserPMessage] WHERE IsRead=0  AND IsDeleted<>1),
        NumTotal = (select count(1) from [dbo].[yaf_UserPMessage] WHERE IsDeleted<>1)
end
GO
/****** Object:  StoredProcedure [dbo].[yaf_pmessage_delete]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_pmessage_delete](@UserPMessageID int, @FromOutbox bit = 0) as
BEGIN
        DECLARE @PMessageID int

    SET @PMessageID = (SELECT TOP 1 PMessageID FROM [dbo].[yaf_UserPMessage] where UserPMessageID = @UserPMessageID);
        
    IF ( @FromOutbox = 1 AND EXISTS(SELECT (1) FROM [dbo].[yaf_UserPMessage] WHERE UserPMessageID = @UserPMessageID AND IsInOutbox = 1 ) )
    BEGIN
        -- remove IsInOutbox bit which will remove it from the senders outbox
        UPDATE [dbo].[yaf_UserPMessage] SET [Flags] = ([Flags] ^ 2) WHERE UserPMessageID = @UserPMessageID
    END
    
    IF ( @FromOutbox = 0 )
    BEGIN
            -- The pmessage is in archive but still is in sender outbox  
    IF ( EXISTS(SELECT (1) FROM [dbo].[yaf_UserPMessage] WHERE UserPMessageID = @UserPMessageID AND IsInOutbox = 1 AND IsArchived = 1 AND IsDeleted = 0) )
    BEGIN
    -- Remove archive flag and set IsDeleted flag
    UPDATE [dbo].[yaf_UserPMessage] SET [Flags] = [Flags] ^ 4  WHERE UserPMessageID = @UserPMessageID AND IsArchived = 1	
    END
        -- set is deleted...
        UPDATE [dbo].[yaf_UserPMessage] SET [Flags] = ([Flags] ^ 8) WHERE UserPMessageID = @UserPMessageID
    END	
    
    -- see if there are no longer references to this PM.
    IF ( EXISTS(SELECT (1) FROM [dbo].[yaf_UserPMessage] WHERE UserPMessageID = @UserPMessageID AND IsInOutbox = 0 AND IsDeleted = 1 ) )
    BEGIN
        -- delete
        DELETE FROM [dbo].[yaf_UserPMessage] WHERE [PMessageID] = @PMessageID
        DELETE FROM [dbo].[yaf_PMessage] WHERE [PMessageID] = @PMessageID
    END	

END
GO
/****** Object:  StoredProcedure [dbo].[yaf_pmessage_archive]    Script Date: 05/18/2015 09:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yaf_pmessage_archive](@UserPMessageID int = NULL) AS
BEGIN
        -- set IsArchived bit
    UPDATE [dbo].[yaf_UserPMessage] SET [Flags] = ([Flags] | 4) WHERE UserPMessageID = @UserPMessageID AND IsArchived = 0
END
GO
/****** Object:  Default [DF_yaf_Topic_Flags]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_Topic] ADD  CONSTRAINT [DF_yaf_Topic_Flags]  DEFAULT ((0)) FOR [Flags]
GO
/****** Object:  Default [DF_yaf_Message_IsModeratorChanged]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_Message] ADD  CONSTRAINT [DF_yaf_Message_IsModeratorChanged]  DEFAULT ((0)) FOR [IsModeratorChanged]
GO
/****** Object:  Default [DF_yaf_Forum_Flags]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_Forum] ADD  CONSTRAINT [DF_yaf_Forum_Flags]  DEFAULT ((0)) FOR [Flags]
GO
/****** Object:  Default [DF_yaf_Forum_IsModeratedNewTopicOnly]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_Forum] ADD  CONSTRAINT [DF_yaf_Forum_IsModeratedNewTopicOnly]  DEFAULT ((0)) FOR [IsModeratedNewTopicOnly]
GO
/****** Object:  Default [DF__yaf_Attac__Messa__68487DD7]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Attachment] ADD  DEFAULT ((0)) FOR [MessageID]
GO
/****** Object:  Default [DF__yaf_Attac__UserI__693CA210]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Attachment] ADD  DEFAULT ((0)) FOR [UserID]
GO
/****** Object:  Default [DF_yaf_User_OverridedefaultThemes]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_User] ADD  CONSTRAINT [DF_yaf_User_OverridedefaultThemes]  DEFAULT ((1)) FOR [OverridedefaultThemes]
GO
/****** Object:  Default [DF_yaf_User_PMNotification]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_User] ADD  CONSTRAINT [DF_yaf_User_PMNotification]  DEFAULT ((1)) FOR [PMNotification]
GO
/****** Object:  Default [DF_yaf_User_AutoWatchTopics]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_User] ADD  CONSTRAINT [DF_yaf_User_AutoWatchTopics]  DEFAULT ((0)) FOR [AutoWatchTopics]
GO
/****** Object:  Default [DF_yaf_User_DailyDigest]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_User] ADD  CONSTRAINT [DF_yaf_User_DailyDigest]  DEFAULT ((0)) FOR [DailyDigest]
GO
/****** Object:  Default [DF__yaf_User__Notifi__5629CD9C]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_User] ADD  DEFAULT ((10)) FOR [NotificationType]
GO
/****** Object:  Default [DF_yaf_User_Flags]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_User] ADD  CONSTRAINT [DF_yaf_User_Flags]  DEFAULT ((0)) FOR [Flags]
GO
/****** Object:  Default [DF_yaf_User_Points]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_User] ADD  CONSTRAINT [DF_yaf_User_Points]  DEFAULT ((1)) FOR [Points]
GO
/****** Object:  Default [DF_yaf_User_IsFacebookUser]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_User] ADD  CONSTRAINT [DF_yaf_User_IsFacebookUser]  DEFAULT ((0)) FOR [IsFacebookUser]
GO
/****** Object:  Default [DF_yaf_User_IsTwitterUser]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_User] ADD  CONSTRAINT [DF_yaf_User_IsTwitterUser]  DEFAULT ((0)) FOR [IsTwitterUser]
GO
/****** Object:  Default [DF_yaf_User_StyleFlags]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_User] ADD  CONSTRAINT [DF_yaf_User_StyleFlags]  DEFAULT ((0)) FOR [StyleFlags]
GO
/****** Object:  Default [DF_yaf_User_IsGoogleUser]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_User] ADD  CONSTRAINT [DF_yaf_User_IsGoogleUser]  DEFAULT ((0)) FOR [IsGoogleUser]
GO
/****** Object:  Default [DF__yaf_Messa__Repor__3E52440B]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_MessageReportedAudit] ADD  DEFAULT ((1)) FOR [ReportedNumber]
GO
/****** Object:  Default [DF_yaf_MessageHistory_IsModeratorChanged]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_MessageHistory] ADD  CONSTRAINT [DF_yaf_MessageHistory_IsModeratorChanged]  DEFAULT ((0)) FOR [IsModeratorChanged]
GO
/****** Object:  Default [DF_yaf_MessageHistory_Flags]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_MessageHistory] ADD  CONSTRAINT [DF_yaf_MessageHistory_Flags]  DEFAULT ((23)) FOR [Flags]
GO
/****** Object:  Default [DF_yaf_Poll_UserID]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Poll] ADD  CONSTRAINT [DF_yaf_Poll_UserID]  DEFAULT ((1)) FOR [UserID]
GO
/****** Object:  Default [DF_yaf_Poll_Flags]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Poll] ADD  CONSTRAINT [DF_yaf_Poll_Flags]  DEFAULT ((0)) FOR [Flags]
GO
/****** Object:  Default [DF_yaf_PollGroupCluster_Flags]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_PollGroupCluster] ADD  CONSTRAINT [DF_yaf_PollGroupCluster_Flags]  DEFAULT ((0)) FOR [Flags]
GO
/****** Object:  Default [DF_yaf_Rank_Flags]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Rank] ADD  CONSTRAINT [DF_yaf_Rank_Flags]  DEFAULT ((0)) FOR [Flags]
GO
/****** Object:  Default [DF_yaf_Rank_SortOrder]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Rank] ADD  CONSTRAINT [DF_yaf_Rank_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
/****** Object:  Default [DF_yaf_Rank_UsrSigChars]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Rank] ADD  CONSTRAINT [DF_yaf_Rank_UsrSigChars]  DEFAULT ((0)) FOR [UsrSigChars]
GO
/****** Object:  Default [DF_yaf_Rank_UsrAlbums]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Rank] ADD  CONSTRAINT [DF_yaf_Rank_UsrAlbums]  DEFAULT ((0)) FOR [UsrAlbums]
GO
/****** Object:  Default [DF_yaf_Rank_UsrAlbumImages]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Rank] ADD  CONSTRAINT [DF_yaf_Rank_UsrAlbumImages]  DEFAULT ((0)) FOR [UsrAlbumImages]
GO
/****** Object:  Default [DF_yaf_Mail_SendTries]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Mail] ADD  CONSTRAINT [DF_yaf_Mail_SendTries]  DEFAULT ((0)) FOR [SendTries]
GO
/****** Object:  Default [DF_yaf_Medal_defaultOrder]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Medal] ADD  CONSTRAINT [DF_yaf_Medal_defaultOrder]  DEFAULT ((255)) FOR [SortOrder]
GO
/****** Object:  Default [DF_yaf_Medal_Flags]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Medal] ADD  CONSTRAINT [DF_yaf_Medal_Flags]  DEFAULT ((0)) FOR [Flags]
GO
/****** Object:  Default [DF_yaf_Group_Flags]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Group] ADD  CONSTRAINT [DF_yaf_Group_Flags]  DEFAULT ((0)) FOR [Flags]
GO
/****** Object:  Default [DF_yaf_Group_PMLimit]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Group] ADD  CONSTRAINT [DF_yaf_Group_PMLimit]  DEFAULT ((0)) FOR [PMLimit]
GO
/****** Object:  Default [DF_yaf_Group_SortOrder]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Group] ADD  CONSTRAINT [DF_yaf_Group_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
/****** Object:  Default [DF_yaf_Group_UsrSigChars]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Group] ADD  CONSTRAINT [DF_yaf_Group_UsrSigChars]  DEFAULT ((0)) FOR [UsrSigChars]
GO
/****** Object:  Default [DF_yaf_Group_UsrAlbums]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Group] ADD  CONSTRAINT [DF_yaf_Group_UsrAlbums]  DEFAULT ((0)) FOR [UsrAlbums]
GO
/****** Object:  Default [DF_yaf_Group_UsrAlbumImages]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Group] ADD  CONSTRAINT [DF_yaf_Group_UsrAlbumImages]  DEFAULT ((0)) FOR [UsrAlbumImages]
GO
/****** Object:  Default [DF_yaf_AccessMask_Flags]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_AccessMask] ADD  CONSTRAINT [DF_yaf_AccessMask_Flags]  DEFAULT ((0)) FOR [Flags]
GO
/****** Object:  Default [DF__yaf_Acces__SortO__76969D2E]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_AccessMask] ADD  DEFAULT ((0)) FOR [SortOrder]
GO
/****** Object:  Default [DF_yaf_Replace_Words_BoardID]    Script Date: 05/18/2015 09:24:18 ******/
ALTER TABLE [dbo].[yaf_Replace_Words] ADD  CONSTRAINT [DF_yaf_Replace_Words_BoardID]  DEFAULT ((1)) FOR [BoardId]
GO
/****** Object:  Default [DF_yaf_ShoutboxMessage_BoardID]    Script Date: 05/18/2015 09:24:18 ******/
ALTER TABLE [dbo].[yaf_ShoutboxMessage] ADD  CONSTRAINT [DF_yaf_ShoutboxMessage_BoardID]  DEFAULT ((1)) FOR [BoardId]
GO
/****** Object:  Default [DF__yaf_Smile__SortO__4BAC3F29]    Script Date: 05/18/2015 09:24:18 ******/
ALTER TABLE [dbo].[yaf_Smiley] ADD  DEFAULT ((0)) FOR [SortOrder]
GO
/****** Object:  Default [DF_yaf_GroupMedal_Hide]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_GroupMedal] ADD  CONSTRAINT [DF_yaf_GroupMedal_Hide]  DEFAULT ((0)) FOR [Hide]
GO
/****** Object:  Default [DF_yaf_GroupMedal_OnlyRibbon]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_GroupMedal] ADD  CONSTRAINT [DF_yaf_GroupMedal_OnlyRibbon]  DEFAULT ((0)) FOR [OnlyRibbon]
GO
/****** Object:  Default [DF_yaf_GroupMedal_SortOrder]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_GroupMedal] ADD  CONSTRAINT [DF_yaf_GroupMedal_SortOrder]  DEFAULT ((255)) FOR [SortOrder]
GO
/****** Object:  Default [DF_yaf_UserMedal_Hide]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_UserMedal] ADD  CONSTRAINT [DF_yaf_UserMedal_Hide]  DEFAULT ((0)) FOR [Hide]
GO
/****** Object:  Default [DF_yaf_UserMedal_OnlyRibbon]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_UserMedal] ADD  CONSTRAINT [DF_yaf_UserMedal_OnlyRibbon]  DEFAULT ((0)) FOR [OnlyRibbon]
GO
/****** Object:  Default [DF_yaf_UserMedal_SortOrder]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_UserMedal] ADD  CONSTRAINT [DF_yaf_UserMedal_SortOrder]  DEFAULT ((255)) FOR [SortOrder]
GO
/****** Object:  Default [DF_yaf_Message_Flags]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_PMessage] ADD  CONSTRAINT [DF_yaf_Message_Flags]  DEFAULT ((23)) FOR [Flags]
GO
/****** Object:  Default [DF_yaf_EventLog_Type]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_EventLog] ADD  CONSTRAINT [DF_yaf_EventLog_Type]  DEFAULT ((0)) FOR [Type]
GO
/****** Object:  Default [DF_yaf_UserPMessage_Flags]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_UserPMessage] ADD  CONSTRAINT [DF_yaf_UserPMessage_Flags]  DEFAULT ((0)) FOR [Flags]
GO
/****** Object:  Default [DF__yaf_UserP__IsRep__03F0984C]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_UserPMessage] ADD  DEFAULT ((0)) FOR [IsReply]
GO
/****** Object:  ForeignKey [FK_yaf_WatchTopic_yaf_Topic]    Script Date: 05/18/2015 09:24:14 ******/
ALTER TABLE [dbo].[yaf_WatchTopic]  WITH CHECK ADD  CONSTRAINT [FK_yaf_WatchTopic_yaf_Topic] FOREIGN KEY([TopicID])
REFERENCES [dbo].[yaf_Topic] ([TopicID])
GO
ALTER TABLE [dbo].[yaf_WatchTopic] CHECK CONSTRAINT [FK_yaf_WatchTopic_yaf_Topic]
GO
/****** Object:  ForeignKey [FK_yaf_WatchTopic_yaf_User]    Script Date: 05/18/2015 09:24:14 ******/
ALTER TABLE [dbo].[yaf_WatchTopic]  WITH CHECK ADD  CONSTRAINT [FK_yaf_WatchTopic_yaf_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[yaf_User] ([UserID])
GO
ALTER TABLE [dbo].[yaf_WatchTopic] CHECK CONSTRAINT [FK_yaf_WatchTopic_yaf_User]
GO
/****** Object:  ForeignKey [FK_yaf_WatchForum_yaf_Forum]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_WatchForum]  WITH CHECK ADD  CONSTRAINT [FK_yaf_WatchForum_yaf_Forum] FOREIGN KEY([ForumID])
REFERENCES [dbo].[yaf_Forum] ([ForumID])
GO
ALTER TABLE [dbo].[yaf_WatchForum] CHECK CONSTRAINT [FK_yaf_WatchForum_yaf_Forum]
GO
/****** Object:  ForeignKey [FK_yaf_WatchForum_yaf_User]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_WatchForum]  WITH CHECK ADD  CONSTRAINT [FK_yaf_WatchForum_yaf_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[yaf_User] ([UserID])
GO
ALTER TABLE [dbo].[yaf_WatchForum] CHECK CONSTRAINT [FK_yaf_WatchForum_yaf_User]
GO
/****** Object:  ForeignKey [FK_yaf_UserForum_yaf_AccessMask]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_UserForum]  WITH CHECK ADD  CONSTRAINT [FK_yaf_UserForum_yaf_AccessMask] FOREIGN KEY([AccessMaskID])
REFERENCES [dbo].[yaf_AccessMask] ([AccessMaskID])
GO
ALTER TABLE [dbo].[yaf_UserForum] CHECK CONSTRAINT [FK_yaf_UserForum_yaf_AccessMask]
GO
/****** Object:  ForeignKey [FK_yaf_UserForum_yaf_Forum]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_UserForum]  WITH CHECK ADD  CONSTRAINT [FK_yaf_UserForum_yaf_Forum] FOREIGN KEY([ForumID])
REFERENCES [dbo].[yaf_Forum] ([ForumID])
GO
ALTER TABLE [dbo].[yaf_UserForum] CHECK CONSTRAINT [FK_yaf_UserForum_yaf_Forum]
GO
/****** Object:  ForeignKey [FK_yaf_UserForum_yaf_User]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_UserForum]  WITH CHECK ADD  CONSTRAINT [FK_yaf_UserForum_yaf_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[yaf_User] ([UserID])
GO
ALTER TABLE [dbo].[yaf_UserForum] CHECK CONSTRAINT [FK_yaf_UserForum_yaf_User]
GO
/****** Object:  ForeignKey [FK_yaf_TopicReadTracking_yaf_Topic]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_TopicReadTracking]  WITH CHECK ADD  CONSTRAINT [FK_yaf_TopicReadTracking_yaf_Topic] FOREIGN KEY([TopicID])
REFERENCES [dbo].[yaf_Topic] ([TopicID])
GO
ALTER TABLE [dbo].[yaf_TopicReadTracking] CHECK CONSTRAINT [FK_yaf_TopicReadTracking_yaf_Topic]
GO
/****** Object:  ForeignKey [FK_yaf_TopicReadTracking_yaf_User]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_TopicReadTracking]  WITH CHECK ADD  CONSTRAINT [FK_yaf_TopicReadTracking_yaf_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[yaf_User] ([UserID])
GO
ALTER TABLE [dbo].[yaf_TopicReadTracking] CHECK CONSTRAINT [FK_yaf_TopicReadTracking_yaf_User]
GO
/****** Object:  ForeignKey [FK_yaf_Topic_yaf_Forum]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_Topic]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Topic_yaf_Forum] FOREIGN KEY([ForumID])
REFERENCES [dbo].[yaf_Forum] ([ForumID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[yaf_Topic] CHECK CONSTRAINT [FK_yaf_Topic_yaf_Forum]
GO
/****** Object:  ForeignKey [FK_yaf_Topic_yaf_Message]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_Topic]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Topic_yaf_Message] FOREIGN KEY([LastMessageID])
REFERENCES [dbo].[yaf_Message] ([MessageID])
GO
ALTER TABLE [dbo].[yaf_Topic] CHECK CONSTRAINT [FK_yaf_Topic_yaf_Message]
GO
/****** Object:  ForeignKey [FK_yaf_Topic_yaf_PollGroupCluster]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_Topic]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Topic_yaf_PollGroupCluster] FOREIGN KEY([PollID])
REFERENCES [dbo].[yaf_PollGroupCluster] ([PollGroupID])
GO
ALTER TABLE [dbo].[yaf_Topic] CHECK CONSTRAINT [FK_yaf_Topic_yaf_PollGroupCluster]
GO
/****** Object:  ForeignKey [FK_yaf_Topic_yaf_Topic]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_Topic]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Topic_yaf_Topic] FOREIGN KEY([TopicMovedID])
REFERENCES [dbo].[yaf_Topic] ([TopicID])
GO
ALTER TABLE [dbo].[yaf_Topic] CHECK CONSTRAINT [FK_yaf_Topic_yaf_Topic]
GO
/****** Object:  ForeignKey [FK_yaf_Topic_yaf_User]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_Topic]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Topic_yaf_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[yaf_User] ([UserID])
GO
ALTER TABLE [dbo].[yaf_Topic] CHECK CONSTRAINT [FK_yaf_Topic_yaf_User]
GO
/****** Object:  ForeignKey [FK_yaf_Topic_yaf_User2]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_Topic]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Topic_yaf_User2] FOREIGN KEY([LastUserID])
REFERENCES [dbo].[yaf_User] ([UserID])
GO
ALTER TABLE [dbo].[yaf_Topic] CHECK CONSTRAINT [FK_yaf_Topic_yaf_User2]
GO
/****** Object:  ForeignKey [FK_yaf_ForumReadTracking_yaf_Forum]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_ForumReadTracking]  WITH CHECK ADD  CONSTRAINT [FK_yaf_ForumReadTracking_yaf_Forum] FOREIGN KEY([ForumID])
REFERENCES [dbo].[yaf_Forum] ([ForumID])
GO
ALTER TABLE [dbo].[yaf_ForumReadTracking] CHECK CONSTRAINT [FK_yaf_ForumReadTracking_yaf_Forum]
GO
/****** Object:  ForeignKey [FK_yaf_ForumReadTracking_yaf_User]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_ForumReadTracking]  WITH CHECK ADD  CONSTRAINT [FK_yaf_ForumReadTracking_yaf_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[yaf_User] ([UserID])
GO
ALTER TABLE [dbo].[yaf_ForumReadTracking] CHECK CONSTRAINT [FK_yaf_ForumReadTracking_yaf_User]
GO
/****** Object:  ForeignKey [FK_yaf_ForumAccess_yaf_AccessMask]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_ForumAccess]  WITH CHECK ADD  CONSTRAINT [FK_yaf_ForumAccess_yaf_AccessMask] FOREIGN KEY([AccessMaskID])
REFERENCES [dbo].[yaf_AccessMask] ([AccessMaskID])
GO
ALTER TABLE [dbo].[yaf_ForumAccess] CHECK CONSTRAINT [FK_yaf_ForumAccess_yaf_AccessMask]
GO
/****** Object:  ForeignKey [FK_yaf_ForumAccess_yaf_Forum]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_ForumAccess]  WITH CHECK ADD  CONSTRAINT [FK_yaf_ForumAccess_yaf_Forum] FOREIGN KEY([ForumID])
REFERENCES [dbo].[yaf_Forum] ([ForumID])
GO
ALTER TABLE [dbo].[yaf_ForumAccess] CHECK CONSTRAINT [FK_yaf_ForumAccess_yaf_Forum]
GO
/****** Object:  ForeignKey [FK_yaf_ForumAccess_yaf_Group]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_ForumAccess]  WITH CHECK ADD  CONSTRAINT [FK_yaf_ForumAccess_yaf_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[yaf_Group] ([GroupID])
GO
ALTER TABLE [dbo].[yaf_ForumAccess] CHECK CONSTRAINT [FK_yaf_ForumAccess_yaf_Group]
GO
/****** Object:  ForeignKey [FK_yaf_Message_yaf_Message]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_Message]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Message_yaf_Message] FOREIGN KEY([ReplyTo])
REFERENCES [dbo].[yaf_Message] ([MessageID])
GO
ALTER TABLE [dbo].[yaf_Message] CHECK CONSTRAINT [FK_yaf_Message_yaf_Message]
GO
/****** Object:  ForeignKey [FK_yaf_Message_yaf_Topic]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_Message]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Message_yaf_Topic] FOREIGN KEY([TopicID])
REFERENCES [dbo].[yaf_Topic] ([TopicID])
GO
ALTER TABLE [dbo].[yaf_Message] CHECK CONSTRAINT [FK_yaf_Message_yaf_Topic]
GO
/****** Object:  ForeignKey [FK_yaf_Message_yaf_User]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_Message]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Message_yaf_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[yaf_User] ([UserID])
GO
ALTER TABLE [dbo].[yaf_Message] CHECK CONSTRAINT [FK_yaf_Message_yaf_User]
GO
/****** Object:  ForeignKey [FK_yaf_Forum_yaf_Category]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_Forum]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Forum_yaf_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[yaf_Category] ([CategoryID])
GO
ALTER TABLE [dbo].[yaf_Forum] CHECK CONSTRAINT [FK_yaf_Forum_yaf_Category]
GO
/****** Object:  ForeignKey [FK_yaf_Forum_yaf_Forum]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_Forum]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Forum_yaf_Forum] FOREIGN KEY([ParentID])
REFERENCES [dbo].[yaf_Forum] ([ForumID])
GO
ALTER TABLE [dbo].[yaf_Forum] CHECK CONSTRAINT [FK_yaf_Forum_yaf_Forum]
GO
/****** Object:  ForeignKey [FK_yaf_Forum_yaf_Message]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_Forum]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Forum_yaf_Message] FOREIGN KEY([LastMessageID])
REFERENCES [dbo].[yaf_Message] ([MessageID])
GO
ALTER TABLE [dbo].[yaf_Forum] CHECK CONSTRAINT [FK_yaf_Forum_yaf_Message]
GO
/****** Object:  ForeignKey [FK_yaf_Forum_yaf_PollGroupCluster]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_Forum]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Forum_yaf_PollGroupCluster] FOREIGN KEY([PollGroupID])
REFERENCES [dbo].[yaf_PollGroupCluster] ([PollGroupID])
GO
ALTER TABLE [dbo].[yaf_Forum] CHECK CONSTRAINT [FK_yaf_Forum_yaf_PollGroupCluster]
GO
/****** Object:  ForeignKey [FK_yaf_Forum_yaf_Topic]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_Forum]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Forum_yaf_Topic] FOREIGN KEY([LastTopicID])
REFERENCES [dbo].[yaf_Topic] ([TopicID])
GO
ALTER TABLE [dbo].[yaf_Forum] CHECK CONSTRAINT [FK_yaf_Forum_yaf_Topic]
GO
/****** Object:  ForeignKey [FK_yaf_Forum_yaf_User]    Script Date: 05/18/2015 09:24:16 ******/
ALTER TABLE [dbo].[yaf_Forum]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Forum_yaf_User] FOREIGN KEY([LastUserID])
REFERENCES [dbo].[yaf_User] ([UserID])
GO
ALTER TABLE [dbo].[yaf_Forum] CHECK CONSTRAINT [FK_yaf_Forum_yaf_User]
GO
/****** Object:  ForeignKey [FK_yaf_FavoriteTopic_yaf_Topic]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_FavoriteTopic]  WITH CHECK ADD  CONSTRAINT [FK_yaf_FavoriteTopic_yaf_Topic] FOREIGN KEY([TopicID])
REFERENCES [dbo].[yaf_Topic] ([TopicID])
GO
ALTER TABLE [dbo].[yaf_FavoriteTopic] CHECK CONSTRAINT [FK_yaf_FavoriteTopic_yaf_Topic]
GO
/****** Object:  ForeignKey [FK_yaf_FavoriteTopic_yaf_User]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_FavoriteTopic]  WITH CHECK ADD  CONSTRAINT [FK_yaf_FavoriteTopic_yaf_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[yaf_User] ([UserID])
GO
ALTER TABLE [dbo].[yaf_FavoriteTopic] CHECK CONSTRAINT [FK_yaf_FavoriteTopic_yaf_User]
GO
/****** Object:  ForeignKey [FK_yaf_NntpTopic_yaf_NntpForum]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_NntpTopic]  WITH CHECK ADD  CONSTRAINT [FK_yaf_NntpTopic_yaf_NntpForum] FOREIGN KEY([NntpForumID])
REFERENCES [dbo].[yaf_NntpForum] ([NntpForumID])
GO
ALTER TABLE [dbo].[yaf_NntpTopic] CHECK CONSTRAINT [FK_yaf_NntpTopic_yaf_NntpForum]
GO
/****** Object:  ForeignKey [FK_yaf_NntpTopic_yaf_Topic]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_NntpTopic]  WITH CHECK ADD  CONSTRAINT [FK_yaf_NntpTopic_yaf_Topic] FOREIGN KEY([TopicID])
REFERENCES [dbo].[yaf_Topic] ([TopicID])
GO
ALTER TABLE [dbo].[yaf_NntpTopic] CHECK CONSTRAINT [FK_yaf_NntpTopic_yaf_Topic]
GO
/****** Object:  ForeignKey [FK_yaf_NntpForum_yaf_Forum]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_NntpForum]  WITH CHECK ADD  CONSTRAINT [FK_yaf_NntpForum_yaf_Forum] FOREIGN KEY([ForumID])
REFERENCES [dbo].[yaf_Forum] ([ForumID])
GO
ALTER TABLE [dbo].[yaf_NntpForum] CHECK CONSTRAINT [FK_yaf_NntpForum_yaf_Forum]
GO
/****** Object:  ForeignKey [FK_yaf_NntpForum_yaf_NntpServer]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_NntpForum]  WITH CHECK ADD  CONSTRAINT [FK_yaf_NntpForum_yaf_NntpServer] FOREIGN KEY([NntpServerID])
REFERENCES [dbo].[yaf_NntpServer] ([NntpServerID])
GO
ALTER TABLE [dbo].[yaf_NntpForum] CHECK CONSTRAINT [FK_yaf_NntpForum_yaf_NntpServer]
GO
/****** Object:  ForeignKey [FK_yaf_Active_yaf_Board]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Active]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Active_yaf_Board] FOREIGN KEY([BoardID])
REFERENCES [dbo].[yaf_Board] ([BoardID])
GO
ALTER TABLE [dbo].[yaf_Active] CHECK CONSTRAINT [FK_yaf_Active_yaf_Board]
GO
/****** Object:  ForeignKey [FK_yaf_Active_yaf_Forum]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Active]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Active_yaf_Forum] FOREIGN KEY([ForumID])
REFERENCES [dbo].[yaf_Forum] ([ForumID])
GO
ALTER TABLE [dbo].[yaf_Active] CHECK CONSTRAINT [FK_yaf_Active_yaf_Forum]
GO
/****** Object:  ForeignKey [FK_yaf_Active_yaf_Topic]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Active]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Active_yaf_Topic] FOREIGN KEY([TopicID])
REFERENCES [dbo].[yaf_Topic] ([TopicID])
GO
ALTER TABLE [dbo].[yaf_Active] CHECK CONSTRAINT [FK_yaf_Active_yaf_Topic]
GO
/****** Object:  ForeignKey [FK_yaf_Active_yaf_User]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Active]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Active_yaf_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[yaf_User] ([UserID])
GO
ALTER TABLE [dbo].[yaf_Active] CHECK CONSTRAINT [FK_yaf_Active_yaf_User]
GO
/****** Object:  ForeignKey [FK_yaf_Attachment_yaf_User]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Attachment]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Attachment_yaf_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[yaf_User] ([UserID])
GO
ALTER TABLE [dbo].[yaf_Attachment] CHECK CONSTRAINT [FK_yaf_Attachment_yaf_User]
GO
/****** Object:  ForeignKey [FK_yaf_User_yaf_Board]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_User]  WITH CHECK ADD  CONSTRAINT [FK_yaf_User_yaf_Board] FOREIGN KEY([BoardID])
REFERENCES [dbo].[yaf_Board] ([BoardID])
GO
ALTER TABLE [dbo].[yaf_User] CHECK CONSTRAINT [FK_yaf_User_yaf_Board]
GO
/****** Object:  ForeignKey [FK_yaf_User_yaf_Rank]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_User]  WITH CHECK ADD  CONSTRAINT [FK_yaf_User_yaf_Rank] FOREIGN KEY([RankID])
REFERENCES [dbo].[yaf_Rank] ([RankID])
GO
ALTER TABLE [dbo].[yaf_User] CHECK CONSTRAINT [FK_yaf_User_yaf_Rank]
GO
/****** Object:  ForeignKey [FK_yaf_MessageReportedAudit_yaf_MessageReported]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_MessageReportedAudit]  WITH CHECK ADD  CONSTRAINT [FK_yaf_MessageReportedAudit_yaf_MessageReported] FOREIGN KEY([MessageID])
REFERENCES [dbo].[yaf_MessageReported] ([MessageID])
GO
ALTER TABLE [dbo].[yaf_MessageReportedAudit] CHECK CONSTRAINT [FK_yaf_MessageReportedAudit_yaf_MessageReported]
GO
/****** Object:  ForeignKey [FK_yaf_MessageHistory_MessageID]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_MessageHistory]  WITH CHECK ADD  CONSTRAINT [FK_yaf_MessageHistory_MessageID] FOREIGN KEY([MessageID])
REFERENCES [dbo].[yaf_Message] ([MessageID])
GO
ALTER TABLE [dbo].[yaf_MessageHistory] CHECK CONSTRAINT [FK_yaf_MessageHistory_MessageID]
GO
/****** Object:  ForeignKey [FK_yaf_PollVote_yaf_Poll]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_PollVote]  WITH CHECK ADD  CONSTRAINT [FK_yaf_PollVote_yaf_Poll] FOREIGN KEY([PollID])
REFERENCES [dbo].[yaf_Poll] ([PollID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[yaf_PollVote] CHECK CONSTRAINT [FK_yaf_PollVote_yaf_Poll]
GO
/****** Object:  ForeignKey [FK_yaf_Choice_yaf_Poll]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Choice]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Choice_yaf_Poll] FOREIGN KEY([PollID])
REFERENCES [dbo].[yaf_Poll] ([PollID])
GO
ALTER TABLE [dbo].[yaf_Choice] CHECK CONSTRAINT [FK_yaf_Choice_yaf_Poll]
GO
/****** Object:  ForeignKey [FK_yaf_Category_yaf_Board]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Category]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Category_yaf_Board] FOREIGN KEY([BoardID])
REFERENCES [dbo].[yaf_Board] ([BoardID])
GO
ALTER TABLE [dbo].[yaf_Category] CHECK CONSTRAINT [FK_yaf_Category_yaf_Board]
GO
/****** Object:  ForeignKey [FK_yaf_Category_yaf_PollGroupCluster]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Category]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Category_yaf_PollGroupCluster] FOREIGN KEY([PollGroupID])
REFERENCES [dbo].[yaf_PollGroupCluster] ([PollGroupID])
GO
ALTER TABLE [dbo].[yaf_Category] CHECK CONSTRAINT [FK_yaf_Category_yaf_PollGroupCluster]
GO
/****** Object:  ForeignKey [FK_yaf_Poll_yaf_PollGroupCluster]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Poll]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Poll_yaf_PollGroupCluster] FOREIGN KEY([PollGroupID])
REFERENCES [dbo].[yaf_PollGroupCluster] ([PollGroupID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[yaf_Poll] CHECK CONSTRAINT [FK_yaf_Poll_yaf_PollGroupCluster]
GO
/****** Object:  ForeignKey [FK_yaf_Rank_yaf_Board]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Rank]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Rank_yaf_Board] FOREIGN KEY([BoardID])
REFERENCES [dbo].[yaf_Board] ([BoardID])
GO
ALTER TABLE [dbo].[yaf_Rank] CHECK CONSTRAINT [FK_yaf_Rank_yaf_Board]
GO
/****** Object:  ForeignKey [FK_yaf_UserGroup_yaf_Group]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_yaf_UserGroup_yaf_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[yaf_Group] ([GroupID])
GO
ALTER TABLE [dbo].[yaf_UserGroup] CHECK CONSTRAINT [FK_yaf_UserGroup_yaf_Group]
GO
/****** Object:  ForeignKey [FK_yaf_UserGroup_yaf_User]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_yaf_UserGroup_yaf_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[yaf_User] ([UserID])
GO
ALTER TABLE [dbo].[yaf_UserGroup] CHECK CONSTRAINT [FK_yaf_UserGroup_yaf_User]
GO
/****** Object:  ForeignKey [FK_yaf_Group_yaf_Board]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_Group]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Group_yaf_Board] FOREIGN KEY([BoardID])
REFERENCES [dbo].[yaf_Board] ([BoardID])
GO
ALTER TABLE [dbo].[yaf_Group] CHECK CONSTRAINT [FK_yaf_Group_yaf_Board]
GO
/****** Object:  ForeignKey [FK_yaf_AccessMask_yaf_Board]    Script Date: 05/18/2015 09:24:17 ******/
ALTER TABLE [dbo].[yaf_AccessMask]  WITH CHECK ADD  CONSTRAINT [FK_yaf_AccessMask_yaf_Board] FOREIGN KEY([BoardID])
REFERENCES [dbo].[yaf_Board] ([BoardID])
GO
ALTER TABLE [dbo].[yaf_AccessMask] CHECK CONSTRAINT [FK_yaf_AccessMask_yaf_Board]
GO
/****** Object:  ForeignKey [FK_yaf_UserAlbumImage_yaf_UserAlbum]    Script Date: 05/18/2015 09:24:18 ******/
ALTER TABLE [dbo].[yaf_UserAlbumImage]  WITH CHECK ADD  CONSTRAINT [FK_yaf_UserAlbumImage_yaf_UserAlbum] FOREIGN KEY([AlbumID])
REFERENCES [dbo].[yaf_UserAlbum] ([AlbumID])
GO
ALTER TABLE [dbo].[yaf_UserAlbumImage] CHECK CONSTRAINT [FK_yaf_UserAlbumImage_yaf_UserAlbum]
GO
/****** Object:  ForeignKey [FK_yaf_Smiley_yaf_Board]    Script Date: 05/18/2015 09:24:18 ******/
ALTER TABLE [dbo].[yaf_Smiley]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Smiley_yaf_Board] FOREIGN KEY([BoardID])
REFERENCES [dbo].[yaf_Board] ([BoardID])
GO
ALTER TABLE [dbo].[yaf_Smiley] CHECK CONSTRAINT [FK_yaf_Smiley_yaf_Board]
GO
/****** Object:  ForeignKey [FK_yaf_Registry_yaf_Board]    Script Date: 05/18/2015 09:24:18 ******/
ALTER TABLE [dbo].[yaf_Registry]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Registry_yaf_Board] FOREIGN KEY([BoardID])
REFERENCES [dbo].[yaf_Board] ([BoardID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[yaf_Registry] CHECK CONSTRAINT [FK_yaf_Registry_yaf_Board]
GO
/****** Object:  ForeignKey [FK_yaf_BannedEmail_yaf_Board]    Script Date: 05/18/2015 09:24:18 ******/
ALTER TABLE [dbo].[yaf_BannedEmail]  WITH CHECK ADD  CONSTRAINT [FK_yaf_BannedEmail_yaf_Board] FOREIGN KEY([BoardID])
REFERENCES [dbo].[yaf_Board] ([BoardID])
GO
ALTER TABLE [dbo].[yaf_BannedEmail] CHECK CONSTRAINT [FK_yaf_BannedEmail_yaf_Board]
GO
/****** Object:  ForeignKey [FK_yaf_BannedName_yaf_Board]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_BannedName]  WITH CHECK ADD  CONSTRAINT [FK_yaf_BannedName_yaf_Board] FOREIGN KEY([BoardID])
REFERENCES [dbo].[yaf_Board] ([BoardID])
GO
ALTER TABLE [dbo].[yaf_BannedName] CHECK CONSTRAINT [FK_yaf_BannedName_yaf_Board]
GO
/****** Object:  ForeignKey [FK_yaf_BannedIP_yaf_Board]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_BannedIP]  WITH CHECK ADD  CONSTRAINT [FK_yaf_BannedIP_yaf_Board] FOREIGN KEY([BoardID])
REFERENCES [dbo].[yaf_Board] ([BoardID])
GO
ALTER TABLE [dbo].[yaf_BannedIP] CHECK CONSTRAINT [FK_yaf_BannedIP_yaf_Board]
GO
/****** Object:  ForeignKey [FK_yaf_BBCode_Board]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_BBCode]  WITH CHECK ADD  CONSTRAINT [FK_yaf_BBCode_Board] FOREIGN KEY([BoardID])
REFERENCES [dbo].[yaf_Board] ([BoardID])
GO
ALTER TABLE [dbo].[yaf_BBCode] CHECK CONSTRAINT [FK_yaf_BBCode_Board]
GO
/****** Object:  ForeignKey [FK_yaf_Extension_yaf_Board]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_Extension]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Extension_yaf_Board] FOREIGN KEY([BoardId])
REFERENCES [dbo].[yaf_Board] ([BoardID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[yaf_Extension] CHECK CONSTRAINT [FK_yaf_Extension_yaf_Board]
GO
/****** Object:  ForeignKey [FK_yaf_NntpServer_yaf_Board]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_NntpServer]  WITH CHECK ADD  CONSTRAINT [FK_yaf_NntpServer_yaf_Board] FOREIGN KEY([BoardID])
REFERENCES [dbo].[yaf_Board] ([BoardID])
GO
ALTER TABLE [dbo].[yaf_NntpServer] CHECK CONSTRAINT [FK_yaf_NntpServer_yaf_Board]
GO
/****** Object:  ForeignKey [FK_yaf_EventLogGroupAccess_yaf_GroupID]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_EventLogGroupAccess]  WITH CHECK ADD  CONSTRAINT [FK_yaf_EventLogGroupAccess_yaf_GroupID] FOREIGN KEY([GroupID])
REFERENCES [dbo].[yaf_Group] ([GroupID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[yaf_EventLogGroupAccess] CHECK CONSTRAINT [FK_yaf_EventLogGroupAccess_yaf_GroupID]
GO
/****** Object:  ForeignKey [FK_yaf_GroupMedal_yaf_Group]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_GroupMedal]  WITH CHECK ADD  CONSTRAINT [FK_yaf_GroupMedal_yaf_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[yaf_Group] ([GroupID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[yaf_GroupMedal] CHECK CONSTRAINT [FK_yaf_GroupMedal_yaf_Group]
GO
/****** Object:  ForeignKey [FK_yaf_GroupMedal_yaf_Medal]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_GroupMedal]  WITH CHECK ADD  CONSTRAINT [FK_yaf_GroupMedal_yaf_Medal] FOREIGN KEY([MedalID])
REFERENCES [dbo].[yaf_Medal] ([MedalID])
GO
ALTER TABLE [dbo].[yaf_GroupMedal] CHECK CONSTRAINT [FK_yaf_GroupMedal_yaf_Medal]
GO
/****** Object:  ForeignKey [FK_yaf_UserProfile_yaf_User]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_yaf_UserProfile_yaf_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[yaf_User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[yaf_UserProfile] CHECK CONSTRAINT [FK_yaf_UserProfile_yaf_User]
GO
/****** Object:  ForeignKey [FK_yaf_UserMedal_yaf_Medal]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_UserMedal]  WITH CHECK ADD  CONSTRAINT [FK_yaf_UserMedal_yaf_Medal] FOREIGN KEY([MedalID])
REFERENCES [dbo].[yaf_Medal] ([MedalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[yaf_UserMedal] CHECK CONSTRAINT [FK_yaf_UserMedal_yaf_Medal]
GO
/****** Object:  ForeignKey [FK_yaf_UserMedal_yaf_User]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_UserMedal]  WITH CHECK ADD  CONSTRAINT [FK_yaf_UserMedal_yaf_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[yaf_User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[yaf_UserMedal] CHECK CONSTRAINT [FK_yaf_UserMedal_yaf_User]
GO
/****** Object:  ForeignKey [FK_yaf_ReputationVote_yaf_User_From]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_ReputationVote]  WITH CHECK ADD  CONSTRAINT [FK_yaf_ReputationVote_yaf_User_From] FOREIGN KEY([ReputationFromUserID])
REFERENCES [dbo].[yaf_User] ([UserID])
GO
ALTER TABLE [dbo].[yaf_ReputationVote] CHECK CONSTRAINT [FK_yaf_ReputationVote_yaf_User_From]
GO
/****** Object:  ForeignKey [FK_yaf_ReputationVote_yaf_User_To]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_ReputationVote]  WITH CHECK ADD  CONSTRAINT [FK_yaf_ReputationVote_yaf_User_To] FOREIGN KEY([ReputationToUserID])
REFERENCES [dbo].[yaf_User] ([UserID])
GO
ALTER TABLE [dbo].[yaf_ReputationVote] CHECK CONSTRAINT [FK_yaf_ReputationVote_yaf_User_To]
GO
/****** Object:  ForeignKey [FK_yaf_Thanks_yaf_User]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_Thanks]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Thanks_yaf_User] FOREIGN KEY([ThanksFromUserID])
REFERENCES [dbo].[yaf_User] ([UserID])
GO
ALTER TABLE [dbo].[yaf_Thanks] CHECK CONSTRAINT [FK_yaf_Thanks_yaf_User]
GO
/****** Object:  ForeignKey [FK_yaf_PMessage_yaf_User1]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_PMessage]  WITH CHECK ADD  CONSTRAINT [FK_yaf_PMessage_yaf_User1] FOREIGN KEY([FromUserID])
REFERENCES [dbo].[yaf_User] ([UserID])
GO
ALTER TABLE [dbo].[yaf_PMessage] CHECK CONSTRAINT [FK_yaf_PMessage_yaf_User1]
GO
/****** Object:  ForeignKey [FK_yaf_AdminPageUserAccess_yaf_UserID]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_AdminPageUserAccess]  WITH CHECK ADD  CONSTRAINT [FK_yaf_AdminPageUserAccess_yaf_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[yaf_User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[yaf_AdminPageUserAccess] CHECK CONSTRAINT [FK_yaf_AdminPageUserAccess_yaf_UserID]
GO
/****** Object:  ForeignKey [FK_yaf_Buddy_yaf_User]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_Buddy]  WITH CHECK ADD  CONSTRAINT [FK_yaf_Buddy_yaf_User] FOREIGN KEY([FromUserID])
REFERENCES [dbo].[yaf_User] ([UserID])
GO
ALTER TABLE [dbo].[yaf_Buddy] CHECK CONSTRAINT [FK_yaf_Buddy_yaf_User]
GO
/****** Object:  ForeignKey [FK_yaf_CheckEmail_yaf_User]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_CheckEmail]  WITH CHECK ADD  CONSTRAINT [FK_yaf_CheckEmail_yaf_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[yaf_User] ([UserID])
GO
ALTER TABLE [dbo].[yaf_CheckEmail] CHECK CONSTRAINT [FK_yaf_CheckEmail_yaf_User]
GO
/****** Object:  ForeignKey [FK_yaf_EventLog_yaf_User]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_EventLog]  WITH CHECK ADD  CONSTRAINT [FK_yaf_EventLog_yaf_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[yaf_User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[yaf_EventLog] CHECK CONSTRAINT [FK_yaf_EventLog_yaf_User]
GO
/****** Object:  ForeignKey [FK_yaf_UserPMessage_yaf_PMessage]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_UserPMessage]  WITH CHECK ADD  CONSTRAINT [FK_yaf_UserPMessage_yaf_PMessage] FOREIGN KEY([PMessageID])
REFERENCES [dbo].[yaf_PMessage] ([PMessageID])
GO
ALTER TABLE [dbo].[yaf_UserPMessage] CHECK CONSTRAINT [FK_yaf_UserPMessage_yaf_PMessage]
GO
/****** Object:  ForeignKey [FK_yaf_UserPMessage_yaf_User]    Script Date: 05/18/2015 09:24:19 ******/
ALTER TABLE [dbo].[yaf_UserPMessage]  WITH CHECK ADD  CONSTRAINT [FK_yaf_UserPMessage_yaf_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[yaf_User] ([UserID])
GO
ALTER TABLE [dbo].[yaf_UserPMessage] CHECK CONSTRAINT [FK_yaf_UserPMessage_yaf_User]
GO

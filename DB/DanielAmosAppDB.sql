USE [master]
GO
/****** Object:  Database [DanielAmosDB]    Script Date: 13/02/2025 04:21:23 ******/
CREATE DATABASE [DanielAmosDB]
GO
ALTER DATABASE [DanielAmosDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DanielAmosDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DanielAmosDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DanielAmosDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DanielAmosDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DanielAmosDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DanielAmosDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DanielAmosDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DanielAmosDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DanielAmosDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DanielAmosDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DanielAmosDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DanielAmosDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DanielAmosDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DanielAmosDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DanielAmosDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DanielAmosDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DanielAmosDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DanielAmosDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DanielAmosDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DanielAmosDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DanielAmosDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DanielAmosDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DanielAmosDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DanielAmosDB] SET RECOVERY FULL 
GO
ALTER DATABASE [DanielAmosDB] SET  MULTI_USER 
GO
ALTER DATABASE [DanielAmosDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DanielAmosDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DanielAmosDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DanielAmosDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DanielAmosDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DanielAmosDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DanielAmosDB', N'ON'
GO
ALTER DATABASE [DanielAmosDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [DanielAmosDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DanielAmosDB]
GO
/****** Object:  Table [dbo].[RegisterUser]    Script Date: 13/02/2025 04:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisterUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HebrewFullName] [nvarchar](20) NOT NULL,
	[EnglishFullName] [varchar](15) NOT NULL,
	[BirthdayDate] [date] NOT NULL,
	[Taz] [nvarchar](512) NOT NULL,
	[Password] [nvarchar](512) NOT NULL,
	[CreatedAt] [date] NOT NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionType]    Script Date: 13/02/2025 04:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TransactionType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionAction]    Script Date: 13/02/2025 04:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionAction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionTypeID] [int] NOT NULL,
	[BankAccountNumber] [varchar](10) NOT NULL,
	[Amount] [int] NOT NULL,
	[StatusAction] [nvarchar](100) NULL,
	[TokenResponse] [nvarchar](max) NULL,
	[CreatedAt] [date] NOT NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionHistory]    Script Date: 13/02/2025 04:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionHistory](
	[TransactionActionID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_TransactionHistory] PRIMARY KEY CLUSTERED 
(
	[TransactionActionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TransactionHistoryFullDataView]    Script Date: 13/02/2025 04:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TransactionHistoryFullDataView]
AS
SELECT TranHistory.TransactionActionID, TranHistory.UserID AS TranHistoryUserID, TranAction.BankAccountNumber, TranAction.Amount, TranAction.StatusAction, TranAction.TokenResponse, TranAction.CreatedAt, TranAction.UpdatedAt, TranType.Name AS TransactionType, 
             RUser.HebrewFullName, RUser.EnglishFullName
FROM   dbo.TransactionHistory AS TranHistory WITH (Nolock) INNER JOIN
             dbo.TransactionAction AS TranAction WITH (Nolock) ON TranHistory.TransactionActionID = TranAction.ID INNER JOIN
             dbo.TransactionType AS TranType WITH (Nolock) ON TranAction.TransactionTypeID = TranType.ID INNER JOIN
             dbo.RegisterUser AS RUser WITH (Nolock) ON TranHistory.UserID = RUser.ID
GO
/****** Object:  Table [dbo].[BankAccount]    Script Date: 13/02/2025 04:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAccount](
	[ID] [varchar](10) NOT NULL,
	[Number] [varchar](10) NOT NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_BankAccount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionStatus]    Script Date: 13/02/2025 04:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TransactionStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RegisterUser] ON 

INSERT [dbo].[RegisterUser] ([ID], [HebrewFullName], [EnglishFullName], [BirthdayDate], [Taz], [Password], [CreatedAt], [UpdatedAt]) VALUES (1, N'דניאל עמוס ארצי', N'Dani''Artzi', CAST(N'1997-12-09' AS Date), N'kEJ8cvvuGBugz54Rd8JmUw==', N'AQAAAAIAAYagAAAAEDsFZagNDuu9e9cZ6PnNNI2SIHlp1/0hsMw1O+OnRhufacSdzCmeso25FjAw2N6g0Q==', CAST(N'2025-02-10' AS Date), NULL)
INSERT [dbo].[RegisterUser] ([ID], [HebrewFullName], [EnglishFullName], [BirthdayDate], [Taz], [Password], [CreatedAt], [UpdatedAt]) VALUES (2, N'תהילה-נעים', N'Tehila Naim', CAST(N'1998-12-13' AS Date), N'0qVDY6tTXxmoV+ohpTwJ9Q==', N'AQAAAAIAAYagAAAAEJrdQVFPQP8iawbLhTMwbNBMhxHCd351JHrfGMcpHSBy0YufJ9IAQ4+pROePCMjGmA==', CAST(N'2025-02-10' AS Date), NULL)
INSERT [dbo].[RegisterUser] ([ID], [HebrewFullName], [EnglishFullName], [BirthdayDate], [Taz], [Password], [CreatedAt], [UpdatedAt]) VALUES (3, N'איתי כבתי', N'Itay C''habte', CAST(N'1995-04-01' AS Date), N'BG7Hgj9oeEBLUF/dIzyfqg==', N'AQAAAAIAAYagAAAAEJ2hMFzXZcAivyewINmApcT804roHm2SIma7jvphDHby9g/oH0XbaihIN+hTDKp5TQ==', CAST(N'2025-02-10' AS Date), NULL)
INSERT [dbo].[RegisterUser] ([ID], [HebrewFullName], [EnglishFullName], [BirthdayDate], [Taz], [Password], [CreatedAt], [UpdatedAt]) VALUES (4, N'איתי-שופל', N'Magic One', CAST(N'2000-02-21' AS Date), N'27AhUBCeKH3pfCfuaGcsog==', N'AQAAAAIAAYagAAAAEBL0BMQ8WSLLkNXpiZux1xbP1Ni6E0gfTXxw1KkiwC4eRsSyrIUEdmAM0o057rZoxA==', CAST(N'2025-02-12' AS Date), NULL)
INSERT [dbo].[RegisterUser] ([ID], [HebrewFullName], [EnglishFullName], [BirthdayDate], [Taz], [Password], [CreatedAt], [UpdatedAt]) VALUES (5, N'דביר ענבי', N'Dviv''o', CAST(N'2025-02-12' AS Date), N'huungI2Vwio6/afaJ/9gxQ==', N'AQAAAAIAAYagAAAAECe7JdtODDniCrZPviFvuL2vx4tVOg6+tdS5FYC6W7IXegVIzVjl7KmisPxiBzCPzg==', CAST(N'2025-02-12' AS Date), NULL)
INSERT [dbo].[RegisterUser] ([ID], [HebrewFullName], [EnglishFullName], [BirthdayDate], [Taz], [Password], [CreatedAt], [UpdatedAt]) VALUES (7, N'נתן ר''קובציק', N'N-a-t-a-n', CAST(N'1998-08-18' AS Date), N'jIA66xK8Hu1GQsFqWotWfg==', N'AQAAAAIAAYagAAAAEOBeXIFGTFoYwVBsrRs62LnLYDAQE5eEV/1Sn35sgfKg/By+nR1iM1ow1xYWVgNarg==', CAST(N'2025-02-12' AS Date), NULL)
INSERT [dbo].[RegisterUser] ([ID], [HebrewFullName], [EnglishFullName], [BirthdayDate], [Taz], [Password], [CreatedAt], [UpdatedAt]) VALUES (14, N'דניאל', N'd d d d', CAST(N'2025-01-26' AS Date), N'kbHLGglZ7IO1M8h9MsGVOw==', N'AQAAAAIAAYagAAAAENMTcAPwxs3/DuvDnmI2fXxDsUaqiuVoGYaFXv3UWXLzt5ZZ07ebJPOmk8cnLGcqDg==', CAST(N'2025-02-12' AS Date), NULL)
INSERT [dbo].[RegisterUser] ([ID], [HebrewFullName], [EnglishFullName], [BirthdayDate], [Taz], [Password], [CreatedAt], [UpdatedAt]) VALUES (17, N'דניאל', N'a s d', CAST(N'2025-01-31' AS Date), N'q2gDwEQDG14zwrY6LIZVbQ==', N'AQAAAAIAAYagAAAAEF+LIDE7jemCUmoyqEjXEp1WjdF9kuT9GaWTpR0RU89opMaXGaUZCh6zFxSbxxC6hA==', CAST(N'2025-02-12' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[RegisterUser] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactionAction] ON 

INSERT [dbo].[TransactionAction] ([ID], [TransactionTypeID], [BankAccountNumber], [Amount], [StatusAction], [TokenResponse], [CreatedAt], [UpdatedAt]) VALUES (1, 1, N'12468922', 714, NULL, NULL, CAST(N'2025-02-10' AS Date), NULL)
INSERT [dbo].[TransactionAction] ([ID], [TransactionTypeID], [BankAccountNumber], [Amount], [StatusAction], [TokenResponse], [CreatedAt], [UpdatedAt]) VALUES (2, 1, N'123123123', 100, NULL, NULL, CAST(N'2025-02-10' AS Date), NULL)
INSERT [dbo].[TransactionAction] ([ID], [TransactionTypeID], [BankAccountNumber], [Amount], [StatusAction], [TokenResponse], [CreatedAt], [UpdatedAt]) VALUES (6, 2, N'121212111', 431234, NULL, NULL, CAST(N'2025-02-10' AS Date), NULL)
INSERT [dbo].[TransactionAction] ([ID], [TransactionTypeID], [BankAccountNumber], [Amount], [StatusAction], [TokenResponse], [CreatedAt], [UpdatedAt]) VALUES (12, 1, N'1123456', 2, NULL, NULL, CAST(N'2025-02-13' AS Date), NULL)
INSERT [dbo].[TransactionAction] ([ID], [TransactionTypeID], [BankAccountNumber], [Amount], [StatusAction], [TokenResponse], [CreatedAt], [UpdatedAt]) VALUES (13, 1, N'1222127', 123, NULL, NULL, CAST(N'2025-02-13' AS Date), NULL)
INSERT [dbo].[TransactionAction] ([ID], [TransactionTypeID], [BankAccountNumber], [Amount], [StatusAction], [TokenResponse], [CreatedAt], [UpdatedAt]) VALUES (20, 1, N'1234567', 1234, N'', N'', CAST(N'2025-02-13' AS Date), NULL)
INSERT [dbo].[TransactionAction] ([ID], [TransactionTypeID], [BankAccountNumber], [Amount], [StatusAction], [TokenResponse], [CreatedAt], [UpdatedAt]) VALUES (21, 1, N'2221112', 232322, N'', N'', CAST(N'2025-02-13' AS Date), NULL)
INSERT [dbo].[TransactionAction] ([ID], [TransactionTypeID], [BankAccountNumber], [Amount], [StatusAction], [TokenResponse], [CreatedAt], [UpdatedAt]) VALUES (22, 1, N'22221112', 2323, N'', N'', CAST(N'2025-02-13' AS Date), NULL)
INSERT [dbo].[TransactionAction] ([ID], [TransactionTypeID], [BankAccountNumber], [Amount], [StatusAction], [TokenResponse], [CreatedAt], [UpdatedAt]) VALUES (23, 1, N'242424242', 22442244, N'', N'', CAST(N'2025-02-13' AS Date), NULL)
INSERT [dbo].[TransactionAction] ([ID], [TransactionTypeID], [BankAccountNumber], [Amount], [StatusAction], [TokenResponse], [CreatedAt], [UpdatedAt]) VALUES (24, 1, N'1234565', 12212211, N'', N'', CAST(N'2025-02-13' AS Date), NULL)
INSERT [dbo].[TransactionAction] ([ID], [TransactionTypeID], [BankAccountNumber], [Amount], [StatusAction], [TokenResponse], [CreatedAt], [UpdatedAt]) VALUES (25, 1, N'2121212', 212121212, N'', N'', CAST(N'2025-02-13' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[TransactionAction] OFF
GO
INSERT [dbo].[TransactionHistory] ([TransactionActionID], [UserID]) VALUES (1, 1)
INSERT [dbo].[TransactionHistory] ([TransactionActionID], [UserID]) VALUES (2, 2)
INSERT [dbo].[TransactionHistory] ([TransactionActionID], [UserID]) VALUES (6, 1)
INSERT [dbo].[TransactionHistory] ([TransactionActionID], [UserID]) VALUES (12, 1)
INSERT [dbo].[TransactionHistory] ([TransactionActionID], [UserID]) VALUES (13, 1)
INSERT [dbo].[TransactionHistory] ([TransactionActionID], [UserID]) VALUES (20, 1)
INSERT [dbo].[TransactionHistory] ([TransactionActionID], [UserID]) VALUES (21, 1)
INSERT [dbo].[TransactionHistory] ([TransactionActionID], [UserID]) VALUES (22, 1)
INSERT [dbo].[TransactionHistory] ([TransactionActionID], [UserID]) VALUES (23, 1)
INSERT [dbo].[TransactionHistory] ([TransactionActionID], [UserID]) VALUES (24, 1)
INSERT [dbo].[TransactionHistory] ([TransactionActionID], [UserID]) VALUES (25, 1)
GO
SET IDENTITY_INSERT [dbo].[TransactionStatus] ON 

INSERT [dbo].[TransactionStatus] ([ID], [Name]) VALUES (1, N'Completed')
INSERT [dbo].[TransactionStatus] ([ID], [Name]) VALUES (2, N'Failed')
INSERT [dbo].[TransactionStatus] ([ID], [Name]) VALUES (3, N'InProcess')
SET IDENTITY_INSERT [dbo].[TransactionStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactionType] ON 

INSERT [dbo].[TransactionType] ([ID], [Name]) VALUES (1, N'Deposit')
INSERT [dbo].[TransactionType] ([ID], [Name]) VALUES (2, N'Withdrawal')
SET IDENTITY_INSERT [dbo].[TransactionType] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Number]    Script Date: 13/02/2025 04:21:23 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Number] ON [dbo].[BankAccount]
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BankAccountID]    Script Date: 13/02/2025 04:21:23 ******/
CREATE NONCLUSTERED INDEX [IX_BankAccountID] ON [dbo].[TransactionAction]
(
	[BankAccountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Name]    Script Date: 13/02/2025 04:21:23 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Name] ON [dbo].[TransactionStatus]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Name]    Script Date: 13/02/2025 04:21:23 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Name] ON [dbo].[TransactionType]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BankAccount] ADD  CONSTRAINT [DF_BankAccount_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[RegisterUser] ADD  CONSTRAINT [DF_RegisterUser_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[TransactionAction] ADD  CONSTRAINT [DF_TransactionAction_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[TransactionAction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_TransactionType] FOREIGN KEY([TransactionTypeID])
REFERENCES [dbo].[TransactionType] ([ID])
GO
ALTER TABLE [dbo].[TransactionAction] CHECK CONSTRAINT [FK_Transaction_TransactionType]
GO
ALTER TABLE [dbo].[TransactionHistory]  WITH CHECK ADD  CONSTRAINT [FK_TransactionHistory_RegisterUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[RegisterUser] ([ID])
GO
ALTER TABLE [dbo].[TransactionHistory] CHECK CONSTRAINT [FK_TransactionHistory_RegisterUser]
GO
ALTER TABLE [dbo].[TransactionHistory]  WITH CHECK ADD  CONSTRAINT [FK_TransactionHistory_TransactionAction] FOREIGN KEY([TransactionActionID])
REFERENCES [dbo].[TransactionAction] ([ID])
GO
ALTER TABLE [dbo].[TransactionHistory] CHECK CONSTRAINT [FK_TransactionHistory_TransactionAction]
GO
ALTER TABLE [dbo].[BankAccount]  WITH CHECK ADD  CONSTRAINT [CK_BankAccount] CHECK  ((len([Number])<=(10) AND len([Number])>(1) AND [Number] like '[0-9]%' AND NOT [Number] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[BankAccount] CHECK CONSTRAINT [CK_BankAccount]
GO
ALTER TABLE [dbo].[RegisterUser]  WITH CHECK ADD  CONSTRAINT [chk_BirthdayDate] CHECK  (([BirthdayDate]<=getdate()))
GO
ALTER TABLE [dbo].[RegisterUser] CHECK CONSTRAINT [chk_BirthdayDate]
GO
ALTER TABLE [dbo].[RegisterUser]  WITH CHECK ADD  CONSTRAINT [chk_EnglishFullName] CHECK  ((len([EnglishFullName])<=(15) AND len([EnglishFullName])>=(2) AND [EnglishFullName] like '[A-Za-z'' -]%' AND NOT [EnglishFullName] like '%[^A-Za-z'' -]%'))
GO
ALTER TABLE [dbo].[RegisterUser] CHECK CONSTRAINT [chk_EnglishFullName]
GO
ALTER TABLE [dbo].[RegisterUser]  WITH CHECK ADD  CONSTRAINT [chk_HebrewFullName] CHECK  ((len([HebrewFullName])<=(20) AND len([HebrewFullName])>=(2) AND [HebrewFullName] like '[א-ת'' -]%' AND NOT [HebrewFullName] like '%[^א-ת'' -]%'))
GO
ALTER TABLE [dbo].[RegisterUser] CHECK CONSTRAINT [chk_HebrewFullName]
GO
ALTER TABLE [dbo].[TransactionAction]  WITH CHECK ADD  CONSTRAINT [CK_BankAccountNumber] CHECK  ((len([BankAccountNumber])<=(10) AND len([BankAccountNumber])>=(7)))
GO
ALTER TABLE [dbo].[TransactionAction] CHECK CONSTRAINT [CK_BankAccountNumber]
GO
ALTER TABLE [dbo].[TransactionStatus]  WITH CHECK ADD  CONSTRAINT [CK_TransactionStatus] CHECK  (([Name] like '[A-Za-z'' -]%' AND NOT [Name] like '%[^A-Za-z'' -]%'))
GO
ALTER TABLE [dbo].[TransactionStatus] CHECK CONSTRAINT [CK_TransactionStatus]
GO
ALTER TABLE [dbo].[TransactionType]  WITH CHECK ADD  CONSTRAINT [CK_TransactionType] CHECK  (([Name] like '[A-Za-z'' -]%' AND NOT [Name] like '%[^A-Za-z'' -]%'))
GO
ALTER TABLE [dbo].[TransactionType] CHECK CONSTRAINT [CK_TransactionType]
GO
/****** Object:  StoredProcedure [dbo].[RegisterUser_GetUserByTaz]    Script Date: 13/02/2025 04:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Daniel Amos Artzi
-- Create date: 10.02.24
-- Description:	Get Register User by taz.
-- =============================================
CREATE PROCEDURE [dbo].[RegisterUser_GetUserByTaz]

	@TazEncryption nvarchar(512)
	
	AS

	BEGIN
		Select ID, HebrewFullName, EnglishFullName, BirthdayDate, Taz, Password, CreatedAt
		From RegisterUser With(nolock)
		Where Taz = @TazEncryption
	END


GO
/****** Object:  StoredProcedure [dbo].[RegisterUser_Insert]    Script Date: 13/02/2025 04:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Daniel Amos Artzi
-- Create date: 10.02.24
-- Description:	Creating New Register User
-- =============================================
CREATE PROCEDURE [dbo].[RegisterUser_Insert]
	(
		@HebrewFullName NVARCHAR(20),
		@EnglishFullName VARCHAR(15),
		@BirthdayDate date,
		@TazEncryption nvarchar(512),
		@PasswordHash nvarchar(512),
		@CreatedAt date = Null
	)	
	AS
	Begin

		Begin try

			Begin Tran
			 IF @CreatedAt Is Null
			 Begin
				 INSERT INTO RegisterUser
							   (HebrewFullName, EnglishFullName, BirthdayDate, Taz, Password)
							Values
							   (@HebrewFullName, @EnglishFullName, @BirthdayDate, @TazEncryption, @PasswordHash)
			End

			Else
			Begin
				INSERT INTO RegisterUser
							   (HebrewFullName, EnglishFullName, BirthdayDate, Taz, Password, CreatedAt)
							Values
							   (@HebrewFullName, @EnglishFullName, @BirthdayDate, @TazEncryption, @PasswordHash,@CreatedAt )
			End
						
			Commit Tran

			--We will retrieve the last values saved in the table to verify the process integrity
			Declare @UserID INT = SCOPE_IDENTITY() -- Used to retrieve the last value of the IDENTITY column 
													   -- generated after adding a new row to the table.
			Select ID, HebrewFullName, EnglishFullName, BirthdayDate, Taz, Password, CreatedAt
			From RegisterUser with(nolock)
			Where ID = @UserID
		End try

		Begin catch
			Rollback Tran
			Select ERROR_MESSAGE() AS ErrorMessage
	    End catch
	End
GO
/****** Object:  StoredProcedure [dbo].[TransactionAction_Delete]    Script Date: 13/02/2025 04:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Daniel Amos Artzi
-- Create date: 10.02.24
-- Description:	Deleting Transaction Action
-- =============================================
CREATE PROCEDURE [dbo].[TransactionAction_Delete]

	@TransactionActionID INT
	 
	AS
	Begin

		Begin try

			Begin Tran

			   -- Checks if the TransactionActionID exists
				If Exists (
							Select 1 
							From TransactionAction
							Where ID = @TransactionActionID
						  )
				Begin

					-- Saves the data before deletion in a table variable @TransactionDataTable
					-- This saves the deleted data in case it needs to be restored or checked later.
					Declare @TransactionDataTable Table
					(
						ID int,
						CreatedAt date,
						UpdatedAt date,
						Amount int,
						BankAccountNumber varchar(10),
						TransactionType nvarchar(50),
						StatusAction nvarchar(100),
						TokenResponse nvarchar(max)
					);

					INSERT INTO @TransactionDataTable

					-- Getting all the information from the view about TransactionHistory According to TransactionActionID
					SELECT  TransactionActionID As ID, CreatedAt, UpdatedAt,
					Amount, BankAccountNumber, TransactionType, 
					StatusAction, TokenResponse 
					From TransactionHistoryFullDataView
					Where TransactionActionID = @TransactionActionID

					-- Deletes from linked tables
					Delete From TransactionHistory
					Where	TransactionActionID = @TransactionActionID

					Delete From TransactionAction
					Where	ID = @TransactionActionID

					-- Check if the addition was successful based on @@ROWCOUNT.
					If @@ROWCOUNT = 0
					Begin
						RAISERROR('No rows were deleted.', 16, 1);
					End
				End

				Else
				Begin
					RAISERROR('Transaction Action ID does not exist.', 16, 1);
				End

			Commit Tran
			Select * From @TransactionDataTable
			
	  End try

	  Begin catch
	  		Rollback Tran
	  		Select ERROR_MESSAGE() AS ErrorMessage
	  End catch
  End
GO
/****** Object:  StoredProcedure [dbo].[TransactionAction_Insert]    Script Date: 13/02/2025 04:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Daniel Amos Artzi
-- Create date: 10.02.24
-- Description:	Creating New Transaction Action
-- =============================================
CREATE PROCEDURE [dbo].[TransactionAction_Insert]
	(
		@TazEncryption nvarchar(512),
		@Amount int,
		@BankAccountNumber varchar(10),
		@TransactionType nvarchar(50),
		@StatusAction nvarchar(100) = Null,
		@TokenResponse nvarchar(max) = Null,
		@CreatedAt date = Null
	)	
	AS
	Begin

		Begin Try

			Begin Tran

				-- Finding the TransactionTypeID
				-- From TransactionType
				-- By  @TransactionType
				Declare @TransactionTypeID INT
				Select @TransactionTypeID = ID
											From TransactionType With(nolock)
											Where [Name] = @TransactionType

				-- If TransactionType is not found, display an error
				If @TransactionTypeID IS NULL
				Begin
				    Raiserror('Transaction Type not found: %s', 16, 1, @TransactionType);
				END

				-- Finding the UserID 
				-- From RegisterUser 
				-- By @TazEncryption
				Declare @UserID INT
				Select @UserID = ID
								From RegisterUser With(nolock)
								Where Taz = @TazEncryption

				 If @CreatedAt Is Null
				 Begin
					 Insert Into TransactionAction
								   (TransactionTypeID, BankAccountNumber, Amount, 
								    StatusAction, TokenResponse)
								Values
								   (@TransactionTypeID, @BankAccountNumber, @Amount, 
								    @StatusAction, @TokenResponse)
				 End

				 Else
				 Begin
					Insert Into TransactionAction
								   (TransactionTypeID, BankAccountNumber, Amount, 
								    StatusAction, TokenResponse, CreatedAt)
								Values
								   (@TransactionTypeID, @BankAccountNumber, @Amount, 
								    @StatusAction, @TokenResponse, @CreatedAt )
				 End
			 
			 --We will retrieve the last values saved in the table to verify the process integrity
			 Declare @TransactionActionID INT = SCOPE_IDENTITY() -- Used to retrieve the last value of the IDENTITY column 	
																 -- generated after adding a new row to the table.
			 Insert Into TransactionHistory
						 (TransactionActionID, UserID)
						 Values
						 (@TransactionActionID, @UserID) 
			Commit Tran

			Select TranAction.ID, CreatedAt,
				   Amount, BankAccountNumber, TranType.Name as TransactionType,
				   StatusAction, TokenResponse
			From TransactionAction TranAction With(nolock)
			Inner Join TransactionType TranType With(nolock) On TranAction.TransactionTypeID = TranType.ID
			Where TranAction.ID = @TransactionActionID
			
		End Try

		Begin Catch
			Rollback Tran
			Select ERROR_MESSAGE() AS ErrorMessage
	    End Catch
	End
GO
/****** Object:  StoredProcedure [dbo].[TransactionAction_Update]    Script Date: 13/02/2025 04:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Daniel Amos Artzi
-- Create date: 10.02.24
-- Description:	Update the Transaction Action Details
-- =============================================
CREATE PROCEDURE [dbo].[TransactionAction_Update]
	(	
		@TransactionActionID int,
		@NewAmount int,
		@NewBankAccountNumber varchar(10),
		@NewUpdateAt date = Null
	)	
	AS
	Begin

		Begin Try

			Begin Tran
		 
				 If @NewUpdateAt Is Null
				 Begin
					  Update TransactionAction
					  Set BankAccountNumber = @NewBankAccountNumber,
						  Amount = @NewAmount,				     
						  UpdatedAt = @NewUpdateAt
					   Where TransactionAction.ID = @TransactionActionID
				 End

				 Else
				 Begin
					  Update TransactionAction
					  Set BankAccountNumber = @NewBankAccountNumber,
						  Amount = @NewAmount,				     
						  UpdatedAt = GetDate()
					  Where TransactionAction.ID = @TransactionActionID
				 End
				
		
			Commit Tran

			Select TranAction.ID, CreatedAt, UpdatedAt,
				   Amount, BankAccountNumber, TranType.Name as TransactionType					   		  
			From TransactionAction TranAction With(nolock)
			Inner Join TransactionType TranType With(nolock) On TranAction.TransactionTypeID = TranType.ID
			Where TranAction.ID = @TransactionActionID
		End Try

		Begin Catch
			Rollback Tran
			Select ERROR_MESSAGE() AS ErrorMessage
	    End Catch
	End
GO
/****** Object:  StoredProcedure [dbo].[TransactionHistory_GetTransactionHistoryByUserID]    Script Date: 13/02/2025 04:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Daniel Amos Artzi
-- Create date: 10.02.24
-- Description:	Get Transaction History UserID.
-- =============================================
CREATE PROCEDURE [dbo].[TransactionHistory_GetTransactionHistoryByUserID]

	@UserID int
	
	AS

	BEGIN
			-- Getting all the information from the view about TransactionHistory
			SELECT TransactionActionID as ID, CreatedAt, UpdatedAt,
			Amount, BankAccountNumber, TransactionType,
			StatusAction,TokenResponse,
			HebrewFullName,EnglishFullName
			From TransactionHistoryFullDataView
			Where TranHistoryUserID = @UserID 
	END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'We will create an index number because it is unique and will make it easier to perform queries' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'INDEX',@level2name=N'IX_Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check for bank account number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'CONSTRAINT',@level2name=N'CK_BankAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check for birthday date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RegisterUser', @level2type=N'CONSTRAINT',@level2name=N'chk_BirthdayDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check for user full name in english ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RegisterUser', @level2type=N'CONSTRAINT',@level2name=N'chk_EnglishFullName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check for user full name in Hebrew' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RegisterUser', @level2type=N'CONSTRAINT',@level2name=N'chk_HebrewFullName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Create BankAccountID indexe for better query performance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionAction', @level2type=N'INDEX',@level2name=N'IX_BankAccountID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Link the table to the TransactionType table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionAction', @level2type=N'CONSTRAINT',@level2name=N'FK_Transaction_TransactionType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check for bank account number len' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionAction', @level2type=N'CONSTRAINT',@level2name=N'CK_BankAccountNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Link the RegisterUser table to the TransactionStatus table as previous ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionHistory', @level2type=N'CONSTRAINT',@level2name=N'FK_TransactionHistory_RegisterUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Link the table to the TransactionAction table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionHistory', @level2type=N'CONSTRAINT',@level2name=N'FK_TransactionHistory_TransactionAction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'We will create an index named because it is unique and will make it easier to perform queries' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionStatus', @level2type=N'INDEX',@level2name=N'IX_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check for transaction status name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionStatus', @level2type=N'CONSTRAINT',@level2name=N'CK_TransactionStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'We will create an index named because it is unique and will make it easier to perform queries' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionType', @level2type=N'INDEX',@level2name=N'IX_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check for transaction type name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionType', @level2type=N'CONSTRAINT',@level2name=N'CK_TransactionType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -144
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TranHistory"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 152
               Right = 320
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TranAction"
            Begin Extent = 
               Top = 153
               Left = 57
               Bottom = 350
               Right = 338
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TranType"
            Begin Extent = 
               Top = 351
               Left = 57
               Bottom = 494
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RUser"
            Begin Extent = 
               Top = 639
               Left = 57
               Bottom = 836
               Right = 296
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TransactionHistoryFullDataView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TransactionHistoryFullDataView'
GO
USE [master]
GO
ALTER DATABASE [DanielAmosDB] SET  READ_WRITE 
GO

USE [GestionTache]
GO
/****** Object:  Table [dbo].[journalisation]    Script Date: 17/05/2021 09:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[journalisation](
	[id_Journa] [int] IDENTITY(1,1) NOT NULL,
	[id_Tache] [int] NOT NULL,
	[id_Utilisateur_aff] [int] NOT NULL,
	[Terminer] [bit] NULL,
	[id_Utilisateur_Crée] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Journa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Projet]    Script Date: 17/05/2021 09:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Projet](
	[id_projet] [int] IDENTITY(1,1) NOT NULL,
	[Titre] [varchar](64) NOT NULL,
	[DescriptionP] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_projet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Statut]    Script Date: 17/05/2021 09:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statut](
	[id_Statut] [int] IDENTITY(1,1) NOT NULL,
	[id_Tache] [int] NOT NULL,
	[id_projet] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Statut] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tache]    Script Date: 17/05/2021 09:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tache](
	[id_Tache] [int] IDENTITY(1,1) NOT NULL,
	[TitreT] [varchar](64) NOT NULL,
	[Echéance] [date] NULL,
	[DescriptionT] [varchar](64) NULL,
	[DateCreation] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Tache] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Utilisateur]    Script Date: 17/05/2021 09:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Utilisateur](
	[id_Utilisateur] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](64) NOT NULL,
	[Prenom] [varchar](64) NOT NULL,
	[Mail] [varchar](64) NOT NULL,
	[Passwd] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Utilisateur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[journalisation]  WITH CHECK ADD  CONSTRAINT [fk3] FOREIGN KEY([id_Tache])
REFERENCES [dbo].[Tache] ([id_Tache])
GO
ALTER TABLE [dbo].[journalisation] CHECK CONSTRAINT [fk3]
GO
ALTER TABLE [dbo].[journalisation]  WITH CHECK ADD  CONSTRAINT [fk4] FOREIGN KEY([id_Utilisateur_aff])
REFERENCES [dbo].[Utilisateur] ([id_Utilisateur])
GO
ALTER TABLE [dbo].[journalisation] CHECK CONSTRAINT [fk4]
GO
ALTER TABLE [dbo].[journalisation]  WITH CHECK ADD  CONSTRAINT [fk6] FOREIGN KEY([id_Utilisateur_Crée])
REFERENCES [dbo].[Utilisateur] ([id_Utilisateur])
GO
ALTER TABLE [dbo].[journalisation] CHECK CONSTRAINT [fk6]
GO
ALTER TABLE [dbo].[Statut]  WITH CHECK ADD  CONSTRAINT [fk1] FOREIGN KEY([id_Tache])
REFERENCES [dbo].[Tache] ([id_Tache])
GO
ALTER TABLE [dbo].[Statut] CHECK CONSTRAINT [fk1]
GO
ALTER TABLE [dbo].[Statut]  WITH CHECK ADD  CONSTRAINT [fk2] FOREIGN KEY([id_projet])
REFERENCES [dbo].[Projet] ([id_projet])
GO
ALTER TABLE [dbo].[Statut] CHECK CONSTRAINT [fk2]
GO

CREATE TABLE DatabaseProperties (
				Name		VARCHAR(64),
				Description	TEXT,	
				Created		DATE			NOT NULL,
				Version		INTEGER			NOT NULL,
				GUID		VARCHAR(36)		NOT NULL
			);
CREATE TABLE IdCounters (
				IdFieldname	VARCHAR(64)	PRIMARY KEY,
				Count		INTEGER		NOT NULL
			);
CREATE TABLE Items (
				VolumeID		INTEGER,
				ItemID			INTEGER,
				ParentID		INTEGER			NOT NULL,
				ItemType		INTEGER			NOT NULL,
				Name			VARCHAR(256)	NOT NULL,
				MimeType		VARCHAR(64),
				MetaData		TEXT,
				Note			TEXT,
				Keywords		TEXT,

				Hash			VARCHAR(64),
				IsContainer		BOOLEAN			NOT NULL DEFAULT 0,


				Location		VARCHAR(4096),
				LastWriteTime	DATE,
				SymLinkTargetID	INTEGER,

				Size			INTEGER,

				PRIMARY KEY (VolumeID, ItemID)
			);
CREATE TABLE Volumes (
				VolumeID	INTEGER			PRIMARY KEY,
				Title		VARCHAR(64),
				Added		DATE,
				VolumeType	INTEGER			NOT NULL,
				IsHashed	BOOLEAN			NOT NULL DEFAULT 0,
				ArchiveNr	VARCHAR(16),
				DriveType	INTEGER			NOT NULL,
				Loaned_To	VARCHAR(64),
				Loaned_Date	DATE,
				Return_Date	DATE,
				Category	VARCHAR(64),
				Description	TEXT,
				Keywords	TEXT,

				Files		INTEGER,
				Dirs		INTEGER,
				Size		INTEGER
			);
CREATE INDEX IDX_Items_ParentID ON Items (ParentID);

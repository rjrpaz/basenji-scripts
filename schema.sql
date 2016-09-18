-- General information about database
CREATE TABLE DatabaseProperties (
-- Name of database
				Name		VARCHAR(64),
-- Additional information
				Description	TEXT,	
-- Date of creation
				Created		DATE			NOT NULL,
-- Database version. I guess is about to manage different database structures 
				Version		INTEGER			NOT NULL,
-- ???
				GUID		VARCHAR(36)		NOT NULL
			);


-- Different media/disk loaded. One register for every media/disk.
CREATE TABLE Volumes (
-- Incremental primary key
				VolumeID	INTEGER			PRIMARY KEY,
-- Name of disk
				Title		VARCHAR(64),
-- Date of creaction
				Added		DATE,
-- ???
				VolumeType	INTEGER			NOT NULL,
-- ???
				IsHashed	BOOLEAN			NOT NULL DEFAULT 0,
-- ???
				ArchiveNr	VARCHAR(16),
-- ???
				DriveType	INTEGER			NOT NULL,
-- ???
				Loaned_To	VARCHAR(64),
-- ???
				Loaned_Date	DATE,
-- ???
				Return_Date	DATE,
-- ???
				Category	VARCHAR(64),
-- ???
				Description	TEXT,
-- ???
				Keywords	TEXT,

-- # of files
				Files		INTEGER,
-- # of dirs
				Dirs		INTEGER,
-- size in bytes
				Size		INTEGER
			);



-- List of elements on a media/disk.
CREATE TABLE Items (
-- What disk it belongs
				VolumeID		INTEGER,
-- Order number inside disk. Includes files and directories.
				ItemID			INTEGER,
-- What item is parent
				ParentID		INTEGER			NOT NULL,
-- 0: directory, 1: file
				ItemType		INTEGER			NOT NULL,
-- filename
				Name			VARCHAR(256)	NOT NULL,
-- kind of file
				MimeType		VARCHAR(64),
-- file metadata, if any
				MetaData		TEXT,
-- additional dat. Ex: additional info of mp3
				Note			TEXT,
-- ??? - Null
				Keywords		TEXT,
-- ??? - Null
				Hash			VARCHAR(64),

-- 1: directory, 0: file
				IsContainer		BOOLEAN			NOT NULL DEFAULT 0,


-- Path to file. "/" if file is at first tree level.
				Location		VARCHAR(4096),
-- Last modification date of file
				LastWriteTime	DATE,
-- ??? - 0
				SymLinkTargetID	INTEGER,

-- Filesize in bytes
				Size			INTEGER,

				PRIMARY KEY (VolumeID, ItemID)
			);



-- Counter for using on next load of media
CREATE TABLE IdCounters (
				IdFieldname	VARCHAR(64)	PRIMARY KEY,
				Count		INTEGER		NOT NULL
			);
CREATE INDEX IDX_Items_ParentID ON Items (ParentID);

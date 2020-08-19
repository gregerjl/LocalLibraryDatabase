-- This is the script to create a new database named LocalLibrary and the tables created in it.
--batch 1
CREATE DATABASE LocalLibrary;

-- GO signals the end of the batch to create the database
GO

--USE LocalLibrary code is to make sure that the new tables are created in the correct database.
--batch 2
USE LocalLibrary;

--CREATE TABLE Authors code creates a table to store the columns and their datatypes as specified below.
CREATE TABLE Authors
--Code for AuthorID column declaring an INT data type, in a field that cannot be null because it is the identity and the primary key.
	(AuthorID		INT				NOT NULL IDENTITY PRIMARY KEY,
--Code for AuthorLastName column declaring the field as varchar with a limit of 50 characters and it can be null.
	AuthorLastName	VARCHAR(50)		NULL,
--Code for AuthorFirstName column declaring the field as varchar with a limit of 50 characters and it can be null.
	AuthorFirstName	VARCHAR(50)		NULL);

--CREATE TABLE Publishers code creates a table to store the columns and their datatypes as specified below.	
CREATE TABLE Publishers
	(PublisherID	INT				NOT NULL IDENTITY PRIMARY KEY,
	PublisherName	VARCHAR(50)		NOT NULL,
	PublisherAddress VARCHAR(50)	NULL,
	PublisherCity	VARCHAR(50)		NULL,
	PublisherState	VARCHAR(20)		NULL,
	PublisherZipCode VARCHAR(20)	NULL,
	PublisherPhone	VARCHAR(20)		NULL);
	
--CREATE TABLE Books code creates a table to store the columns and their datatypes as specified below.		
CREATE TABLE Books
	(BookID			INT				NOT NULL IDENTITY PRIMARY KEY,
	ISBNNumber		VARCHAR(20)		NOT NULL,
	Title			VARCHAR(100)	NOT NULL,
--REFERENCES is used to create a relationship between the Books and Authors tables with AuthorID as a foreign key
	AuthorID		INT				NULL	REFERENCES Authors(AuthorID),
--REFERENCES is used to create a relationship between the Books and Publishers tables with PublisherID as a foreign key
	PublisherID		INT				NULL 	REFERENCES Publishers(PublisherID),
	YearPublished	INT				NULL);

--CREATE TABLE LibraryBranches code creates a table to store the columns and their datatypes as specified below.	
CREATE TABLE LibraryBranches
	(BranchID		INT				NOT NULL IDENTITY PRIMARY KEY,
	BranchName		VARCHAR(50)		NOT NULL,
	BranchAddress	VARCHAR(50)		NULL,
	BranchCity		VARCHAR(50)		NULL,
	BranchState		VARCHAR(20)		NULL,
	BranchZipCode	VARCHAR(20)		NULL,
	BranchPhone		VARCHAR(20)		NULL);

--CREATE TABLE LibraryCardHolders code creates a table to store the columns and their datatypes as specified below.	
CREATE TABLE LibraryCardHolders
	(CardHolderID		INT			NOT NULL IDENTITY PRIMARY KEY,
	CardHolderNumber	VARCHAR(20)	NOT NULL,
	CardHolderLastName	VARCHAR(50)	NOT NULL,
	CardHolderFirstName	VARCHAR(50)	NOT NULL,
	CardHolderAddress	VARCHAR(50)	NULL,
	CardholderCity		VARCHAR(50) NULL,
	CardHolderState		VARCHAR(20)	NULL,
	CardHolderZipCode	VARCHAR(20) NULL,
	CardHolderPhone		VARCHAR(20)	NULL);

--CREATE TABLE BorrowedBooks code creates a table to store the columns and their datatypes as specified below.	
CREATE TABLE BorrowedBooks
	(TransactionID		INT			NOT NULL IDENTITY PRIMARY KEY,
	CardHolderID		INT			NOT NULL	REFERENCES LibraryCardHolders(CardHolderID),
	BookID				INT			NOT NULL	REFERENCES Books(BookID),
	DateBorrowed		DATE		NOT NULL,
	DateReturned		DATE		NULL);

--CREATE TABLE BookCopies_Branches code creates a table to store the columns and their datatypes as specified below.	
CREATE TABLE BookCopies_Branches
	(BookID				INT			NOT NULL 	REFERENCES Books(BookID),
	BranchID			INT			NULL 		REFERENCES LibraryBranches(BranchID),
	ShelfLocation		VARCHAR(20)	NULL);

--End of second batch

	
	
	
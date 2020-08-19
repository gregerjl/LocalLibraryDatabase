-- View statements

--View 1) The system calculates the due dates to prevent user error. 
--And the view provides the user a quick list of books and their due dates.
CREATE VIEW BookDueDate
	AS
	SELECT Title, DateBorrowed, DATEADD(day, 14, DateBorrowed) AS DueDate
		FROM Books B JOIN BorrowedBooks BB
		ON B.BookID = BB.BookID;

--View 2) This view provides the user with a list of borrowed books, showing which ones are late. 
--This allows the user to quickly see what books were returned late. 
CREATE VIEW OverdueBooks
	AS
	SELECT Title,  DATEADD(day, 14, DateBorrowed) AS DueDate, DateReturned,
		CASE
			WHEN DATEDIFF(day, DateBorrowed ,DateReturned)> 14
				THEN 'LATE'
			WHEN DateReturned IS NULL AND (DATEADD(day, 14, DateBorrowed) < GETDATE())
				THEN 'LATE'
			ELSE 'Not Late'			
		END AS Status
		FROM Books B JOIN BorrowedBooks BB
		ON B.BookID = BB.BookID;

--Stored Procedures
--This procedure shows a list of card holders from a certain city.
--This could be used for regional promotional purposes.
Use LocalLibrary;
GO
CREATE PROC spCardHoldersFromCity
	@City	varchar(50)
	AS
	SELECT CardHolderFirstName, CardHolderLastName, CardholderCity 
	FROM LibraryCardHolders 
	WHERE CardHolderCity = @City;

--Execute spCardHoldersFromCity to find library card holders that live in Batavia.		
EXEC spCardHoldersFromCity @City='Batavia';		
	
--This procedure allows new books to be added to the database.	
Use LocalLibrary;
GO
CREATE PROC spInsertNewBook
	@ISBNNumber		VARCHAR(20) = NULL,
	@Title			VARCHAR(100) = NULL,
	@AuthorID		INT	= NULL,
	@PublisherID	INT	= NULL,
	@YearPublished	INT	= NULL	
	AS
		--some error handling
	IF @ISBNNumber IS NULL
    THROW 50001, 'Please enter a valid ISBN Number.', 1;
	IF @Title IS NULL
    THROW 50001, 'Please enter a book title.', 1;
	
	INSERT Books 
	VALUES (@ISBNNumber, @Title, @AuthorID, @PublisherID, @YearPublished);
	RETURN @@IDENTITY
	
	--script for Insert stored procedure
	Use LocalLibrary;
	BEGIN TRY
		DECLARE @BookID INT;
		EXEC	@BookID = spInsertNewBook
				@ISBNNumber = '9780486280615',
				@Title = 'Adventures of Huckleberry Finn',
				@AuthorID = '6',
				@PublisherID = '6',
				@YearPublished	= 1994;
			PRINT 'Row was inserted.';
			PRINT 'New BookID: ' + CONVERT(varchar, @@IDENTITY);
	END TRY
	
	BEGIN CATCH
		PRINT 'An error occurred. Row was not inserted.';
		PRINT 'Error number: ' + CONVERT(varchar, ERROR_NUMBER());
		PRINT 'Error message: ' + CONVERT(varchar, ERROR_MESSAGE());
	END CATCH;
	
	
--	scalar function
-- Calculates the number of books borrowed today.
-- This would be useful for paperwork at the end of each day.
	CREATE FUNCTION fnBooksBorrowedToday()
	RETURNS int
	BEGIN 
	RETURN(SELECT COUNT(*)AS NumberOfBooksBorrowed
	FROM BorrowedBooks
	WHERE DateBorrowed = GETDATE());
END;
---------------------
-- Returns the number of books borrowed to the user.
PRINT CONVERT(varchar, dbo.fnBooksBorrowedToday()) + ' books were borrowed today.';


-- trigger, AFTER, INSERT
-- Trigger stores deleted author rows in authorarchive table.
CREATE TRIGGER Authors_DELETE
	ON Authors
	AFTER DELETE
	AS
	INSERT INTO authorarchive
		(AuthorID, AuthorLastName, AuthorFirstName)
	SELECT AuthorID, AuthorLastName, AuthorFirstName
	FROM Deleted
	
	SELECT * FROM authorarchive
	
--Delete author to test
	DELETE Authors
	WHERE AuthorLastName='Collins';
	
--Convert an insert statement for tables into a transaction 

DECLARE @CardHolderID int;
BEGIN TRY
	BEGIN TRAN;

	INSERT INTO [dbo].[LibraryCardHolders]
	([CardHolderNumber]
      ,[CardHolderLastName]
      ,[CardHolderFirstName]
      ,[CardHolderAddress]
      ,[CardholderCity]
      ,[CardHolderState]
      ,[CardHolderZipCode])
	VALUES
	('19SM289767', 'Howard', 'Joe', '112 West St', 'Felicity', 'OH', '45120'),
	('17JO098984', 'West', 'Mary', '519 Sesame St', 'Amelia', 'OH', '45102');
	
	COMMIT TRAN;
END TRY
BEGIN CATCH
	ROLLBACK TRAN;
END CATCH;


--Write a script that performs a test before committing a transaction for deleting a transaction 

BEGIN TRAN; 
DECLARE @AuthorID int = 2;

    IF 
    (SELECT COUNT(BookID) 
        FROM [Books]  
        WHERE AuthorID=@AuthorID)>=2

    BEGIN 
        DELETE FROM [Books]  
        WHERE AuthorID = @AuthorID 
        COMMIT TRAN; 
        PRINT 'Deletions committed to the database.'; 
    END; 

    ELSE 
        BEGIN 
        ROLLBACK TRAN; 
        PRINT 'Book cannot be deleted'; 
    END; 
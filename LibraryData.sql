INSERT INTO Authors
	VALUES
	('Nield', 'Thomas'),
	('Ullman', 'Larry'),
	('Freeman', 'Adam'),
	('Brinkley', 'Alan'),
	('Felke-Morris', 'Terry'),
	('Twain', 'Mark'),
	('Collins', 'Jackie'),
	('Davis', 'Jim');

INSERT INTO Publishers
	VALUES
	('O''Reilly Media', '1005 Gravenstein Highway', 'North Sebastopol', 'CA', '95472', '707-827-7000'),
	('Peachpit Press', '1255 Battery St', 'San Francisco', 'CA', '94111', '415-274-4780'),
	('Apress', 'One New York Plaza, Suite 4600', 'New York', 'NY', '10004-1562', ''),
	('McGraw-Hill Education', 'Two Penn Plaza, 9th Floor', 'New York', 'NY', '10121-2298', '212-904-2574'),
	('Pearson', '2510 N Dodge St', 'Iowa City', 'IA', '52245', '319-354-9200'),
	('Dover Publications', '31 East 2nd Street', 'Mineola', 'NY', '11501-3852', '');

INSERT INTO Books
	VALUES
	('9781491938614', 'Getting Started with SQL', '1', '1', '2016'),
	('9780134301846', 'PHP and MySQL for Dynamic Web Sites: Visual 
		QuickPro Guide', '2', '2', '2017'),
	('9780321812522', 'Modern JavaScript: Develop and Design', '2', 
		'2', '2012'),
	('9781484231494', 'Pro ASP.NET Core MVC 2', '3', '3', '2017'),
	('9780073513294', 'American History: Connecting with the Past', 
		'4', '4', '2014'),
	('9780134801148', 'Web Development and Design Foundations with HTML5',
		'5', '5', '2018');


INSERT INTO LibraryBranches
	VALUES
	('Amelia', '58 Maple St', 'Amelia', 'OH', '45102', '513-752-5580'),
	('Batavia-Main', '180 S Third St', 'Batavia', 'OH', '45103', '513-732-2128'),
	('Bethel', '611 W Plane St', 'Bethel', 'OH', '45106', '512-734-2619'),
	('Goshen', '6678 St Rt 132', 'Goshen', 'OH', '45122', '513-722-1221'),
	('Union Township', '4450 Glen Este-Withamsville Rd', 'Cincinnati', 'OH', '45245', '513-528-1744');

INSERT INTO LibraryCardHolders
	VALUES
	('19SM289765', 'Smith', 'Mike', '104 Main St', 'Amelia', 'OH', '45012', '513-333-4444'),
	('17JO098987', 'Jones', 'Joe', '309 Front St', 'Batavia', 'OH', '45103', '513-333-5555'),
	('98WE963789', 'Wells', 'Sue', '987 Union St', 'Bethel', 'OH', '45106', '513-4444-6666'),
	('19DA369561', 'Davis', 'Mary', '505 High St', 'Goshen', 'OH', '45122', '513-333-7777'),
	('18BR467902', 'Brown', 'Scott', '456 Water St', 'Cincinnati', 'OH', '45245', '513-666-8888'),
	('20MI502045', 'Miller', 'Bill', '775 Oak St', 'Cincinnati', 'OH', '45245', '513-333-9999');

INSERT INTO BorrowedBooks
	VALUES
	('1', '2', '2019-05-15', '2019-05-22'),
	('1', '3', '2019-08-15', '2019-09-20'),
	('2', '3', '2020-02-10', '2020-02-28'),
	('3', '4', '2019-09-19', '2019-10-01'),
	('4', '5', '2020-01-15', '2020-01-21'),
	('2', '3', '2019-06-17', '2019-08-15'),
	('5', '1', '2020-03-02', '2020-03-14'),
	('1', '4', '2020-03-07', '');
	
INSERT INTO BookCopies_Branches
	VALUES
	('1', '5', 'TCH1223N'),
	('2', '4', 'TCH2432U'),
	('3', '3', 'TCH2432U'),
	('4', '2', 'TCH0641F'),
	('5', '1', 'TCH0257B'),
	('6', '4', 'TCH0639F');

-- Additional Insert statements
INSERT INTO LibraryCardHolders
	VALUES
	('19SM289765', 'Howard', 'Beth', '112 West St', 'Felicity', 'OH', '45120'),
	('17JO098987', 'West', 'Bob', '519 Sesame St', 'Amelia', 'OH', '45102');
	
INSERT INTO BorrowedBooks
	VALUES
	('1', '5', '2020-01-15', '2020-01-22'),
	('3', '4', '2020-03-10', '2020-03-18');
	
/*
							SQL Project Name : Bus Online Ticket (BOT)
								Trainee Name : Md.Ataur Rahman
									Trainee ID : 1271516
								Batch ID : ESAD-CS/PNTL-M/53/01

--***********************************************************************************************************

Table of Contents : DDL
			*** SECTION 01: Created a Database [BOT]
			*** SECTION 02: Created Appropriate Tables with column definition related to the project
			*** SECTION 03: ALTER, DROP AND MODIFY TABLES & COLUMNS
			*** SECTION 04: CREATE CLUSTERED AND NONCLUSTERED INDEX
			*** SECTION 05: CREATE SEQUENCE & ALTER SEQUENCE
			*** SECTION 06: CREATE A VIEW & ALTER VIEW
			*** SECTION 07: CREATE STORED PROCEDURE & ALTER STORED PROCEDURE
			*** SECTION 08: CREATE FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED) & ALTER FUNCTION
			*** SECTION 09: CREATE TRIGGER (FOR/AFTER TRIGGER)
			*** SECTION 10: CREATE TRIGGER (INSTEAD OF TRIGGER)


*/
/*
************************************* SECTION 01 ******************************
*/

CREATE DATABASE BOT
ON
(
	name='BOT_Data_1',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BOT_Data_1.mdf',
	size = 25mb,
	maxsize = 60mb,
	filegrowth = 5%
)
LOG ON
(
	name='BOT_Log_1',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BOT_Log_1.ldf',
	size = 5mb,
	maxsize = 30mb,
	filegrowth = 2mb
)
go

/*
************************ SECTION 02 ****************************
		          CREATE TABLES WITH COLUMN DEFINITION 
****************************************************************
*/

--***************** Table with IDENTITY, PRIMARY KEY & nullability CONSTRAINT... ********************--

-- USE SCHEMA
USE BOT
GO
CREATE TABLE country
(
	countryId INT IDENTITY PRIMARY KEY,
	countryName CHAR(16) NOT NULL
)
GO
CREATE TABLE city
(
	cityId INT IDENTITY PRIMARY KEY,
	cityName CHAR(16) NOT NULL
)
GO
CREATE TABLE [shift]
(
	shiftId INT IDENTITY PRIMARY KEY,
	shiftTitle CHAR(50) NOT NULL
)
GO
CREATE TABLE busCategory
(
	categoryId INT identity primary key,
	categoryName VARCHAR(50) NOT NULL
)
GO

CREATE TABLE busStation
(
	busStationId INT IDENTITY PRIMARY KEY,
	busStationName VARCHAR(50) NOT NULL
)
GO

CREATE TABLE busChecker
(
	checkerId int identity primary key,
	checkerName varchar(40) not null
)
GO

CREATE TABLE employees
(
	employeesId int identity primary key,
	employeesName VARCHAR(50) NOT NULL
)
GO
--***************************** Table with PRIMARY KEY & FOREIGN KEY & DEFAULT CONSTRAINT ...********************************
CREATE TABLE busServicePasenjar
(	
	busServiceId INT IDENTITY PRIMARY KEY,
	busServiceName VARCHAR(50) NOT NULL,
	pasenjarName varchar(50),
	dob date not null,
	countryId int references country(countryId),
	cityId int references city(cityId),
	shiftId int references [shift](shiftId),
	email varchar (50) NOT NULL,
	phone CHAR(20) UNIQUE CHECK(phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	[address] varchar(1000),
	posCode nchar(7) default 'n/a'
)
GO
--============== Table with CHECK CONSTRAINT & set CONSTRAINT name ============--
CREATE TABLE bus
(
	busId int  primary key,
	busName varchar(50) not null,
	busNumber int ,
	employeesId int references employees(employeesId),
	checkerId int references busChecker(checkerId),
	busStationId int references busStation(busStationId),
	categoryId int references busCategory(categoryId),
	shiftId int references [shift](shiftId),
	cityId int references city(cityId),
	countryId int references country(countryId)

)
GO
--============== Table with composite PRIMARY KEY ============--
CREATE TABLE busInfo
(	
	employeesId int references employees (employeesId),
	checkerId int references busChecker(checkerId),
	busStationId int references busStation(busStationId),
	categoryId int references busCategory(categoryId),
	shiftId int references [shift](shiftId),
	cityId int references city(cityId),
	countryId int references country(countryId),
	busId int references bus(busId),
	primary key(employeesId,checkerId,busStationId,categoryId,shiftId,cityId,busId)
)
GO
---=======================BUS Reservation System =================
CREATE TABLE schedule
(
	scheduleId int identity primary key,
	busId int references bus(busId),
	startingPoint varchar(40),
	destination varchar(40),
	departureTime time,
	scheduleDate date,
	fareAmount money,
)
GO
CREATE TABLE busCounter
(
	counterId int identity primary key,
	counterName varchar(40) not null,
	phoneNumber char(11)
)
GO

CREATE TABLE ticketPayment
(
	paymentId int identity primary key,
	paymentDate date,
	quantity int,
	unitPrice money,
	discount float,
	AmountPaid money,
	busId int references bus(busId)

)
GO
CREATE TABLE ticketCancel
(
	cancelId int identity primary key,
	cancelDate DATE ,
	busId int references bus(busId),
	 paymentId int references ticketPayment(paymentId)
)
go
CREATE TABLE massages
(
	massagesId int identity primary key ,
	massagesView varchar(50),
	massages date,
	paymentId int references ticketPayment(paymentId),
	cancelId int references ticketCancel(cancelId),
	busId int references bus(busId)

)
GO
CREATE  TABLE passenger
(
	passengerId  int identity primary key,
	passengerName varchar(50) not null,
	age int,
	contactAddress varchar(1000),
	busId int references bus(busId)

)
GO

CREATE TABLE transactionReports
(
	reportId int identity primary key,
	passengerId int  references passenger(passengerId),
	reportDate date,
	paymentId int references ticketPayment(paymentId),
	busId int references bus(busId)

)
GO
CREATE TABLE busDetails
(
	busdetailsId int primary key,
	busId int references bus(busId),
	employeesId int references Employees(employeesId),
	busStationId int references busStation(busStationId),
	checkerId int references busChecker(checkerId),
	categoryId int references busCategory(categoryId),
	shiftId int references [shift](shiftId),
	scheduleId int references schedule(scheduleId),
	counterId int references busCounter(counterId),
	paymentId int references ticketPayment(paymentId),
	cancelId int references ticketCancel(cancelId),
	passengerId int references passenger(passengerId),
	reportId int references transactionReports(reportId)
	
)
GO
--************ CREATE A SCHEMA *****************
CREATE SCHEMA BOT
GO
--************ USE SCHEMA IN A TABLE **************--

CREATE TABLE BOT.busInfo
(
	busId INT,
	busName NVARCHAR(100) NULL,
	busNumber INT NULL
)
GO

/*
****************************** SECTION 03 *******************************
		          ALTER, DROP AND MODIFY TABLES & COLUMNS
**************************************************************************
*/


--============== ALTER TABLE SCHEMA AND TRANSFER TO [DBO] ============--

ALTER SCHEMA dbo TRANSFER  BOT.busInfo
GO

--============== Update column definition ****************--

ALTER TABLE busEmployees
ALTER COLUMN employeesName VARCHAR(40) NOT NULL
GO
--***************** ADD column with DEFAULT CONSTRAINT **********************--

ALTER TABLE busServicePasenjar
ADD posCode nchar(7) default 'n/a'
GO

CREATE TABLE agent
(
	agentId  int identity primary key,
	agentName varchar(50) not null,
)
GO
--************** DROP COLUMN *****************--
ALTER TABLE agent
DROP COLUMN agentName
GO
--***************** DROP TABLE *********************--
DROP TABLE country
GO
--******************** DROP SCHEMA ***********************--
DROP SCHEMA BOT
GO
/*
**********************  SECTION 04 **********************
		          CREATE CLUSTERED AND NONCLUSTERED INDEX
**********************************************************
*/
-- Clustered Index
CREATE NONCLUSTERED INDEX IX_busChecker
ON busChecker
(
	checkerId 
)
GO
-- Nonclustered Index
CREATE  Clustered INDEX IX_busChecke
ON busChecker
(
	checkerId,
	checkerName
)
GO
/*
******************************  SECTION 05  *****************************
							 CREATE SEQUENCE
*************************************************************************
*/

CREATE SEQUENCE seqNum
	AS INT
	START WITH 1
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 200
	CYCLE
	CACHE 10
GO

--******************** ALTER SEQUENCE **********************--

ALTER SEQUENCE seqNum
	MAXVALUE 200
	CYCLE
	CACHE 9
GO
/*
******************************* SECTION 06  ******************************
							  CREATE A VIEW
***************************************************************************
*/
CREATE VIEW VW_busInfo
AS
SELECT employeesId, checkerId, busStationId, categoryId FROM busInfo
GO
-- VIEW WITH ENCRYPTION, SCHEMABINDING & WITH CHECK OPTION
-- A VIEW to get today course sales information

CREATE VIEW VW_TodaybusServicePasenjar
WITH SCHEMABINDING, ENCRYPTION
AS
SELECT busServiceId, busServiceName, countryId, cityId, shiftId FROM dbo.busServicePasenjar
WHERE CONVERT(DATE, dob) = CONVERT(DATE, GETDATE())
WITH CHECK OPTION
GO



--************************** ALTER VIEW **************************--

ALTER VIEW VW_busInfo
AS
SELECT employeesId, busId, checkerId, busStationId, shiftId,cityId FROM busInfo
GO
/*
*******************************  SECTION 07  *****************************************
							 STORED PROCEDURE
**************************************************************************************
*/
--******************STORED PROCEDURE for insert data using parameter *******************--
CREATE PROCEDURE spInsertbusServicePasenjar	@pasenjarName VARCHAR(50),
									@dob DATE,
									@countryId INT,
									@cityId INT,
									@shiftId INT,
									@email VARCHAR(40),
									@phone CHAR(20),
									@address VARCHAR(100),
									@posCode NCHAR(12)
AS
BEGIN
	INSERT INTO busServicePasenjar(pasenjarName, dob,countryId,cityId,shiftId, email, phone, [address]) 
	VALUES(@pasenjarName, @dob, @countryId, @cityId, @shiftId, @email, @phone,@address, @posCode)
END
GO
--************* STORED PROCEDURE for insert data with OUTPUT parameter *************--
CREATE PROCEDURE spInsertbusServicePasenjar	@pasenjarName VARCHAR(50),
											@dob DATE,
											@countryId INT,
											@cityId INT,
											@shiftId INT,
											@email VARCHAR(40),
											@phone CHAR(20),
											@address VARCHAR(70),
											@posCode NCHAR(12)
AS
BEGIN
	INSERT INTO busServicePasenjar(pasenjarName, dob,countryId,cityId,shiftId, email, phone, [address],posCode) 
	VALUES(@pasenjarName, @dob, @countryId, @cityId, @shiftId, @email, @phone, @address, @posCode)
	SELECT  @pasenjarName = IDENT_CURRENT('bus')
END
GO

--***********************STORED PROCEDURE for UPDATE data ********************--
CREATE PROCEDURE spUpdateSchedule	@scheduleId INT,
									@scheduleDate DATE
AS
BEGIN
	UPDATE schedule
	SET
	scheduleDate = @scheduleDate
	WHERE scheduleId = @scheduleId
END
GO

--************************ STORED PROCEDURE for DELETE Table data ******************

CREATE PROCEDURE spDeleteBusCounter	@counterId INT
AS
BEGIN
	DELETE FROM busCounter
	WHERE counterId = @counterId
END
GO
--************************ ALTER STORED PROCEDURE **********************--

ALTER PROCEDURE spUpdateSchedule	@scheduleId INT,
								@scheduleDate DATE,
								@fareAmount NVARCHAR(200)
AS
BEGIN
	UPDATE schedule
	SET
	scheduleDate = @scheduleDate,
	fareAmount = @fareAmount
	WHERE fareAmount = @fareAmount
END
GO

--********* TRY CATCH IN A STORED PROCEDURE & RAISERROR WITH ERROR NUMBER AND ERROR MESSAGE **************--

CREATE PROCEDURE spRaisError
AS
BEGIN
	BEGIN TRY
		DELETE FROM busCounter
	END TRY
	BEGIN CATCH
		DECLARE @Error VARCHAR(200) = 'Error' + CONVERT(varchar, ERROR_NUMBER(), 1) + ' : ' + ERROR_MESSAGE()
		RAISERROR(@Error, 1, 1)
	END CATCH
END
GO
/*
******************************  SECTION 08  *****************************
								 FUNCTION
*************************************************************************
*/

--********************** A SCALAR FUNCTION **********************--
-- A Scalar Function to get Current Year Total Net Sales
CREATE FUNCTION fnCurrentYearSales()
RETURNS  MONEY
AS
BEGIN
	DECLARE @AmountPaid MONEY

	SELECT @AmountPaid = SUM((unitPrice*quantity))
	FROM ticketPayment
	WHERE YEAR(ticketPayment.paymentDate) = YEAR(GETDATE())

	RETURN @AmountPaid
END
GO
CREATE FUNCTION fnMonthlyTicketPayment(@year INT, @month INT)
RETURNS TABLE
AS
RETURN
(
	SELECT 
			SUM(unitPrice) AS 'Total Sales',
			SUM(quantity) AS 'Net Sales'
	FROM ticketPayment
	WHERE YEAR(ticketPayment.paymentDate) = @year AND MONTH(ticketPayment.paymentDate) = @month

)
GO
--******************** A MULTISTATEMENT TABLE VALUED FUNCTION *****************--

-- Function to get monthly net sales using two parameter @year & @month
CREATE FUNCTION fnMonthlytcketPayment(@year INT, @month INT)
RETURNS @sales TABLE
(
	[paymentId] INT,
	[paymentDate] DATETIME,
	[quantity] int,
	[unitPrice] MONEY,
	[discount ]MONEY,
	[Net Sale] MONEY
)
AS
BEGIN	
	INSERT INTO @sales
	SELECT
	ticketPayment.paymentId,
	ticketPayment.paymentDate,
	ticketPayment.[quantity],
	ticketPayment.[unitPrice],
	ticketPayment.discount,
	ticketPayment.AmountPaid
	FROM busDetails
	INNER JOIN bus ON bus.busId = busDetails.busId
	INNER JOIN ticketPayment ON ticketPayment.paymentId = busDetails.paymentId
	WHERE YEAR(ticketPayment.paymentDate) = @year AND MONTH(ticketPayment.paymentDate) = @month

	RETURN
END
GO
--********************* ALTER FUNCTION =*************************--

ALTER FUNCTION fnMonthlyticketPayment (@year INT, @month INT)
RETURNS TABLE
AS
RETURN
(
	SELECT 
	SUM(unitPrice) AS 'Total Sales',
	SUM(discount) AS 'Total Discount',
	SUM(AmountPaid) AS 'Net Sales'
	FROM ticketPayment
	WHERE YEAR(ticketPayment.paymentDate) = @year AND MONTH(ticketPayment.paymentDate) = @month
)
GO
/*
*****************************  SECTION 09 **************************
							FOR/AFTER TRIGGER
********************************************************************
*/

-- Create trigger on Stockin table and update stock in product table
CREATE TRIGGER trticketPayment
ON ticketPayment
FOR INSERT
AS
BEGIN
	DECLARE @pid INT
	DECLARE @stock INT

	SELECT
	@pid = paymentId,
	@stock = inserted.quantity
	FROM inserted

	UPDATE ticketPayment
	SET AmountPaid = AmountPaid + @stock
	WHERE busId = @pid
	PRINT 'Stock updated via Stock Entry'
END
GO


--******************* AN AFTER/FOR TRIGGER FOR INSERT, UPDATE, DELETE **************--

-- Create trigger on tblProductForInfrastructure table and update stock in product table
CREATE TRIGGER trticketPaymentStockManage
ON ticketPayment
FOR INSERT, UPDATE, DELETE
AS
	BEGIN
		DECLARE @pid INT
		DECLARE @qty INT
				-- Check if this trigger is executed only for updated
				IF (EXISTS(SELECT * FROM INSERTED) AND EXISTS(SELECT * FROM DELETED))
					BEGIN
						UPDATE ticketPayment
						SET @pid = (CASE
										WHEN i.quantity > d.quantity THEN @pid - (i.quantity-i.quantity)
										WHEN i.quantity < d.quantity THEN @pid + (d.quantity-i.quantity)
										ELSE i.quantity
									END)
						FROM inserted As i
						INNER JOIN deleted AS d
						ON i.paymentId = d.paymentId
						WHERE ticketPayment.paymentId = i.paymentId
						PRINT 'Stock updated via modified sales entry'
					END
				--Check if this trigger is for only for inserted
				ELSE IF (EXISTS(SELECT * FROM INSERTED) AND NOT EXISTS(SELECT * FROM DELETED))
					BEGIN
						SELECT
						@pid = paymentId,
						@qty = quantity
						FROM inserted

						UPDATE ticketPayment
						SET AmountPaid = AmountPaid - @qty
						WHERE paymentId = @pid
						PRINT 'Stock updated via new sales'
					END
				-- Check if this trigger is executed only for deleted
				ELSE IF (EXISTS(SELECT * FROM DELETED) AND NOT EXISTS(SELECT * FROM INSERTED))
					BEGIN
						SELECT
						@pid = paymentId,
						@qty = quantity
						FROM deleted

						UPDATE ticketPayment
						SET AmountPaid = AmountPaid + @qty
						WHERE paymentId = @pid
						PRINT 'Stock updated due to deleted sales id'
					END
				-- If not match any condition then rollback the transaction
				ELSE ROLLBACK TRANSACTION
		END
GO

/*
***************************  SECTION 10  ************************
							INSTEAD OF TRIGGER
********************************************************************
*/

-- Trigger For get price from another table and manipulate data in current table
CREATE TRIGGER ticketPayment
ON ticketPayment
INSTEAD OF INSERT
AS
BEGIN
	IF ((SELECT COUNT(*) FROM inserted) > 0)
		BEGIN
			INSERT INTO busDetails(paymentId, busId)
			SELECT
			i.paymentId,
			i.busId,
			ticketPayment.unitPrice
			from inserted i
			INNER JOIN ticketPayment ON ticketPayment.paymentId = i.paymentId
		END
	ELSE
	BEGIN
		PRINT 'Error Occured for Inserting Data Into busDetails Table !'
	END
END
GO

--****************** AN INSTEAD OF TRIGGER ON VIEW --******************

CREATE TRIGGER trViewInsteadInsert
ON VW_busInfo
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO busDetails(paymentId, cancelId)
	SELECT i.checkerId,i.shiftId FROM inserted i
END
GO

--****************** ALTER TRIGGER --******************

ALTER TRIGGER trViewInsteadInsert
ON VW_busInfo
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO busDetails(paymentId, cancelId,reportId)
	SELECT i.employeesId, i.checkerId, i.cityId FROM inserted i
END
GO
-----=======================BUS Reservation System =================
--CREATE TABLE schedule
--(
--	id int identity primary key,
--	busId int references bus(busId),
--	startingPoint varchar(40),
--	destination varchar(40),
--	departureTime varchar(40),
--	scheduleDate date,
--	fareAmount money,
--)
--CREATE TABLE busCounter
--(
--	counterId int identity primary key,
--	counterName varchar(40) not null,
--	phoneNumber char(11)
--)
--GO
--CREATE TABLE driver
--(
--	driverId int identity primary key,
--	driverName varchar(50) not null,
--	busId int references bus(busId)

--)
--GO
--CREATE TABLE ticketPayment
--(
--	paymentId int identity primary key,
--	paymentDate datetime(),
--	busId int references bus(busId)

--)
--GO
--CREATE TABLE ticketCancel
--(
--	cancelId int identity primary key,
--	cancelDate datetime(),
--	busId int references bus(busId)

--)
--go
--CREATE TABLE massages
--(
--	massagesId int identity primary key ,
--	massagesView varchar(50),
--	massages datetime,
--	paymentId int references ticketPayment(paymentId),
--	cancelId int references ticketCancel(cancelId),
--	busId int references bus(busId)

--)
--CREATE  TABLE passenger
--(
--	passengerId  int identity primary key,
--	passengerName varchar(50) not null,
--	genderId int references gender(genderId),
--	age int,
--	contactAddress varchar(1000),
--	busId int references bus(busId)

--)
--GO

--CREATE TABLE transactionReports
--(
--	reportId int identity primary key,
--	passengerId int  references passenger(passengerId),
--	reportDate datetime(),
--	paymentId int references ticketPayment(paymentId),
--	busId int references bus(busId)

--)
--GO
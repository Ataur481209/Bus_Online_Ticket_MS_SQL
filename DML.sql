/*

					SQL Project Name : Bus Online Ticket(BOT)
							    Trainee Name : Md.Ataur Rahman  
						    	  Trainee ID : 1271516     
							Batch ID : ESAD-CS/PNTL-M/53/01 

 **************************************************************************************************
Table of Contents: DML
			** SECTION 01: INSERT DATA USING INSERT INTO KEYWORD
			** SECTION 02: INSERT DATA THROUGH STORED PROCEDURE
				SUB SECTION => 2.1 : INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER 
				SUB SECTION => 2.2 : INSERT DATA USING SEQUENCE VALUE
			** SECTION 03: UPDATE DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.1 : UPDATE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.2 : DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.3 : STORED PROCEDURE WITH TRY CATCH AND RAISE ERROR
			** SECTION 04: INSERT UPDATE DELETE DATA THROUGH VIEW
				SUB SECTION => 4.1 : INSERT DATA through view
				SUB SECTION => 4.2 : UPDATE DATA through view
				SUB SECTION => 4.3 : DELETE DATA through view
			** SECTION 05: RETREIVE DATA USING FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED)
			** SECTION 06: TEST TRIGGER (FOR/AFTER TRIGGER ON TABLE, INSTEAD OF TRIGGER ON TABLE & VIEW)
			** SECTION 07: QUERY
				SUB SECTION => 7.01 : SELECT FROM TABLE
				SUB SECTION => 7.02 : SELECT FROM VIEW
				SUB SECTION => 7.03 : SELECT INTO
				SUB SECTION => 7.04 : IMPLICIT JOIN WITH WHERE BY CLAUSE, ORDER BY CLAUSE
				SUB SECTION => 7.05 : INNER JOIN WITH GROUP BY CLAUSE
				SUB SECTION => 7.06 : OUTER JOIN
				SUB SECTION => 7.07 : CROSS JOIN
				SUB SECTION => 7.08 : TOP CLAUSE WITH TIES
				SUB SECTION => 7.09 : DISTINCT
				SUB SECTION => 7.10 : COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR
				SUB SECTION => 7.11 : LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE
				SUB SECTION => 7.12 : OFFSET FETCH
				SUB SECTION => 7.13 : UNION
				SUB SECTION => 7.14 : EXCEPT INTERSECT
				SUB SECTION => 7.15 : AGGREGATE FUNCTIONS
				SUB SECTION => 7.16 : GROUP BY & HAVING CLAUSE
				SUB SECTION => 7.17 : ROLLUP & CUBE OPERATOR
				SUB SECTION => 7.18 : GROUPING SETS
				SUB SECTION => 7.19 : SUB-QUERIES (INNER, CORRELATED)
				SUB SECTION => 7.20 : EXISTS
				SUB SECTION => 7.21 : CTE
				SUB SECTION => 7.22 : MERGE
				SUB SECTION => 7.23 : BUILT IN FUNCTION
				SUB SECTION => 7.24 : CASE
				SUB SECTION => 7.25 : IIF
				SUB SECTION => 7.26 : COALESCE & ISNULL
				SUB SECTION => 7.27 : WHILE
				SUB SECTION => 7.28 : GROPING FUNCTION
				SUB SECTION => 7.29 : RANKING FUNCTION
				SUB SECTION => 7.30 : IF ELSE & PRINT
				SUB SECTION => 7.31 : TRY CATCH
				SUB SECTION => 7.32 : GOTO
				SUB SECTION => 7.33 : WAITFOR
				SUB SECTION => 7.34 : sp_helptext
				SUB SECTION => 7.35 : TRANSACTION WITH SAVE POINT
*/
/*
********************************  SECTION 01  ****************************
					INSERT DATA USING INSERT INTO KEYWORD
**************************************************************************
*/
USE BOT
GO

INSERT INTO country VALUES
('Bangladesh'),
('Bangladesh')
GO
SELECT * FROM country
GO

INSERT INTO city VALUES
('Dhaka'),
('Barishal'),
('Shaleet'),
('Jasor'),
('kulna')
GO
SELECT * FROM city
GO

INSERT INTO [shift] VALUES
('Day shift'),
('Night shift')
GO
SELECT * FROM [shift]
GO

INSERT INTO busCategory VALUES
('AC bus'),
('Non Ac bus')
GO
SELECT * FROM busCategory
GO

INSERT INTO busStation VALUES
('Dhaka Gaptoly'),
('Barishal NotullBath ')
GO
SELECT * FROM busStation
GO

INSERT INTO busChecker VALUES
('Asad'),
('Babul')
GO
SELECT * FROM busChecker
GO

INSERT INTO Employees VALUES
('DriverName:Batsha'),
('SupervizerName: Kamal '),
('HelperName: Akkas Ali')

GO
SELECT * FROM Employees
GO
--************** Table with PRIMARY KEY & FOREIGN KEY & DEFAULT CONSTRAINT ...***********
INSERT INTO busServicePasenjar VALUES
('Ena','2022-12-03',null,null,null,null,1,null,1,null,'akas',null,null,'asad@gmail.com','019255252','birulia,savar,dhaka','1121')
GO
SELECT * FROM busServicePasenjar
GO
--******************** Table with CHECK CONSTRAINT & set CONSTRAINT name ******************--
INSERT INTO bus VALUES
(1,'Hanif Enterprice',102,1,1,1,1,1,1,1),
(2,'Sakura Enterprice',103,2,2,2,2,2,2,2)
GO
SELECT * FROM bus
GO
--******************Table with composite PRIMARY KEY ********************--
INSERT INTO busInfo VALUES
(1,1,1,1,1,1,1,1)
GO
SELECT * FROM busInfo
GO
--******************BUS Reservation System --******************
--
INSERT INTO schedule VALUES 
(1,'Dhaka Gabtoly','Barishal Notullahbath','10:30 AM','2022-12-03',500)
GO
SELECT * FROM schedule
GO

INSERT INTO busCounter VALUES
('Dhaka Gabtoty',01664821567)
GO
SELECT * FROM busCounter
GO

INSERT INTO ticketPayment VALUES
('2022-12-03',1,500,.15,455,2)
GO
SELECT * FROM ticketPayment
GO

INSERT INTO ticketCancel VALUES
('2022-12-02',1,1)
GO
SELECT * FROM ticketCancel
GO

INSERT INTO massages VALUES
('Good Buy','2022-12-03',1,1,1)
GO
SELECT * FROM massages
GO

INSERT INTO passenger VALUES
('Akas',26,'birulia,savar,dhaka',1)
GO
SELECT * FROM passenger
go

INSERT INTO transactionReports VALUES
(2,'2022-12-03',1,1)
GO
SELECT * FROM transactionReports
GO

INSERT INTO busDetails VALUES
(1,1,1,1,1,1,1,1,1,1,1,1,1)
GO
SELECT * FROM busDetails
GO
--************ USE SCHEMA IN A TABLE **************--
INSERT INTO BOT.busInfo VALUES
(1,'Hanif',1)
GO
SELECT * FROM BOT.busInfo
GO
-- STORED PROCEDURE for update trainee (closing date & closing remarks)
EXEC spUpdateticketPayment 1, '2022-01-01', 'unitPrice'
GO
SELECT * FROM busDetails
--****************** DELETE DATA THROUGH STORED PROCEDURE --******************

-- STORED PROCEDURE for Delete CourseSales
EXEC spDeletebusChecker 1
GO
SELECT * FROM busChecker
GO
--****************** STORED PROCEDURE WITH TRY CATCH AND RAISE ERROR --******************

EXEC spRaisError
GO


/*
--******************  SECTION 04  --******************
					INSERT UPDATE DELETE DATA THROUGH VIEW
==========================================================================
*/

--****************** INSERT DATA through view --******************
SELECT * FROM VW_busInfo
GO

INSERT INTO VW_busInfo(employeesId, checkerId, busStationId) VALUES(1,1,1)
GO
SELECT * FROM VW_busInfo
GO
--****************** UPDATE DATA through view --******************
UPDATE VW_TodaybusServicePasenjar
SET shiftId = 0.15
WHERE countryId = 10
GO
SELECT * FROM VW_TodaybusServicePasenjar
GO
--****************** DELETE DATA through view --******************
DELETE FROM VW_TodaybusServicePasenjar
WHERE shiftId = 1
GO
SELECT * FROM VW_TodaybusServicePasenjar
GO

/*
--******************  SECTION 05  --******************
						RETREIVE DATA USING FUNCTION
--***************************************************************
*/

-- A Scalar Function to get monthly total net sales using two parameter @year & @month
SELECT dbo.fnCurrentYearSales() AS 'Currrent Year Net Sale'
GO
-- A Inline Table Valued Function to get monthly total sales, discount & net sales using two parameter @year & @month
SELECT * FROM dbo.fnCurrentYearSales(1)
GO


-- A Multi Statement Table Valued Function to get monthly net sales using two parameter @year & @month
SELECT * FROM dbo.fnMonthlySalesDetails(2022, 6)
GO

/*
--******************  SECTION 06  --******************
					 TEST TRIGGER
--*****************************************************
*/
--****************** FOR/AFTER TRIGGER ON TABLE --******************

-- EX - 01
-- INSERT DATA IN Stockin TABLE and AUTOMATICALLY UPDATE STOCK IN Prodcut TABLE

SELECT * FROM ticketPayment
SELECT * FROM ticketPayment
GO
INSERT INTO ticketPayment(paymentId, AmountPaid) VALUES (1, 500)
GO

SELECT * FROM tblProduct
SELECT * FROM tblStockIn
GO

-- EX - 02
-- INSERT DATA ON tblProductForInfrastructure TABLE and AUTOMATICALLY UPDATE STOCK IN Prodcut TABLE

SELECT * FROM tblProduct
SELECT * FROM tblProductForInfrastructure

INSERT INTO tblProductForInfrastructure(productId, quantity) VALUES(4, 5)

SELECT * FROM tblProduct
SELECT * FROM tblProductForInfrastructure
GO

--============== INSTEAD OF TRIGGER ON TABLE ============--


--INSTEAD OF INSERT TRIGGER ON courseSales TO get price from course table and manipulate data in current table

SELECT * FROM busCounter
SELECT * FROM busInfo
GO
INSERT INTO busCounter(counterId,counterName) VALUES
(1,'Dhaka')
GO
SELECT * FROM busInfo
GO


--============== AN INSTEAD OF TRIGGER ON VIEW ============--

SELECT * FROM VW_busInfo

INSERT INTO VW_busInfo(busId,checkerId,cityId) VALUES(13, 3, .10)

SELECT * FROM VW_busInfo
GO


/*
==============================  SECTION 07  ==============================
								  QUERY
==========================================================================
*/


--============== 7.01 A SELECT STATEMENT TO GET RESULT SET FROM A TABLE ============--

SELECT * FROM VW_busInfo
GO

--============== 7.02 A SELECT STATEMENT TO GET today course sales information FROM A VIEW ============--

SELECT * FROM VW_busInfo
GO

--============== 7.03 SELECT INTO > SAVE RESULT SET TO A NEW TEMPORARY TABLE ============--

SELECT * INTO VW_busInfo
FROM VW_busInfo
GO

SELECT * FROM busCounter
GO

--*************** IMPLICIT JOIN WITH WHERE BY CLAUSE, ORDER BY CLAUSE ***********--

SELECT busId,paymentId FROM busDetails
WHERE busId=1
order by paymentId asc , paymentId desc
--************ 7.05 INNER JOIN WITH GROUP BY CLAUSE **********

SELECT passengerName,count(tp.quantity*unitPrice) as 'total amount' FROM busDetails bd
inner join passenger p on bd.passengerId=p.passengerId
inner join ticketPayment tp on bd.paymentId=tp.paymentId
group by passengerName 
--============== 7.06 OUTER JOIN ============--
select * from busDetails bd
left join busInfo bi on bi.busId=bd.busId
right join ticketPayment tp on tp.paymentId=bd.paymentId
full join [shift] s on s.shiftId=bi.shiftId
go
--============== 7.07 CROSS JOIN ============--
select * from busDetails bd
cross join busInfo
go


--============== 7.08 TOP CLAUSE WITH TIES ============--

select * from busInfo bi
inner join bus b on b.busId=bi.busId
order by busName desc
--****************** 7.09 DISTINCT --******************
SELECT distinct cityName FROM busServicePasenjar bp
INNER JOIN city c on c.cityId=bp.cityId
order by cityName

--****************** 7.10 COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR --******************

SELECT * FROM busDetails
WHERE passengerId = 1
AND paymentId BETWEEN '1996-01-01' AND '1997-12-10'
AND NOT  passengerId= 1
AND passengerId> 1400
OR passengerId = 1
GO

--****************** 7.11 LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE --******************

SELECT * FROM busDetails
WHERE name LIKE '%n'
AND cityId NOT IN ('1' ,'2')
AND reference IS NULL
GO

--****************** 7.12 OFFSET FETCH --******************

-- OFFSET 5 ROWS
SELECT * FROM busStation
ORDER BY busStationName
OFFSET 5 ROWS
GO

-- OFFSET 10 ROWS AND GET NEXT 5 ROWS

SELECT * FROM busStation
ORDER BY busStationName
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY
GO

--****************** 7.13 in operator --******************

SELECT * FROM employees
WHERE employeesName IN ('1', '2', '3')

UNION

SELECT * FROM employees
WHERE employeesName IN ('4', '5', '6')
GO

--****************** 7.14 EXCEPT INTERSECT --******************

-- EXCEPT
SELECT * FROM employees

EXCEPT

SELECT * FROM employees
WHERE employeesId = 2
GO

--INTERSECT

SELECT * FROM employees
WHERE employeesName > 2

INTERSECT

SELECT * FROM employees
WHERE employeesId > 15
GO

--****************** 7.15 AGGREGATE FUNCTION --******************

SELECT	COUNT(*) 'Total Sales Count',
		SUM(unitPrice) 'Total Net unitPrice',
		AVG(quantity) 'Average Sale',
		MIN(AmountPaid) 'MIN COURSE FEE',
		(MAX(discount))*100 'MAX Discount %'
FROM ticketPayment
GO

--****************** 7.16 AGGREGATE FUNCTION WITH GROUP BY & HAVING CLAUSE --******************

SELECT b.busId, count(paymentDate) Total, SUM(quantity*unitPrice) 'NET SALES' FROM ticketPayment tp
INNER JOIN busInfo b ON b.busId=b.busId
GROUP BY b.busId 
HAVING SUM(quantity*unitPrice) > 50000
GO

--****************** 7.17 ROLLUP & CUBE OPERATOR --******************

--ROLLUP
SELECT b.busId, count(paymentDate) Total, SUM(quantity*unitPrice) 'NET SALES' FROM ticketPayment tp
INNER JOIN busInfo b ON b.busId=b.busId
GROUP BY rollup b.busId 
order by b.shiftId desc
GO

-- CUBE

SELECT b.busId, count(paymentDate) Total, SUM(quantity*unitPrice) 'NET SALES' FROM ticketPayment tp
INNER JOIN busInfo b ON b.busId=b.busId
GROUP BY cube ( b.busId,b.checkerId) 
order by b.shiftId desc
GO

--****************** 7.18 GROUPING SETS --******************

SELECT b.busId, count(paymentDate) Total, SUM(quantity*unitPrice) 'NET SALES' FROM ticketPayment tp
INNER JOIN busInfo b ON b.busId=b.busId
GROUP BY  GROUPING SETS ( b.busId,b.checkerId) 
order by b.shiftId desc
GO

--****************** 7.19 SUB-QUERIES--******************


--A subquery to findout trainees who have not enrolled yet

SELECT pasenjarName, dob, email, phone, [address] FROM busServicePasenjar
WHERE phone  NOT IN (SELECT phone FROM busServicePasenjar)
ORDER BY pasenjarName
GO

--A correlated subquery

SELECT paymentDate, SUM(unitPrice) 'NET SALES' FROM ticketPayment
GROUP BY paymentDate
HAVING SUM(unitPrice) >50 (SELECT AVG(unitPrice) FROM ticketPayment WHERE ticketPayment.paymentId = ticketPayment.paymentId)
GO

--****************** 7.20 EXISTS  ******************

SELECT pasenjarName, dob, email, phone, [address] FROM busServicePasenjar
WHERE NOT EXISTS 
			(SELECT * FROM busServicePasenjar
				WHERE busServicePasenjar.busServiceId = busServicePasenjar.busServiceId)
GO

--****************** 7.21 CTE ******************

-- A CTE TO GET MAXIMUM SALES COURSE
WITH  AS 
(
SELECT tc.cancelId, count(quantity) TotalCourse FROM ticketPayment tp
INNER JOIN ticketCancel tc ON tc.cancelId=tp.paymentId
GROUP BY tc.cancelId
)
SELECT paymentId, paymentDate from ticketPayment
WHERE unitPrice = (SELECT MAX(unitPrice) FROM ticketPayment)
GO

--****************** 7.22 MERGE --******************

SELECT * FROM ticketPayment
SELECT * FROM ticketCancel
GO

MERGE ticketPayment AS SOURCE
USING ticketCancel AS TARGET
ON SOURCE.paymentId = TARGET.paymentId
WHEN MATCHED THEN
				UPDATE SET
				paymentId = SOURCE.paymentId,
				paymentId = SOURCE.paymentId;
GO

--****************** 7.23 BUILT IN FUNCTION --******************

-- Get current date and time
SELECT GETDATE()
GO

-- GET STRING LENGTH
SELECT employeesId, LEN(employeesName) 'Name Length' FROM employees
GO

-- CONVERT DATA USING CAST()
SELECT CAST(1500 AS decimal(17,2)) AS DecimalNumber
GO

-- CONVERT DATA USING CONVERT()
DECLARE @currTime DATETIME = GETDATE()
SELECT CONVERT(VARCHAR, @currTime, 108) AS ConvertToTime
GO

-- CONVERT DATA USING TRY_CONVERT()
SELECT TRY_CONVERT(FLOAT, 'HELLO', 1) AS ReturnNull
GO

-- GET DIFFERENCE OF DATES
SELECT DATEDIFF(DAY, '2021-01-01', '2022-01-01') AS DAYinYear
GO

-- GET A MONTH NAME
SELECT DATENAME(MONTH, GETDATE()) AS 'Month'
GO

--****************** 7.24 CASE --******************

SELECT 

	CASE 
		WHEN (unitPrice < 40000) THEN 'Lower amount'
		WHEN (unitPrice > 40000) THEN 'Good amount'
END AS 'Status'
FROM ticketPayment tp
INNER JOIN ticketCancel tc ON tc.cancelId =tp.paymentId
GO
 
--****************** 7.25 IIF --******************

SELECT unitPrice,
IIF((unitPrice > 50000), 'Great amount', 'Lower amount') AS 'Status'
FROM ticketPayment tp
INNER JOIN employees e ON tp.paymentId= e.employeesId
GO


--****************** 7.26 COALESCE & ISNULL --******************

SELECT paymentId ,paymentDate,COALESCE(unitPrice, 'All unitPrice') AS unitPrice,
ISNULL(quantity, 'All') AS quantity,
SUM(unitPrice.quantity) AmountPaid
FROM ticketPayment
GROUP BY  ROLLUP (paymentId ,paymentDate)
ORDER BY paymentId DESC, paymentId DESC
GO

--****************** 7.27 WHILE --******************

	DECLARE @counter int
	SET @counter = 0

	WHILE @counter < 20

	BEGIN
	  SET @counter = @counter + 1
	  INSERT INTO ticketPayment(commentId, comment) VALUES((NEXT VALUE FOR [dbo].seqNum), NULL)
	END

	SELECT * FROM ticketPayment
GO

--****************** 7.28 GROPING FUNCTION --******************

SELECT 
	CASE 
		WHEN GROUPING(busId) = 1 THEN ' good'
		ELSE 'Good'
		END AS Better
FROM busDetails
GROUP BY  ROLLUP (busId)
GO

--****************** 7.29 RANKING FUNCTION --******************

SELECT 
RANK() OVER(ORDER BY paymentId) AS 'Rank',
DENSE_RANK() OVER(ORDER BY busId) AS 'Dense_Rank',
NTILE(3) OVER(ORDER BY unitPrice) AS 'NTILE',
paymentId,
busId, 
unitPrice
FROM ticketPayment
GO

--****************** 7.30 IF ELSE & PRINT --******************

DECLARE @AmountPaid MONEY
SELECT @AmountPaid = SUM((unitPrice*quantity))
FROM ticketPayment
WHERE YEAR(ticketPayment.paymentDate) = YEAR(GETDATE())
IF @AmountPaid > 1000000
	BEGIN
		PRINT 'Great ! The sales is greater than target in this year !!'
	END
ELSE
	BEGIN
		PRINT 'Didn''t Reached the goal !'
	END
GO

--****************** 7.31 TRY CATCH --******************

BEGIN TRY
	DELETE FROM busCounter
	PRINT 'SUCCESSFULLY DELETED'
END TRY

BEGIN CATCH
		DECLARE @Error VARCHAR(200) = 'Error' + CONVERT(varchar, ERROR_NUMBER(), 1) + ' : ' + ERROR_MESSAGE()
		PRINT (@Error)
END CATCH
GO

--****************** 7.32 GOTO --******************

DECLARE @value INT
SET @value = 0

WHILE @value <= 10
	BEGIN
	   IF @value = 2
		  GOTO printMsg
	   SET @value = @value + 1

	   	IF @value = 9
		  GOTO printMsg2
	   SET @value = @value + 1
	END
printMsg:
   PRINT 'Crossed Value 2'
printMsg2:
   PRINT 'Crossed Value 9'
GO

--****************** 7.33 WAITFOR --******************

PRINT 'HELLO'
WAITFOR DELAY '00:00:03'
PRINT 'GOOD LUCK'
GO

--****************** 7.34 SYSTEM STORED PROCEDURE(sp_helptext) TO GET UNENCRYPTED STORED PROCEDURE SCRIPT  --******************

EXEC sp_helptext spUpdateticketPayment
GO



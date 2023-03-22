EXEC tSQLt.NewTestClass 'ActualPartsRQFail';
GO

CREATE PROCEDURE [ActualPartsRQFail].[test to retrieve aactual parts with RQ]
AS
BEGIN
    DECLARE @StartDateTime DateTime2; SET @StartDateTime = '2022-09-12 16:00:00.0000000';
	DECLARE @EndDateTime DateTime2; SET @StartDateTime = '2022-09-12 22:00:00.0000000';
	DECLARE @Machine varchar(255); SET @Machine = 'KBLIBFP-BayonetMachineThing';

	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	
   CREATE TABLE actual (
	    Label varchar(255), 
		OptionalProductionDate datetime2, 
		OptionalDiffInMinutesLastPartProduced int, 
		OK int, 
		NOK int, 
		KPI float 
    );
    INSERT INTO actual
	(LABEL, OptionalProductionDate, OptionalDiffInMinutesLastPartProduced, OK, NOK, KPI)
	EXEC dbo.GetActualPartsWithRQ @StartDateTime,@EndDateTime,@Machine

     ------Assertion
    CREATE TABLE expected (
	    Label varchar(255), 
		OptionalProductionDate datetime2, 
		OptionalDiffInMinutesLastPartProduced int, 
		OK int, 
		NOK int, 
		KPI float 
    );

	INSERT INTO expected (Label, OptionalProductionDate, OptionalDiffInMinutesLastPartProduced, OK, NOK, KPI) SELECT '-', '1970-01-01 00:00:00.0000000', 27941367, 0, 0, 0;
	
	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;
GO


EXEC tSQLt.NewTestClass 'ActualPartsRQPass';
GO

CREATE PROCEDURE [ActualPartsRQPass].[test to retrieve aactual parts with RQ]
AS
BEGIN
    DECLARE @StartDateTime DateTime2; SET @StartDateTime = '2022-09-12 16:00:00.0000000';
	DECLARE @EndDateTime DateTime2; SET @StartDateTime = '2022-09-12 22:00:00.0000000';
	DECLARE @Machine varchar(255); SET @Machine = 'KBLIBFP-BayonetMachineThing';

	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	
   CREATE TABLE actual (
	    Label varchar(255), 
		OptionalProductionDate datetime2, 
		OptionalDiffInMinutesLastPartProduced int, 
		OK int, 
		NOK int, 
		KPI float 
    );
    INSERT INTO actual
	(LABEL, OptionalProductionDate, OptionalDiffInMinutesLastPartProduced, OK, NOK, KPI)
	EXEC dbo.GetActualPartsWithRQ @StartDateTime,@EndDateTime,@Machine

     ------Assertion
    CREATE TABLE expected (
	    Label varchar(255), 
		OptionalProductionDate datetime2, 
		OptionalDiffInMinutesLastPartProduced int, 
		OK int, 
		NOK int, 
		KPI float 
    );

	INSERT INTO expected (Label, OptionalProductionDate, OptionalDiffInMinutesLastPartProduced, OK, NOK, KPI) SELECT '-', '1970-01-01 00:00:00.0000000', 27941479, 0, 0, 0;
	
	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;
GO

tSQLt.RunAll


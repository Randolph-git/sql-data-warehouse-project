/*
=============================================================
Create Database and Schemas
=============================================================
Script Overview:
	This script initializes a database named DataWarehouse by first verifying whether it already exists. 
	If an existing instance is found, it is deleted and then recreated. Once the database is created, 
	three schemas—bronze, silver, and gold—are established within it.
	
WARNING:
    Executing this script will permanently remove the DataWarehouse database if it already exists. 
	All stored data will be irreversibly erased. Use this script with caution and confirm that appropriate 
	backups are in place before proceeding.
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO



CREATE LOGIN myuser WITH PASSWORD = 'StrongPassword123!';

CREATE USER myuser FOR LOGIN myuser;

EXEC sp_addrolemember 'db_owner', 'myuser';

--CREATE TABLE tasks (
--    task_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
--    task_description VARCHAR(255) NOT NULL,
--    complete BOOLEAN DEFAULT false NOT NULL,
--    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
--);


--drop table tasks

CREATE TABLE tasks (
    task_id BIGINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    task_description VARCHAR(255) NOT NULL,
    complete BIT NOT NULL DEFAULT 0,
    created_at DATETIME2(6) NOT NULL DEFAULT SYSDATETIME()
);


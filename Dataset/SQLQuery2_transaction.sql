IF OBJECT_ID('transactions', 'U') IS NOT NULL
    DROP TABLE transactions;

SELECT TOP 100 * FROM accounts;

WITH numbers AS (
    SELECT TOP (10) 
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.all_objects
)

SELECT 
    DATEADD(YEAR, n, a.Account_Open_Date) AS Transaction_Date,
    a.Account_ID,
    a.Branch_id,
    a.Amount,
    a.Service_Type,

    -- Random Credit / Debit
    CASE 
        WHEN ABS(CHECKSUM(NEWID())) % 2 = 0 THEN 'CREDIT'
        ELSE 'DEBIT'
    END AS Transaction_type
    into transactions

FROM accounts a
JOIN numbers n 
    ON n.n <= 10   -- up to 10 years (adjust if needed)

WHERE 
    a.Service_Type = 'Savings'
    AND DATEADD(YEAR, n, a.Account_Open_Date) 
        BETWEEN '2022-04-04' AND '2026-03-26';

SELECT TOP 20 * FROM transactions;


WITH numbers AS (
    SELECT TOP (40)
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.all_objects
)

INSERT INTO transactions (
    Transaction_Date,
    Account_ID,
    Branch_id,
    Amount,
    Service_Type,
    Transaction_type
)

SELECT 
    DATEADD(MONTH, n * 3, a.Account_Open_Date),
    a.Account_ID,
    a.Branch_id,
    1000,
    a.Service_Type,
    'CREDIT'

FROM accounts a
JOIN numbers n 
    ON n.n <= 40

WHERE 
    a.Service_Type = 'SSA'
    AND DATEADD(MONTH, n * 3, a.Account_Open_Date) 
        BETWEEN '2022-04-04' AND '2026-03-26';

SELECT TOP 20 * 
FROM transactions
WHERE Service_Type = 'SSA'
ORDER BY Account_ID, Transaction_Date;

WITH numbers AS (
    SELECT TOP (600)   -- enough for long tenure
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.all_objects
)

INSERT INTO transactions (
    Transaction_Date,
    Account_ID,
    Branch_id,
    Amount,
    Service_Type,
    Transaction_type
)

SELECT 
    DATEADD(MONTH, n, a.Account_Open_Date),
    a.Account_ID,
    a.Branch_id,
    a.Amount,
    a.Service_Type,
    'CREDIT'

FROM accounts a
JOIN numbers n 
    ON n.n <= ISNULL(a.Tenure_Year, 0) * 12

WHERE 
    a.Service_Type IN ('RD','RPLI','PLI')
    
    -- skip opening date
    AND DATEADD(MONTH, n, a.Account_Open_Date) > a.Account_Open_Date
    
    -- apply date window
    AND DATEADD(MONTH, n, a.Account_Open_Date) 
        BETWEEN '2022-04-04' AND '2026-03-26';


SELECT TOP 50 *
FROM transactions
WHERE Service_Type IN ('RD','RPLI','PLI')
ORDER BY Account_ID, Transaction_Date;

INSERT INTO transactions (
    Transaction_Date,
    Account_ID,
    Branch_id,
    Amount,
    Service_Type,
    Transaction_type
)

SELECT 
    a.Maturity_Date,
    s.Account_ID,        -- savings account
    s.Branch_id,
    a.Amount,
    'Savings',
    'CREDIT'

FROM accounts a
JOIN accounts s 
    ON a.Customer_ID = s.Customer_ID
    AND s.Service_Type = 'Savings'

WHERE 
    a.Service_Type = 'TD'
    
    -- maturity within window
    AND a.Maturity_Date 
        BETWEEN '2022-04-04' AND '2026-03-26';


SELECT *
FROM transactions
WHERE Service_Type = 'Savings'
AND Transaction_type = 'CREDIT'
ORDER BY Transaction_Date DESC;

select * from transactions;
Software Used: DB Browser (SQLite)
99289_97357_97267


INSERT INTO policyholder (Policyholder_ID, Policyholder_Name, Phone_Num, Policyholder_DOB, Policyholder_Email)
VALUES 
('900729156799', 'Vivian Hong', '0143287780', '1990-07-29', 'vvhong@gmail.com');


DELETE FROM policyholder
WHERE Policyholder_ID = "950615137676"


SELECT * FROM vehicle
WHERE Policyholder_ID = "950615137676"


UPDATE policyholder
SET Policyholder_ID = "010610103409"
WHERE Policyholder_Name = "Andrew Jason"


SELECT * FROM vehicle
WHERE Policyholder_ID = "010610103409"


SELECT 
    policyholder.Policyholder_ID AS "Policyholder ID",
    policyholder.Policyholder_Name AS "Policyholder Name",
    SUM(policy.Premium_Amount) AS "Total Premium"
FROM policyholder
JOIN vehicle ON policyholder.Policyholder_ID = vehicle.Policyholder_ID
JOIN policy ON vehicle.Car_Registration_Num = policy.Car_Registration_Num
GROUP BY policyholder.Policyholder_ID, policyholder.Policyholder_Name
ORDER BY "Total Premium" DESC;


INSERT INTO vehicle (Car_Registration_Num, Vehicle_Type, Policyholder_ID)
VALUES ('QAB 2375 X', 'Sedan', '970125110410');


INSERT INTO policy (Policy_ID, Policy_Type, Policy_Purpose, Policy_Start_Date, Policy_End_Date, Coverage_Details, Premium_Amount, Car_Registration_Num, Bill_ID)
VALUES 
('P031', 'Comprehensive', 'Personal', '2024-03-11', '2029-03-14', 'Full Coverage', 500.00, 'QAB 2375 X', 'B031');


DELETE FROM vehicle
WHERE Car_Registration_Num = 'DCX 9821';


SELECT * FROM policy
WHERE Car_Registration_Num = 'DCX 9821';


UPDATE policy
SET Coverage_Details = 'Third-Party Damage', Policy_End_Date = '2029-02-28'
WHERE Policy_ID = 'P010';


INSERT INTO bills (Bill_ID, Payment_Status)
VALUES
('B032', 'UNPAID');


UPDATE bills
SET Payment_Status = 'PAID'
WHERE Bill_ID = 'B032';


DELETE FROM bills
WHERE Bill_ID = 'B032';


SELECT 
    bills.Bill_ID AS "Bill ID",
    policy.Policy_ID AS "Policy ID",
    policy.Car_Registration_Num AS "Car Registration Number"
FROM bills
JOIN policy ON bills.Bill_ID = policy.Bill_ID;


SELECT
    strftime('%Y-%m', Policy_Start_Date) AS "Month",
    COUNT(*) AS "Number of Policy Sales"
FROM policy
GROUP BY strftime('%Y-%m', Policy_Start_Date)
ORDER BY "Month";


SELECT
     Vehicle_Type AS "Vehicle Type"
     COUNT(*) AS "Number of Vehicle Insured"
FROM vehicle
GROUP BY Vehicle_Type
ORDER BY "Number of Vehicle Insured" DESC
LIMIT 5;
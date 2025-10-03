Software Used: DB Browser (SQLite)
99289_97357_97267

CREATE TABLE "policyholder" (
	"Policyholder_ID"	VARCHAR(12) NOT NULL,
	"Policyholder_Name"	VARCHAR(125),
	"Phone_Num"	VARCHAR(11),
	"Policyholder_DOB"	DATE,
	"Policyholder_Email"	VARCHAR(125),
	PRIMARY KEY("Policyholder_ID")
);


CREATE TABLE "vehicle" (
	"Car_Registration_Num"	VARCHAR(15) NOT NULL,
	"Vehicle_Type"	VARCHAR(125),
	"Policyholder_ID"	VARCHAR(12),
	PRIMARY KEY("Car_Registration_Num"),
	FOREIGN KEY("Policyholder_ID") REFERENCES "policyholder"("Policyholder_ID") ON UPDATE CASCADE
);


CREATE TABLE "bills" (
	"Bill_ID"	VARCHAR(5) NOT NULL,
	"Payment_Status"	VARCHAR(50),
	PRIMARY KEY("Bill_ID")
);


CREATE TABLE "policy" (
	"Policy_ID"	VARCHAR(5) NOT NULL,
	"Policy_Type"	VARCHAR(50),
	"Policy_Purpose"	VARCHAR(125),
	"Policy_Start_Date"	DATE,
	"Policy_End_Date"	DATE,
	"Coverage_Details"	VARCHAR(125),
	"Premium_Amount"	DOUBLE,
	"Car_Registration_Num"	VARCHAR(15),
	"Bill_ID"	VARCHAR(5),
	PRIMARY KEY("Policy_ID"),
	FOREIGN KEY("Bill_ID") REFERENCES "bills"("Bill_ID") ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY("Car_Registration_Num") REFERENCES "vehicle"("Car_Registration_Num") ON UPDATE CASCADE ON DELETE CASCADE
);
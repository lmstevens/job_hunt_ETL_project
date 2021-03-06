-- CREATE one table at a time, upload matching data and then proceed to the next table

CREATE TABLE PopTechIndustries (
    PopTechIndustries_ID INT PRIMARY KEY NOT NULL,
    Industry_Name VARCHAR(30) NOT NULL
);

CREATE TABLE TechHub (
    TechHub_ID INT PRIMARY KEY NOT NULL,
    TechHub_Name VARCHAR(30) NOT NULL,
    Rent_OneBedroom INT,
    Lunch_Price INT,
    Median_HomePrice INT,
    Population INT,
    Number_TechCompanies INT,
    Industry_1 INT,
    Industry_2 INT,
    Industry_3 INT,
	FOREIGN KEY (Industry_1) REFERENCES PopTechIndustries(PopTechIndustries_ID),
	FOREIGN KEY (Industry_2) REFERENCES PopTechIndustries(PopTechIndustries_ID),
	FOREIGN KEY (Industry_3) REFERENCES PopTechIndustries(PopTechIndustries_ID)
 );

CREATE TABLE JobCategory (
    JobCategory_ID INT PRIMARY KEY NOT NULL,
    Category_Name VARCHAR(30) NOT NULL
);

CREATE TABLE JobPosting (
    JobPosting_ID INT PRIMARY KEY NOT NULL,
    JobCategory_ID INT NOT NULL,
    Job_Title VARCHAR(30),
    Company VARCHAR(30),
    Neighborhood VARCHAR(30),
    TechHub_ID INT NOT NULL,
	FOREIGN KEY (JobCategory_ID) REFERENCES JobCategory(JobCategory_ID),
	FOREIGN KEY (TechHub_ID) REFERENCES TechHub(TechHub_ID)
);

CREATE TABLE Salary (
    Salary_ID INT PRIMARY KEY NOT NULL,
    TechHub_ID INT NOT NULL,
    JobCategory_ID INT NOT NULL,
    Avg_SalaryVARCHAR(30)   NOT NULL,
	FOREIGN KEY (TechHub_ID) REFERENCES TechHub(TechHub_ID),
	FOREIGN KEY (JobCategory_ID) REFERENCES JobCategory(JobCategory_ID)
);

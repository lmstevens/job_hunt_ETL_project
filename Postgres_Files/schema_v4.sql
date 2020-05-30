CREATE TABLE TechHub (
    TechHub_ID SERIAL PRIMARY KEY,
    TechHub_Name VARCHAR(30) NOT NULL,
    Rent_OneBedroom INT,
    Lunch_Price INT,
    Median_HomePrice INT,
    Population INT,
    Number_TechCompanies INT
);

CREATE TABLE PopTechIndustries (
    PopTechIndustries_ID SERIAL PRIMARY KEY,
    TechHub_Name VARCHAR(30) NOT NULL,
    Popular_Industry VARCHAR(30)
);

CREATE TABLE JobCategory (
    JobCategory_ID SERIAL PRIMARY KEY,
    Category_Name VARCHAR(30) NOT NULL
);

--CREATE TABLE Neighborhood (
--	Neighborhood_ID SERIAL PRIMARY KEY,
--	Name VARCHAR(30) NOT NULL
--);

CREATE TABLE JobPosting (
    JobPosting_ID SERIAL PRIMARY KEY,
    TechHub_ID INT NOT NULL,
	JobCategory_ID INT NOT NULL,
    Job_Title VARCHAR(30),
    Company VARCHAR(30),
    -- Neighborhood_ID VARCHAR(30) NOT NULL,
    Neighborhood VARCHAR(30),
	FOREIGN KEY (TechHub_ID) REFERENCES TechHub(TechHub_ID),
	FOREIGN KEY (JobCategory_ID) REFERENCES JobCategory(JobCategory_ID)
--	,FOREIGN KEY (NEIGHBORHOOD_ID) REFERENCES Neighborhood(Neighborhood_ID) 
);

CREATE TABLE Salary (
    Salary_ID SERIAL PRIMARY KEY,
    TechHub_ID INT NOT NULL,
    JobCategory_ID INT NOT NULL,
    Avg_Salary INT NOT NULL,
	FOREIGN KEY (TechHub_ID) REFERENCES TechHub(TechHub_ID),
	FOREIGN KEY (JobCategory_ID) REFERENCES JobCategory(JobCategory_ID) 
);


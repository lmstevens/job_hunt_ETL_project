-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/mbmvBu
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Div_Neighborhood" (
    "Neighborhood_ID" INT   NOT NULL,
    "Name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Div_Neighborhood" PRIMARY KEY (
        "Neighborhood_ID"
     )
);

CREATE TABLE "Div_TechHub" (
    "TechHub_ID" INT   NOT NULL,
    "TechHub_Name" VARCHAR   NOT NULL,
    "Rent_OneBedroom" INT   NOT NULL,
    "Lunch_Price" INT   NOT NULL,
    "Median_HomePrice" INT   NOT NULL,
    "Population" INT   NOT NULL,
    "Number_TechCompanies" INT   NOT NULL,
    CONSTRAINT "pk_Div_TechHub" PRIMARY KEY (
        "TechHub_ID"
     )
);

CREATE TABLE "Dim_PopTechIndustries" (
    "PopTechIndustries_ID" INT   NOT NULL,
    "TechHub_Name" VARCHAR   NOT NULL,
    "Popular_Industry" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Dim_PopTechIndustries" PRIMARY KEY (
        "PopTechIndustries_ID"
     )
);

-- Dim_TechIndustry
-- -
-- TechIndustry_ID PK INT FK >- Dim_PopTechIndustries.TechIndustry_ID
-- TechIndustry_Name VARCHAR
CREATE TABLE "Dim_JobCategory" (
    "JobCategory_ID" INT   NOT NULL,
    "Category_Name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Dim_JobCategory" PRIMARY KEY (
        "JobCategory_ID"
     )
);

CREATE TABLE "Div_JobPosting" (
    "JobPosting_ID" INT   NOT NULL,
    "JobCategory_ID" VARCHAR   NOT NULL,
    "Job_Title" VARCHAR   NOT NULL,
    "Company" VARCHAR   NOT NULL,
    "Neighborhood_MAYBE" VARCHAR   NOT NULL,
    "Neighborhood_ID" INT   NOT NULL,
    "TechHub_ID" INT   NOT NULL,
    CONSTRAINT "pk_Div_JobPosting" PRIMARY KEY (
        "JobPosting_ID"
     )
);

CREATE TABLE "Div_Salary" (
    "Salary_ID" INT   NOT NULL,
    "TechHub_ID" INT   NOT NULL,
    "JobCategory_ID" INT   NOT NULL,
    "Avg_Salary" INT   NOT NULL,
    CONSTRAINT "pk_Div_Salary" PRIMARY KEY (
        "Salary_ID"
     )
);

ALTER TABLE "Div_Neighborhood" ADD CONSTRAINT "fk_Div_Neighborhood_Neighborhood_ID" FOREIGN KEY("Neighborhood_ID")
REFERENCES "Div_JobPosting" ("Neighborhood_ID");

ALTER TABLE "Div_TechHub" ADD CONSTRAINT "fk_Div_TechHub_TechHub_ID" FOREIGN KEY("TechHub_ID")
REFERENCES "Div_JobPosting" ("TechHub_ID");

ALTER TABLE "Dim_PopTechIndustries" ADD CONSTRAINT "fk_Dim_PopTechIndustries_TechHub_Name" FOREIGN KEY("TechHub_Name")
REFERENCES "Div_TechHub" ("TechHub_Name");

ALTER TABLE "Dim_JobCategory" ADD CONSTRAINT "fk_Dim_JobCategory_JobCategory_ID" FOREIGN KEY("JobCategory_ID")
REFERENCES "Div_JobPosting" ("JobCategory_ID");

ALTER TABLE "Div_Salary" ADD CONSTRAINT "fk_Div_Salary_TechHub_ID" FOREIGN KEY("TechHub_ID")
REFERENCES "Div_TechHub" ("TechHub_ID");

ALTER TABLE "Div_Salary" ADD CONSTRAINT "fk_Div_Salary_JobCategory_ID" FOREIGN KEY("JobCategory_ID")
REFERENCES "Dim_JobCategory" ("JobCategory_ID");


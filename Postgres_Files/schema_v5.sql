-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/mbmvBu
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "PopTechIndustries" (
    "PopTechIndustries_ID" INT   NOT NULL,
    "Industry_Name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_PopTechIndustries" PRIMARY KEY (
        "PopTechIndustries_ID"
     )
);

CREATE TABLE "TechHub" (
    "TechHub_ID" INT   NOT NULL,
    "TechHub_Name" VARCHAR(30)   NOT NULL,
    "Rent_OneBedroom" INT   NOT NULL,
    "Lunch_Price" INT   NOT NULL,
    "Median_HomePrice" INT   NOT NULL,
    "Population" INT   NOT NULL,
    "Number_TechCompanies" INT   NOT NULL,
    "Industry_1" INT   NOT NULL,
    "Industry_2" INT   NOT NULL,
    "Industry_3" INT   NOT NULL,
    CONSTRAINT "pk_TechHub" PRIMARY KEY (
        "TechHub_ID"
     )
);

CREATE TABLE "JobCategory" (
    "JobCategory_ID" INT   NOT NULL,
    "Category_Name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_JobCategory" PRIMARY KEY (
        "JobCategory_ID"
     )
);

CREATE TABLE "JobPosting" (
    "JobPosting_ID" INT   NOT NULL,
    "JobCategory_ID" INT   NOT NULL,
    "Job_Title" VARCHAR(30)   NOT NULL,
    "Company" VARCHAR(30)   NOT NULL,
    "Neighborhood" VARCHAR(30   NOT NULL,
    "TechHub_ID" (INT)   NOT NULL,
    CONSTRAINT "pk_JobPosting" PRIMARY KEY (
        "JobPosting_ID"
     )
);

CREATE TABLE "Salary" (
    "Salary_ID" INT   NOT NULL,
    "TechHub_ID" INT   NOT NULL,
    "JobCategory_ID" INT   NOT NULL,
    "Avg_Salary" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Salary" PRIMARY KEY (
        "Salary_ID"
     )
);

ALTER TABLE "TechHub" ADD CONSTRAINT "fk_TechHub_Industry_1" FOREIGN KEY("Industry_1")
REFERENCES "PopTechIndustries" ("PopTechIndustries_ID");

ALTER TABLE "TechHub" ADD CONSTRAINT "fk_TechHub_Industry_2" FOREIGN KEY("Industry_2")
REFERENCES "PopTechIndustries" ("PopTechIndustries_ID");

ALTER TABLE "TechHub" ADD CONSTRAINT "fk_TechHub_Industry_3" FOREIGN KEY("Industry_3")
REFERENCES "PopTechIndustries" ("PopTechIndustries_ID");

ALTER TABLE "JobPosting" ADD CONSTRAINT "fk_JobPosting_JobCategory_ID" FOREIGN KEY("JobCategory_ID")
REFERENCES "JobCategory" ("JobCategory_ID");

ALTER TABLE "JobPosting" ADD CONSTRAINT "fk_JobPosting_TechHub_ID" FOREIGN KEY("TechHub_ID")
REFERENCES "TechHub" ("TechHub_ID");

ALTER TABLE "Salary" ADD CONSTRAINT "fk_Salary_TechHub_ID" FOREIGN KEY("TechHub_ID")
REFERENCES "TechHub" ("TechHub_Name");


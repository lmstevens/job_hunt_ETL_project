-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/mbmvBu
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "TechHub" (
    "TechHub_ID" INT   NOT NULL,
    "TechHub_Name" VARCHAR(30)   NOT NULL,
    "Rent_OneBedroom" INT   NOT NULL,
    "Lunch_Price" INT   NOT NULL,
    "Median_HomePrice" INT   NOT NULL,
    "Population" INT   NOT NULL,
    "Number_TechCompanies" INT   NOT NULL,
    CONSTRAINT "pk_TechHub" PRIMARY KEY (
        "TechHub_ID"
     )
);

CREATE TABLE "PopTechIndustries" (
    "PopTechIndustries_ID" INT   NOT NULL,
    "TechHub_Name" VARCHAR(30)   NOT NULL,
    "Popular_Industry" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_PopTechIndustries" PRIMARY KEY (
        "PopTechIndustries_ID"
     )
);

CREATE TABLE "JobCategory" (
    "JobCategory_ID" INT   NOT NULL,
    "Category_Name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_JobCategory" PRIMARY KEY (
        "JobCategory_ID"
     )
);

-- Neighborhood
-- -
-- Neighborhood_ID PK INT FK >- JobPosting.Neighborhood_ID
-- Name VARCHAR
CREATE TABLE "JobPosting" (
    "JobPosting_ID" INT   NOT NULL,
    "JobCategory_ID" VARCHAR(30)   NOT NULL,
    "Job_Title" VARCHAR(30)   NOT NULL,
    "Company" VARCHAR(30)   NOT NULL,
    -- Neighborhood_MAYBE VARCHAR(30)
    "Neighborhood_ID" INT   NOT NULL,
    "TechHub_ID" INT   NOT NULL,
    CONSTRAINT "pk_JobPosting" PRIMARY KEY (
        "JobPosting_ID"
     )
);

CREATE TABLE "Salary" (
    "Salary_ID" INT   NOT NULL,
    "TechHub_ID" INT   NOT NULL,
    "JobCategory_ID" INT   NOT NULL,
    "Avg_Salary" INT   NOT NULL,
    CONSTRAINT "pk_Salary" PRIMARY KEY (
        "Salary_ID"
     )
);

ALTER TABLE "TechHub" ADD CONSTRAINT "fk_TechHub_TechHub_ID" FOREIGN KEY("TechHub_ID")
REFERENCES "JobPosting" ("TechHub_ID");

ALTER TABLE "PopTechIndustries" ADD CONSTRAINT "fk_PopTechIndustries_TechHub_Name" FOREIGN KEY("TechHub_Name")
REFERENCES "TechHub" ("TechHub_Name");

ALTER TABLE "JobCategory" ADD CONSTRAINT "fk_JobCategory_JobCategory_ID" FOREIGN KEY("JobCategory_ID")
REFERENCES "JobPosting" ("JobCategory_ID");

ALTER TABLE "Salary" ADD CONSTRAINT "fk_Salary_TechHub_ID" FOREIGN KEY("TechHub_ID")
REFERENCES "TechHub" ("TechHub_ID");

ALTER TABLE "Salary" ADD CONSTRAINT "fk_Salary_JobCategory_ID" FOREIGN KEY("JobCategory_ID")
REFERENCES "JobCategory" ("JobCategory_ID");


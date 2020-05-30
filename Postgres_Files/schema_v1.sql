-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/mbmvBu
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Div_Neighborhood" (
    "Neighborhood_ID" INT   NOT NULL,
    "TechHub_ID" INT   NOT NULL,
    "Name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Div_Neighborhood" PRIMARY KEY (
        "Neighborhood_ID"
     )
);

CREATE TABLE "Div_TechHub" (
    "TechHub_ID" INT   NOT NULL,
    "Name" VARCHAR   NOT NULL,
    "Neighborhood_ID" INT   NOT NULL,
    "Rent_OneBedroom" INT   NOT NULL,
    "Lunch_Price" INT   NOT NULL,
    "Median_HouseholdIncome" INT   NOT NULL,
    "Population" INT   NOT NULL,
    "Number_TechCompanies" INT   NOT NULL,
    "Number_CommunityMembers" INT   NOT NULL,
    "Expenseive_Rank" INT   NOT NULL,
    "TechIndustries_ID" INT   NOT NULL,
    CONSTRAINT "pk_Div_TechHub" PRIMARY KEY (
        "TechHub_ID"
     )
);

CREATE TABLE "Div_TechIndustries" (
    "TechIndustries_ID" INT   NOT NULL,
    "TechHub_ID" INT   NOT NULL,
    "Industry_1" VARCHAR   NOT NULL,
    "Industry_2" VARCHAR   NOT NULL,
    "Industry_3" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Div_TechIndustries" PRIMARY KEY (
        "TechIndustries_ID"
     )
);

CREATE TABLE "Div_JobCategory" (
    "JobCategory_ID" INT   NOT NULL,
    "Builtin_Category" VARCHAR   NOT NULL,
    "Bureau_Category" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Div_JobCategory" PRIMARY KEY (
        "JobCategory_ID"
     )
);

CREATE TABLE "Div_JobPosting" (
    "JobPosting_ID" INT   NOT NULL,
    "JobCategory_ID" VARCHAR   NOT NULL,
    "Field" VARCHAR   NOT NULL,
    "Job_Title" VARCHAR   NOT NULL,
    "Company" VARCHAR   NOT NULL,
    "City" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Div_JobPosting" PRIMARY KEY (
        "JobPosting_ID"
     )
);

CREATE TABLE "Div_LocationDate" (
    "LocationDate_ID" INT   NOT NULL,
    "Latitude" VARCHAR   NOT NULL,
    "Longitude" VARCHAR   NOT NULL,
    "post_time_hours_ago" VARCHAR   NOT NULL,
    "post_time_days_ago" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Div_LocationDate" PRIMARY KEY (
        "LocationDate_ID"
     )
);

CREATE TABLE "Fact_JobProspect" (
    "JobProspect_ID" INT   NOT NULL,
    "JobPosting_ID" INT   NOT NULL,
    "TechHub_ID" INT   NOT NULL,
    "LocationDate_ID" INT   NOT NULL,
    "Salary_ID" INT   NOT NULL,
    -- Posted Jobs as percent of total jobs? --> Hiring rate -- high/med/low
    "Aggregate_1" INT   NOT NULL,
    -- Percent Entry Level Jobs/total jobs available, based on Job Title?/Or Experience Tag
    "Aggregate_2" INT   NOT NULL,
    -- % salary paid for household_expenses/mortgage??
    "Aggregate_3" INT   NOT NULL,
    CONSTRAINT "pk_Fact_JobProspect" PRIMARY KEY (
        "JobProspect_ID"
     )
);

CREATE TABLE "Div_Salary" (
    "Salary_ID" INT   NOT NULL,
    "Avg_BuiltInSalary" INT   NOT NULL,
    "AVg_BureauSalary" INT   NOT NULL,
    CONSTRAINT "pk_Div_Salary" PRIMARY KEY (
        "Salary_ID"
     )
);

ALTER TABLE "Div_Neighborhood" ADD CONSTRAINT "fk_Div_Neighborhood_Neighborhood_ID" FOREIGN KEY("Neighborhood_ID")
REFERENCES "Div_TechHub" ("Neighborhood_ID");

ALTER TABLE "Div_TechHub" ADD CONSTRAINT "fk_Div_TechHub_TechHub_ID" FOREIGN KEY("TechHub_ID")
REFERENCES "Fact_JobProspect" ("TechHub_ID");

ALTER TABLE "Div_TechIndustries" ADD CONSTRAINT "fk_Div_TechIndustries_TechIndustries_ID" FOREIGN KEY("TechIndustries_ID")
REFERENCES "Div_TechHub" ("TechIndustries_ID");

ALTER TABLE "Div_JobCategory" ADD CONSTRAINT "fk_Div_JobCategory_JobCategory_ID" FOREIGN KEY("JobCategory_ID")
REFERENCES "Div_JobPosting" ("JobCategory_ID");

ALTER TABLE "Div_JobPosting" ADD CONSTRAINT "fk_Div_JobPosting_JobPosting_ID" FOREIGN KEY("JobPosting_ID")
REFERENCES "Fact_JobProspect" ("JobProspect_ID");

ALTER TABLE "Div_LocationDate" ADD CONSTRAINT "fk_Div_LocationDate_LocationDate_ID" FOREIGN KEY("LocationDate_ID")
REFERENCES "Fact_JobProspect" ("LocationDate_ID");

ALTER TABLE "Div_Salary" ADD CONSTRAINT "fk_Div_Salary_Salary_ID" FOREIGN KEY("Salary_ID")
REFERENCES "Fact_JobProspect" ("Salary_ID");


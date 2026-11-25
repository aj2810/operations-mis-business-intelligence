# Operations MIS & Business Performance Intelligence System

A portfolio project demonstrating an end-to-end operations reporting and
business performance analysis workflow using **Microsoft Excel, Power
BI, SQLite and SQL**.

> **Data disclosure:** This project uses a purpose-built synthetic
> dataset for a fictional customer operations centre in Navi Mumbai. It
> does not represent a real employer, client, production system or
> commercial deployment.

## Project overview

Operations teams need a consolidated view of interaction volumes,
resolution performance, service-level achievement, handling time,
errors, attendance and customer satisfaction. This project prepares
operational records, defines performance indicators, builds interactive
reports and uses SQL to investigate patterns across teams, agents and
shifts.

## Objectives

-   Clean and validate a structured operational dataset.
-   Build an Excel MIS workbook for KPI monitoring and performance
    reporting.
-   Develop a two-page Power BI report with interactive Team and Date
    slicers.
-   Store the cleaned data in SQLite and perform analytical queries
    using SQL.
-   Translate analytical results into practical, evidence-based
    observations.

## Dataset

  -----------------------------------------------------------------------
  Attribute                           Details
  ----------------------------------- -----------------------------------
  Raw records                         1,012

  Cleaned records                     1,000

  Date range                          25 September 2026 -- 23 November
                                      2026

  Original columns                    14

  Teams                               Technical Support, Customer
                                      Service, Collections, Sales Support

  Shifts                              Morning, Afternoon, Night

  Agent identifiers                   30 synthetic IDs
  -----------------------------------------------------------------------

### Data-quality treatment

  Issue                                 Count Treatment
  ----------------------------------- ------- -----------------------------
  Duplicate rows                           12 Removed
  Missing Team                              8 Labelled `Unassigned`
  Missing AHT                               6 Retained blank; not imputed
  Invalid Shift spelling (`Mornng`)         5 Standardised to `Morning`
  Negative Errors                           4 Cleared/blanked and flagged

The cleaned dataset contains 1,000 records. The source fields are:

`Record_ID`, `Date`, `Team`, `Agent_ID`, `Shift`,
`Interactions_Handled`, `Interactions_Resolved`, `SLA_Eligible`,
`SLA_Met_Count`, `AHT_Minutes`, `Errors`, `Attendance`,
`Target_Interactions`, `Customer_Satisfaction`.

## Tools and technologies

-   **Microsoft Excel for Web** --- data review, MIS calculations,
    summary sheets and dashboard charts.
-   **Microsoft Power BI Desktop** --- Power Query transformations, DAX
    measures, KPI cards, charts and slicers.
-   **SQLite / DB Browser for SQLite** --- storage and validation of the
    cleaned dataset.
-   **SQL** --- analytical queries for KPI, team, agent, shift, SLA,
    error, attendance and CSAT analysis.
-   **Visual Studio Code / Notepad++** --- supporting project and
    query-file editing.

## Solution components

### 1. Excel MIS workbook

The workbook contains eight sheets:

1.  `Raw_Data`
2.  `Clean_Data`
3.  `Data_Quality`
4.  `MIS_Summary`
5.  `Team_Performance`
6.  `Agent_Performance`
7.  `Trend_Analysis`
8.  `Dashboard`

### 2. Power BI report

**Executive Overview** - Overall KPI cards - Interactions handled by
team - Resolution rate by team - SLA achievement by team - Daily
interaction trend - Total errors by team - Team and Date slicers

**Operational Performance** - Interactions handled by shift - Average
handling time by shift - Interactions handled by agent - Resolution rate
by agent - Customer satisfaction by team - Attendance rate by shift -
Total errors by shift - Team and Date slicers

### 3. SQLite and SQL analysis

-   SQLite database: `sql/Operations_MIS.db`
-   SQL analysis script: `sql/Operations_MIS_Analysis.sql`
-   Table: `clean_data`
-   Eight analytical queries covering overall KPIs, team performance,
    agent performance, shift performance, data-quality checks, SLA
    performance, error analysis, and attendance/customer satisfaction.

## Overall KPI snapshot

  KPI                             Result
  ----------------------- --------------
  Cleaned records                  1,000
  Interactions handled            41,076
  Interactions resolved           36,233
  Resolution rate                 88.21%
  SLA achievement                 90.73%
  Average handling time     8.94 minutes
  Total errors                     2,405
  Average CSAT                  3.89 / 5

### KPI definitions

-   **Resolution Rate** = Interactions Resolved ÷ Interactions Handled
-   **SLA Achievement** = SLA Met Count ÷ SLA Eligible
-   **Average Handling Time** = Average of available `AHT_Minutes`
    values
-   **Attendance Rate** = Present records ÷ all records; Late is not
    counted as Present and remains in the denominator
-   **Average CSAT** = Average of available `Customer_Satisfaction`
    values

## Selected analytical observations

-   Collections had the lowest resolution rate among assigned teams
    (87.51%) and lowest SLA achievement (90.17%).
-   Technical Support recorded the highest raw error count (623) and the
    highest average CSAT among assigned teams (3.94).
-   Customer Service had the highest SLA achievement (91.02%) among
    assigned teams.
-   Night shift had the highest interaction volume and the lowest
    shift-level resolution rate (87.95%).
-   Agent resolution rates ranged from 85.27% to 90.89% in the generated
    dataset.

See `documentation/Business_Insights_and_Recommendations.docx` for the
full findings and recommendations.

## Repository structure

``` text
Operations_MIS_Project/
├── data/
│   ├── raw/
│   └── cleaned/
├── excel/
│   └── Operations_MIS_System.xlsx
├── powerbi/
│   └── Operations_MIS_PowerBI.pbix
├── sql/
│   ├── Operations_MIS.db
│   └── Operations_MIS_Analysis.sql
├── documentation/
│   ├── Project_Overview.docx
│   ├── Data_Cleaning_and_Methodology.docx
│   └── Business_Insights_and_Recommendations.docx
├── screenshots/
└── README.md
```

## Validation

-   Raw row count: 1,012.
-   Duplicate rows removed: 12.
-   Cleaned row count: 1,000.
-   Remaining duplicate `Record_ID` count: 0.
-   SQLite table row count: 1,000.
-   SQLite schema checked against the 14 source fields.
-   Overall SQL KPI results compared with the Excel baseline.
-   Power BI Attendance Rate definition aligned to Present divided by
    all rows.

## Limitations

-   The dataset is synthetic and designed for portfolio demonstration.
-   The analysis is descriptive and does not establish causation.
-   Six missing AHT values remain blank.
-   The `Unassigned` group contains only eight records and should be
    interpreted cautiously.
-   Agent IDs appear across multiple teams in the synthetic data; this
    does not establish a real staffing roster.
-   The project demonstrates a reporting and analytics workflow; it is
    not a live enterprise MIS implementation.

## Skills demonstrated

**Data cleaning · Excel MIS reporting · KPI design · Power Query · DAX ·
Power BI dashboards · SQLite · SQL aggregation and analysis · Business
insights · Data storytelling**

------------------------------------------------------------------------

*Portfolio project --- Operations MIS & Business Performance
Intelligence System*

-- QUERY 01: OVERALL OPERATIONAL KPIs
SELECT
    COUNT(*) AS Total_Records,
    SUM(Interactions_Handled) AS Total_Interactions_Handled,
    SUM(Interactions_Resolved) AS Total_Interactions_Resolved,
    ROUND(
        100.0 * SUM(Interactions_Resolved) /
        SUM(Interactions_Handled), 2
    ) AS Resolution_Rate_Percent,
    ROUND(
        100.0 * SUM(SLA_Met_Count) /
        SUM(SLA_Eligible), 2
    ) AS SLA_Achievement_Percent,
    ROUND(AVG(AHT_Minutes), 2) AS Average_Handling_Time,
    SUM(Errors) AS Total_Errors,
    ROUND(AVG(Customer_Satisfaction), 2) AS Average_CSAT
FROM clean_data;


-- QUERY 02: TEAM PERFORMANCE ANALYSIS
SELECT
    Team,
    COUNT(*) AS Total_Records,
    SUM(Interactions_Handled) AS Interactions_Handled,
    SUM(Interactions_Resolved) AS Interactions_Resolved,
    ROUND(
        100.0 * SUM(Interactions_Resolved) /
        SUM(Interactions_Handled), 2
    ) AS Resolution_Rate_Percent,
    ROUND(
        100.0 * SUM(SLA_Met_Count) /
        SUM(SLA_Eligible), 2
    ) AS SLA_Achievement_Percent,
    ROUND(AVG(AHT_Minutes), 2) AS Average_Handling_Time,
    SUM(Errors) AS Total_Errors,
    ROUND(AVG(Customer_Satisfaction), 2) AS Average_CSAT
FROM clean_data
GROUP BY Team
ORDER BY Interactions_Handled DESC;

-- QUERY 03: AGENT PERFORMANCE
SELECT
    Agent_ID,
    COUNT(DISTINCT Team) AS Teams_Assigned,
    SUM(Interactions_Handled) AS Interactions_Handled,
    SUM(Interactions_Resolved) AS Interactions_Resolved,
    ROUND(
        100.0 * SUM(Interactions_Resolved) /
        NULLIF(SUM(Interactions_Handled), 0), 2
    ) AS Resolution_Rate_Percent,
    ROUND(AVG(AHT_Minutes), 2) AS Average_Handling_Time,
    SUM(Errors) AS Total_Errors,
    ROUND(AVG(Customer_Satisfaction), 2) AS Average_CSAT
FROM clean_data
GROUP BY Agent_ID
ORDER BY Resolution_Rate_Percent DESC;

--QUERY 04: SHIFT PERFORMANCE ANALYSIS
SELECT
    Shift,
    COUNT(*) AS Total_Records,
    SUM(Interactions_Handled) AS Interactions_Handled,
    SUM(Interactions_Resolved) AS Interactions_Resolved,
    ROUND(
        100.0 * SUM(Interactions_Resolved) /
        NULLIF(SUM(Interactions_Handled), 0), 2
    ) AS Resolution_Rate_Percent,
    ROUND(AVG(AHT_Minutes), 2) AS Average_Handling_Time,
    SUM(Errors) AS Total_Errors,
    ROUND(AVG(Customer_Satisfaction), 2) AS Average_CSAT
FROM clean_data
GROUP BY Shift
ORDER BY Interactions_Handled DESC;

--QUERY 05: DAILY INTERACTION TREND
SELECT
    Date,
    COUNT(*) AS Total_Records,
    SUM(Interactions_Handled) AS Interactions_Handled,
    SUM(Interactions_Resolved) AS Interactions_Resolved,
    ROUND(
        100.0 * SUM(Interactions_Resolved) /
        NULLIF(SUM(Interactions_Handled), 0), 2
    ) AS Resolution_Rate_Percent,
    ROUND(AVG(Customer_Satisfaction), 2) AS Average_CSAT
FROM clean_data
GROUP BY Date
ORDER BY Date;

--QUERY 06: SLA PERFORMANCE ANALYSIS
SELECT
    Team,
    SUM(SLA_Eligible) AS Total_SLA_Eligible,
    SUM(SLA_Met_Count) AS Total_SLA_Met,
    SUM(SLA_Eligible) - SUM(SLA_Met_Count) AS SLA_Missed,
    ROUND(
        100.0 * SUM(SLA_Met_Count) /
        NULLIF(SUM(SLA_Eligible), 0), 2
    ) AS SLA_Achievement_Percent
FROM clean_data
GROUP BY Team
ORDER BY SLA_Achievement_Percent DESC;

--QUERY 07: ERROR ANALYSIS BY TEAM AND SHIFT
SELECT
    Team,
    Shift,
    SUM(Errors) AS Total_Errors,
    COUNT(*) AS Total_Records,
    ROUND(AVG(Errors), 2) AS Average_Errors_Per_Record
FROM clean_data
GROUP BY Team, Shift
ORDER BY Total_Errors DESC;

ATTENDANCE AND CUSTOMER SATISFACTION
SELECT
    Team,
    COUNT(*) AS Total_Records,
    SUM(CASE WHEN Attendance = 'Present' THEN 1 ELSE 0 END) AS Present_Count,
    SUM(CASE WHEN Attendance = 'Absent' THEN 1 ELSE 0 END) AS Absent_Count,
    SUM(CASE WHEN Attendance = 'Late' THEN 1 ELSE 0 END) AS Late_Count,
    ROUND(
        100.0 * SUM(CASE WHEN Attendance = 'Present' THEN 1 ELSE 0 END) /
        COUNT(*), 2
    ) AS Attendance_Rate_Percent,
    ROUND(AVG(Customer_Satisfaction), 2) AS Average_CSAT
FROM clean_data
GROUP BY Team
ORDER BY Attendance_Rate_Percent DESC;
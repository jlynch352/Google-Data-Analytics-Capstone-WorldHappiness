CREATE TABLE `capstone-440704.My_Tables.Corruption` AS
WITH CorruptionData AS (
    SELECT 
        Y2015.Country,
        Y2015.Region,
        SAFE_CAST(Y2015.Trust_Government_Corruption AS FLOAT64) AS Y2015Corruption,
        SAFE_CAST(Y2016.`Trust Government Corruption` AS FLOAT64) AS Y2016Corruption,
        SAFE_CAST(Y2017.`Trust Government Corruption` AS FLOAT64) AS Y2017Corruption,
        SAFE_CAST(Y2018.`Perceptions of corruption` AS FLOAT64) AS Y2018Corruption,
        SAFE_CAST(Y2019.`Perceptions of corruption` AS FLOAT64) AS Y2019Corruption
    FROM 
        `capstone-440704.WorldHappinessReport.2015_Data` AS Y2015 
    JOIN `capstone-440704.WorldHappinessReport.2016_data` AS Y2016 
        ON Y2015.Country = Y2016.Country
    JOIN `capstone-440704.WorldHappinessReport.2017_data` AS Y2017  
        ON Y2015.Country = Y2017.Country
    JOIN `capstone-440704.WorldHappinessReport.2018_Data` AS Y2018
        ON Y2015.Country = Y2018.`Country or region`
    JOIN `capstone-440704.WorldHappinessReport.2019_Data` AS Y2019
        ON Y2015.Country = Y2019.`Country or region`
)
SELECT
    Country,
    Region,
    Y2015Corruption,
    Y2016Corruption,
    Y2017Corruption,
    Y2018Corruption,
    Y2019Corruption,
    -- Calculates the average corruption perception across the five years
    (
        COALESCE(Y2015Corruption, 0) + 
        COALESCE(Y2016Corruption, 0) + 
        COALESCE(Y2017Corruption, 0) + 
        COALESCE(Y2018Corruption, 0) + 
        COALESCE(Y2019Corruption, 0)
    ) / NULLIF(
        (CASE WHEN Y2015Corruption IS NULL THEN 0 ELSE 999 END) +
        (CASE WHEN Y2016Corruption IS NULL THEN 0 ELSE 999 END) +
        (CASE WHEN Y2017Corruption IS NULL THEN 0 ELSE 999 END) +
        (CASE WHEN Y2018Corruption IS NULL THEN 0 ELSE 999 END) +
        (CASE WHEN Y2019Corruption IS NULL THEN 0 ELSE 999 END),
        0
    ) AS AvgCorruption
FROM CorruptionData
ORDER BY
    AvgCorruption DESC;

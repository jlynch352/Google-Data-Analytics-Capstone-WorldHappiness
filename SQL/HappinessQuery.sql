CREATE TABLE `capstone-440704.My_Tables.HappinessScores` AS
SELECT 
    Y2015.Country,
    Y2015.Region,
    Y2015.`Happiness Score` AS Y2015HappinessScore,
    Y2016.`Happiness Score` AS Y2016HappinessScore,
    Y2017.`Happiness Score` AS Y2017HappinessScore,
    Y2018.Score AS Y2018HappinessScore,
    Y2019.Score AS Y2019HappinessScore,
    /*
    Calculates the average GDP across the five years
    */
    (
        Y2015.`Happiness Score` + 
        Y2016.`Happiness Score` + 
        Y2017.`Happiness Score` + 
        Y2018.Score + 
        Y2019.Score
    ) / 5 AS AvgHappiness_Score
FROM 
    `capstone-440704.WorldHappinessReport.2015_Data` AS Y2015 
JOIN 
    `capstone-440704.WorldHappinessReport.2016_data` AS Y2016 
    ON Y2015.Country = Y2016.Country
JOIN 
    `capstone-440704.WorldHappinessReport.2017_data` AS Y2017  
    ON Y2015.Country = Y2017.Country
JOIN 
    `capstone-440704.WorldHappinessReport.2018_Data` AS Y2018
    ON Y2015.Country = Y2018.`Country or region`
JOIN 
    `capstone-440704.WorldHappinessReport.2019_Data` AS Y2019
    ON Y2015.Country = Y2019.`Country or region`
ORDER BY
    AvgHappiness_Score DESC;
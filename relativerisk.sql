SELECT
    date_extract_y(crash_date) AS year,
    COUNT(*) AS n,
    SUM(CASE(weather_condition == "RAIN" AND injuries_total >= 1, 1, TRUE, 0)) AS a,
    SUM(CASE(weather_condition == "RAIN" AND injuries_total == 0, 1, TRUE, 0)) AS b,
    SUM(CASE(weather_condition != "RAIN" AND injuries_total >= 1, 1, TRUE, 0)) AS c,
    SUM(CASE(weather_condition != "RAIN" AND injuries_total == 0, 1, TRUE, 0)) AS d,
    (a / (a + b)) / (c / (c + d)) AS rr
WHERE year >= 2015
GROUP BY year
ORDER BY year ASC
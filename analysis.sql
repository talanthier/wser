USE wser;

DESCRIBE results;


# Overall winners by finish time
SELECT finish_time, firstname, lastname, gender, age, state, yr, bib, city, country
FROM results WHERE place = 1 ORDER BY finish_time ASC; 

# Finishers ordered by finish time
SELECT * FROM results ORDER BY finish_time ASC LIMIT 25; 
# Of the 10 fastest finish times, 9 have been run in the past decade (2012-2022)
# The one exception being Jim King with a 14:54:00 in 1984.

# Female finishers ordered by finish time
SELECT * FROM results WHERE gender = 'F' ORDER BY finish_time ASC LIMIT 25;

SELECT * FROM summary;

SELECT * FROM weather;

SELECT summary.yr, summary.starters, summary.finishers, summary.sub_24, summary.finish_rate, (summary.sub_24/summary.starters) AS sub_24_rate,
weather.temp_high, weather.temp_low, weather.fastest_time FROM summary INNER JOIN weather ON summary.yr = weather.yr ORDER BY temp_high DESC;
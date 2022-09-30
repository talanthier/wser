USE wser;

# Finish rates and fastest times ordered by temperature
SELECT summary.yr, summary.finish_rate, ROUND(100*(summary.sub_24/summary.starters),1) AS sub_24_rate,
weather.temp_high, weather.temp_low, weather.fastest_time FROM summary INNER JOIN weather ON summary.yr = weather.yr ORDER BY temp_high DESC, temp_low DESC;

SELECT yr, finish_rate, ROUND(100*(sub_24/starters),1) AS sub_24_rate, starters FROM summary ORDER BY finish_rate DESC;

# Overall winners by finish time
SELECT finish_time, firstname, lastname, gender, age, state, yr, bib, city, country
FROM results WHERE place = 1 ORDER BY finish_time ASC; 

# Finishers ordered by finish time
SELECT * FROM results ORDER BY finish_time ASC LIMIT 25; 
# Of the 10 fastest finish times, 9 have been run in the past decade (2012-2022)
# The one exception being Jim King with a 14:54:00 in 1984.

# Female finishers ordered by finish time
SELECT * FROM results WHERE gender = 'F' ORDER BY finish_time ASC LIMIT 25;


# Finish Place by gender
SELECT *, RANK() OVER (
PARTITION BY yr, gender ORDER BY finish_time ASC) gender_place
 FROM results ORDER BY yr DESC, place ASC;  
 

# Fastest international times
SELECT * FROM results WHERE country != 'USA' AND country IS NOT NULL ORDER BY finish_time;
# Fastest international time (Tom Evans in 2019) was not a winning time. 

SELECT * FROM results WHERE country != 'USA' AND country IS NOT NULL AND place <= 3 ORDER BY place;
# Only 2 international winners (at least since they started recording location data)






USE wser;

DESCRIBE results;


# Overall winners by finish time
SELECT finish_time, firstname, lastname, gender, age, state, yr, bib, city, country
FROM results WHERE place = 1 ORDER BY finish_time ASC; 

# Finishers ordered by finish time
SELECT * FROM results ORDER BY finish_time ASC; 
# Of the 10 fastest finish times, 9 have been run in the past decade (2012-2022)
# The one exception being Jim King with a 14:54 in 1984.


SELECT place, firstname, lastname, gender, age, state, yr, bib, city, country
FROM results WHERE gender = 'F' ORDER BY finish_time ASC; 

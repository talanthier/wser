USE wser;


CREATE TABLE results (
	place int,
    finish_time time,
    firstname varchar(255),
    lastname varchar(255),
    gender char(1),
    age int,
    state varchar(255),
    yr int,
    bib varchar(255),
    city varchar(255),
    country varchar(255));
    
LOAD DATA INFILE 'results.csv'
INTO TABLE results 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@a, @b, @c, @d,@e,@f,@g,@h,@i,@j,@k) 
SET place = IF(@a = '', NULL, @a), 
   finish_time = IF(@b = '', NULL, @b), 
   firstname = IF(@c = '', NULL, @c), 
   lastname = IF(@d = '', NULL, @d),
   gender = IF(@e = '', NULL, @e), 
   age = IF(@f = '', NULL, @f), 
   state = IF(@g = '', NULL, @g), 
   yr = IF(@h = '', NULL, @h), 
   bib = IF(@i = '', NULL, @i), 
   city = IF(@j = '', NULL, @j),
   country = IF(@k = '', NULL, @k);

CREATE TABLE weather (
	start_date date,
    temp_high int,
    temp_low int,
    finish_percent float,
    fastest_time time,
    distance float,
    snow varchar(255),
    river_crossing varchar(255),
    yr int);

LOAD DATA INFILE 'weather.csv'
INTO TABLE weather
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@a,@b,@c,@d,@e,@f,@g,@h,@i)
SET start_date = IF(@a = '', NULL, @a),
temp_high = IF(@b = '', NULL, @b),
temp_low = IF(@c = '', NULL, @c),
finish_percent = IF(@d = '', NULL, @d),
fastest_time = IF(@e = '', NULL, @e),
distance = IF(@f = '', NULL, @f),
snow = IF(@g = '', NULL, @g),
river_crossing = IF(@h = '', NULL, @h),
yr = IF(@i = '', NULL, @i);

CREATE TABLE summary (
	yr int,
    starters int,
    finishers int,
    sub_24 int,
    finish_rate float);
    
LOAD DATA INFILE 'summary.csv'
INTO TABLE summary
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@a,@b,@c,@d,@e)
SET yr = IF(@a = '', NULL, @a),
	starters = IF(@b = '', NULL, @b),
	finishers = IF(@c = '', NULL, @c),
	sub_24 = IF(@d = '', NULL, @d),
	finish_rate = IF(@e = '', 0, @e);
    
	
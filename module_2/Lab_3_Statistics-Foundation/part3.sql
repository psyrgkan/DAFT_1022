use recap;

CREATE TABLE IF NOT EXISTS students 
(	student_id INT,
	score INT
);

INSERT INTO students
VALUES
(1,	91),
(2,	72),
(3,	98),
(4,	62),
(5, 62),
(6,	95),
(7,	83),
(8,	86),
(9,	56),
(10, 97),
(11, 58),
(12, 71),
(13, 87),
(14, 83),
(15, 98);

-- Please find MEAN, SUM, STANDARD DEVIATION, VARIANCE, MIN and MAX.

SELECT AVG(score) as average, SUM(score) as sum, STDDEV(score) as stdev, VARIANCE(score) as variance, MIN(score) as min, MAX(score) as max
FROM students;
SELECT gender,
       count(gender) AS Total_Students,
       AVG(age) as Average_Age,
       SUM(total_score) as Total_Score

FROM student
GROUP BY gender

/*

This is a much more efficient result. In the first line of the script the id, name and gender columns 
are retrieved. These columns do not contain any aggregated results.

Next, for the columns that contain aggregated results, 
we simply specify the aggregated function, 
followed by the OVER clause and then within the parenthesis we specify the PARTITION BY clause
followed by the name of the column that we want our results to be partitioned as shown below.
*/

SELECT    id, name, gender,
          COUNT(gender) OVER (PARTITION BY gender) AS Total_students,
          AVG(age) OVER (PARTITION BY gender) AS Average_Age,
          SUM(total_score) OVER (PARTITION BY gender) AS Total_Score
FROM student
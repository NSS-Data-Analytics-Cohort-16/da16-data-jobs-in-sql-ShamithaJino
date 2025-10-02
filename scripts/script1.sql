-- 1.	How many rows are in the data_analyst_jobs table?
SELECT 
	count(*)
FROM data_analyst_jobs;
-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT 
* 
FROM data_analyst_jobs
LIMIT 10;

-- ExxonMobil is on the 10th row

-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT
	COUNT(*) AS total_posting_TN
FROM data_analyst_jobs
WHERE location ='TN';

SELECT
	COUNT(*) AS total_posting_TN_KY
FROM data_analyst_jobs
WHERE location IN ('TN', 'KY');


-- 4.	How many postings in Tennessee have a star rating above 4?

SELECT 
	COUNT(*) AS rating_above_4 
FROM data_analyst_jobs
WHERE star_rating>4 AND location='TN';


-- 5.	How many postings in the dataset have a review count between 500 and 1000?
SELECT 
	COUNT(*) AS review_count_Between_500_and_1000
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 and 1000;

-- 6.	Show the average star rating for companies in each state. 
-- The output should show the state as `state` and the average rating for the state as `avg_rating`. 
-- Which state shows the highest average rating?

SELECT 
	location AS state,
	AVG(star_rating  ) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;

-- Nebraska has the highest average rating

-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT 
	COUNT(DISTINCT title) AS unique_job_title_count
FROM data_analyst_jobs;

-- 8.	How many unique job titles are there for California companies?

SELECT 
	COUNT(DISTINCT title) AS unique_job_titles_ca_count
FROM data_analyst_jobs
WHERE location='CA';

-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. 
-- How many companies are there with more that 5000 reviews across all locations?


SELECT 
	company, 
	ROUND(AVG(star_rating),2) AS avg_rating
FROM data_analyst_jobs
WHERE review_count >5000 AND company IS NOT NULL
GROUP BY company;


-- 10.	Add the code to order the query in #9 from highest to lowest average star rating.
-- Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?


SELECT 
	company,
	ROUND(AVG(star_rating),2) AS avg_rating
FROM data_analyst_jobs
WHERE review_count >5000 AND company IS NOT NULL
GROUP BY company
ORDER BY avg_rating DESC;

-- Six companies share the highest average rating of 4.20

-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

SELECT 
	DISTINCT title
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%'

-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’?
-- What word do these positions have in common?

SELECT 
	DISTINCT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%'
AND
title NOT ILIKE '%Analytics%'


-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. 
-- Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
SELECT 
* 
FROM data_analyst_jobs

SELECT 
	domain,
	count(title) 
FROM data_analyst_jobs
WHERE 
	skill='SQL' 
AND  days_since_posting>21
GROUP BY domain

--  Disregard any postings where the domain is NULL. 
SELECT 
	domain,
	count(title) AS no_of_jobs
FROM data_analyst_jobs
WHERE 
	skill='SQL' 
AND  days_since_posting>21
AND domain IS NOT NULL
GROUP BY domain

-- Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 

SELECT 
	domain,
	count(title) AS no_of_jobs
FROM data_analyst_jobs
WHERE 
	skill='SQL' 
AND  days_since_posting>21
AND domain IS NOT NULL
GROUP BY domain
ORDER BY no_of_jobs DESC

-- Which three industries are in the top 3 on this list? 
--Consulting and Business Services, 
--Consumer Goods and Services, 
--rest of the 4 domain has one hard to fill job or Null column/unnamed domain has 4 hard-to-fill jobs

-- How many jobs have been listed for more than 3 weeks for each of the top 3?
-- Consulting and Business Services-->5,
-- Consumer Goods and Services--> 2,
 


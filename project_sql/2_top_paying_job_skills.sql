WITH top_paying_jobs AS
(
    SELECT 
        j.job_id,
        c.name as company_name,
        j.job_title,
        j.salary_year_avg
    FROM job_postings_fact j
    LEFT JOIN company_dim c ON j.company_id = c.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
       t.*,
       s.skills
FROM
       top_paying_jobs t
JOIN   skills_job_dim sjd ON t.job_id = sjd.job_id
JOIN
       skills_dim s ON sjd.skill_id = s.skill_id
ORDER BY 
       salary_year_avg DESC

/*Here's the breakdown of the most demanding skills for data analysis in 2023, based on job postings
    -SQL is leading with a bold count of 8
    -Python follows closely with a bold count of 7
    -Tableau is also highly sought after with a bold count of 6
    -Other Skills like R, Snowflake, Pandas and Excel show varying demand
*/
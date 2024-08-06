WITH in_demand_skills AS (
    SELECT 
        s.skills,
        s.skill_id,
        count(sjd.job_id) as count_of_job_postings  
    FROM
        job_postings_fact j
    JOIN   skills_job_dim sjd ON j.job_id = sjd.job_id
    JOIN
        skills_dim s ON sjd.skill_id = s.skill_id
    WHERE job_title_short = 'Data Analyst' AND
        job_work_from_home = 'True'AND
        salary_year_avg IS NOT NULL
    GROUP BY
        s.skill_id,s.skills
),  salary_based_skills AS (
    SELECT 
        s.skills,
        s.skill_id,
        ROUND(avg(salary_year_avg),0) AS yrly_avg_salary  
    FROM
        job_postings_fact j
    JOIN   skills_job_dim sjd ON j.job_id = sjd.job_id
    JOIN
        skills_dim s ON sjd.skill_id = s.skill_id
    WHERE job_title_short = 'Data Analyst' AND
        job_work_from_home = 'True' AND
        salary_year_avg IS NOT NULL
    GROUP BY
        s.skill_id,s.skills
)

SELECT  ids.skill_id,
        ids.skills,
        count_of_job_postings,
        yrly_avg_salary  
FROM
        in_demand_skills ids
JOIN    salary_based_skills sbs ON ids.skill_id=sbs.skill_id
ORDER BY
        count_of_job_postings DESC,
        yrly_avg_salary DESC
LIMIT 25
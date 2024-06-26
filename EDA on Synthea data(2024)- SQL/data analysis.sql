--What is the distribution of patients by gender?
SELECT 
	gender,
	COUNT(*) AS count
FROM
	public.patients
GROUP BY gender;
	
--What are the top 5 cities from which patients visited the hospital?
SELECT 
	p.city,
	count(*) as visits
FROM 
	public.encounter as e
INNER JOIN 
	public.patients as p
ON
	e.patient = p.patient_id
GROUP BY 
	p.city
ORDER BY 
	visits DESC
LIMIT 5;

--Who was the most visited patient in 2023, and from which city did they come?
SELECT
	e.patient,
	p.city,
	count(*) as most_visited
FROM 
	public.encounter as e
INNER JOIN
	public.patients as p
ON e.patient = p.patient_id
WHERE
	EXTRACT(YEAR FROM e.start)= 2023
GROUP BY 
	e.patient, p.city
ORDER BY
	most_visited DESC
LIMIT 1;

--How many patients visited the hospital in 2021?
SELECT 
	COUNT(e.patient) as total_visits
FROM 
	public.encounter as e
WHERE
	EXTRACT(YEAR FROM e.start)= 2021;

--Which race has the highest number of Ischemic heart disease (disorder) cases?
SELECT
    p.race,
    COUNT(c.description) AS IHD_count
FROM 
    public.patients AS p
INNER JOIN
    public.condition AS c ON p.patient_id = c.patient_id
WHERE
    c.description = 'Ischemic heart disease (disorder)'
GROUP BY 
    p.race
ORDER BY
	IHD_count DESC;

--What are the minimum and maximum incomes of the patients? 
SELECT
	MIN(income)AS min_income,
	MAX(income) AS max_income
FROM 
	public.patients

--Which procedures were performed more than 10 times in 2021?	
SELECT 
	procedure_description AS procedure,
	COUNT(*) AS procedure_count
FROM
	public.procedure AS p
WHERE 
	EXTRACT(YEAR FROM stop_timestamp)= 2021
GROUP BY
	procedure
HAVING 
	count(*) > 10
ORDER BY
	count(*) DESC

--What is the total procedural cost by gender?
SELECT
	gender, 
	sum(base_cost) as total_procedure_cost
FROM 
	public.patients as pt
INNER JOIN 
	public.procedure as pr
ON 
	pt.patient_id = pr.patient_id
GROUP BY 
	gender;
	
--What are the details of payments made in cash for procedures?
SELECT 
	ct.patientid,
	ct.notes as procedure,
	ct.payments as cash_payment,
	c.statusp,
	c.outstandingp,
	c.lastbilleddatep
FROM
	public.claim_transcations as ct
INNER JOIN 
	public.claims as c
ON 
	ct.claimid = c.id
WHERE 
	ct.method= 'CASH';	
	
--What allergies do the patients have?
SELECT 
	DISTINCT(description) as allergies
FROM 
	public.allergies;

--Provide information about patients with a care plan for diabetes self-management and an income greater than $50,000.
SELECT 
	patient as pt_id,
	gender,
	description as care_plan,
	income
FROM 
	Public.care_plan as c
INNER JOIN patients as p 
	ON c.patient = p.patient_id	
WHERE 
	code IN ('698360004' ) and income >50000
ORDER BY gender;	
	
--How many conditions does a specific patient have?	
SELECT
    patient_id,
    string_agg(DISTINCT description, ', ') AS conditions
FROM
    public.condition
WHERE
    patient_id = 'eb20905e-ba8a-ae54-2457-40686098e069'
GROUP BY
    patient_id;

--What are the top 3 administered vaccines in 2021?
SELECT 
	DISTINCT(description) as vaccine,
	COUNT(*) as vaccine_count
FROM
	public.immunization
WHERE
	EXTRACT(YEAR FROM date)= 2021
GROUP BY 
	description 
ORDER BY 
	count(*) DESC
LIMIT
	3;

-----AGE of patients who are alive(assuming null in death date column means still alive)
SELECT 
	patient_id ,
	EXTRACT (YEAR FROM age(CURRENT_DATE, date_of_birth)) as age
FROM
	public.patients
WHERE 
	date_of_death IS NULL
ORDER BY 
	age DESC;

--What are the top 5 reasons for patient visits? 
SELECT 
	c.description as reason,
	COUNT(*)
From 
	public.encounter as e
JOIN 
	public.condition as c
ON
	e.id = c.encounter_id
GROUP BY 
	reason
ORDER BY 
	count DESC
LIMIT 5;
	
--What is the average duration of a consultation(Medication review due (situation)) by gender?
WITH CTE as (
	SELECT e.start, 
	e.stop,
	c.description, 
	e.patient, 
	ROUND(EXTRACT(EPOCH FROM (e.stop - e.start)) / 60 ) AS duration_minutes  
	FROM 
	public.encounter as e
	INNER JOIN 
	public.condition as c ON e.id = c.encounter_id
    WHERE 
	c.description IN('Medication review due (situation)')
)	
SELECT 
	p.gender , 
	CTE.description as condition, 
	ROUND(AVG(duration_minutes)) as average_time_min
FROM 
	CTE 
INNER JOIN 
	public.patients AS p ON cte.patient = p.patient_id
GROUP BY 
	condition , p.gender

--What is the blood pressure status (Hypertensive or Normal) for patients with 'Systolic Blood Pressure' readings?
SELECT
	date,
    patient,
    value as SBP,
	units,
    CASE
        WHEN value::numeric > 130 and units = 'mm[Hg]' THEN 'Hypertensive' 
        ELSE 'Normal' END AS bp_status
FROM
    observations
WHERE
    DESCRIPTION = 'Systolic Blood Pressure';

	


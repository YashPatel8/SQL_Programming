
DROP DATABASE IF EXISTS `assi2`;
CREATE DATABASE  IF NOT EXISTS `assi2`;
USE `assi2`;

--
-- Step 4a part 1
--

SELECT a.business_name AS hospital_name, sum(b.license_beds) AS total_license_beds
FROM business a 
INNER JOIN bed_fact b ON b.ims_org_id = a.ims_org_id
LEFT JOIN bed_type c ON c.bed_id = b.bed_id WHERE c.bed_desc IN ('ICU' , 'SICU')
GROUP BY hospital_name
ORDER BY total_license_beds DESC
LIMIT 10;

--
-- Step 4a part 2
--

SELECT a.business_name AS hospital_name, sum(b.census_beds) AS total_census_beds
FROM business a 
INNER JOIN bed_fact b ON b.ims_org_id = a.ims_org_id
LEFT JOIN bed_type c ON c.bed_id = b.bed_id WHERE c.bed_desc IN ('ICU' , 'SICU')
GROUP BY hospital_name
ORDER BY total_census_beds DESC
LIMIT 10;

--
-- Step 4a part 3
--

SELECT a.business_name AS hospital_name, sum(b.staffed_beds) AS total_staffed_beds
FROM business a 
INNER JOIN bed_fact b ON b.ims_org_id = a.ims_org_id
LEFT JOIN bed_type c ON c.bed_id = b.bed_id WHERE c.bed_desc IN ('ICU' , 'SICU')
GROUP BY hospital_name
ORDER BY total_staffed_beds DESC
LIMIT 10;

--
-- Step 5a part 1
--

SELECT a.business_name AS hospital_name, sum(b.license_beds) AS total_license_beds
from business a 
INNER JOIN (
				SELECT ims_org_id
                FROM bed_fact b
                LEFT JOIN bed_type c ON b.bed_id = c.bed_id
                WHERE c.bed_desc IN ('SICU','ICU')
                GROUP BY ims_org_id
                HAVING count(*) > 1 
			)  d
ON a.ims_org_id = d.ims_org_id
INNER JOIN bed_fact b ON a.ims_org_id = b.ims_org_id
LEFT JOIN bed_type c ON b.bed_id = c.bed_id
WHERE  c.bed_desc  IN ('ICU','SICU')
GROUP BY hospital_name
order by total_license_beds DESC
limit 10;

--
-- Step 5a part 2
--

SELECT a.business_name AS hospital_name, sum(b.census_beds) AS total_census_beds
from business a 
INNER JOIN (
				SELECT ims_org_id
                FROM bed_fact b
                LEFT JOIN bed_type c ON b.bed_id = c.bed_id
                WHERE c.bed_desc IN ('SICU','ICU')
                GROUP BY ims_org_id
                HAVING count(*) > 1 
			)  d
ON a.ims_org_id = d.ims_org_id
INNER JOIN bed_fact b ON a.ims_org_id = b.ims_org_id
LEFT JOIN bed_type c ON b.bed_id = c.bed_id
WHERE  c.bed_desc  IN ('ICU','SICU')
GROUP BY hospital_name
order by total_census_beds DESC
limit 10;

--
-- Step 5a part 3
--

SELECT a.business_name AS hospital_name, sum(b.staffed_beds) AS total_staffed_beds
from business a 
INNER JOIN (
				SELECT ims_org_id
                FROM bed_fact b
                LEFT JOIN bed_type c ON b.bed_id = c.bed_id
                WHERE c.bed_desc IN ('SICU','ICU')
                GROUP BY ims_org_id
                HAVING count(*) > 1 
			)  d
ON a.ims_org_id = d.ims_org_id
INNER JOIN bed_fact b ON a.ims_org_id = b.ims_org_id
LEFT JOIN bed_type c ON b.bed_id = c.bed_id
WHERE  c.bed_desc  IN ('ICU','SICU')
GROUP BY hospital_name
order by total_staffed_beds DESC
limit 10;

--
--
--



DROP DATABASE IF EXISTS `HNI`;
CREATE DATABASE  IF NOT EXISTS `HNI`;
USE `HNI`;

--
--
--

SELECT a.business_name AS hospital_name, sum(b.license_beds) AS total_license_beds
FROM Business a 
INNER JOIN Bed_Fact b ON b.ims_org_id = a.ims_org_id
LEFT JOIN Bed_Type c ON c.bed_id = b.bed_id WHERE c.bed_desc IN ('ICU' , 'SICU')
GROUP BY hospital_name
ORDER BY total_license_beds DESC
LIMIT 10;

--
--
--

SELECT a.business_name AS hospital_name, sum(b.census_beds) AS total_census_beds
FROM Business a 
INNER JOIN Bed_Fact b ON b.ims_org_id = a.ims_org_id
LEFT JOIN Bed_Type c ON c.bed_id = b.bed_id WHERE c.bed_desc IN ('ICU' , 'SICU')
GROUP BY hospital_name
ORDER BY total_census_beds DESC
LIMIT 10;

--
--
--

SELECT a.business_name AS hospital_name, sum(b.staffed_beds) AS total_staffed_beds
FROM Business a 
INNER JOIN Bed_Fact b ON b.ims_org_id = a.ims_org_id
LEFT JOIN Bed_Type c ON c.bed_id = b.bed_id WHERE c.bed_desc IN ('ICU' , 'SICU')
GROUP BY hospital_name
ORDER BY total_staffed_beds DESC
LIMIT 10;

--
--
--

SELECT a.business_name AS hospital_name, sum(b.license_beds) AS total_license_beds
from Business a 
INNER JOIN (
				SELECT ims_org_id
                FROM Bed_Fact b
                LEFT JOIN Bed_Type c ON b.bed_id = c.bed_id
                WHERE c.bed_desc IN ('SICU','ICU')
                GROUP BY ims_org_id
                HAVING count(*) > 1 
			)  d
ON a.ims_org_id = d.ims_org_id
INNER JOIN Bed_Fact b ON a.ims_org_id = b.ims_org_id
LEFT JOIN Bed_Type c ON b.bed_id = c.bed_id
WHERE  c.bed_desc  IN ('ICU','SICU')
GROUP BY hospital_name
order by total_license_beds DESC
limit 10;

--
--
--

SELECT a.business_name AS hospital_name, sum(b.census_beds) AS total_census_beds
from Business a 
INNER JOIN (
				SELECT ims_org_id
                FROM Bed_Fact b
                LEFT JOIN Bed_Type c ON b.bed_id = c.bed_id
                WHERE c.bed_desc IN ('SICU','ICU')
                GROUP BY ims_org_id
                HAVING count(*) > 1 
			)  d
ON a.ims_org_id = d.ims_org_id
INNER JOIN Bed_Fact b ON a.ims_org_id = b.ims_org_id
LEFT JOIN Bed_Type c ON b.bed_id = c.bed_id
WHERE  c.bed_desc  IN ('ICU','SICU')
GROUP BY hospital_name
order by total_census_beds DESC
limit 10;

--
--
--

SELECT a.business_name AS hospital_name, sum(b.staffed_beds) AS total_staffed_beds
from Business a 
INNER JOIN (
				SELECT ims_org_id
                FROM Bed_Fact b
                LEFT JOIN Bed_Type c ON b.bed_id = c.bed_id
                WHERE c.bed_desc IN ('SICU','ICU')
                GROUP BY ims_org_id
                HAVING count(*) > 1 
			)  d
ON a.ims_org_id = d.ims_org_id
INNER JOIN Bed_Fact b ON a.ims_org_id = b.ims_org_id
LEFT JOIN Bed_Type c ON b.bed_id = c.bed_id
WHERE  c.bed_desc  IN ('ICU','SICU')
GROUP BY hospital_name
order by total_staffed_beds DESC
limit 10;

--
--
--


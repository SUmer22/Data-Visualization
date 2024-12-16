--Project SQL Queries

-------------------------------1. Key Performance Indicators (KPIs)---------------------------------------

--i.	Total Employees – Current total headcount.

select count(*) as [Total Employees] from HR_Data

--ii.	Attrition Count – Total number of employees who have left.

SELECT COUNT(*) as [Employees Left] FROM HR_Data WHERE Attrition = 'Yes'

--iii.	Attrition Rate – Percentage of employees who have left the organization.

SELECT (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0) / COUNT(*) AS Attrition_Rate
FROM HR_Data

--iv.	Active Employees – Total active employees.

SELECT COUNT(*) as [Total Active Employees] from HR_Data WHERE Attrition = 'No'

--v.	Gender Distribution – Employee count segmented by gender.

Select Count(*) as [Total Active Employees] , Gender from HR_Data 
Where Attrition = 'No' Group by Gender

--vi.	Job Role Distribution – Employee count by job role.

Select Count(*) as [Total Active Employees] , Job_Role from HR_Data 
Where Attrition = 'No' Group by Job_Role

--vii.	Educational Background – Employee count by field of education.

Select Count(*) as [Total Active Employees] , Education  from HR_Data 
Where Attrition = 'No' Group by Education

--viii.	Average Age – Mean age of employees.

Select round(avg(Age),2) as [Average Age] from HR_Data where Attrition = 'No'


--ix.	Work-Life Balance Score – Average work-life balance rating.

select AVG(Work_Life_Balance) as [Average Work Life Balance Score] from HR_Data where Attrition = 'No' 

--x.	Average Monthly Salary – Mean monthly income of employees.

select round(avg(Monthly_Income), 2) as [Average Monthly Income] from HR_Data where Attrition = 'No' 

----------------------------------------2: Additional Dashboard Features---------------------------------------------

--2: Employee Distribution by Age Group.

Select Age as [Age Group], count(*) as [Total Employees] from HR_Data where Attrition = 'No'
group by Age
Order by Age desc

--3. Turnover Rate by Department.

select count(*) as [Turn over Rate by Departments], Department from HR_Data where Attrition = 'Yes'
group by Department Order by count(*) desc

--4. Departmental Employee Distribution

select count(*) as [Department wise distribution], Department from HR_Data where Attrition = 'No'
group by Department order by count(*) desc

--5. Job Involvement by Role

SELECT 
    Job_Role,
    SUM(CASE WHEN Job_Involvement = 1 THEN 1 ELSE 0 END) AS Low,
    SUM(CASE WHEN Job_Involvement = 2 THEN 1 ELSE 0 END) AS Medium,
    SUM(CASE WHEN Job_Involvement = 3 THEN 1 ELSE 0 END) AS High,
    SUM(CASE WHEN Job_Involvement = 4 THEN 1 ELSE 0 END) AS Outstanding
FROM HR_Data
where Attrition = 'No'
GROUP BY Job_Role
ORDER BY Job_Role

--6. Satisfaction Ratings for Active Employees.

select round(avg(Job_Satisfaction),2) as [Average Satisfaction Rating ] from HR_Data where Attrition = 'No'


--7. Employee Count by Gender and Marital Status.

Select count(*) as [Employee Count] , Gender, Marital_Status from HR_Data where Attrition = 'No'
group by Gender, Marital_Status
order by count(*) desc

--8. Work-Life Balance Ratings w.r.t Department.

SELECT 
    Department,
    CASE 
        WHEN Work_Life_Balance = 1 THEN 'Low'
        WHEN Work_Life_Balance = 2 THEN 'Medium'
        WHEN Work_Life_Balance = 3 THEN 'High'
        WHEN Work_Life_Balance = 4 THEN 'Outstanding'
    END AS Work_Life_Balance_Label,
    COUNT(*) AS Employee_Count
FROM HR_Data
where Attrition = 'No'
GROUP BY Department, Work_Life_Balance
ORDER BY Department, Work_Life_Balance


--9. Relationship Satisfaction w.r.t Department
SELECT 
    Department, 
    CASE 
        WHEN Relationship_Satisfaction = 1 THEN 'Low'
        WHEN Relationship_Satisfaction = 2 THEN 'Medium'
        WHEN Relationship_Satisfaction = 3 THEN 'High'
        WHEN Relationship_Satisfaction = 4 THEN 'Outstanding'
    END AS Relationship_Satisfaction_Label,
    COUNT(*) AS Employee_Count
FROM HR_Data
where Attrition = 'No'
GROUP BY Department, Relationship_Satisfaction
ORDER BY Department, Relationship_Satisfaction

--10. Job Satisfaction Ratings w.r.t Department.
SELECT 
Department,
    CASE 
        WHEN Job_Satisfaction = 1 THEN 'Low'
        WHEN Job_Satisfaction = 2 THEN 'Medium'
        WHEN Job_Satisfaction = 3 THEN 'High'
        WHEN Job_Satisfaction = 4 THEN 'Outstanding'
    END AS Job_Satisfaction_Label,
    COUNT(*) AS Employee_Count
FROM HR_Data
where Attrition = 'No'
GROUP BY Job_Satisfaction, Department
ORDER BY Job_Satisfaction

--11. Education wise Employee Attrition

select count(*) as [Attrition Count], Education from HR_Data
where Attrition = 'Yes'
Group by Education


--12: Promotion Rate

SELECT Round((COUNT(CASE WHEN "Years_Since_Last_Promotion" > 0 THEN 1 END) * 100.0) / COUNT(*), 2) AS Promotion_Rate
FROM HR_Data where Attrition = 'No'


--13. Managerial Tenure (Effectiveness)

SELECT 
    Job_Role, 
    Round(AVG(Years_with_Curr_Manager), 5) AS Average_Managerial_Tenure
FROM HR_Data
WHERE Job_Role = 'Manager' and Attrition = 'No' 
GROUP BY Job_Role
ORDER BY Average_Managerial_Tenure DESC

--14: Overtime Participation by Gender.

SELECT 
    Gender,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Over_Time = 'Yes' THEN 1 ELSE 0 END) AS Overtime_Participants,
    (SUM(CASE WHEN Over_Time = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS Overtime_Participation_Rate
FROM HR_Data
where Attrition = 'No'
GROUP BY Gender
ORDER BY Gender


--15. Performance Ratings by Gender

SELECT 
    Gender,
    AVG(Performance_Rating) AS Average_Performance_Rating,
    COUNT(CASE WHEN Performance_Rating = 3 THEN 1 END) AS [Average Performance],
    COUNT(CASE WHEN Performance_Rating = 4 THEN 1 END) AS [Above Average Performance]
FROM HR_Data
where Attrition = 'No'
GROUP BY Gender
ORDER BY Gender



----------------------------------------------------Thank You--------------------------------------------------------------

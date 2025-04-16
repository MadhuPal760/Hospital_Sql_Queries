
select *  from Hospital_Data;

--1. Total Number of Patients
Select Sum(Patients_Count) as Total_Patients from Hospital_Data;

--2. Average Number of Doctors per Hospital
Select AVG(Doctors_Count)as Average_Dooctors from Hospital_Data;

--3. Top 3 Departments with the Highest Number of Patients
Select Top 3 Department,Patients_Count from Hospital_Data
order by Patients_Count desc;

--4. Hospital with the Maximum Medical Expenses
Select Hospital_Name, MAX(medical_Expenses)as Expensive_hospital from Hospital_Data
group by Hospital_Name;

--5. Daily Average Medical Expenses
SELECT 
    AVG(DATEDIFF(day, Admission_Date, Discharge_Date)) AS Avg_Stay_Duration,
    AVG(Medical_Expenses / NULLIF(DATEDIFF(day, Admission_Date, Discharge_Date), 0)) AS Avg_Daily_Expense
FROM 
    Hospital_Data;

--6. Longest Hospital Stay
Select  top 1 Admission_Date,Discharge_Date,
nullif(datediff(day,Admission_Date,Discharge_Date),0) as Stay_in_hospital From Hospital_Data
order by Stay_in_hospital desc  ;

--7. Total Patients Treated Per City
Select Distinct(Location), sum(Patients_Count) as Total_Pateints_treated from Hospital_Data
group by Location;

--8. Average Length of Stay Per Department
Select Department, AVG(DATEDIFF(day, Admission_Date, Discharge_Date)) as Average_stay from Hospital_Data
group by Department;



--9. Identify the Department with the Lowest Number of Patients
Select top 1 Department, patients_count from Hospital_Data
order by Patients_Count Asc ;


--10. Monthly Medical Expenses Report
select YEAR(admission_date) as Year,
Month(Admission_Date) as Month,
sum(medical_Expenses)as Total_Expenses
from Hospital_Data
group by YEAR(admission_date), Month(Admission_Date)
order by Month(Admission_Date) asc;


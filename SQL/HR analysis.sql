create database HR_Analytics;
use HR_Analytics;
show tables;



-- Dept info -- 
with CTE_Dept as 
	(select 
		`Job Role` as Dept,
		Max(`Monthly Income`) max_sal,
        Min(`Monthly Income`) min_sal,
        count(`Employee ID`) as emp_count,
		sum(case when Attrition = 0 then 1 else 0 end) as Attrition_Count,
        ROUND(SUM(CASE WHEN Attrition = 0 THEN 1 ELSE 0 END) / COUNT(*), 2) as Attrition_Rate,
        Round(avg(`Monthly Income`), 2) as avg_salary
	from employee_attrition
	group by `Job Role`
	)
select *
from CTE_Dept
order by Attrition_Count desc;


-- salary segmentation for Education Dept--
with CTE_Emp as (
	select
		case
			when `Monthly Income` < 3000 then 'Low salary'
			when `Monthly Income` < 5000 then 'Medium salary'
			else 'High salary'
		end
		as salary_div,               
		sum(case when Attrition = 0 then 1 else 0 end) as Attrition_Count,
        count(`Employee ID`) as emp_count
	from employee_attrition
	where `Job Role` = 'Education'
	group by salary_div)
select *, Attrition_Count/emp_count as Attrition_rate
from CTE_Emp;
    
    
    
-- Attrition Rate by each Job Role --
Delimiter &&
CREATE PROCEDURE Dept_Attrition_compare(IN p_dept VARCHAR(255))
BEGIN
    SELECT 
        `Job Role`,
        COUNT(*) as Total_Employees,
        SUM(CASE WHEN Attrition = 0 THEN 1 ELSE 0 END) as Left_employees,
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) as Stayed_employees,
        ROUND(SUM(CASE WHEN Attrition = 0 THEN 1 ELSE 0 END) / COUNT(*), 2) as Attrition_Rate,
        Round(avg(`Monthly Income`), 2) as Avg_salary
    FROM employee_attrition
    WHERE `Job Role` = p_dept
    group by `Job Role`;
END &&
delimiter ;


call Dept_Attrition_compare('Technology');
call Dept_Attrition_compare('Healthcare');
call Dept_Attrition_compare('Education');
call Dept_Attrition_compare('Media');
call Dept_Attrition_compare('Finance');




-- Top 5 Employees per each Job Role based on Monthly Income --
Delimiter $$
create procedure emp_rank(IN p_dept VARCHAR(255))
Begin
	select * from
		(select
			`Employee ID`,
			`Job Role`,
			`Monthly Income`,
            `Attrition`,
            `Education Level`,
            Gender,
            Age,
			rank() over (partition by `Job Role` order by `Monthly Income` desc) as emp_rank 
		from employee_attrition
		where `Job Role` = p_dept
        ) as dept_ranked_table
	where emp_rank <= 5;
End $$
delimiter ;

call emp_rank('Technology');
call emp_rank('Healthcare');
call emp_rank('Education');
call emp_rank('Media');
call emp_rank('Finance');




-- Work Life Balance and Attrition --
create view vw_worklifebalance_attrition as 
	(select
		`Work-Life Balance`,
        count(*) as Total_Employees,
        sum(case when Attrition = 0 then 1 else 0 end) as Attrition_Count,
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) as Stayed_employees,
        ROUND(SUM(CASE WHEN Attrition = 0 THEN 1 ELSE 0 END) / COUNT(*), 2) as Attrition_Rate
        from employee_attrition
        group by `Work-Life Balance`
        );
SELECT *
FROM vw_worklifebalance_attrition
ORDER BY Attrition_Rate DESC;



-- Overtime and  Attrition --
create view vw_overtime_attrition as
	(select
		Overtime,
        ROUND(SUM(CASE WHEN Attrition = 0 THEN 1 ELSE 0 END) / COUNT(*), 2) as Attrition_Rate,
        sum(case when Attrition = 0 then 1 else 0 end) as Attrition_Count,
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) as Stayed_employees,
        COUNT(*) as Total_Employees
        from employee_attrition
        group by Overtime
		);
    
select * from vw_overtime_attrition;
    


-- Years at Company and Attrition --
create view vw_experience as
	(select
		case
			when `Years at Company` < 3 then 'Junior'
			when `Years at Company` < 7 then 'Mid-Level'
			when `Years at Company` < 15 then 'Senior'
			else 'Executive'
		end as YearsAtCompany,
		COUNT(*) as Total_Employees,
        sum(case when Attrition = 0 then 1 else 0 end) as Attrition_Count,
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) as Stayed_employees,
		ROUND(SUM(CASE WHEN Attrition = 0 THEN 1 ELSE 0 END) / COUNT(*), 2) as Attrition_Rate,
        Round(avg(`Monthly Income`), 2) as Avg_salary
	from employee_attrition
			group by YearsAtCompany
			);
		
select * from vw_expereince;
emp_with_salary = LOAD '/home/acadgild/pig/employee_details.txt' USING PigStorage(',') AS (emp_id:int, emp_name:chararray, emp_salary:int, emp_rating:int);
sorted_emp_with_salary = order emp_with_salary by emp_salary desc,emp_name;
filtered_emp_with_salary_odd_id = filter sorted_emp_with_salary by emp_id%2!=0;
top_three_emp = limit filtered_emp_with_salary_odd_id 3;
top_three_emp_details = FOREACH top_three_emp generate emp_id,emp_name;
store top_three_emp_details into '/home/acadgild/Desktop/5.1/output/partB';

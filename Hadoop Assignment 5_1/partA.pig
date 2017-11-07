emp_with_rating = LOAD '/home/acadgild/pig/employee_details.txt' USING PigStorage(',') AS (emp_id:int, emp_name:chararray, emp_salary:int, emp_rating:int);
sorted_emp_with_rating = order emp_with_rating by emp_rating Desc,emp_name;
top_five_emp = limit sorted_emp_with_rating 5;
top_five_emp_details = FOREACH top_five_emp generate emp_id,emp_name;
store top_five_emp_details into '/home/acadgild/Desktop/5.1/output/partA';


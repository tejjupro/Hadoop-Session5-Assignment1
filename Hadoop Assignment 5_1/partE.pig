emp = LOAD '/home/acadgild/pig/employee_details.txt' USING PigStorage(',') AS (emp_id:int, emp_name:chararray, emp_salary:int);
emp_expenses = LOAD '/home/acadgild/pig/employee_expenses.txt' AS (emp_id:int, expenses:int);
joined_data = join emp by emp_id left outer, emp_expenses by emp_id;
sorted_joined_data_with_expense = order joined_data by expenses desc,emp_name;
filter_sorted_joined_data_with_expense = FILTER sorted_joined_data_with_expense by $4 is null;
employee_not_expns = FOREACH filter_sorted_joined_data_with_expense generate $0,$1;
store employee_not_expns into '/home/acadgild/Desktop/5.1/output/partE';

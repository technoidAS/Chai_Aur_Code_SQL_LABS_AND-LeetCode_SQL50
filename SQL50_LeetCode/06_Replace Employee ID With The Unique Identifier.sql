SELECT unique_id, name
FROM Employees AS e1 LEFT JOIN EmployeeUNI as e2
on e1.id = e2.id; 
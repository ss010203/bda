emp_id <- c(01, 02, 03)

emp_name <- c("Siddhesh", "Gourika", "Sagar")

emp_dep <- c("Boss", "employee", "employee")

emp_sal <- c(2000000, 2000000, 2000000)

emp_df <- data.frame(
    Employee_ID = emp_id,
    Employee_Name = emp_name,
    Employee_Department = emp_dep,
    Employee_Salary = emp_sal
)

print(emp_df)
summary(emp_df)
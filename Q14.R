emp <- data.frame(
  Name = c("Siddhesh", "Gourika", "Sagar", "Jatin", "Pratham"),
  Age = c(21, 22, 21, 23, 22),
  Department = c("IT", "HR", "IT", "Finance", "HR"),
  Salary = c(200000, 190000, 185000, 100000, 150000)
)

result <- emp[, c("Name", "Salary")]
print(result)

result2 <- subset(emp, Salary > 150000)
print(result2)

png("q14.png", width = 800, height = 600)

barplot(
  emp$Salary,
  main="Salary Data",
  xlab = "Emp Name",
  ylab = "Emp Salary",
  names.arg = emp$Name
)

dev.off()
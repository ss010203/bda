EmpDet <- data.frame(
    Name = c("Siddhesh", "Gourika", "Sagar"),
    Salary = c(200000, 190000, 185000)
)

EmpDet2 <- data.frame(
    Name = c("Jatin", "Pratham"),
    Salary = c(100000, 150000)
)

EmpDet3 <- rbind(EmpDet, EmpDet2)

print(EmpDet3)

png("q6.png", width = 800, height = 600)
barplot(
    EmpDet3$Salary,
    main = "Salary Details",
    names.arg = EmpDet3$Name,
    xlab = "Name",
    ylab = "Salary",
    col = "blue"
)
dev.off()
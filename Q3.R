vec <- c(50,70,10,35,40,60,20,5)

asc <- sort(vec)
desc <- sort(vec, decreasing = TRUE)

print(vec)
print(asc)
print(desc)

png("asc.png", width = 800, height = 600)

barplot(
    asc,
    main = "Ascending Order",
    xlab = "Index",
    ylab = "Value",
    col = "skyblue"
)
dev.off()
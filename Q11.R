bread <- c(12, 3, 5, 11, 9)
milk <- c(21, 27, 18, 20, 15)
cola <- c(10, 1, 33, 6, 12)
chocolate <- c(6, 7, 4, 13, 12)
detergent <- c(5, 8, 12, 20, 23)

sales <- rbind(bread, milk, cola, chocolate, detergent)

colnames(sales) <- c("Mon", "Tues", "Wed", "Thurs", "Fri")

png("q11.png", width = 800, height = 600)
barplot(
    sales,
    beside = TRUE,
    main = "Sales data",
    ylab = "Product Sales",
    xlab = "Day"
)
dev.off()
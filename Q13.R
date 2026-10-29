df <- data.frame(
  course = c(1, 2, 3, 4, 5, 6),
  id = c(11, 12, 13, 14, 15, 16),
  class = c(1, 2, 1, 2, 1, 2),
  marks = c(56, 75, 48, 69, 84, 53)
)

result <- df[df$course < 3, ]

result2 <- subset(df, course < 3 | class == 2)

png("q13.png", width=800, height=600)
barplot(
    df$marks,
    main="q13",
    xlab = "Course",
    ylab= "Marks"
)
dev.off()
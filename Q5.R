df <- data.frame(
  Subject = c(1, 2, 3, 4, 5, 6),
  Class = c(1, 2, 1, 2, 1, 2),
  Marks = c(56, 75, 48, 69, 84, 53)
)

result <- subset(df, Subject < 4)

result2 <- df[df$Subject < 3 & df$Class == 2, ]

png("q5.png", width=800, height=600)
barplot(
    df$Marks,
    main = "Marks by Subject",
    names.arg = df$Subject,
    xlab = "Subject",
    ylab = "Marks",
    col = "skyblue"
)
dev.off()
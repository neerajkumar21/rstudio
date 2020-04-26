train <- read.csv("train.csv", header = TRUE)
test <- read.csv("test.csv")

test.survived <- data.frame(Survived = rep("None", nrow(test)), test[,])

data.combined <- rbind(train, test.survived)

str(data.combined)

data.combined$Survived <- as.factor(data.combined$Survived)
data.combined$Pclass <- as.factor(data.combined$Pclass)

table(data.combined$Survived)
table(data.combined$Pclass)

library(ggplot2)

train$Pclass <- as.factor(train$Pclass)
ggplot(train, aes(x = Pclass, fill = factor(Survived))) +
  geom_bar() +
  xlab("Pclass") +
  ylab("Total Count") +
  labs(fill = "Survived")

head(as.character(train$Name))

length(unique(as.character(data.combined$Name)))

dup.names <- as.character(data.combined[which(duplicated(as.character(data.combined$Name))), "Name"])
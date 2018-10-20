
## Part 4B: Decision Tree ##
training_data <- readRDS(file = "./data/training_data.Rda")
test_data <- readRDS(file = "./data/test_data.Rda")

#divide features and test data
training_features <- training_data[,1:4]  #
training_labels <- training_data[,5] # last
test_features <- test_data[,1:4]
test_labels <- test_data[,5]

#install and import "party" library
install.packages("party")
library(party)   # has ctree function

# specify target (class) and predictors (features)
myFormula <- Species ~ Sepal.Length + Sepal.Width +
  Petal.Length +Petal.Width

# generate classification tree
iris_ctree <- ctree(myFormula, data = training_data)

#visualise the tree
plot(iris_ctree)
plot(iris_ctree, type = "simple")

#predict test labels
ctree_pred <- predict(iris_ctree, newdata = test_features)
saveRDS(ctree_pred, file = "./data/ctree_pred.Rda")


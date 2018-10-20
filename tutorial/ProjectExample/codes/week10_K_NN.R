# Part 4C : K-NN##
training_data <- readRDS(file = "./data/training_data.Rda")
test_data <- readRDS(file = "./data/test_data.Rda")

#divide features and labels
training_features <- training_data[,1:4]
training_labels <- training_data[,5]
test_features <- test_data[,1:4]
test_labels <- test_data[,5]

#install and import "class" library
install.packages("class")
library(class)

#classify using K-NN
knn_pred <-knn(train = training_features,
               test = test_features,
               cl = training_labels,
               k = 3)

saveRDS(test_labels, file = "./data/test_labels.Rda")
saveRDS(knn_pred, file = "./data/knn_pred.Rda")

## Part 4D: Evaluation ##

test_labels <-readRDS(file = "./data/test_labels.Rda")
ctree_pred <- readRDS(file = "./data/ctree_pred.Rda")
knn_pred <- readRDS(file = "./data/knn_pred.Rda")

cm = as.matrix(table(Actual = test_labels,Predicted = ctree_pred))

n = sum (cm)
nc = nrow(cm)
diag = diag(cm)
rowsums = apply(cm,1,sum) # sum of each row for each column
colsums = apply(cm, 2, sum) # sum of each column for each row

accuracy =sum(diag)/n
precision = diag/colsums
recall = diag/rowsums
f1 = 2*precision*recall/(precision +recall)

result <- data.frame(precision, recall, f1)
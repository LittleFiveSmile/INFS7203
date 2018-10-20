## Practical Tutorial 4:Classification ##
## Part 4A: Create Experimental Data##

# Extract Data
iris <- read.table("./data/iris.data",sep =',')

#Assign name to variables
names(iris) <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")

# For reproducible result
set.seed(2018)  # same seed will have same sequence

#Set training and test ratio
m = nrow(iris)
training_percentage = 0.7
test_percentage = 0.3

# Sample random index
ind <- sample(2, m, replace = TRUE, prob = c(training_percentage,test_percentage))  # 70% 是1，30% is 2

# Select training and test data  
training_data = iris[ind == 1,]  # whole column
test_data = iris[ind == 2,]

# Save datasets to files
saveRDS(training_data, file ="./data/training_data.Rda")
saveRDS(test_data, file = "./data/test_data.Rda")

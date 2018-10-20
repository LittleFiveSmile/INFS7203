# Extract data
iris <- read.table("./data/iris.data",sep=',')

#assign name to variables
names(iris) <-c("Sepal.Length","Sepal,Width","Petal.length","Petal.Width","Species")

#have a look at data(Ctrl +enter kuai shu yunxing)
dim(iris)
names(iris)
str(iris)
attributes(iris)

#Explore subset of data
iris[1:5,]
head(iris)
tail(iris)
iris[1:10,"Sepal.Length"]
iris$Sepal.Length[1:10]


#Visualise the frequency
hist(iris$Sepal.Length)
table(iris$Species)
pie(table(iris$Species))
barplot(table(iris$Species))


## Introduction Part 2###
#Select variable(columns)
x1<- iris[,"Sepal.Length"]
x2 <-iris[,1]
Features<-iris[ ,c("Sepal.Length","Sepal,Width",
                   "Petal.length","Petal.Width")]
Target <-iris[ ,"Species"]

Features2 <- iris[ ,1:4]
Target2 <- iris[ ,5]

#Select observations(rows)

k=100
m=nrow(iris)
D1=iris[1:k, ]       #d1 前一百行数据
D2=iris[(k+1):m, ]   #D1 剩下的所有数据

D1_Features<-D1[ ,1:4]  #前四个属性
D1_Target <- D1[ ,5]  #第五个属性

D2_Features<-D2[ ,1:4]
D2_Target <- D2[ ,5]

# Select based on condition(s)

iris_setosa <- iris[iris$Species=="Iris-setosa", ]
str(iris_setosa)

summary(iris)
high_sepal_length <-iris[iris$Sepal.Length>5.8, ]
high_sepal_length <-iris[iris$Sepal.Length>median(iris$Sepal.Length), ]
str(high_sepal_length)
summary(high_sepal_length)

#Generate training and testing data

m= nrow(iris)
train_percentage =0.7
test_percentage =0.3

m_train = m * train_percentage
m_test =m-m_train

train_data =iris[1:m_train, ]
test_data =iris[(m_train+1):m, ]
summary(train_data)
summary(test_data)

## Problem with above    这一块真不懂

set.seed(1234)
ind <- sample(2,m,replace = TRUE,
              prob = c(train_percentage,test_percentage))

train_data2=iris[ind==1, ]
test_data2=iris[ind==2,]

summary(train_data2)
summary(test_data2)

#Visualisation

#a single variable

jpeg(filename = "./plots/Speal_length.jpeg")
plot(iris$Sepal.Length,
     xlab = "obervations",ylab = "Sepal Length",
     main="First Obervation",
     pch=18,col="blue")  ##pch 一个数字对应一个符号

dev.off()  #关闭当前设备

#Visualise multiple variables

plot(iris[ ,c("Sepal.Length","Sepal,Width")])

plot(iris[ ,c("Sepal.Length","Sepal,Width","Petal.length")])
plot(iris[ ,c("Sepal.Length","Sepal,Width","Petal.length","Petal.Width")])


#odd points to plot   ####这个也不懂呢

iris2 <- iris[ ,c("Sepal.Length","Sepal,Width","Petal.length","Petal.Width")]
(kmeans.result <- kmeans(iris2,3))

plot(iris[ ,c("Sepal.Length","Sepal,Width","Petal.length","Petal.Width")],
     col=kmeans.result$cluster)


plot(iris[ ,c("Sepal.Length","Sepal,Width")], col=kmeans.result$cluster)

points(kmeans.result$clusters[ ,c("Sepal.Length","Sepal,Width")],col=1:3,pch=8,cex=2)


#try

str(iris)
summary(iris)


iris <-read.table("./data/iris.data",sep =",")

#Assign name to variables
names(iris) <- c("Sepal.Length","Sepal,Width",
                 "Petal.length","Petal.Width","Species")

#Select first four vars 
iris2 <-iris[ ,1:4]

#for reproducible result
set.seed(2018)
#Cluster with K-means into nclust cluster
nclust = 3

(kmeans.result <- kmeans(iris2,nclust))


plot(iris[ ,c("Sepal.Length","Sepal,Width")],
     col = kmeans.result$cluster)
title(paste("k=",nclust))
points(kmeans.result$centers[ ,c("Sepal.Length","Sepal,Width")],
       col = 1:nclust,pch =8,cex=2)


###Hierarchical Clustering 

#For reproducible result
set.seed(2018)

n=nrow(iris2)
ns =40
idx <-sample(1:n,ns)

irisSample <-iris2[idx,]

hc <-hclust(dist(irisSample),method ="ave")

plot(hc,hang = -1,labels=iris$Species[idx])

#Cut the dendrogram into nclust cluster
nclust =3
rect.hclust(hc,k=nclust)
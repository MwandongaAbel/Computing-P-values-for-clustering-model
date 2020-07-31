#Computing P-value for Hierarchical Clustering----Abel Mwandonga Haro.

install.packages("pvclust")
library(pvclust)
library(pvclust)
data("lung")
?lung
str(lung)
head(lung)
head(lung[,1:5])
dim(lung)
set.seed(123)
ss<-sample(1:73,30)
df<-lung[,ss]
res_pv<-pvclust(df,method.dist = "cor",method.hclust = "average",nboot = 10)

# Default plot
plot(res_pv,hang=-1,cex=0.5)
pvrect(res_pv)
clusters<-pvpick(res_pv)
clusters
# Create a parallel socket cluster
library(parallel)
ps<-makeCluster(2,type = "PSOCK")
# parallel version of pvclust
res_pv<-parPvclust(ps,df,nboot = 1000)
stopCluster(ps)

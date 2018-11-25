#############################################################################################
######### F ratio (mean sq.) distribution with randomized samples and associated probability ###########
#############################################################################################
anova2<-function(response,v1,v2,nbrep=1000){
        rep<-response
        var1<-v1
        var2<-v2
        data<-data.frame(rep=rep,var1=var1,var2=var2)
        obs<-data.frame(t(anova(lm(rep~var1*var2,data=data))$Mean))
        names(obs)<-c("Factor 1","Factor 2","Interaction","Residuals")
        for (i in 2:nbrep) {
                obs[i,]<-t(anova(lm(sample(rep)~var1*var2,data=data))$Mean)
                }
                pval<-NULL
        for (j in 1:3) {
                pval[j]<-sum(obs[,j]>=obs[1,j])/length(obs[,j])
                }
par(mfrow=c(3,1))
hist(obs$"Factor 1",xlab="Mean Sq.");abline(v=obs[1,1],lwd=2)
hist(obs$"Factor 2",xlab="Mean Sq.");abline(v=obs[1,2],lwd=2)
hist(obs$"Interaction",xlab="Mean Sq.");abline(v=obs[1,3],lwd=2)

return(pval)
}

# TO USE IT e.g.: anova2(females$Tau, females$Species, females$Light, nbrep=5000)   ###

anova1<-function(response,v3,nbrep=1000){
        rep<-response
        var3<-v3
        data<-data.frame(rep=rep,var3=var3)
        obs1<-data.frame(t(anova(lm(rep~var3,data=data))$Mean))
        names(obs1)<-c("Factor","Residuals")
        for (i in 2:nbrep) {
                obs1[i,]<-t(anova(lm(sample(rep)~var3,data=data))$Mean)
                }
                pvalu<-NULL
                pvalu<-sum(obs1[,1]>=obs1[1,1])/length(obs1[,1])
hist(obs1$"Factor",xlab="Mean Sq.");abline(v=obs1[1,1],lwd=2)

return(pvalu)
}

#### With 3 factors

anova3<-function(response,o1,o2,o3,nbrep=1000){
        rep<-response
        var1<-o1
        var2<-o2
        var3<-o3
        data<-data.frame(rep=rep,var1=var1,var2=var2,var3=var3)
        obs3<-data.frame(t(anova(lm(rep~var1*var2*var3,data=data))$Mean))
        names(obs3)<-c("Factor 1","Factor 2","Factor 3","Interaction 1x2","Interaction 1x3","Residuals")
        for (i in 2:nbrep) {
                obs3[i,]<-t(anova(lm(sample(rep)~var1*var2*var3,data=data))$Mean)
                }
                pval<-NULL
        for (j in 1:5) {
                pval[j]<-sum(obs3[,j]>=obs3[1,j])/length(obs3[,j])
                }
par(mfrow=c(5,1))      
hist(obs3$"Factor 1",xlab="Mean Sq.");abline(v=obs3[1,1],lwd=2)
hist(obs3$"Factor 2",xlab="Mean Sq.");abline(v=obs3[1,2],lwd=2)
hist(obs3$"Factor 3",xlab="Mean Sq.");abline(v=obs3[1,3],lwd=2)
hist(obs3$"Interaction 1x2",xlab="Mean Sq.");abline(v=obs3[1,4],lwd=2)
hist(obs3$"Interaction 1x3",xlab="Mean Sq.");abline(v=obs3[1,5],lwd=2)

return(pval)
}

# TO USE IT e.g.: anova2(females$Tau, females$Species, females$Light, nbrep=5000)   ###

## Confidence intervals ###
ci95<-function(x) {
t.value<- qt(0.975,length(x)-1)
standard.error<-se(x)
ci<-t.value*standard.error
cat("95% Confidence Interval = ", mean(x) -ci, "to ", mean(x) +ci,"\n") }
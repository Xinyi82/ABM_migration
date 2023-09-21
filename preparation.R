
library('tidyverse')
library('readxl')
library('cat')
library('humanleague')
library('ggplot2')
setwd("G:/PhD/Dropbox/PhD/phd")
# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
# LOAD INPUT
# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
sexAgeEdu <- read.table("Napop_edu.csv",sep=",",header=T) 
sexAgeLF <- read.table("Napop_LF.csv",sep=",",header=T)
Botspop <- read.table("Bots.csv",sep=",",header=T)
Mozpop <- read.table("Mo.csv",sep=",",header=T)
SApop <- read.table("SA.csv",sep=",",header=T)
Zimpop <- read.table("Zim.csv",sep=",",header=T)
# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
# SYTHETIC POPULATION
# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------

microsynthesise = function() {
  
  cat(paste("Population: ", sum(sexAgeEdu$Persons), "\n"))
  cat("Starting microsynthesis...")
  
  lf=aggregate(sexAgeLF$Persons, by=list(sexAgeLF$LF), FUN=sum)
  sex=aggregate(sexAgeLF$Persons, by=list(sexAgeLF$Sex), FUN=sum)
  age=aggregate(sexAgeLF$Persons, by=list(sexAgeLF$Age), FUN=sum)
  edu=aggregate(sexAgeEdu$Persons, by=list(sexAgeEdu$Edu), FUN=sum)
  
  n = sum(sexAgeLF$Persons)
  
  synpop=data.table( Sex=rep("",n), Age=rep(-1,n), Edu=rep("",n), LF=rep("",n))
  
  index = 1L
  
    for (s in sex$Group.1) {
      for (b in age$Group.1) {
        l1 = sexAgeEdu[ sexAgeEdu$Sex==s & sexAgeEdu$Age==b,]$Ethnicity
        l2 = sexAgeLF[ sexAgeLF$Sex==s & sexAgeLF$Age ==b,]$LF
        m1 = sexAgeEdu[ sexAgeEdu$Sex==s & sexAgeEdu$Age==b,]$Persons
        m2 = sexAgeLF[ sexAgeLF$Sex==s & sexAgeLF$Age ==b,]$Persons
        if (sum(m1)>0) {
          res = synthPop(list(m1,m2))
          for (i in 1:nrow(res$pop)) {
            set(synpop,index,"Sex", s)
            set(synpop,index,"Age", b)
            set(synpop,index,"LF", l2[res$pop$C1[i]+1])
            set(synpop,index,"Edu", l1[res$pop$C0[i]+1])
            index = index + 1L
          }
        }
      }
    }
  
  return(synpop)
}

Napop <- microsynthesise()

# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
# INITIALIZE POPULATION
# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------

 d1 <-  Botspop %>%
  subset( !AGE=='999') %>%
  subset( !EDATTAIN=='9' ) %>%
  subset( !EMPSTAT=='9' ) 

 d2 <-  Mopop %>%
  subset( !AGE=='999') %>%
  subset( !EDATTAIN=='9' ) %>%
  subset( !EMPSTAT=='9' )

 d3 <-  Zimpop %>%
  subset( !AGE=='999') %>%
  subset( !EDATTAIN=='9' ) %>%
  subset( !EMPSTAT=='9' )

 d4 <-  SApop %>%
  subset( !AGE=='999') %>%
  subset( !EDATTAIN=='9' ) %>%
  subset( !EMPSTAT=='9' )

 d5 <-  Napop 
 
 inipop_pop = function(data,n){data[sample(nrow(data),n), ]}
 
 bots_pop <- inipop_pop(d1,427)
 
 mo_pop <- inipop_pop(d2,4752)
 
 na_pop <- inipop_pop(d5,427)
 
 sa_pop <- inipop_pop(d4,10489)
 
 zim_pop <- inipop_pop(d3,2605)
 
 write.csv(bots_pop, file = "botspop.csv", row.names = FALSE, col.names = FALSE)
 write.csv(mo_pop, file = "mopop.csv", row.names = FALSE, col.names = FALSE)
 write.csv(na_pop, file = "napop.csv", row.names = FALSE, col.names = FALSE)
 write.csv(sa_pop, file = "sapop.csv", row.names = FALSE, col.names = FALSE)
 write.csv(zim_pop, file = "zimpop.csv", row.names = FALSE, col.names = FALSE)
 
# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
# GENERATE RANDOM INCOME
# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
 
lognormalrandom <- function(mu, gini){
  normalsd <- gini * mu * (pi)^(1/2)
  stdSquaredLog <- log(1+((normalsd^2)/(mu ^ 2)))
  muLog<-log(mu) - (1/2) * stdSquaredLog
  # For a single value
  randomIncome <- rlnorm(1,mean=muLog, sd= stdSquaredLog^(1/2))
  return(randomIncome)
}
 
 # ----------------------------------------------------------------------------------------------------------------------
 # ----------------------------------------------------------------------------------------------------------------------
 # OUTPUT
 # ----------------------------------------------------------------------------------------------------------------------
 # ----------------------------------------------------------------------------------------------------------------------
 
 dfb1 <- read.table("Bots_simflow.csv",sep=",",header=T)
 dfm1 <- read.table("Mo_simflow.csv",sep=",",header=T)
 dfn1 <- read.table("Na_simflow.csv",sep=",",header=T)
 dfz1 <- read.table("Zim_simflow.csv",sep=",",header=T)
 
 
 ggplot() +
   geom_ribbon(data = dfb1,aes(x = year,ymin = lower95, ymax = upper95,group = 1), fill = "lightblue") +
   geom_line(data = dfb1, aes(x = year, y = b1,group = 1))+
   ylim(0,25)+
   ylab("Botswana_emigration rate")
 
 ggplot() +  
   geom_ribbon(data=dfm1,aes(x = year,ymin = lower95, ymax = upper95,group = 1), fill = "lightblue")+
   geom_line(data=dfm1,aes(x=year, y=m1,group = 1))+
   ylim(0,25)+
   ylab("Mozambique_emigration rate")
 
 ggplot() +
   geom_ribbon(data=dfn1,aes(x = year,ymin = lower95, ymax = upper95,group = 1), fill = "lightblue")+
   geom_line(data=dfn1,aes(x=year, y=n1,group = 1))+
   ylim(0,25)+
   ylab("Namibia_emigration rate")
 
 ggplot() +
   geom_ribbon(data=dfz1,aes(x = year,ymin = lower95, ymax = upper95,group = 1), fill = "lightblue")+
   geom_line(data=dfz1,aes(x=year, y=z1,group = 1))+
   ylim(0,25)+
   ylab("Zimbabwe_emigration rate")
 
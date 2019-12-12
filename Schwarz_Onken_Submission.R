#Exercise 10- Dynamic Modeling
#Non-mutant sub-pop
# Equation
#  N[t+1]=N[t]+(RN*N[t]*(1-((N[t]+M[t])/K)))
#Mutant sub-pop
# Equation
#  M[t+1]=M[t]+(RM*M[t]*(1-((N[t]+M[t])/K)))
# Set parameters
RN=0.1
K=1000000
N0=99
timesteps=400
RM=0.1
M0=1
# note:timesteps are in days
# create vector to set intial N and store N's
N=numeric(length=timesteps)
N[1]=N0
M=numeric(length=timesteps)
M[1]=M0
# simulate
for(t in 1:(timesteps-1)) {
  N[t+1] <- N[t] +(RN*N[t]*(1-((N[t]+M[t])/K)))
  M[t+1] <- M[t] +(RM*M[t]*(1-((N[t]+M[t])/K)))
}
# plot simulations
library(ggplot2)
nonmutant <- data.frame(time=1:length(N),N=N)
mutant <- data.frame(time=1:length(M),M=M)
ggplot()+
  geom_line(data=nonmutant,aes(x=time,y=N),color="red")+
  geom_line(data=mutant,aes(x=time,y=M),color="blue")
# find the equilibrium point
M
N
# equilibrium at t=322 
# add drug treatment after t=322 to simulation 
# Set parameters
RN=0.1
K=1000000
N0=99
timesteps=1000
RM=0.1
M0=1
# note:timesteps are in days
# create vector to set intial N and store N's
N=numeric(length=timesteps)
N[1]=N0
M=numeric(length=timesteps)
M[1]=M0
# simulate
for(t in 1:(timesteps-1)) {
  if(t>322){
    RN=-0.1
    RM=0.05
    N[t+1] <- N[t] +(RN*N[t]*(1-((N[t]+M[t])/K)))
    M[t+1] <- M[t] +(RM*M[t]*(1-((N[t]+M[t])/K)))
  }else{
  N[t+1] <- N[t] +(RN*N[t]*(1-((N[t]+M[t])/K)))
  M[t+1] <- M[t] +(RM*M[t]*(1-((N[t]+M[t])/K)))}
}
# plot simulations
library(ggplot2)
nonmutant <- data.frame(time=1:length(N),N=N)
mutant <- data.frame(time=1:length(M),M=M)
ggplot()+
  geom_line(data=nonmutant,aes(x=time,y=N),color="red")+
  geom_line(data=mutant,aes(x=time,y=M),color="blue")

M
N

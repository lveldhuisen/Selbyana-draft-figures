#Leah Veldhuisen 
#Figures for Selbyana manuscript
#April 7, 2021


library(ggthemes)
library(ggplot2)

#code for LLL vs RW for PR to show why using LLL as main measure 
ggplot2::aes(PraimondiiR$`Longest leaf leangth (cm)`,PraimondiiR$`Rosette width (cm)`)
ggplot(data = PraimondiiR)
a <- ggplot(PraimondiiR, aes(PraimondiiR$`Longest leaf leangth (cm)`,PraimondiiR$`Rosette width (cm)`))
plot(a)
a + geom_point() + xlab("Longest leaf length (cm)") + ylab("Rosette width (cm)") + ggtitle("Leaf length and rosette width for P. raimondii") + geom_smooth(method = 'lm',formula = y~x) + theme_stata()

#boxplots for flowering threshold for all three species -- wrong data
f <- ggplot(CompiledLLLdataRJan21,aes(CompiledLLLdataRJan21$`all RC`,CompiledLLLdataRJan21$`all LLL`)) + geom_boxplot() + xlab("Reproductive category") + ylab("Longest leaf length (cm)") + ggtitle("Distribution of leaf lengths by reproductive category and species") + facet_grid(cols = vars(CompiledLLLdataRJan21$Species)) 
plot(f)

#PC and PG pup/LLL tradeoff
t <- ggplot(CompiledLLLdataRJan21, aes(CompiledLLLdataRJan21$`pups LLL`,CompiledLLLdataRJan21$`pup number`)) + geom_point(aes(color = factor(CompiledLLLdataRJan21$`Species - pups`))) + xlab("Longest leaf length (cm)") + ylab("Number of pups") + ggtitle("Longest leaf length and pup number for P. cryptantha and P. goudotiana") + labs(color = "Species") + theme_stata()
plot(t)

#fruit and LLL tradeoff for PG (same as Erin's)
b <- ggplot(CompiledLLLdataRJan21, aes(CompiledLLLdataRJan21$`PG LLL`,CompiledLLLdataRJan21$`PG number of fruits`)) + geom_point(aes(color = factor(CompiledLLLdataRJan21$`PG Pups or no`))) + xlab("Longest leaf length (cm)") + ylab("Number of fruits") + ggtitle("P. goudotiana fruits") + labs(color = "Pups") + theme_stata()
plot(b)

#fruit and LLL tradeoff for PC (same as Erin's)
c <- ggplot(CompiledLLLdataRJan21, aes(CompiledLLLdataRJan21$`PC LLL`,CompiledLLLdataRJan21$`PC number of fruits`)) +geom_point(aes(color = factor(CompiledLLLdataRJan21$`PC pups or no`))) + xlab("Longest leaf length (cm)") + ylab("Number of fruits") + ggtitle("P. cryptantha fruits") + labs(color = "Pups") + theme_stata()
plot(c)

#new data frame by kate

plantdata<-data.frame(time=CompiledLLLdataRJan21$`all RC`,species=CompiledLLLdataRJan21$Species,length=CompiledLLLdataRJan21$`all LLL`)

pc<-(CompiledLLLdataRJan21$Species=="P. cryptantha")
pg<-(CompiledLLLdataRJan21$Species=="P. goudotiana")
pr<-(CompiledLLLdataRJan21$Species=="P. raimondii")
boxplotdata<-data.frame(P.cryptantha=pc, P.goudotiana=pc, P.raimondii=pr)


#boxplots for LLL for all three species by RC
f <- ggplot(plantdata,aes(x=time, y=length)) + geom_boxplot() + xlab("Reproductive category") + ylab("Longest leaf length (cm)") + ggtitle("Distribution of leaf lengths by reproductive category and species")+facet_wrap(plantdata$species) + theme_stata()
plot(f)

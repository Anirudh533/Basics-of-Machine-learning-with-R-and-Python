View(Book1)
Runs <- c(30,40,25,30,12,15,20,35,39)
Age <- c(30,24,25,26,27,22,23,29,35)
Runs_after_10_overs <- c(50,55,69,73,75,89,78,90,100)
Reg <- lm(Runs~Age)
summary(Reg)
plot(Runs,Age)

#Case 2:
View(Book1)
Runs <- c(30,40,25,30,12,15,20,35,39)
Age <- c(30,24,25,26,27,22,23,29,35)
Runs_after_10_overs <- c(50,55,69,73,75,89,78,90,100)
Regr <- lm(Runs~Runs_after_10_overs)
summary(Regr)
View(Regr)
plot(Regr)
plot(Runs,Runs_after_10_overs)


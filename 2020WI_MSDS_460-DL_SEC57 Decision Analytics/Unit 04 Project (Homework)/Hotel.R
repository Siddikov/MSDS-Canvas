# Alisher Siddikov
# 25 points 


# There are a number of options in R and Python, 
# you need to be able to generate the random distributions (rbinom in R, or numpy.random.binomial in Python), and then go from there.

library(data.table)
set.seed(1234)

rent <- 150
cost <- 30
overbookCost <- 200
minRoom <- 100
maxRoom <- 108
capacity <- 100
noShow <- 0.95 #5%

# Find 10 random values from a sample of 100 with probability of 0.95.
rbinom(n = 10, size = 100, prob = 0.95)

simulation <- data.table(Reservations = rbinom(n = 1000, size = 110, prob = 0.95))
simulation$Booked <- ifelse(simulation$Reservations < 100, simulation$Reservations, 100)
simulation$Overbooked <- ifelse(simulation$Reservations > 100, simulation$Reservations - 100, 0)
simulation$Revenue <- rent * simulation$Booked 
simulation$Cost <- cost * simulation$Booked 
simulation$OverbookedCost <- overbookCost * simulation$Overbooked
simulation$Profit <- (simulation$Revenue - simulation$Cost - simulation$OverbookedCost) 
simulation

library(dplyr)
simulation %>%
  group_by(Reservations) %>%
  summarise(count = n(), average = mean(Profit))

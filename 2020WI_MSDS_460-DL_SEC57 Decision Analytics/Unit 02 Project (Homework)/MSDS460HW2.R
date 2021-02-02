library (lpSolve)

# I'm looking for 25 bonus points
# Created by Alisher Siddikov

#######################
# problem part 1
# maximize students
#######################

## Objective: AS_TX +	AS_CA +	AS_DC +	AS_NY +	COL_TX + COL_CA + COL_DC + COL_NY

## Constraints:
## AS_TX +	AS_CA +	AS_DC +	AS_NY >= 1000
## COL_TX + COL_CA + COL_DC + COL_NY >= 1400
## AS_TX <= 750
## AS_CA <= 650
## AS_DC <= 300
## AS_NY <= 800
## COL_TX <= 750
## COL_CA <= 650
## COL_DC <= 300
## COL_NY <= 800
## 


# defining parameters

obj.fun <- c(1, 1, 1, 1, 1, 1, 1, 1)
constr <- matrix (c(1, 1, 1, 1, 0, 0, 0, 0,
                    0, 0, 0, 0, 1, 1, 1, 1,
                    1, 0, 0, 0, 1, 0, 0, 0,
                    0, 1, 0, 0, 0, 1, 0, 0,
                    0, 0, 1, 0, 0, 0, 1, 0,
                    0, 0, 0, 1, 0, 0, 0, 1), ncol = 8, byrow =TRUE)
constr

constr.dir <- c(">=", ">=", "<=", "<=", "<=", "<=")
rhs <- c(1000, 1400, 750, 650, 300, 800)

# solving model
prod.sol <- lp(direction = "max", obj.fun, constr, constr.dir, rhs, compute.sens = TRUE)

# answers
prod.sol # objective function
prod.sol$solution # maximized numbers

#######################
# problem part 2
# minimize cost
#######################

obj.fun2 <- c(3000, 2500, 5000, 4000, 4500, 4000, 1500, 2000)

# solving model
prod.sol2 <- lp(direction = "min", obj.fun2, constr, constr.dir, rhs, compute.sens = TRUE)

# answers
prod.sol2 # objective function
prod.sol2$solution # minimized numbers

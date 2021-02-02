library (lpSolve)

# problem

## t = number of tables; c = number of chairs
## maximize total profit

## Objective: $7t + $5c

## Constrains:
## 3t + 4c <= 2400
## 2t + 1c <= 1000
## 1t + 0c >= 100 
## 0t + 1c <= 450


# defining parameters

obj.fun <- c(7, 5)
constr <- matrix (c(3, 4, 2, 1, 1, 0, 0, 1), ncol = 2, byrow =TRUE)
constr

constr.dir <- c("<=", "<=", ">=", "<=")
rhs <- c(2400, 1000, 100, 450)

# solving model
prod.sol <- lp(direction = "max", obj.fun, constr, constr.dir, rhs, compute.sens = TRUE)

# answers
prod.sol #total profit
prod.sol$solution # number of tables and chares should be produced to max profit



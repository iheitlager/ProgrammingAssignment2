# Calculating a random matrix and calculate the Inverse

# Matrix inverse AB = BA = I_n

# Matrix inversion: https://en.wikipedia.org/wiki/Invertible_matrix
# Matrix calculation: http://r.789695.n4.nabble.com/How-to-create-a-random-matrix-td901667.html
# Matrix inverse: http://www.statmethods.net/advstats/matrix.html

size=10 

A<-matrix(runif(size*size), ncol=size) 

A 
# Generate inverse just out of the box
B <- solve(A)

# This will produce Identity Matrices
I1 <- round(A %*% B)
I2 <- round(B %*% A)
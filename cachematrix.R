# This file contains an example of how to use the <<- operator. 
# The example is new datatype that caches the calculated inverse of a matrix
# in the datatype itself. It has two functions:
# 1. makeCacheMatrix: generate a new cacheable matrix type out of a regular matrix
# 2. solveMatrix: generate inverse of matrix based on solve, taking cached result if already calculated
# example:
# > size=10 
# > A<-matrix(runif(size*size), ncol=size) 
# > a <- makeCacheMatrix(A)
# > a$getinverse()  # check if inverse is emptye
# NULL
# > cacheSolve(a)
# > B<-matrix(runif(size*size), ncol=size) 
# > b <- makeCacheMatrix(B)
# > cacheSolve(b)
# Validate that a, b are not identical (therefore different)
# > sum(a$get() != b$get()) >= 0
# [1] TRUE
# > sum(a$getinverse() != b$getinverse()) >= 0
# [1] TRUE


# This function creates a special type of matrix which is able to cache
# an inverse next to the matrix itself, as a new datatype
# it binds 4 functions to the datatype and two internal variables i and x.
makeCacheMatrix <- function(x = matrix()) {
  # reset internal variables x (!) and i 
  i <- NULL
  set <- function(y) {
    #  set the matrix value to internal var x (and reset the inverse)
    x <<- y
    i <<- NULL
  }
  get <- function() x # get the matrix value from internal var x
  setinverse <- function(inverse) i <<- inverse # set the inverse i (next to the matrix value)
  getinverse <- function() i # get the inverse i (cached next to the matrix value)
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse) # bind four functions to this datatype
}


# This functions generates the Inverse of a matrix of our cacheable matrix type
# it inverse was already calculated it returns the cached result, thereby 
# saving cpu cycles. else calculate and store it. 
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i) # it was cached, so do nothing, just return value
  }
  # it is not yet calculated and cached
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i) # cache 
  i # and return inverse
}

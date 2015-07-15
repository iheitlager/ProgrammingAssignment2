# Caching the Mean of a Vector
# Taken from https://class.coursera.org/rprog-030, assignment 2
# In this example we introduce the <<- operator which can be 
# used to assign a value to an object in an environment that is 
# different from the current environment. 

# Also some additioanl example from 
# https://github.com/DanieleP/PA2-clarifying_instructions

makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

##function plusFunctions stores two functions:
## plustwo() : sums 2 to the given value
## plusthree() : sums 3 to the given value
plusFunctions <- function (){
  plustwo <- function(y) {
    x <- y + 2
    return(x)
  }
  plusthree <- function(y) {
    x <- y + 3
    return(x)
  }
  #the following line stores the two functions:
  list(plustwo = plustwo, plusthree = plusthree) 
}
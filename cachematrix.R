## For costly computations,it is better to cache the data and return results before doing the same caculations multiple times.
#These 2 functions explains how it can be done in R for calculating inverse of a matrix.

## This function caches the result of a matrix in the environment using <<--.
##it stores all matrix information in  a  list.It has set and get functions for the matrix and invers matrix.

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
  set <- function(y)
  {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


## THis function looks into the cache and see if the inverse of matrix is already available for the input . If it is there, it returns the result from cache 
##else calculates the result.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  
  m
}

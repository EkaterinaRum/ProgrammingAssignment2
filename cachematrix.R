## This is an R function that is able to cache potentially time-consuming computations

 makeCacheMatrix <- function(x = matrix()) {
## This function creates a special "matrix" object that can cache its inverse
   inv <- NULL
 set <- function(y) {
 x <<- y  
 inv <<- NULL  
 }
     get <- function() x 
 setinverse <- function(inverse) inv <<- inverse
 getinverse <- function() inv
 list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
 }

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.

## Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
        inv <- x$getinverse()
  if(!is.null(inv)) {
  message("getting cached data")
 return(inv)
  }
 data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
  }
       
}

##  Assignment cachmatrix.R

##  The first function, `makeCacheMatrix` creates a special "matrix", which is
##  really a list containing a function to

#1.  set the value of the matrix
#2.  get the value of the matrix
#3.  set the value of the inverse of the matrix
#4.  get the value of the inverse of the matrix
#


makeCacheMatrix <- function(x = matrix()) {    # Reads in the matrix and 
          inv <- NULL                          # Initializes the inv to NULL
          set <- function(y) {                 # Sets the matrix
                x <<- y
                inv <<- NULL
          }
          get <- function() x                  # Gets the matrix
          setinverse <- function(inverse) inv <<- inverse  # Sets the inverse of the matrix
          getinverse <- function() inv                     # Gets the inverse of the matrix
          list(set = set, get = get,           # Returns a list of the matrix functions
                setinverse = setinverse,
                getinverse = getinverse)
}



##  The following  script checks to see if an inverse matrix has been calculated
##  if not it calculates the inverse matrix.


cacheSolve <- function(x, ...) {
    inv <- x$getinverse()               # Checking the list for the inverse matrix.
    if(!is.null(inv)) {
      message("getting cached data")    # Retrieving and displaying the cached inverse matrix.
      return(inv)
    }
     data <- x$get()                      
     inv <- solve(data, ...)            # Solving for the invers matrix.
     message("solving for inverse")
    x$setinverse(inv)                   # Caching and displaying the inverse matrix.
    inv                                 # Return a matrix that is the inverse of 'x'

}

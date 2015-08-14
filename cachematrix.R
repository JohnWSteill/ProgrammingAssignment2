# This suite of functions serve to store, or cache, a matrix inverse.
#
# The first funtion, makeCacheMatrix, returns a list of 4 functions, set, get, 
# setInverse and getInverse. It actually functions a bit like a class: there are 
# two member variables, x and x_inv. When the function is first called with a 
# matrix argument, x is initialized to this argument and x_inv is initialized to 
# NULL. set is only used to change the matix, and get exposes x. 

# The other two functions are never meant to be explicitly called, but are there
# for the second function, cacheSolve. which checks x_inv is not Null, and
# calculates it if it is. 

# If the reader wonders:
#    Why are setInverse and getInverse exposed? e.g. 
#         my_matrix = makeCacheMatrix(diag(3))
#         my_matrix$setInverse("Peanuts") # Works fine
#    Why isn't cacheSolve a subfunction in makeCacheMatrix?
#    Why the name makeCacheMatrix, given that it does other things?
#
# The author agrees with you, and hoped your experience with this API wasn't as
# initially as confsuing as mine.


makeCacheMatrix <- function(x = matrix()) {
  # NULL here is a flag value, to show inverse not yet calculated
  x_inv <- NULL  
  set <- function(y) {
    x <<- y # changing member variable x, in parent frame, hence '<<-'
    x_inv <<- NULL #changed x, so throw away old inverse
  }
  get <- function() x
  setInverse <- function(calculatedInverse) {
    x_inv <<- calculatedInverse
  }
  getInverse <- function() x_inv
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x', calculates only if not
  ## Previously calculated
  ## Here x_inv is a local variable, not to be confused with x's x_inv.
  x_inv <- x$getInverse()
  # if we ever change NULL flag, this check needs to be rewritten. Probably better
  # to use a global constant FLAG_FOR_UNCOMPUTED_INVERSE, so we'd only need to 
  # change one line.
  if(!is.null(x_inv)) {  
    message("getting cached data")
    return(x_inv)
  }
  x_inv <- solve(x$get()) 
  x$setInverse(x_inv)
  x_inv
}


## [This script cache the inverse of a matrix.]


## The function creates a special "matrix" 
## object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  m<- NULL
  set<- function(y){
    x<<-y
    m<<-NULL
  }
  get<- function() x
  setinverse<- function(inv)m<<- inv
  getinverse<- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## This fucntion computes the inverse of the matrix 
## or retrieving the inverse from cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m<- x$getinverse()
  if(!is.null(m)){
    message("getting cached data")
    return (m)
    }
  data<-x$get()
  m<-solve(data,...)
  x$setinverse(m)
  m
}

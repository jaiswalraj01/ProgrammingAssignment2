## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Function that creates special "matrix" bject that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  inver<-NULL        ## Asign NULL values to inver vector        
  set<-function(y){  
    x<<-y
    inver<<-NULL  ## Use assignment operator
  }
  get<-function()x
  setInverse<-function(solveMatrix) inver<<-solveMatrix
  getInverse<-function()inver
  list(set=set,get=get, setInverse=setInverse,getInverse=getInverse) ## New Object by returning a list()
}


## Write a short comment describing this function
## Function computes the inverse of matrix returned by makeCacheMatrix
## It first checks to see if the inverse of the matrix has already been calculated
## If so, it gets the inverse from the cache and skip the computation.
## Otherwise, it calculates the inverse of the data and sets the inverse matrix in the 
## cache by using setInverse function.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inver<-x$getInverse()       
  if(!is.null(inver)){            
    message("getting data")
    return(inver)
  }
  data<=x$get()
  inver<-solve(data)
  x$setInverse(inver)
  inver
}


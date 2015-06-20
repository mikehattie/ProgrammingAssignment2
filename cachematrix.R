## Matrix inversion is usually a costly computation and there may be some 
## benefit to caching the inverse of a matrix rather than computing it 
## repeatedly.  Following is a pair of functions that calculate and then 
## cache the inverse of a matrix.

## makeCacheMatrix is a function to 
## 1) set the value of the matrix
## 2) get the value of the matrix
## 3) set the inverse of the matrix
## 4) get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- funtion(y){
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

## cacheSolve is a function to recalculate the inverse of the matrix
## using the cached inverse from the previous function instead of 
## recalculating the entire matrix.  If the matrix has not changed
## then it will return the inverse from the cache.

cacheSolve <- function(x, ...) {
        m <-x$getinverse()
        if(!is.NULL(m)){
                message("getting cached data")
                return(m)      
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        return(m)
}

Why, when and how of writing your own R functions
================
Emily Armbruster

# Background:

##### R functions combine a set of commands so that they can be used repeatedly as a convenient unit of code. Some functions are built into basic R, but you can also build your own. Here, we will practice building our own function and discuss tips and techniques for troubleshooting and polishing functions.

# Section 1: Improving code analysis with functions

##### The main steps of converting a chunk of code into a function include 1) making sure code works, 2) simplifying code to working snipet 3) reduce calculation duplication 4) transfer streamlined code into useful function.

##### Here’s the code we will convert into a function:

df \<- data.frame(a=1:10, b=seq(200,400,length=10),c=11:20,d=NA)

df\(a <- (df\)a - min(df\(a)) / (max(df\)a) - min(df$a))

df\(b <- (df\)b - min(df\(a)) / (max(df\)b) - min(df$b))

df\(c <- (df\)c - min(df\(c)) / (max(df\)c) - min(df$c))

df\(d <- (df\)d - min(df\(d)) / (max(df\)a) -
min(df$d))

##### We can improve this code by identifying the main activities that we will use to construct our function.

##### 1\) Make sure code works/does not have errors

``` r
df <- data.frame(a=1:10, b=seq(200,400,length=10),c=11:20,d=NA)

df$a <- (df$a - min(df$a)) / (max(df$a) - min(df$a))

df$b <- (df$b - min(df$a)) / (max(df$b) - min(df$b))

df$c <- (df$c - min(df$c)) / (max(df$c) - min(df$c))

df$d <- (df$d - min(df$d)) / (max(df$a) - min(df$d)) 
```

##### The code runs, but notice that there are some typos\!

``` r
df <- data.frame(a=1:10, b=seq(200,400,length=10),c=11:20,d=NA)

df$a <- (df$a - min(df$a)) / (max(df$a) - min(df$a))

df$b <- (df$b - min(df$b)) / (max(df$b) - min(df$b))

df$c <- (df$c - min(df$c)) / (max(df$c) - min(df$c))

df$d <- (df$d - min(df$d)) / (max(df$d) - min(df$d)) 
```

##### 2\) Turn the code into a working snipet:

``` r
library(bio3d)

s1 <- read.pdb("4AKE") # kinase with drug
```

    ##   Note: Accessing on-line PDB file

``` r
s2 <- read.pdb("1AKE") # kinase no drug
```

    ##   Note: Accessing on-line PDB file
    ##    PDB has ALT records, taking A only, rm.alt=TRUE

``` r
s3 <- read.pdb("1E4Y") # kinase with drug
```

    ##   Note: Accessing on-line PDB file

``` r
s1.chainA <- trim.pdb(s1, chain="A", elety="CA")
s2.chainA <- trim.pdb(s2, chain="A", elety="CA")
s3.chainA <- trim.pdb(s1, chain="A", elety="CA")

s1.b <- s1.chainA$atom$b
s2.b <- s2.chainA$atom$b
s3.b <- s3.chainA$atom$b

plotb3(s1.b, sse=s1.chainA, typ="l", ylab="Bfactor")
```

![](Why,-when-and-how-of-writing-your-own-functions_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

``` r
plotb3(s2.b, sse=s2.chainA, typ="l", ylab="Bfactor")
```

![](Why,-when-and-how-of-writing-your-own-functions_files/figure-gfm/unnamed-chunk-3-2.png)<!-- -->

``` r
plotb3(s3.b, sse=s3.chainA, typ="l", ylab="Bfactor")
```

![](Why,-when-and-how-of-writing-your-own-functions_files/figure-gfm/unnamed-chunk-3-3.png)<!-- -->

##### 3\) reduce calculation duplication

``` r
library(bio3d)

s1 <- read.pdb("4AKE") # kinase with drug
```

    ##   Note: Accessing on-line PDB file

    ## Warning in get.pdb(file, path = tempdir(), verbose = FALSE): /var/folders/
    ## 0k/c69wd_h96lg_gjkpnzcgzywr0000gn/T//Rtmpx0WSoj/4AKE.pdb exists. Skipping
    ## download

``` r
s1.chainA <- trim.pdb(s1, chain="A", elety="CA")

s1.b <- s1.chainA$atom$b

plotb3(s1.b, sse=s1.chainA, typ="l", ylab="Bfactor")
```

![](Why,-when-and-how-of-writing-your-own-functions_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->
\#\#\#\#\# 4) transfer streamlined code into useful function named
“protein\_plot”.

``` r
protein_plot <- function(x) {
  read.pdb(x)
  s1.chainA <- trim.pdb(s1, chain="A", elety="CA")
  s1.b <- s1.chainA$atom$b
  plotb3(s1.b, sse=s1.chainA, typ="l", ylab="Bfactor") }

protein_plot("4AKE")
```

    ##   Note: Accessing on-line PDB file

    ## Warning in get.pdb(file, path = tempdir(), verbose = FALSE): /var/folders/
    ## 0k/c69wd_h96lg_gjkpnzcgzywr0000gn/T//Rtmpx0WSoj/4AKE.pdb exists. Skipping
    ## download

![](Why,-when-and-how-of-writing-your-own-functions_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

# Section 2: Writing and calling a function

##### Functions require 1) a name, 2) at least 1 argument (although this is not required), and 3) a body of code. It probably should return some object, but does not have to.

``` r
name.of.function <- function(argument1, argument2) {
 body
 return(something)
}
```

##### Arguments can be any kind of object (vector, matrix, scalar, logical, etc). Here is an example of a very simple function that squares its input argument:

``` r
square.it <- function(x) {
 square <- x * x
 return(square)
}

square.it(4)
```

    ## [1] 16

``` r
square.it(FALSE)
```

    ## [1] 0

##### This function can be used on logicals and numerics, whether in a matrix or vector. But it will throw an error if the argument is a string.

##### Local vs global environment: You do not necessarily need to use the return() function at the end of your function. The reason to do so, however, is to save the value you roduce in the local environment.

\#Section 3: Getting more complex \#\#\#\#\# You can use multiple
arguments in one function and you can also use functions within other
functions. R will evaulate arguments in the order you write them.

``` r
my.fun <- function(X.matrix, y.vec, z.scalar) {
 # use my previous function square.it() and save result
 sq.scalar <- square.it(z.scalar)
 # multiply the matrix by the vector using %*% operator
 mult <- X.matrix %*% y.vec
 # multiply the resulting objects together to get a final ans
 final <- mult * sq.scalar
 # return the result
 return(final)
}
```

``` r
# save a matrix and a vector object
my.mat <- cbind(c(1, 3, 4), c(5, 4, 3))
my.vec <- c(4, 3)
# pass my.mat and my.vec into the my.fun function
my.fun(X.matrix = my.mat, y.vec = my.vec, z.scalar = 9)
```

    ##      [,1]
    ## [1,] 1539
    ## [2,] 1944
    ## [3,] 2025

``` r
## [,1]
## [1,] 1539
```

##### You can also use the list() function to have R return a list of objects.

``` r
another.fun <- function(sq.matrix, vector) {
 # transpose matrix and square the vector
 step1 <- t(sq.matrix)
 step2 <- vector * vector
 # save both results in a list and return
 final <- list(step1, step2)
 return(final)
}

outcome <- another.fun(sq.matrix = cbind(c(1, 2), c(3, 4)),
vector = c(2, 3))

outcome
```

    ## [[1]]
    ##      [,1] [,2]
    ## [1,]    1    2
    ## [2,]    3    4
    ## 
    ## [[2]]
    ## [1] 4 9

# Section 4: Tricks for troubleshooting and debugging

##### Conveniently, R will throw an error and stop running code when it hits a bug.

##### Debug tip 1: You can use the debug() function to find out where the error is occuring. Put the name of your function into debug() and then run the function.

##### Debug tip 2: Print out your function.

##### Debug tip 3: Use the stop() and stopifnot() functions to write your own error messages for your original functions.

# Section 5: Good function writing practices

##### 1\. Keep functions short so they are manageable to run, debug and update.

##### 2\. Add comments on the inputs of a function, what it does and what it returns so you remember how it works.

##### 3\. Make sure to check that your function works throughout development by using simple example inputs. Remember to print out the results and use error messages.
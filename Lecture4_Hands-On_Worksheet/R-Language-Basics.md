R Language Basics
================
Emily Armbruster

# Section 1: Background

##### This hands-on assignment demonstrates the basics of using R language to do calculations, call functions, and assign variables and explore vectors and data types.

# Section 2: Learning how to conduct simple calculations

##### Open a new R chunk and type in the problem directly, then hit “run”

##### Adding

``` r
5 + 3
```

    ## [1] 8

##### Subtracting

``` r
5 - 3
```

    ## [1] 2

##### Multiplying

``` r
5*3
```

    ## [1] 15

##### Dividing

``` r
5/3
```

    ## [1] 1.666667

# Section 3: Object Assignment

##### You can assign an object to a variable with the “\<-” arrow

``` r
x <- 3 * 4
```

##### Notes: Object names cannot start with digits or contain characters like commas or spaces. Also be careful about typing\! R will only recognize the exact notation you give objects - including capitalziation.

# Section 4: Calling Functions

##### Let’s practice calling the seq() function, which creates a regular sequence of numbers depending on the parameters you provide.

``` r
seq(1,10)
```

    ##  [1]  1  2  3  4  5  6  7  8  9 10

##### 1 and 10 are the arguments of this function. We can use the help function to determine what each argument of a function tells R to do. One way to reach the help page for a function is to type its name into the console, preceded by a question mark: “?seq”. You can also use the help() function.

##### The help tab for seq() tells us that the first argument is the number the sequence starts at and the second argument is the last value in the sequence. Additionally, the third argument (“by”) tells the size of steps between elements in the sequence.

``` r
seq(1,10, 2)
```

    ## [1] 1 3 5 7 9

##### To further explore the outcomes of various arguments in a function, use the example() function, which runs the examples from the documentation of the function you want to investigate:

``` r
example(seq)
```

    ## 
    ## seq> seq(0, 1, length.out = 11)
    ##  [1] 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0
    ## 
    ## seq> seq(stats::rnorm(20)) # effectively 'along'
    ##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
    ## 
    ## seq> seq(1, 9, by = 2)     # matches 'end'
    ## [1] 1 3 5 7 9
    ## 
    ## seq> seq(1, 9, by = pi)    # stays below 'end'
    ## [1] 1.000000 4.141593 7.283185
    ## 
    ## seq> seq(1, 6, by = 3)
    ## [1] 1 4
    ## 
    ## seq> seq(1.575, 5.125, by = 0.05)
    ##  [1] 1.575 1.625 1.675 1.725 1.775 1.825 1.875 1.925 1.975 2.025 2.075
    ## [12] 2.125 2.175 2.225 2.275 2.325 2.375 2.425 2.475 2.525 2.575 2.625
    ## [23] 2.675 2.725 2.775 2.825 2.875 2.925 2.975 3.025 3.075 3.125 3.175
    ## [34] 3.225 3.275 3.325 3.375 3.425 3.475 3.525 3.575 3.625 3.675 3.725
    ## [45] 3.775 3.825 3.875 3.925 3.975 4.025 4.075 4.125 4.175 4.225 4.275
    ## [56] 4.325 4.375 4.425 4.475 4.525 4.575 4.625 4.675 4.725 4.775 4.825
    ## [67] 4.875 4.925 4.975 5.025 5.075 5.125
    ## 
    ## seq> seq(17) # same as 1:17, or even better seq_len(17)
    ##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17

##### Not all functions require arguments, however. One example is the date() function, which simply prints the date:

``` r
date()
```

    ## [1] "Thu Nov  7 21:10:34 2019"

# Section 5: Getting Help in R

##### We have already discussed the use of the help() function and ?my\_function notation to find the details about a function we are already aware of. However, there are other ways to find new functions to accomplish our tasks: the help.search() function and the use of ??my\_function short-cut. The argument for the help.search() function is a string of the kind of activity you are hoping to find a function for. This will pull up search results in the “Help” tab.

# Section 6: Vectors and Indices

##### A vector is a one dimentional group of data. We can create a vector called “x” with the "combine function: c(). Type the name of the vector to print it.

``` r
x <- c(56, 95.3, 0.4)
x
```

    ## [1] 56.0 95.3  0.4

``` r
y <- c(3.2, 1.1, 0.2)
y
```

    ## [1] 3.2 1.1 0.2

##### Vectorization is the process of applying a function across a vector by each element. For example, when adding vectors, the first element of vector 1 will be added to the first element of vector 2 and so on.

``` r
x + y
```

    ## [1] 59.2 96.4  0.6

``` r
x - y
```

    ## [1] 52.8 94.2  0.2

``` r
x/y
```

    ## [1] 17.50000 86.63636  2.00000

##### R math functions like sqrt(), round() and log() are also vectorized. Vectorization is easier to read and often computationally faster than looping.

##### Indexing allows one to access specific vector elements. Each element in a vector has an index - an integer that indicates where the element is in the vector. In R the first element of a vector corresponds to index 1. If we wanted to access the second element in vector “x”…

``` r
x[2]
```

    ## [1] 95.3

##### However, trying to access a non-existent element in a vector will resturn a “not available” or missing value.

``` r
x[7]
```

    ## [1] NA

##### You can use the index of an element in a vector to modify a specific element in a vector.

``` r
x[1] <- 6
x
```

    ## [1]  6.0 95.3  0.4

# One last note:

##### Because software is always being updated, it is important for reproducibility to be able to recall which versions of R and its packages you used for analysis. Use the sessionInfo() function to record this information.

``` r
sessionInfo()
```

    ## R version 3.6.1 (2019-07-05)
    ## Platform: x86_64-apple-darwin15.6.0 (64-bit)
    ## Running under: macOS Mojave 10.14.6
    ## 
    ## Matrix products: default
    ## BLAS:   /Library/Frameworks/R.framework/Versions/3.6/Resources/lib/libRblas.0.dylib
    ## LAPACK: /Library/Frameworks/R.framework/Versions/3.6/Resources/lib/libRlapack.dylib
    ## 
    ## locale:
    ## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] compiler_3.6.1  magrittr_1.5    tools_3.6.1     htmltools_0.4.0
    ##  [5] yaml_2.2.0      Rcpp_1.0.2      stringi_1.4.3   rmarkdown_1.16 
    ##  [9] knitr_1.25      stringr_1.4.0   xfun_0.10       digest_0.6.21  
    ## [13] rlang_0.4.1     evaluate_0.14

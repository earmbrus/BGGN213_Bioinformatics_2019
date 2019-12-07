Practice with R functions
================
Emily Armbruster

# Let’s learn a little more about functions…

##### and practice making another one.

## First, let’s discuss “stops” and “warnings” with the rescale() function, found at the link below:

``` r
source("http://tinyurl.com/rescale-R")
```

##### This command will download functions to the global environment from an online file. Under “functions” in the global environment, double click on ‘rescale’. This will open another window describing the rescale() function. Let’s try it out on some simple data:

``` r
rescale(1:10)
```

    ##  [1] 0.0000000 0.1111111 0.2222222 0.3333333 0.4444444 0.5555556 0.6666667
    ##  [8] 0.7777778 0.8888889 1.0000000

##### Simple enough… However, if you run rescale() on data with a missing value (NA), R will throw an error that says “non-numeric argument to binary operator.”

##### This is an example of a function with a “stop”. We can use a “warning” when we want to warn a user that something might be suspicious or “stop” when the function does not work on the input. You would want to build stops and warnings into the early part of a function body so that R will abort running the program or warn the user early\!

##### It is helpful to write functions were the warning/stop is clear to the user: “rescale2” has an if loop. If x is not numeric, it will stop and tell the user “Input X should be numeric”

# 

##### Now we want to write a function called “both\_na() that counts how many positions in two input vectors, x and y, where both have a missing value (”NA").

##### Start with simple definition of the problem and solve a simple problem first with a short, working snippet of code.

##### A quick Google search helps us find the which() function, which detects the NA items in a vector.

# Lets define an example x and y

``` r
x <- c( 1, 2, NA, 3, NA)
y <- c(NA, 3, NA, 3, 4)

is.na(x)
```

    ## [1] FALSE FALSE  TRUE FALSE  TRUE

``` r
is.na(y)
```

    ## [1]  TRUE FALSE  TRUE FALSE FALSE

##### So far so good…

``` r
which(is.na(x))
```

    ## [1] 3 5

``` r
which(is.na(y))
```

    ## [1] 1 3

##### As we can see, which() tells you the indices of the elements of the vector for which the internal function is true. Now try the and function build a function.

``` r
is.na(x) & is.na(y)
```

    ## [1] FALSE FALSE  TRUE FALSE FALSE

##### This result makes sense because the functions only match in the 3rd position. Now we have our snippet of code. We can put it in our function\!

``` r
both_na <- function(x, y) {
  sum(is.na(x) & is.na(y))
}

both_na(x,y)
```

    ## [1] 1

##### Hooray\! It works\! Don’t forget to give the function an input after you build it to see if it’s working.

# Now let’s test some different inputs… (aka eejit proofing).

##### We want to make sure our function works for all inputs.

##### If you make one input vector n times as long as the others (where n is an integer), you will not get a warning because R will iteratively compare the shorter vector against the longer one.

``` r
y3 <- c(1, NA, NA, NA, NA, NA)

both_na(x,y3)
```

    ## Warning in is.na(x) & is.na(y): longer object length is not a multiple of
    ## shorter object length

    ## [1] 2

##### We can visualize this repeating “recycling” function with a plot:

``` r
plot(1:10, col=c("red", "blue"))
```

![](Practice-with-R-Functions_files/figure-gfm/unnamed-chunk-8-1.png)<!-- -->
\#\#\#\#\# All the same, we might want to add a warning or stop when the
vectors have different lengths.

``` r
both_na2 <- function(x, y) {
  if(length(x) != length(y))
  stop("The vectors are not the same length!", call.=FALSE)
  sum(is.na(x) & is.na(y))
}
```

##### Note, the call.= tells the function not to report which part of the code is causing th error.

# Now let’s build a function to find the overall grade for some homework\!

##### NOTE: You are going to drop the lowest single alignment score.

``` r
# student 1
student1 <- c(100, 100, 100, 100, 100, 100, 100, 90)
# student 2
student2 <- c(100, NA, 90, 90, 90, 90, 97, 80)
```

##### So you want a mean for all but the lowest values.

##### This is how Barry solved it: -which.min removes the minimum value from vector student1

``` r
which.min(student1)
```

    ## [1] 8

``` r
student1[-which.min(student1)]
```

    ## [1] 100 100 100 100 100 100 100

``` r
overall_grade <- function(x) {
  mean(student1[-which.min(student1)])
}

overall_grade(student1)
```

    ## [1] 100

##### But how do you deal with NA - a student is missing a homework\! Function as written ignores NA so that if you have a set of scores “100, NA, NA, NA” the answer will be 100, which is not correct\! You could replace NA with 0… But there’s a variety of answers available.

``` r
overall_grade <- function(x) {
  sum(x[-which.min(x)], na.rm=TRUE) / (length(x) - 1)
}

overall_grade(student2)
```

    ## [1] 79.57143

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

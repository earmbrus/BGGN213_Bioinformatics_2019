Untitled
================
Emily Armbruster

##### First load RCy3, igraph and RColorBrewer

``` r
library(RCy3)
library(igraph)
```

    ## 
    ## Attaching package: 'igraph'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     decompose, spectrum

    ## The following object is masked from 'package:base':
    ## 
    ##     union

``` r
library(RColorBrewer)
```

##### These functions are a convenient way to verify a connection to Cytoscape and for logging the versions of RCy3 and Cytoscape in your scripts.

``` r
# Test the connection to Cytoscape.
cytoscapePing()
```

    ## [1] "You are connected to Cytoscape!"

``` r
# Check the version
cytoscapeVersionInfo()
```

    ##       apiVersion cytoscapeVersion 
    ##             "v1"          "3.7.2"

##### We can test things further by making a small network (here in igraph format as used by the R igraph package) and sending it to Cytoscape:

``` r
g <- makeSimpleIgraph()
createNetworkFromIgraph(g,"myGraph")
```

    ## Loading data...
    ## Applying default style...
    ## Applying preferred layout...

    ## networkSUID 
    ##          80

##### If you turn to your Cytoscape window you should now see a simple 4 vertex and 4 edge network displayed (see below). We can include this Cytoscape rendered network image in our report with the following code:

``` r
fig <- exportImage(filename="demo", type="png", height=350)
```

    ## Warning: This file already exists. A Cytoscape popup 
    ##                 will be generated to confirm overwrite.

``` r
knitr::include_graphics("./demo.png")
```

![](./demo.png)<!-- -->

## Switch Styles

##### Cytoscape provides a number of canned visual styles. The code below explores some of these styles. For example check out the marquee style\!

``` r
setVisualStyle("Marquee")
```

    ##                 message 
    ## "Visual Style applied."

``` r
fig <- exportImage(filename="demo_marquee", type="png", height=350)
```

    ## Warning: This file already exists. A Cytoscape popup 
    ##                 will be generated to confirm overwrite.

``` r
knitr::include_graphics("./demo_marquee.png")
```

![](./demo_marquee.png)<!-- -->

##### You can find out what other styles are available and try a couple:

``` r
styles <- getVisualStyleNames()
styles
```

    ##  [1] "size_rank"            "Directed"             "default"             
    ##  [4] "Sample3"              "BioPAX_SIF"           "Minimal"             
    ##  [7] "Gradient1"            "Marquee"              "Sample1"             
    ## [10] "Nested Network Style" "Universe"             "BioPAX"              
    ## [13] "Curved"               "Ripple"               "Sample2"             
    ## [16] "Solid"                "Big Labels"           "default black"

##### Now we know that out connection between R and Cytoscape is running we can get to work with our real metagenomics data. Our first step is to read our data into R itself.

## Read our metagenomics data

##### We will read in a species co-occurrence matrix that was calculated using Spearman Rank coefficient. (see reference Lima-Mendez et al. (2015) for details).

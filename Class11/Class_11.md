Untitled
================
Emily Armbruster

# What is in the PDB database?

``` r
data <- read.csv("Data_Export_Summary_(PDB).csv")
data
```

    ##   Experimental.Method Proteins Nucleic.Acids Protein.NA.Complex Other
    ## 1               X-Ray   131463          2060               6768     8
    ## 2                 NMR    11241          1304                262     8
    ## 3 Electron Microscopy     2925            32               1004     0
    ## 4               Other      280             4                  6    13
    ## 5        Multi Method      144             5                  2     1
    ##    Total
    ## 1 140299
    ## 2  12815
    ## 3   3961
    ## 4    303
    ## 5    152

##### Download a CSV file from the PDB site (accessible from “Analyze” -\> “PDB Statistics” \>“by Experimental Method and Molecular Type”. Move this CSV file into your RStudio project and determine the percentage of structures solved by X-Ray and Electron Microscopy.

``` r
sum(data$Total)
```

    ## [1] 157530

``` r
ans <- data$Total/sum(data$Total) * 100
names(ans) <- data$Experimental.Method
round(ans, 2)
```

    ##               X-Ray                 NMR Electron Microscopy 
    ##               89.06                8.13                2.51 
    ##               Other        Multi Method 
    ##                0.19                0.10

``` r
ans[1] + ans[3]
```

    ##    X-Ray 
    ## 91.57621

##### The percentage of structures solved by X-Ray and Electron Microscopy is ~91.58%.

##### Can you determine what proportion of structures are protein?

``` r
prop <- (sum(data$Proteins))/sum(data$Total)
prop
```

    ## [1] 0.927144

##### ~92.71% of the structures are proteins.

# Working with biomolecular data in R.

##### Let’s use the bio3d package to read a pdb file in R.

``` r
library(bio3d)
pdb <- read.pdb("1HSG")
```

    ##   Note: Accessing on-line PDB file

``` r
pdb
```

    ## 
    ##  Call:  read.pdb(file = "1HSG")
    ## 
    ##    Total Models#: 1
    ##      Total Atoms#: 1686,  XYZs#: 5058  Chains#: 2  (values: A B)
    ## 
    ##      Protein Atoms#: 1514  (residues/Calpha atoms#: 198)
    ##      Nucleic acid Atoms#: 0  (residues/phosphate atoms#: 0)
    ## 
    ##      Non-protein/nucleic Atoms#: 172  (residues: 128)
    ##      Non-protein/nucleic resid values: [ HOH (127), MK1 (1) ]
    ## 
    ##    Protein sequence:
    ##       PQITLWQRPLVTIKIGGQLKEALLDTGADDTVLEEMSLPGRWKPKMIGGIGGFIKVRQYD
    ##       QILIEICGHKAIGTVLVGPTPVNIIGRNLLTQIGCTLNFPQITLWQRPLVTIKIGGQLKE
    ##       ALLDTGADDTVLEEMSLPGRWKPKMIGGIGGFIKVRQYDQILIEICGHKAIGTVLVGPTP
    ##       VNIIGRNLLTQIGCTLNF
    ## 
    ## + attr: atom, xyz, seqres, helix, sheet,
    ##         calpha, remark, call

##### Access atoms via pdb$atom. This looks similar to when we looked at the pdb file in VMD.

##### This is how you display residue types for specific atops.

``` r
pdb$atom[1,"resid"]
```

    ## [1] "PRO"

##### This is how you change 3 letter code to 1 letter code:

``` r
aa321 (pdb$atom[pdb$calpha, "resid"])
```

    ##   [1] "P" "Q" "I" "T" "L" "W" "Q" "R" "P" "L" "V" "T" "I" "K" "I" "G" "G"
    ##  [18] "Q" "L" "K" "E" "A" "L" "L" "D" "T" "G" "A" "D" "D" "T" "V" "L" "E"
    ##  [35] "E" "M" "S" "L" "P" "G" "R" "W" "K" "P" "K" "M" "I" "G" "G" "I" "G"
    ##  [52] "G" "F" "I" "K" "V" "R" "Q" "Y" "D" "Q" "I" "L" "I" "E" "I" "C" "G"
    ##  [69] "H" "K" "A" "I" "G" "T" "V" "L" "V" "G" "P" "T" "P" "V" "N" "I" "I"
    ##  [86] "G" "R" "N" "L" "L" "T" "Q" "I" "G" "C" "T" "L" "N" "F" "P" "Q" "I"
    ## [103] "T" "L" "W" "Q" "R" "P" "L" "V" "T" "I" "K" "I" "G" "G" "Q" "L" "K"
    ## [120] "E" "A" "L" "L" "D" "T" "G" "A" "D" "D" "T" "V" "L" "E" "E" "M" "S"
    ## [137] "L" "P" "G" "R" "W" "K" "P" "K" "M" "I" "G" "G" "I" "G" "G" "F" "I"
    ## [154] "K" "V" "R" "Q" "Y" "D" "Q" "I" "L" "I" "E" "I" "C" "G" "H" "K" "A"
    ## [171] "I" "G" "T" "V" "L" "V" "G" "P" "T" "P" "V" "N" "I" "I" "G" "R" "N"
    ## [188] "L" "L" "T" "Q" "I" "G" "C" "T" "L" "N" "F"

##### What if you want to return all C-alpha atoms (return their indices)?

``` r
ca.inds <- atom.select(pdb, "calpha")
ca.inds
```

    ## 
    ##  Call:  atom.select.pdb(pdb = pdb, string = "calpha")
    ## 
    ##    Atom Indices#: 198  ($atom)
    ##    XYZ  Indices#: 594  ($xyz)
    ## 
    ## + attr: atom, xyz, call

``` r
atom.select.pdb(pdb, string = "calpha")
```

    ## 
    ##  Call:  atom.select.pdb(pdb = pdb, string = "calpha")
    ## 
    ##    Atom Indices#: 198  ($atom)
    ##    XYZ  Indices#: 594  ($xyz)
    ## 
    ## + attr: atom, xyz, call

##### Use the Bio3D write.pdb() function to write out a protein only PDB file for viewing in VMD. Also write out a second separate PDB file for the ligand with residue name MK1

##### First select “protein” then write out a file: “1hsg\_protein.pdb”

##### “ligand” is the string argument value and setting “value” to TRUE causes it to create pdb file.

``` r
atom.select(pdb, "ligand", value = TRUE)
```

    ## 
    ##  Call:  trim.pdb(pdb = pdb, sele)
    ## 
    ##    Total Models#: 1
    ##      Total Atoms#: 45,  XYZs#: 135  Chains#: 1  (values: B)
    ## 
    ##      Protein Atoms#: 0  (residues/Calpha atoms#: 0)
    ##      Nucleic acid Atoms#: 0  (residues/phosphate atoms#: 0)
    ## 
    ##      Non-protein/nucleic Atoms#: 45  (residues: 1)
    ##      Non-protein/nucleic resid values: [ MK1 (1) ]
    ## 
    ## + attr: atom, helix, sheet, seqres, xyz,
    ##         calpha, call

``` r
prot <- atom.select(pdb, "protein", value = TRUE)
write.pdb(prot, file = "1hsg_protein.pdb")
```

##### Now the same for ligand…

``` r
lig <- atom.select(pdb, "ligand", value = TRUE)
write.pdb(lig, file = "1hsg_protein.pdb")
```

##### Load package “devtools”

Command: install.packages(“devtools”) devtools::install\_bitbucket

``` r
library("bio3d.view")
view(pdb, "overview", col="sse")
```

    ## Computing connectivity from coordinates...

``` r
pdb <- read.pdb("1hel")
```

    ##   Note: Accessing on-line PDB file

# Normal mode analysis calculation:

``` r
modes <- nma(pdb)
```

    ##  Building Hessian...     Done in 0.02 seconds.
    ##  Diagonalizing Hessian...    Done in 0.136 seconds.

``` r
m7 <- mktrj(modes,
 mode=7,
 file="mode_7.pdb")
view(m7, col=vec2color( rmsf(m7) ))
```

    ## Potential all C-alpha atom structure(s) detected: Using calpha.connectivity()

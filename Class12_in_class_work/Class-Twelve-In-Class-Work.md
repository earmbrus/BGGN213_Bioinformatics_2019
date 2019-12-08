Receptor-Based Drug Discovery
================
Emily Armbruster

# We’re going to look at the structure of the HIV protease and drug binding.

##### First, load the Bio3D package and use read.pdb() to pull in the structure with “library(bio3d)”. Do this in the console so we don’t re-load the package every time you knit the R Markdown file. Use “read.pdb” to bring in the “1hsg” pdb file. Then we’re going to create two different pdb files for the ligand and the protein.

##### Assign the structure to the name “hiv”. Get a quick summary of the object by typing in its name.

``` r
library(bio3d)
hiv <- read.pdb("1hsg")
```

    ##   Note: Accessing on-line PDB file

``` r
hiv
```

    ## 
    ##  Call:  read.pdb(file = "1hsg")
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

##### The two non protein resid values are “HOH (127)” and “MK1 (1)”, representing water around the protein and the ligand.

###### Produce a “1hsg\_protein.pdb” and “1hsg\_ligand.pdb” file. Do the ligand first.

``` r
ligand <- atom.select(hiv, "ligand", value = TRUE)
write.pdb(ligand, file = "1hsg_ligand.pdb")
```

##### Then do the protein.

``` r
protein <- atom.select(hiv, "protein", value = TRUE)
write.pdb(protein, file = "1hsg_protein.pdb")
```

##### Format an output file with config.txt.

##### out = all.pdbqt \<- Type of file in output.

##### Inspect docking results. “multi=TRUE” allows us to read the file. View in VMD.

``` r
res <- read.pdb("all.pdbqt", multi=TRUE)
write.pdb(res, "results.pdb")
```

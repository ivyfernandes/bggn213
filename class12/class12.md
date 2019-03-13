Class 12: Structural Bioinformatics
================
Ivy Fernandes
2/20/2019

Clean up our protein target surface
-----------------------------------

``` r
library(bio3d)

pdb.code<-"1hsg" 
#allows for you to only have to change this one area if you want to re-use this for other proteins in the future 

file.name<-get.pdb(pdb.code)
```

    ## Warning in get.pdb(pdb.code): ./1hsg.pdb exists. Skipping download

need to read the structure into R. extract the protein only segment of this PDB entry and write out a new PDB format file.

``` r
hiv<-read.pdb(file.name)
hiv #to get a summary of what is in the file
```

    ## 
    ##  Call:  read.pdb(file = file.name)
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

The summary shows that besides the protein, there is also the ligand (MK1) and water molecules

first extract the protein

``` r
prot<-trim.pdb(hiv,"protein")
prot
```

    ## 
    ##  Call:  trim.pdb(pdb = hiv, "protein")
    ## 
    ##    Total Models#: 1
    ##      Total Atoms#: 1514,  XYZs#: 4542  Chains#: 2  (values: A B)
    ## 
    ##      Protein Atoms#: 1514  (residues/Calpha atoms#: 198)
    ##      Nucleic acid Atoms#: 0  (residues/phosphate atoms#: 0)
    ## 
    ##      Non-protein/nucleic Atoms#: 0  (residues: 0)
    ##      Non-protein/nucleic resid values: [ none ]
    ## 
    ##    Protein sequence:
    ##       PQITLWQRPLVTIKIGGQLKEALLDTGADDTVLEEMSLPGRWKPKMIGGIGGFIKVRQYD
    ##       QILIEICGHKAIGTVLVGPTPVNIIGRNLLTQIGCTLNFPQITLWQRPLVTIKIGGQLKE
    ##       ALLDTGADDTVLEEMSLPGRWKPKMIGGIGGFIKVRQYDQILIEICGHKAIGTVLVGPTP
    ##       VNIIGRNLLTQIGCTLNF
    ## 
    ## + attr: atom, helix, sheet, seqres, xyz,
    ##         calpha, call

``` r
prot.filename<-paste(pdb.code,"_protein.pdb", sep="") #will print out the protein that you inititally serarched for attatched to this new string, must use the sep="" so no spaces are incorporated
write.pdb(prot,prot.filename) #writes the data to a file
```

now do the same for the ligand

``` r
ligand<-trim.pdb(hiv,"ligand")
ligand
```

    ## 
    ##  Call:  trim.pdb(pdb = hiv, "ligand")
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
ligand.filename<-paste(pdb.code,"_ligand.pdb",sep="")
write.pdb(ligand,ligand.filename)
```

Using autodock tools to setup protein docking
---------------------------------------------

PDB files do not include charges and atom types that describe properties, therefore the files for the proteins and the ligands have to be prepared to include these values along with the atomic coordinates

Docking indinavir into HIV-1 protease
-------------------------------------

``` r
library(bio3d)
res <- read.pdb("all.pdbqt", multi=TRUE)
write.pdb(res, "results.pdb")
```

Loaded into VMD

Qualitatively, how good are the docks? Is the crystal binding mode reproduced? Is it the best conformation according to AutoDock Vina?

Quantitatively assess the docking using root mean square distance

``` r
ori <- read.pdb("1hsg_ligand.pdbqt")
rmsd(ori, res)
```

    ##  [1]  0.590 11.163 10.531  4.364 11.040  3.682  5.741  3.864  5.442 10.920
    ## [11]  4.318  6.249 11.084  8.929

Quantitatively how good are the docks? Is the crystal binding mode reproduced within 1Å RMSD for all atoms?

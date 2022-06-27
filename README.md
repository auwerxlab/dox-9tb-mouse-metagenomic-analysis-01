# Dox 9-TB mouse metagenomic analysis 01

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.

© Copyright 2022 Laboratory of Integrative Systems Physiology, EPFL, Switzerland

This is a Renku project, see https://renku.readthedocs.io for details.

This project is based on the following template: https://github.com/auwerxlab/renku-project-template/tree/master/R-renv (deb856b)

**Authors:** Alexis Rapin (alexis.rapin@epfl.ch), Adrienne Mottis (mottisadrienne@gmail.com)

## Description

This R project assesses the impact of two tetracycline (Tet) compounds, Doxycycline (Dox) and 9-TB, on the fecal microbial communities of 8 week-old female BALB/cN mice in a longitudinal manner both before and after infection with Influenza A virus (IFV).

Results were included in: Mottis A, Yang Li T, El Alam G, Rapin A, Katsyuba E, Liaskos D, D’Amico D, Harris NL, Grier MC, Mouchiroud L, Nelson ML, Auwerx J. Tetracycline-induced mitohormesis mediates disease tolerance against influenza. 2022. Accepted for publication in the Journal of Clinical Investigation.

## Background and results

Mitohormesis defines the increase in fitness mediated by adaptive responses to a mild mitochondrial stress. Tetracyclines inhibit not only bacterial but also mitochondrial translation, thus imposing a low level of mitochondrial stress to eukaryotic cells. The mitochondrial stress response induced by Dox and 9-TB improved survival and disease tolerance against lethal IFV infection.

The analysis carried on in this R project shows that while Dox affects the gut bacterial community, 9-TB has no detectable effect on it. This suggests the later compound may be used to induce mitohormesis and improve the response to viral infection while leaving the microbiome unaffected.

## Methods

### General experimental design

<img src="/figs/design.png" alt="Experimental design" width="400"/>

### Tetracycline treatment

Mice were treated with Doxycycline (40 mpkd, IP), 9-TB (1 mpkd, IP) or vehicle (control) daily from day -3 pre Influenza A infection to day 6 post Influenza A infection.

### Influenza A infection

Mice were inoculated intranasally with 175 PFU of the Influenza A virus (strain H1N1 PR8) in PBS.

### Whole metagenome sequencing

DNA was extracted using the MagMAX Microbiome Ultra Nucleic Acid Isolation Kit (Thermo Fisher, Catalog#: A42358) using 100 mg of fecal sample for 800 µL of Lysis Buﬀer. Bead beating was performed for 5 min at 50 Hz. Lysate was centrifuged at 14,000 g for 2 min and 400-500 μL  of supernatant was used in subsequent steps using a KingFisher Flex system (Thermo Fisher) following the manufacturer’s protocol. Extracted DNA quantified using the Qubit dsDNA Assay Kit (Thermo Fisher). Sequencing library was prepared with 100 ng of DNA per sample. Briefly: Shearing was performed on a Covaris LE200 system, end repair, A-tailing, ligation of adaptors and PCR were performed using the KAPA Hyper Prep Kit (Roche, Catalog#: 07962363001) with the following PCR program: 45 min at 98 deg C, 7 cycles including 15 min at 98 deg C, 30 min at 60 deg C and 30 min at 72 deg C, then finally 60 min at 72 deg C and holding 4 deg C until samples retrieval. Library concentration was measured using the Qubit dsDNA Assay Kit (Thermo Fisher) and fragment length was assessed on an Agilent TapeStation. The library was sequenced on a Illumina NovaSeq 6000 platform using paired-end 2x150 bp chemistry. Sequences were deposited on the European nucleotide archive (ENA) and are publicly available under accession number PRJEB52004.

### DNA reads processing and taxonomic classification

Low quality bases and adapters were trimmed. Short reads (length shorter than 35 bp) and low-quality reads were removed. Host sequences were identified by mapping to the host reference genome with [bowtie2](https://doi.org/10.1038/nmeth.1923), then removed. Taxonomy was assigned using the the [Kraken2](https://doi.org/10.1186/s13059-019-1891-0) sequence classifier with an in house developed microbial database including 27,165 reference genomes (spanning 9,471 bacteria, 1,854 fungi, 15,752 viruses, 88 parasites). Genus and species relative abundances in terms of reads per million (rpm) were estimated using [Bracken](https://doi.org/10.7717/peerj-cs.104).

### Data analysis included in this R project

The entire statistical analysis was done within R notebooks located in the ``notebooks/`` directory. Briefly, the species composition of the bacterial communities was assessed using permutational multivariate analysis of variance (perMANOVA) based on the Bray-Curtis dissimilarity and 10,000 permutations. Samples similarities were further assessed using a non-metric multidimensional scaling (NMDS) analysis based on the Bray-Curtis dissimilarity. Bacterial species diversity was assessed in terms of Shannon diversity index (SDI) and richness and compared using Kruskal–Wallis one-way analysis of variance followed by post-hoc Wilcoxon tests with p-value adjusted for multiple comparison using the Holm-Bonferroni method.

## Resources

- Raw whole metagenome sequencing FASTQ reads are available at ENA under accession number PRJEB52004.

## Get this project

You can clone this project from https://sv-renku-git.epfl.ch.
```
$ git clone https://sv-renku-git.epfl.ch/arapin/dox-9tb-mouse-metagenomic-analysis-01.git
```

If it is private, you would need a valid Gitlab token. Contact the authors if needed.
```
$ git clone https://< gitlab_token_name >:< gitlab_token >@sv-renku-git.epfl.ch/arapin/dox-9tb-mouse-metagenomic-analysis-01.git
```

You can also get an **archive** of this project from https://github.com.

```
$ git clone https://github.com/auwerxlab/dox-9tb-mouse-metagenomic-analysis-01.git
```

And from Zenodo: [![DOI](https://www.zenodo.org/badge/486551594.svg)](https://www.zenodo.org/badge/latestdoi/486551594)

## Requirements

- This is a Renku project, see https://renku.readthedocs.io for details
- R version 4.0.0
- renv R package
- See ``renv.lock`` for the complete list of R packages dependencies
- See ``Dockerfile`` for more system requirements
- Data (see below)

## Data

Data and associated metadata are located in the ``data`` directory and include.

### Details

#### Metagenome

- Description: Genus and species relative abundance data estimated with Braken, plus samples metadata.
- Source: Privately available on https://lispnas1.epfl.ch: archive/RAW/DNAseq/amottis_metagenomics_sequenta/report_table/:

```
$ scp arapin@lispsrv1.epfl.ch:archive/RAW/DNAseq/amottis_metagenomics_sequenta/report_table/*.xlsx data/metagenome/
```

- Files:
<pre>
metagenome
├── C22001898LD01-< SampleID >.report_table.xlsx    Table of taxa read counts in XLSX fomat (one file for each sample)
├── IFV_EPFL_20210817_run_samples.txt             Samples metadata table in tab-delimited text format
└── s1886g03001.Metagenomics_Analysis_Report.pdf  Sequencing report, including description of report tables content
</pre>

## Usage

### 1. Open the project in Renku

This is a Renku project and comes with a Dockerfile to build the required environment (see https://renku.readthedocs.io for details).

This project can also be used outside Renku, provided RStudio and dependencies are available (see below).

### 2. Open the project in RStudio

This project is setup to use the R renv package to manage dependencies and to keep required R libraries files on the docker image, instead of within a ``renv/`` directory. This is why there is a symbolic ``renv`` link in the main directory in place of the usual ``renv/`` directory.

To use renv outside Renku, simply remove the ``renv`` symbolic link (e.g. ``$ rm renv``) before openning the project in RStudio or running ``> renv::activate()``.

Open This project in RStudio using the ``.Rproj`` file.

If needed, activate renv using ``> renv::activate()`` and install required R libraries using ``> renv::restore()``.

This project uses git lfs to track large files, see ``.gitattributes`` details and https://git-lfs.github.com/ for usage.

### 3. Run the analysis

Run notebooks in ``notebooks/`` sequencially.

Final figure panels and tables are assembled in the ``notebooks/figure_compilation.Rmd`` notebook.

### 4. Render notebooks and track changes

Render notebooks using ``make``:

```
$ make
render               render all R notebooks located in notebooks/
commit               run git commit with --no-verify option
```

## Structure

<pre>
.
├── data                      Data
├── figs                      Figures
├── notebooks                 R notebooks
└── renv                      renv directory (set as a symbolic link in order to keep R libraries files on the docker image when using Renku) - not included in archive
</pre>

## References

1. Langmead, B., Salzberg, S.L., 2012. Fast gapped-read alignment with Bowtie 2. Nat Methods 9, 357–359. https://doi.org/10.1038/nmeth.1923
2. Wood, D.E., Lu, J., Langmead, B., 2019. Improved metagenomic analysis with Kraken 2. Genome Biology 20, 257. https://doi.org/10.1186/s13059-019-1891-0
3. Lu, J., Breitwieser, F.P., Thielen, P., Salzberg, S.L., 2017. Bracken: estimating species abundance in metagenomics data. PeerJ Comput. Sci. 3, e104. https://doi.org/10.7717/peerj-cs.104

# cFMD

curatedFoodMetagenomicData (cFMD) is a resource that comprehends curated metadata, microbiome profiles, as well as reconstructed genomes from **food (shotgun) metagenomes**. The current version of cFMD (v1.2.1) comprises additional 835 food metagenomes from 26 datasets of recent publicly available studies, along with the 2,533 publicly available and [EU 2020 MASTER project](https://www.master-h2020.eu/index.html) food metagenomes from the initial cFMD release. Overall, cFMD v1.2.1 comprehends 3,368 food metagenomes from 85 food metagenomic datasets. 

<!---**Note: The profiling of the new metaegenomes is done using previous cFMD release databases to remain consistent with the outcomes of old and new metagenomes**---> <!---TO ADD TO THE CHANGE LOG AND ANNOUNCEMENTS, NOT HERE--->

<!---Current release: [![DOI](https://zenodo.org/badge/579006339.svg)](https://zenodo.org/doi/10.5281/zenodo.10567318)---> <!---I DON'T THINK THIS MIRRORING IN ZENODO IS NEEDED ANYMORE, BUT TO DISCUSS--->

Go to [cFMD v1.1.0](https://github.com/SegataLab/cFMD/releases/tag/v1.1.0) for the version associated with Carlino _et al._, "Unexplored microbial diversity from 2,500 food metagenomes and links with the human microbiome", _Cell_, 2024, DOI: [10.1016/j.cell.2024.07.039](https://doi.org/10.1016/j.cell.2024.07.039).

## Data

From this GitHub repository you can access to these cFMD-level files (more details are provided in the section "Detailed description of data" below):
- [**cFMD_datasets**]( ): summary of the datasets included in the current release, with reference to the publication (if available) <!--TO ADD THE LINK WHEN WE HAVE IT-->

- [**cFMD_metadata**]( ): metadata information, in addition to statistics about reconstructed MAGs at sample level. The table has samples as row indices and type of information as column headers. This includes: <!--TO ADD THE LINK WHEN WE HAVE IT-->
  - categorization of the samples,
  - accession codes to retrieve public metagenomes,
  - technical information (e.g. dna extraction kit, sequencer, etc.),
  - basic statistics (number of reads, number of bases, number of MAGs, etc.).
The unique key for querying the database is represented by the dataset_name and sample_id. Food samples were classified according to their composition and production using three levels of detail (category, type and subtype).

- [**cFMD_metadata_rules**](https://github.com/SegataLab/cFMD/blob/main/cFMD_metadata_rules.tsv): description of the syntactic rules to define the metadata fields of the above file "cFMD_metadata"

- [**cFMD_mags_list**]( ): the list of the reconstructed MAGs with information in terms of: <!--TO ADD THE LINK WHEN WE HAVE IT-->
  - sample origin,
  - assigned taxonomy at species-level genome bin (SGB) level,
  - known/unknown status of the SGB,
  - assigned taxonomy according to BUSCO in the case of recently included (v1.2.1) eukaryotic MAGs,
  - basic statistics (number of contigs, N50, completeness, contamination, etc.).
 
<!---- [**cFMD_sgbs_prokaryotic**](https://github.com/SegataLab/cFMD/blob/main/cFMD_sgbs_prokaryotic.tsv): for each prokaryotic food SGB (i.e., having at least one MAG reconstructed from food) information in terms of:
  - taxonomy, known/unknown status of the SGB,
  - level of the assigned taxonomy,
  - SGB statistics (number of included MAGs, number of included reference genomes, etc.).---> <!---NOT TO BE ADDED ANYMORE, ONLY TO BE PRESENT IN THE VERSION ASSOCIATED WITH CELL PAPER--->
 
<!---- [**cFMD_sgbs_eukaryotic**](https://github.com/SegataLab/cFMD/blob/main/cFMD_sgbs_eukaryotic.tsv): as the file "cFMD_sgbs_prokaryotic" but referred to eukaryotic SGBs.---> <!---SAME AS ABOVE--->

Alongside the cFMD-level files mentioned above, we also provide dataset-specific folders with the following dataset-specific files that can be accessed from the **cFMD_data** folder:

- **cFMD_mags**: the reconstructed MAGs in fasta format (hosted externally due to large size; a download script is provided).

  Users can download the mags for dataset(s) using the following script:

  ```
  download_mags.sh {dataset_name}
  ```
  <br/>

- **cFMD_taxonomic_profiles**: taxonomic profiles with samples as row indices and taxa as column headers, with values expressed as taxa relative abundances (%).

- **cFMD_functional_profiles**: functional profiles (normalized UniRef90 gene families, pathway abundances, and pathway coverages) with samples as column headers and row indices as functions (hosted externally due to large size; a download script is provided).

Each dataset folder also includes dataset-specific files for the metadata and list of reconstructed MAGs.
 
## Detailed description of data

More description about the fields for some of the files presented above:
- **cFMD_metadata** (unique key= dataset_name+sample_id)
  - dataset_name: name of dataset. It is formed as i) “first author surname + initial letter of first author name(s) + _ + year of publication”  for public datasets ii) “first author surname + initial letter of first author name(s) + _ + “xxxx” for not already public datasets (among those there are also MASTER partners datasets) iii) “MASTER + WPn + sampling partner + increasing number” for datasets produced inside  MASTER 
  - sample_id: name of the sample
  - macrocategory: highest-level description of the sample type (food, controls, food processing, environment, or animal)
  - category: second highest-level description of the sample type 
  - type: third highest-level description of the sample type 
  - subtype: lowest level of description of the sample type (can be blank if not necessary/available)
  - commercial_name: name of the commercialized product
  - fermented/non-fermented: categorizing samples across and within categories based on fermentation presence
  - country: country of origin of the sample as defined by ISO3 international convention
  - sample_accession: code identificative of the sample if present in public databases
  - run_accession: code identificative of the sequencing run if present in public databases
  - experiment_accession: code identificative of the experiment if present in public databases
  - study_accession: code identificative of the study if present in public databases
  - project_accession: code identificative of the sample if present in public databases
  - database_origin: name of the public database from which the reads of the sample have been downloaded
  - library_layout: layout of the sequencing library (e.g. paired, single )
  - sequencing_platform: sequencer used to read DNA basis
  - DNA_extraction_kit: extraction kit used to isolate DNA in the sample
  - collection_date: day (DD/MM/YYYY) or month (MM-YYYY) or year (YYYY) of sample collection
  - n_of_bases: # of nucleaotides forming the reads of the sample after pre-processing
  - n_of_reads: # of reads of the sample after pre-processing
  - min_read_len: minimum number of basis among the reads of the sample
  - median_read_len: median number of basis among the reads of the sample
  - mean_read_len: mean number of basis among the reads of the sample
  - max_read_len: max number of basis among the reads of the sample
  - n_contigs: # of contigs with length > 1000 bp assembled from the reads of the sample
  - n_MAGs_MQ_prok:	# of prokaryotic MAGs with 50%<=completeness<90% and contamination <5% according to CheckM
  - n_MAGs_HQ_prok:	# of prokaryotic MAGs with completeness >=90% and contamination <5% according to CheckM
  - n_MAGs_MQ_euk:	# of eukaryotic MAGs with 50%<=completeness<90% and contamination <5% according to BUSCO
  - n_MAGs_HQ_euk:	# of eukaryotic MAGs with completeness >=90% and contamination <5% according to BUSCO
  - filtered: food samples with less than 1e08 basis excluded from following analysis
  - curator: name of the curator
 
- **cFMD_mags_list**  (unique key= mag)
  - MAG_id: name of the MAG formed by “${dataset_name}__${sample_id}__bin.${bin_number}”
  - dataset_id: name of the dataset from which the MAG has been reconstructed
  - sample_id: name of the sample from which the MAG has been reconstructed
  - SGB_id:  identification number of the SGB in MetaRefSGB to which the MAG has been assigned
  - unknown: can have three values, kSGB (short for knownSGB, i.e. a cluster containing at least one isolate genome) uSGB (unknownSGB, cluster containing only reconstructed genomes),  or ufSGB (unknownfoodSGB, cluster containing only reconstructed genomes from food samples and hence newly introduced)
  - assigned_taxonomy_level: species if containing at least one reference genome, otherwise lowest taxonomic rank assignable
  - superkingdom: superkingdom of the assigned taxonomy
  - phylum: phylum of the assigned taxonomy
  - class: class of the assigned taxonomy
  - family: family of the assigned taxonomy
  - genus: genus of the assigned taxonomy
  - species: species of the assigned taxonomy
  - genome_size: # of nucleotides (including unknowns specified by N's) in the genome (CheckM)
  - n_contigs: number of contigs within the genome as determined by splitting scaffolds at any position consisting of more than 10 consecutive ambiguous bases (CheckM)
  - N50: N50 statistics as calculated over all contigs (CheckM)
  - completeness: percentage value of the estimated completeness of the  genome as determined from the presence/absence of marker genes and the expected colocalization of these genes (CheckM)
  - contamination: percentage value of the estimated contamination of genome as determined by the presence of multi-copy marker genes and the expected colocalization of these genes  (CheckM)
  - GC_content: percentage of G+C nucleotides with respect to genome length
  - BUSCO_taxonomy: assinged taxonomy according to BUSCO
 
<!---- **cFMD_sgbs_prokaryotic** and **cFMD_sgbs_eukaryotic** (unique key= sgb_id)
  - sgb_id: identification number of the SGB in MetaRefSGB
  - Unknown: can have three values, kSGB (short for knownSGB, i.e. a cluster containing at least one isolate genome) uSGB (unknownSGB, cluster containing only reconstructed genomes),  or ufSGB (unknownfoodSGB, cluster containing only reconstructed genomes from food samples and hence newly introduced)
  - Level of assigned taxonomy: species if containing at least one reference genome, otherwise lowest taxonomic rank assignable
  - Assigned taxonomy: taxonomy assigned to the bin according to the prevalent taxonomy of the reference genomes inside it. Each level is separated by a pipe character “|”
  - superkingdom: superkingdom of the assigned taxonomy
  - phylum: phylum of the assigned taxonomy
  - class: class of the assigned taxonomy
  - family: family of the assigned taxonomy
  - genus: genus of the assigned taxonomy
  - species: species of the assigned taxonomy
  - MAGs: #of reconstructed genomes that are contained in the SGB
  - isolates: #of reference genomes in the bin
  - MAGs_filtered: number of reconstructed genomes discarded by MetaRefSGB (for being too similar to another included MAG) that would be assigned to the SGB
  - Food: # of MAGs in the bin retrieved from food samples
  - Human: # of MAGs in the bin retrieved from human samples
  - Animal: # of MAGs in the bin retrieved from animal samples
  - Other_categories: # of MAGs in the bin retrieved from samples of various origin ( soil, environmental, etc...)
  - NA: # of MAGs in the bin for which metadata about the original samples are not available
  - The number of MAGs for each food category is also reported---> <!---SAME AS ABOVE--->

## Data generation

The data here provided were mainly generated through the following tools:
  - Pre-processing of raw-reads: validated pipeline available [here](https://github.com/SegataLab/preprocessing)
  - Reconstruction and taxonomic assignment of MAGs: assembly-based pipeline available [here](https://github.com/SegataLab/MASTER-WP5-pipelines/tree/master/05-Assembly_pipeline)
  - Taxonomic profiling: MetaPhlAn4-based pipeline, with full tutorial available [here](https://github.com/biobakery/biobakery/wiki/metaphlan4)
  - Strain-level profiling: StrainPhlAn-based pipeline, with full tutorial available [here](https://github.com/biobakery/biobakery/wiki/strainphlan4)
  - Functional profiling: HUMAnN3-based pipeline, with full tutorial available [here](https://github.com/biobakery/biobakery/wiki/humann3)

Further information and requests should be directed to Niccolò Carlino (niccolo.carlino@unitn.it), Hrituraj Dey (hrituraj.dey@unitn.it), Vitor Heidrich (vitor.heidrich@unitn.it), Nicola Segata (nicola.segata@unitn.it), Edoardo Pasolli (edoardo.pasolli@unina.it)

## Publication

Carlino _et al._, "Unexplored microbial diversity from 2,500 food metagenomes and links with the human microbiome", _Cell_, 2024, DOI: [10.1016/j.cell.2024.07.039](https://doi.org/10.1016/j.cell.2024.07.039)

### Acknowledgements

The MASTER EU Consortium was funded by the European Union’s Horizon 2020 research and innovation programme under grant agreement No 818368. This resource was also partially supported by the European Union’s Horizon Europe programme (project DOMINO-101060218).

# cFMD

curatedFoodMetagenomicData (cFMD) is a database that comprehends curated metadata, taxonomic profiles, as well as reconstructed genomes from **food (shotgun) metagenomes** both publicly available and within EU H2020 MASTER (https://www.master-h2020.eu/index.html) generated. The first version of cFMD consists in a total of 2,533 metagenomes associated with 59 datasets: 45 datasets and 583 samples are coming from publicly available studies, and the remaining 14 datasets and 1,950 samples are produced by EU H2020 MASTER partners.

[![DOI](https://zenodo.org/badge/579006339.svg)](https://zenodo.org/doi/10.5281/zenodo.10567318)

## Files

In this GitHub respository you can find 6 files:
- **cFMD_summary_datasets:** summary of the datasets included with reference to the publication (if public)

- **cFMD_sample_metadata_w_mags:** the file contains metadata information in addition to statistics about MAGs reconstruction at the sample level. Table has samples as row indices and type of information as column headers. These includes:
  - categorization of the samples,
  - accession codes to retrieve public metagenomes,
  - technical information (e.g. dna extraction kit, sequencer, …), and 
  - basic statistics (number of basis, reads, contigs, MAGs..).
The unique key for querying the database is represented by the dataset_name and sample_id. Food samples were classified according to their composition and production using three levels of detail (category, type and subtype) using https://link.springer.com/article/10.1007/s00253-022-11909-y as reference to help subdivide fermented foods.

- **cFMD_mags:** all the MAGs reconstructed (generated with pipeline also presented here  https://pubmed.ncbi.nlm.nih.gov/30661755/)  with information of:
  - the sample of origin,
  - the taxonomy of SGB to which has been assigned according to the pipeline of MetaRefSGB,
  - the known/unknown status of the specie, and 
  - basic statistics (number of contigs, N50, completeness, contamination…) calculated using CheckM.

- **cFMD_MetaRefSGB_Mar22_sgbs_w_food_MAGs:** for each SGB to which at least one cFMD MAG has been assigned there are information about:
  - taxonomy, known/unknown status of the species,
  - level of assigned taxonomy of the species, and 
  - statistics of the SGB (number of MAG included, number of reference genomes included, and MAG counts per macrocategory of the genomes included. These could differ from the sum of MAGs+reference genomes for technical reasons). New SGBs, i.e. species newly reconstructed from food samples are marked as uSGB_food.

- **cFMD_taxonomic_profiles_metaphlan4**: matrix resulting from the merge of profiles generated by metaphlan4 (https://www.nature.com/articles/s41587-023-01688-w), where samples and basic metadata are column headers, SGBs are rows indices and the values are relative abundances. These have been generated using as reference the new release of MetaRefSGB Mar22 which is the one containing all the MAGs and SGBs generated and described in points 2) and 3). This table is restricted to non-filtered samples with non-empty taxonomic profiles.

- **cFMD_sample_metadata_template**: metadata column description of the sintactic rules or dictionary used
 
## Detailed description and FAQs
All the tables report the taxonomic analysis at the Specie-level Genome Bins (SGB) precision. SGBs redefine the species concept through re-clustering of both isolates and reconstructed genomes according to their genomic distances. It is a consolidated method to include MAGs in genome references, recognize species sub-clades and characterize microbial dark matter. If you’re not familiar with the concept of SGB  and want to learn more please look at *"Extensive Unexplored Human Microbiome Diversity Revealed by Over 150,000 Genomes from Metagenomes Spanning Age, Geography, and Lifestyle"* by Edoardo Pasolli and colleagues (*Cell*, 2019) https://pubmed.ncbi.nlm.nih.gov/30661755. If you're interested in human microbiome data, please have a look at curatedMetagenomicData (*cMD*, https://github.com/waldronlab/curatedMetagenomicDataCuration/wiki#tutorial) and at the powerful unlocked analysis (https://github.com/waldronlab/curatedMetagenomicDataAnalyses)

Description of the columns included in the shared files:
- **cFMD_sample_metadata_w_mags** (unique key= dataset_name+sample_id)
  - dataset_name: name of dataset. It is formed as i) “first author surname + initial letter of first author name(s) + _ + year of publication”  for public datasets ii) “first author surname + initial letter of first author name(s) + _ + “xxxx” for not already public datasets (among those there are also MASTER partners datasets) iii) “MASTER + WPn + sampling partner + increasing number” for datasets produced inside  MASTER 
  - sample_id: name of the sample
  - macrocategory: highest-level description of the sample type (food, controls, food processing, environment, or animal)
  - category: second highest-level description of the sample type 
  - type: third highest-level description of the sample type 
  - subtype: lowest level of description of the sample type (can be blank if not necessary/available)
  - commercial_name: name of the commercialized product
  - fermented/non-fermented: Dichotomous variable indicating Fermented or Non-Fermented food sample
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
  - n_bases: # of nucleaotides forming the reads of the sample after pre-processing
  - n_reads: # of reads of the sample after pre-processing
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
 
- **cFMD_mags**  (unique key= mag)
  - mag: name of the MAG formed by “${dataset_name}_${sample_id}_bin.${bin_number}”
  - dataset_name: name of the dataset from which the MAG has been reconstructed
  - sample_id: name of the sample from which the MAG has been reconstructed
  - sgb_id:  identification number of the SGB in MetaRefSGB to which the MAG has been assigned
  - Unknown: can have three values, kSGB (short for knownSGB, i.e. a cluster containing at least one isolate genome) uSGB (unknownSGB, cluster containing only reconstructed genomes),  or ufSGB (unknownfoodSGB, cluster containing only reconstructed genomes from food samples and hence newly introduced)
  - Level of assigned taxonomy: species if containing at least one reference genome, otherwise lowest taxonomic rank assignable
  - superkingdom: superkingdom of the assigned taxonomy
  - phylum: phylum of the assigned taxonomy
  - class: class of the assigned taxonomy
  - family: family of the assigned taxonomy
  - genus: genus of the assigned taxonomy
  - species: species of the assigned taxonomy
  - genome_size: # of nucleotides (including unknowns specified by N's) in the genome (ChekM)
  - #contigs: number of contigs within the genome as determined by splitting scaffolds at any position consisting of more than 10 consecutive ambiguous bases (CheckM)
  - N50 (contigs): N50 statistics as calculated over all contigs (CheckM)
  - completeness: percentage value of the estimated completeness of the  genome as determined from the presence/absence of marker genes and the expected colocalization of these genes (CheckM)
  - contamination: percentage value of the estimated contamination of genome as determined by the presence of multi-copy marker genes and the expected colocalization of these genes  (CheckM)
  - GC: percentage of G+C nucleotides with respect to genome length  (CheckM)
  - strain_heterogeneity: estimated strain heterogeneity as determined from the number of multi-copy marker pairs which exceed a specified amino acid identity threshold (default = 90%)  (CheckM)
 
- **cFMD_MetaRefSGB_Mar22_sgbs_w_food_MAGs**  (unique key= sgb_id)
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
  - MAG: #of reconstructed genomes that are contained in the SGB
  - reference_genome: #of reference genomes in the bin
  - filtered: number of reconstructed genomes discarded by MetaRefSGB (for being too similar to another included MAG) that would be assigned to the SGB
  - Food: # of MAGs in the bin retrieved from food samples
  - Human: # of MAGs in the bin retrieved from human samples
  - Animal: # of MAGs in the bin retrieved from animal samples
  - Other_categories: # of MAGs in the bin retrieved from samples of various origin ( soil, environmental, etc...)
  - NA: # of MAGs in the bin for which metadata about the original samples are not available

## Publications

The scientific publication with the main results about cFMD is currently under review.

Currently cFMD release DOI:10.5281/zenodo.10567319

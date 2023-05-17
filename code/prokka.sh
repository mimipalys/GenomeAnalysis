#!/bin/bash -l                                                                             
#SBATCH -A uppmax2023-2-8                                                                  
#SBATCH -M snowy                                                                           
#SBATCH -p core                                                                            
#SBATCH -n 4                                                                               
#SBATCH -t 12:00:00                                                                        
#SBATCH -J prokka_MK                                                                         
#SBATCH --mail-type=ALL                                                                    
#SBATCH --mail-user mkh6163@student.uu.se
                                                                                           
# Load modules                                                                             
module load bioinfo-tools                                                                  
module load prokka

# variables
INPUT=/home/mimipaly/genomeAnalysisProjectMK2/analysis/01_genome_assembly/01_canu/lferriphilum.contigs.fasta
OUTPUT=/home/mimipaly/genomeAnalysisProjectMK2/analysis/01_genome_assembly/04_annotation_prokka

# running prokka
prokka --outdir $OUTPUT --prefix prokka_combined $INPUT

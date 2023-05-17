#!/bin/bash -l                                                                             
#SBATCH -A uppmax2023-2-8                                                                  
#SBATCH -M snowy                                                                           
#SBATCH -p core                                                                            
#SBATCH -n 5                                                                               
#SBATCH -t 12:00:00                                                                        
#SBATCH -J blastn_MK                                                                         
#SBATCH --mail-type=ALL                                                                    
#SBATCH --mail-user muhamed.khatib.6163@student.uu.se
                                                                                           
# Load modules
module load bioinfo-tools
module load blast

# Variables
CANU=/home/mimipaly/genomeAnalysisProjectMK2/analysis/01_genome_assembly/01_canu/lferriphilum.contigs.fasta
ML_04=/home/mimipaly/genomeAnalysisProjectMK2/data/ml_04.fasta
OUTPUT=/home/mimipaly/genomeAnalysisProjectMK2/analysis/01_genome_assembly/05_comparison_blastn

# Creating directory
cd /home/mimipaly/genomeAnalysisProjectMK2/analysis/01_genome_assembly/
mkdir 05_comparison_blastn

# Running blastn
blastn -query $CANU -subject $ML_04 -outfmt 6 -out $OUTPUT/blastn.txt


#!/bin/bash -l                                                                                                                                                                                                                                                              
#SBATCH -A uppmax2023-2-8                                                                                                            
#SBATCH -M snowy                                                                                                                      
#SBATCH -p core                                                                                                                       
#SBATCH -n 4                                                                                                                          
#SBATCH -t 12:00:00                                                                                                                   
#SBATCH -J Canu_MK                                                                                                           
#SBATCH --mail-type=ALL                                                                                                               
#SBATCH --mail-user mkh6163@student.uu.se
                                                                                                                                                                                                                               
# Load modules                                                                                                                        
module load bioinfo-tools                                                                                                             
module load quast  

# variables
INPUT=/home/mimipaly/genomeAnalysisProjectMK2/analysis/01_genome_assembly/01_canu/lferriphilum.contigs.fasta
OUTPUT=/home/mimipaly/genomeAnalysisProjectMK2/analysis/01_genome_assembly/02_evaluation_quast
REF=/home/mimipaly/genomeAnalysisProjectMK2/data/2_Christel_2017/reference/OBMB01.fasta

#run quast
quast.py \
$INPUT \
-R $REF \
-o $OUTPUT \
--gene-finding


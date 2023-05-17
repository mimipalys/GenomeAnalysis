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
module load MUMmer  

# variables
INPUT=/home/mimipaly/genomeAnalysisProjectMK2/analysis/01_genome_assembly/01_canu/lferriphilum.contigs.fasta
OUTPUT=/home/mimipaly/genomeAnalysisProjectMK2/analysis/01_genome_assembly/03_evaluation_mumerplot
REF=/home/mimipaly/genomeAnalysisProjectMK2/data/2_Christel_2017/reference/OBMB01.fasta

# running MUMmer
mummer -mum -b -c \
$REF \
$INPUT \
> $OUTPUT/lferriphilum.mums

# running mummerplot
cd $OUTPUT

mummerplot \
-Q $INPUT \
-R $REF \
$OUTPUT/lferriphilum.mums \
--png --prefix=lferriphilum

gnuplot lferriphilum.gp



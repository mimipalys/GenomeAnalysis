#!/bin/bash -l                                                                                                                                                                                                                                                              
#SBATCH -A uppmax2023-2-8                                                                                                            
#SBATCH -M snowy                                                                                                                      
#SBATCH -p core                                                                                                                       
#SBATCH -n 4                                                                                                                          
#SBATCH -t 12:00:00                                                                                                                   
#SBATCH -J Canu_MK                                                                                                           
#SBATCH --mail-type=ALL                                                                                                               
#SBATCH --mail-user mkh6163@student.uu.se
X                                                                                                                                                                                                                               
# Load modules                                                                                                                        
module load bioinfo-tools                                                                                                             
module load canu    
                                                                                                                                                                                                                                                        
# variables
INPUT=$HOME/genomeAnalysisProjectMK2/data/2_Christel_2017/DNA_raw_data/ERR2028*.fastq.gz
OUTPUT=/home/mimipaly/genomeAnalysisProjectMK2/analysis/01_genome_assembly/01_canu
# running canu
canu \
-p lferriphilum \
-d $OUTPUT \
useGrid=false \
genomeSize=2.4m \
-pacbio $INPUT

# running prokka
prokka \
--outdir $OUTPUT --prefix lferr --locustag LFT \
--genus Leptospirillum --species ferriphilum --strain DSM_14647 --gram neg\
--usegenus --cpus 4 --rfam \
lferriphilum_genome.fasta \

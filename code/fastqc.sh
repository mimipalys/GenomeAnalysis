#!/bin/bash -l                                                                             
#SBATCH -A uppmax2023-2-8                                                                  
#SBATCH -M snowy                                                                           
#SBATCH -p core                                                                            
#SBATCH -n 4                                                                               
#SBATCH -t 12:00:00                                                                        
#SBATCH -J FastQC_MK                                                                         
#SBATCH --mail-type=ALL                                                                    
#SBATCH --mail-user mkh6163@student.uu.se
                                                                                           
# Load modules                                                                             
module load bioinfo-tools                                                                  
module load FastQC

# variables
INPUT=/home/mimipaly/genomeAnalysisProjectMK2/data/2_Christel_2017/RNA_raw_data/*.fastq.gz
OUTPUT=/home/mimipaly/genomeAnalysisProjectMK2/analysis/02_diff_expression/01_qc_fastqc

cd /home/mimipaly/genomeAnalysisProjectMK2/analysis/
mkdir 02_diff_expression
cd 02_diff_expression
mkdir 01_qc_fastqc

# running FastQC
fastqc -t 4 \
-o $OUTPUT \
-d $OUTPUT \
$INPUT

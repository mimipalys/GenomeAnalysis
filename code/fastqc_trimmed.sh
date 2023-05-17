#!/bin/bash -l                                                                             
#SBATCH -A uppmax2023-2-8                                                                  
#SBATCH -M snowy                                                                           
#SBATCH -p core                                                                            
#SBATCH -n 5                                                                               
#SBATCH -t 12:00:00                                                                        
#SBATCH -J FastQC_trimmed_MK                                                                         
#SBATCH --mail-type=ALL                                                                    
#SBATCH --mail-user muhamed.khatib.6163@student.uu.se
                                                                                           
# Load modules
module load bioinfo-tools
module load FastQC

# variables
INPUT=/home/mimipaly/genomeAnalysisProjectMK2/analysis/02_diff_expression/02_trimmomatic/*.fastq.gz
OUTPUT=/home/mimipaly/genomeAnalysisProjectMK2/analysis/02_diff_expression/03_trimmed_qc_fastqc

cd /home/mimipaly/genomeAnalysisProjectMK2/analysis/02_diff_expression
mkdir 03_trimmed_qc_fastqc

# running FastQC
fastqc -t 4 \
-o $OUTPUT \
-d $OUTPUT \
$INPUT

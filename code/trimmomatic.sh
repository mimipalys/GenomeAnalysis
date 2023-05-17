#!/bin/bash -l                                                                             
#SBATCH -A uppmax2023-2-8                                                                  
#SBATCH -M snowy                                                                           
#SBATCH -p core                                                                            
#SBATCH -n 5                                                                               
#SBATCH -t 12:00:00                                                                        
#SBATCH -J trimmomatic_MK                                                                         
#SBATCH --mail-type=ALL                                                                    
#SBATCH --mail-user muhamed.khatib.6163@student.uu.se
                                                                                           
# Load modules
module load bioinfo-tools
module load trimmomatic

# Variables 
INPUT=/home/mimipaly/genomeAnalysisProjectMK2/data/2_Christel_2017/RNA_raw_data
OUTPUT=/home/mimipaly/genomeAnalysisProjectMK2/analysis/02_diff_expression/02_trimmomatic

# Creating a directory 
cd /home/mimipaly/genomeAnalysisProjectMK2/analysis/02_diff_expression
mkdir 02_trimmomatic

# Run trimmomatic
trimmomatic PE -threads 4 -phred33 \
$INPUT/ERR2036629_1.fastq.gz $INPUT/ERR2036629_2.fastq.gz  \
-baseout $OUTPUT/ERR2036629_trimmed_.fastq.gz \
ILLUMINACLIP:$TRIMMOMATIC_HOME/adapters/TruSeq3-PE.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:36 

trimmomatic PE -threads 4 -phred33 \
$INPUT/ERR2036630_1.fastq.gz $INPUT/ERR2036630_2.fastq.gz \
-baseout $OUTPUT/ERR2036630_trimmed_.fastq.gz \
ILLUMINACLIP:$TRIMMOMATIC_HOME/adapters/TruSeq3-PE.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:36 

trimmomatic PE -threads 4 -phred33 \
$INPUT/ERR2036631_1.fastq.gz $INPUT/ERR2036631_2.fastq.gz \
-baseout $OUTPUT/ERR2036631_trimmed_.fastq.gz \
ILLUMINACLIP:$TRIMMOMATIC_HOME/adapters/TruSeq3-PE.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:36 

trimmomatic PE -threads 4 -phred33 \
$INPUT/ERR2036632_1.fastq.gz $INPUT/ERR2036632_2.fastq.gz \
-baseout $OUTPUT/ERR2036632_trimmed_.fastq.gz \
ILLUMINACLIP:$TRIMMOMATIC_HOME/adapters/TruSeq3-PE.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:36 

trimmomatic PE -threads 4 -phred33 \
$INPUT/ERR2036633_1.fastq.gz $INPUT/ERR2036633_2.fastq.gz \
-baseout $OUTPUT/ERR2036633_trimmed_.fastq.gz \
ILLUMINACLIP:$TRIMMOMATIC_HOME/adapters/TruSeq3-PE.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:36 

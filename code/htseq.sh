#!/bin/bash -l                                                                             
#SBATCH -A uppmax2023-2-8                                                                  
#SBATCH -M snowy                                                                           
#SBATCH -p core                                                                            
#SBATCH -n 5                                                                               
#SBATCH -t 12:00:00                                                                        
#SBATCH -J BWA&SAMTOOLS&HTSEQ_MK                                                                         
#SBATCH --mail-type=ALL                                                                    
#SBATCH --mail-user muhamed.khatib.6163@student.uu.se
                                                                                           
# Load modules
module load bioinfo-tools
module load bwa
module load samtools
module load htseq

# Variables
CANU=/home/mimipaly/genomeAnalysisProjectMK2/analysis/01_genome_assembly/01_canu/lferriphilum.contigs.fasta
PROKKA=/home/mimipaly/genomeAnalysisProjectMK2/analysis/01_genome_assembly/04_annotation_prokka/prokka_combined.gff
TRIMMED=/home/mimipaly/genomeAnalysisProjectMK2/analysis/02_diff_expression/02_trimmomatic
OUTPUT=/home/mimipaly/genomeAnalysisProjectMK2/analysis/02_diff_expression/04_HTSeq

# Commands

bwa index $CANU

bwa mem -t 5 $CANU $TRIMMED/ERR2036629_trimmed__1P.fastq.gz $TRIMMED/ERR2036629_trimmed__2P.fastq.gz | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - $PROKKA > $OUTPUT/output_2036629.txt
bwa mem -t 5 $CANU $TRIMMED/ERR2036630_trimmed__1P.fastq.gz $TRIMMED/ERR2036630_trimmed__2P.fastq.gz | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - $PROKKA > $OUTPUT/output_2036630.txt
bwa mem -t 5 $CANU $TRIMMED/ERR2036631_trimmed__1P.fastq.gz $TRIMMED/ERR2036631_trimmed__2P.fastq.gz | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - $PROKKA > $OUTPUT/output_2036631.txt
bwa mem -t 5 $CANU $TRIMMED/ERR2036632_trimmed__1P.fastq.gz $TRIMMED/ERR2036632_trimmed__2P.fastq.gz | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - $PROKKA > $OUTPUT/output_2036632.txt
bwa mem -t 5 $CANU $TRIMMED/ERR2036633_trimmed__1P.fastq.gz $TRIMMED/ERR2036633_trimmed__2P.fastq.gz | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - $PROKKA > $OUTPUT/output_2036633.txt

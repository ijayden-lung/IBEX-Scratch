#!/bin/bash
#SBATCH --job-name=STAR
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --time=4:00:00
#SBATCH --output=log.%J
#SBATCH --mail-user=yongkang.long@kaust.edu.sa
#SBATCH --mail-type=END
#SBATCH --mem=310G

#module load star

dir='/ibex/scratch/longy/cnda/STAR_INDEX/newhg38len75'
if [ ! -d $dir ];then
	mkdir $dir
fi
fa="/home/longy/cnda/ucsc/hg38.fa"
gtf="/home/longy/cnda/gencode/gencode.v38.annotation.gtf"
STAR --runMode genomeGenerate --runThreadN 16 --genomeDir $dir --genomeFastaFiles $fa --sjdbGTFfile $gtf --sjdbOverhang 75

#!/bin/bash
#SBATCH -N 1 #Number of nodes
#SBATCH -n 4 #Number of "tasks"
#SBATCH -o sing_test_%A.out #The %A refers to the slurm job ID, this is useful for distinguishing output files

module purge
module load singularity


singularity exec docker://XSEDE/nix-container-sc-benchmark /usr/local/sc-benchmark/rbenchmark.R && /usr/local/sc-benchmark/scratch-dna-go 1000 1048576 10 /usr/local/sc-benchmark/dna
#singularity test shub://XSEDE/nix-container-sc-benchmark 

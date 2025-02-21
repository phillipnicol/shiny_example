#!/bin/bash
#SBATCH --job-name=my_job           # Job name
#SBATCH --output=logs/glm.log      # Standard output log (%j expands to job ID)
#SBATCH --error=logs/glm_err.err        # Standard error log
#SBATCH --time=01:00:00             # Time limit (hh:mm:ss)
#SBATCH --ntasks=1                  # Number of tasks
#SBATCH --cpus-per-task=16          # Number of CPU cores per task
#SBATCH --mem=8G                   # Memory per node


# Run your program
Rscript parallel_glm.R

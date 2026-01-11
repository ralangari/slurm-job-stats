# Slurm Job Statistics

Interactive Bash script to display Slurm job statistics using accounting data.

Author: **Riman Alangari**  
GitHub: https://github.com/ralangari

## Features
- Number of completed jobs
- Number of running jobs
- Total elapsed runtime
- Interactive CLI menu
- Read-only and safe for production HPC clusters

## Requirements
- Slurm with accounting enabled (`sacct`)
- Bash
- Permission to run `sacct` and `squeue`

## Usage

```bash
chmod +x slurm_job_stats.sh
./slurm_job_stats.sh


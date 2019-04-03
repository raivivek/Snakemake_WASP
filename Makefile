# Makefile
#
# Vivek Rai
# vivekrai@umich.edu
# (c) Parker Lab
#
# 2019-04-03
#

.PHONY = dry_run run

dry_run:
	# --jn: job name
	# -n: dry-run only
	# -r: output reason
	# -p: commands run
	@snakemake -npr \ 
		--jn "snakejob.{jobid}" \
		--snakefile src/Snakefile \
		--configfile config/config.yaml

run:
	# nohup: run in background 
	# -j: maximum number of jobs to put in queue
	#	--keep-going: keep going with independent jobs if some fail
	# --rerun-incomplete: re-run any incomplete rules
	@nohup snakemake \ 
		--jn "snakejob.{jobid}" \
		-j 999 \ 
		--keep-going \
		--rerun-incomplete \
		--snakefile src/Snakefile \
		--configfile config/config.yaml \
		--cluster-config config/cluster.yaml \
		--cluster "sbatch --output {cluster.output} --time {cluster.time} --mem {cluster.mem} --cpus-per-task {cluster.cpus}" \
		> logs/snakemake.log&

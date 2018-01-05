TOP=`pwd`/..
exec_proc=$TOP/quda-build/tests/dslash_test
cmd="$exec_proc --dslash-type clover"
nvprof --csv $cmd
mvprof --query-events
nvprof --query-metrics
nvprof --events inst_executed $cmd
nvprof --metrics all $cmd
nvprof --metrics inst_executed $cmd
nvprof --aggregate-mode-off --source-level-analysis global_access,shared_access,branch,instruction_execution,pc_sampling  $cmd


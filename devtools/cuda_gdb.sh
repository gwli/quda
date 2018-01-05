TOP=`pwd`/..
exec_proc=$TOP/quda-build/tests/dslash_test
cmd="$exec_proc --dslash-type clover"
cuda-gdb  --args $cmd

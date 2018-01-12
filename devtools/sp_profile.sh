TOP=`pwd`/..
exec_proc=$TOP/quda-build/tests/dslash_test
cmd="$exec_proc --dslash-type clover"

sp="/raid/tools/SP/SystemProfiler-linux-public-3.9.3747-52a8955/Target-x86_64/x86_64/sp"

rm -fr ./*.qdstrm
$sp profile --delay=2 --duration=10 -o quda_dslash_test.qdstrm -t cuda,cublas,curand,pthread,cudnn $cmd

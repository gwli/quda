imgtag=nvdevtools/hpc-cuda-8.0:latest
#imgtag=nvdevtools/hpc-cuda-9.1:latest
nvidia-docker run -it --privileged=true --rm  -v /raid/HPC:/raid/HPC  -v /raid/tools:/raid/tools -w `pwd`  $imgtag /bin/bash

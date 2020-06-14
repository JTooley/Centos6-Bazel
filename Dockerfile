FROM centos:6.6

ENV EXTRA_BAZEL_ARGS="--host_javabase=@local_jdk//:jdk"

RUN yum -y install wget which findutils tar gzip zip unzip git zlib-devel; yum clean all
RUN yum -y install java-1.8.0-openjdk-devel; yum clean all
#RUN yum -y install gcc gcc-c++ kernel-devel make; yum clean all
#RUN yum -y install python; yum clean all
RUN yum -y install centos-release-scl-rh
RUN yum -y install devtoolset-7-gcc devtoolset-7-gcc-c++ devtoolset-7-binutils
#RUN yum -y install openjdk-11-jdk python zip unzip

RUN wget https://github.com/bazelbuild/bazel/releases/download/0.26.1/bazel-0.26.1-dist.zip
RUN wget https://github.com/bazelbuild/bazel/releases/download/0.26.1/bazel-0.26.1-dist.zip.sig
#RUN gpg --verify bazel-3.2.0-dist.zip.sig 
RUN unzip -d /tmp/bazel-0.26.1-dist  bazel-0.26.1-dist.zip 
RUN yum clean all
RUN yum -y install python27; yum clean all
RUN echo 'cd /tmp/bazel-0.26.1-dist && bash ./compile.sh && cp output/bazel /usr/local/bin' | scl enable devtoolset-7 python27 bash 

RUN /bin/rm -rf  /tmp/bazel-0.26.1-dist
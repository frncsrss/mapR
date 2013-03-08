Hadoop and R
============

Installation
------------
I thought I would share the steps to have a simple map reduce job called from R up and running since it took me some tweaks to get it working locally on my machine.

First download the packages rmr and rdhfs from https://github.com/RevolutionAnalytics/RHadoop/wiki/Downloads.

Then depending on either you use R directly from command line or from RStudio, you need to export differently 2 environment variables pointing to your Hadoop home folder and your Hadoop executable.

*   From command line, run in the terminal:
<pre><code>
export HADOOP_HOME="path/to/home"
export HADOOP_CMD="${HADOOP_HOME}/bin/hadoop"
</code></pre>

*   From RStudio, append to your ~/.Renviron file the following two lines (basically no export!):
<pre><code>
HADOOP_HOME="path/to/home"
HADOOP_CMD="${HADOOP_HOME}/bin/hadoop"
</code></pre>

Then, you need to install packages from the downloaded archives:
<pre><code>
install.packages("path/to/hdfs/archive", repos = NULL, type = "source")
install.packages("path/to/rmr2/archive", repos = NULL, type = "source")
</code></pre>

In my case, I needed to download some dependencies first from the CRAN repository:
<pre><code>
install.packages(c('Rcpp', 'RJSONIO', 'itertools', 'digest', 'functional', 'stringr', 'plyr'))
</code></pre>

You are all set and can run the mapreduce trivial example from mapreduce.R

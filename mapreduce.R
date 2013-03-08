# compute the first 1000 squares in memory
small.ints = 1:1000
sapply(small.ints, function(x) x^2)

# compute the first 1000 squares with Hadoop (HDFS + MapReduce)
library(rhdfs)
hdfs.init()
library(rmr2)
small.ints = to.dfs(1:1000)
from.dfs(
  mapreduce(
    input = small.ints, 
    map = function(k, v) cbind(v, v^2)
  )
)
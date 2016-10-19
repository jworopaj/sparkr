# podaj swoj ip
Sys.setenv(SPARK_LOCAL_IP = "192.168.13.10")

# podaj sciezke katalogu konfiguracyjnego
Sys.setenv(HADOOP_CONF_DIR = "/home/kuba/Documents/spark-2.0.1-bin-hadoop2.7/conf")

# podaj sciezke do javy
Sys.setenv(JAVA_HOME = "/usr/lib/jvm/java-8-openjdk-amd64")

# podaj sciezke do mojego sparka
Sys.setenv(SPARK_HOME = "/home/kuba/Documents/spark-2.0.1-bin-hadoop2.7")

# trick
Sys.setenv(SPARKR_SUBMIT_ARGS = "--master yarn sparkr-shell")

# zainstaluj SparkR library
# install.packages("devtools")
# devtools::install_github('apache/spark@v2.0.1', subdir='R/pkg')

# wczytaj biblioteke SparkR
library(SparkR, lib.loc = c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib")))

# podaj konfiguracje sparka
sparkConfig = list(
  spark.executor.instances = "2",
  spark.executor.memory = "2g",
  spark.spark.r.command = "/usr/bin/Rscript",
  `spark.hadoop.yarn.timeline-service.enabled` = "false",
  spark.blockManager.port = "5000",
  spark.driver.port = "6117"
)

session = sparkR.session(master = "yarn", appName = "SparkR - test", sparkConfig = sparkConfig)

sparkR.session(appName = "SparkR - test")


# library(sparklyr)
# 
# sc <- spark_connect(master = "yarn-client")



# TESTY -------------------------------------------------------------------

df <- as.DataFrame(faithful)

class ApacheSparkAT162 < Formula
  desc "Engine for large-scale data processing"
  homepage "https://spark.apache.org"
  url "https://d3kbcqa49mib13.cloudfront.net/spark-1.6.2-bin-hadoop2.6.tgz"
  version "1.6.2"
  sha256 "ed03ddfdc662cfa3d1b9a09173d1b5b343291f5609e56addf953132573476ee6"
  revision 1

  bottle :unneeded

  keg_only :versioned_formula

  def install
    # Rename beeline to distinguish it from hive's beeline
    mv "bin/beeline", "bin/spark-beeline"

    rm_f Dir["bin/*.cmd"]
    libexec.install Dir["*"]
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/spark-shell <<<'sc.parallelize(1 to 1000).count()'"
  end
end

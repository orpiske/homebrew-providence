# Generated with JReleaser 1.19.0 at 2025-07-12T08:29:14.451714736Z

class ProvidenceCollector < Formula
  desc "Providence Collector"
  homepage "https://github.com/orpiske/providence"
  url "https://github.com/orpiske/providence/releases/download/v0.0.10/providence-collector-0.0.10-jar-with-dependencies.jar", :using => :nounzip
  version "0.0.10"
  sha256 "81049b5560fb77d1e5b0b88085c67979ad1f8e9a9119f2695d3115993dc87329"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install "providence-collector-0.0.10-jar-with-dependencies.jar"

    bin.mkpath
    File.open("#{bin}/providence-collector", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/providence-collector-0.0.10-jar-with-dependencies.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/providence-collector --version")
    assert_match "0.0.10", output
  end
end

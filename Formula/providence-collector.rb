# Generated with JReleaser 1.19.0 at 2025-07-20T09:03:36.378911991Z

class ProvidenceCollector < Formula
  desc "Providence Collector"
  homepage "https://github.com/orpiske/providence"
  url "https://github.com/orpiske/providence/releases/download/v0.0.11/providence-collector-0.0.11-jar-with-dependencies.jar", :using => :nounzip
  version "0.0.11"
  sha256 "f73f0ed16d213d5d5ee20844534d86b6860a322ab9157d3ccd2053f6b4ea7cf9"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install "providence-collector-0.0.11-jar-with-dependencies.jar"

    bin.mkpath
    File.open("#{bin}/providence-collector", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/providence-collector-0.0.11-jar-with-dependencies.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/providence-collector --version")
    assert_match "0.0.11", output
  end
end

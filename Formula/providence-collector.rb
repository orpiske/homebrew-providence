# Generated with JReleaser 1.17.0 at 2025-07-06T15:39:04.202637+02:00

class ProvidenceCollector < Formula
  desc "Providence Collector"
  homepage "https://github.com/orpiske/providence"
  url "https://github.com/orpiske/providence/releases/download/v0.0.9/providence-collector-0.0.9-jar-with-dependencies.jar", :using => :nounzip
  version "0.0.9"
  sha256 "ddfdad610fe06f027f2e05566dbdff8210e95927ff34d96918f439f068204449"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install "providence-collector-0.0.9-jar-with-dependencies.jar"

    bin.mkpath
    File.open("#{bin}/providence-collector", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/providence-collector-0.0.9-jar-with-dependencies.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/providence-collector --version")
    assert_match "0.0.9", output
  end
end

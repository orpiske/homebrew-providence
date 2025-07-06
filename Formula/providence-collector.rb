# Generated with JReleaser 1.17.0 at 2025-07-06T11:18:36.982926+02:00

class ProvidenceCollector < Formula
  desc "Providence Collector"
  homepage "https://github.com/orpiske/providence"
  url "https://github.com/orpiske/providence/releases/download/v0.0.8/providence-collector-0.0.8-bin.zip"
  version "0.0.8"
  sha256 "44146a60b8da7208fa62bac51019824f5c18f2e8b7aa8c59b5d9e98cc65f4074"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/providence-collector" => "providence-collector"
  end

  test do
    output = shell_output("#{bin}/providence-collector --version")
    assert_match "0.0.8", output
  end
end

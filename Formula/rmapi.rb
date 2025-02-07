# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Rmapi < Formula
  version "v0.0.29"
  desc "Go app that allows you to access your reMarkable tablet files through the Cloud API"
  homepage "https://github.com/ddvk/rmapi"
  url "https://github.com/ddvk/rmapi/archive/refs/tags/#{version}.tar.gz"
  sha256 "0ee804dafe5b9fbdb1ece511c3135970106b2e006d21a4cd954d0445ad8a71ab"
  license "AGPL-3.0-or-later"

  depends_on "go" => :build

  def install
    inreplace "version/version.go", "var Version = \"dev\"", "var Version = \"#{version}\""
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    output = shell_output("#{bin}/rmapi version")
    assert_match "#{version}", output
  end
end

class Ipass < Formula
  desc "CLI to interact with Apple macOS Passwords (iCloud KeyChain)"
  homepage "https://github.com/kezhenxu94/ipass"
  url "https://github.com/kezhenxu94/ipass/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "f600ab4273ce94984d3a9858f820b6a4b5700cae7f7d5bbaf3c0b33c1282b029"
  license "GPL-3.0-only"

  depends_on "rust" => :build

  def install
    inreplace "Cargo.toml", /^version = "[^"]*"$/, "version = \"#{version}\""
    system "cargo", "install", *std_cargo_args
  end

  service do
    run [opt_bin/"ipass", "start"]
  end

  test do
    output = shell_output("#{bin}/ipass --version")
    assert_match "ipass #{version}", output
  end
end

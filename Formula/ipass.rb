class Ipass < Formula
  desc "CLI to interact with Apple macOS Passwords (iCloud KeyChain)"
  homepage "https://github.com/kezhenxu94/ipass"
  url "https://github.com/kezhenxu94/ipass/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "f146eb0a61aea7cb0e64dcf540f0c99980fd3f9b2e02a18e3e8ec605b26fa2b0"
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

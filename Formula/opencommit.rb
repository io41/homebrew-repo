class Opencommit < Formula
  desc "Auto-generate meaningful commits in a second"
  homepage "https://github.com/di-sukharev/opencommit#readme"
  url "https://registry.npmjs.org/opencommit/-/opencommit-3.2.5.tgz"
  sha256 "6b0b965714340ae3425ce2621753cbe6aea96d04f3f00a067ad4abf51ea35077"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # The app does API calls to LLM providers, which we don't want to do during a test.
    assert_match version.to_s, shell_output("#{bin}/opencommit --version")
  end
end

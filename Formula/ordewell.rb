# The Homebrew formula for the command line tool, rendered by
# scripts/render-package-manifests.mjs from a release's version and SHA256SUMS
# and pushed to ordewell/homebrew-tap as Formula/ordewell.rb (ADR-0065). Do not
# edit the tap's copy by hand: the next release replaces it. The desktop app is
# the cask, ordewell-desktop.rb.tmpl.
#
# There is no `version` line: Homebrew scans the version from the archive URLs
# (ordewell-<x.y.z>-<os>-<arch>.tar.gz), and brew audit flags an explicit one as
# redundant. For the same reason the URLs spell the version out instead of
# interpolating `version`, which a formula without that line does not have yet
# while its class body is read. `livecheck` comes before the platform blocks,
# which is the order brew audit asks for.
#
# Each platform downloads the release's versioned archive, which holds one
# executable, `ordewell`: the same file the one-line installer and the
# Release's fixed-name copy carry.
class Ordewell < Formula
  desc "Turn one goal into an ordered plan of coding-agent tasks"
  homepage "https://ordewell.ai/"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.1/ordewell-0.14.1-darwin-arm64.tar.gz"
      sha256 "a57e965366ddbb39d2b683138756a91186ff882f056fa3e540ce0e0c81324372"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.1/ordewell-0.14.1-darwin-x64.tar.gz"
      sha256 "1f0b3b99ee0b9ea609d80fc4d6b3a645bae1b6663340256ea1b89ea19687e3ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.1/ordewell-0.14.1-linux-arm64.tar.gz"
      sha256 "a44d0cc23ad42025f4013f38ef115f70c39b58b0d0fb0b581e80b9710b09ad78"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.1/ordewell-0.14.1-linux-x64.tar.gz"
      sha256 "3eb249fe333c33f1d3f5a4a7e51e27e09242a616ff0c7db5a6d99669b1e3e73c"
    end
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

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
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.13/ordewell-0.14.13-darwin-arm64.tar.gz"
      sha256 "b39dc7497175aef571b314c089df7b304184f820205d4dfd8e0831db327127b3"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.13/ordewell-0.14.13-darwin-x64.tar.gz"
      sha256 "47d231b91452bab6a197530e3ffbcc31c6f401cade9c811d19a1ed7fdf977c93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.13/ordewell-0.14.13-linux-arm64.tar.gz"
      sha256 "972866100eb3d853353a8d9148f586926de6be72061318ed090a8e3347ac57c6"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.13/ordewell-0.14.13-linux-x64.tar.gz"
      sha256 "efc411e2d14b351c04b933d0e7b4951c0cb4610f5ec2c3de24341f8cccddec66"
    end
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

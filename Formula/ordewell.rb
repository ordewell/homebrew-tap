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
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.7/ordewell-0.14.7-darwin-arm64.tar.gz"
      sha256 "e514cf15a6e589cac78af543827556a2a982a348d774db619768e22e46e73ae2"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.7/ordewell-0.14.7-darwin-x64.tar.gz"
      sha256 "425e0b5a88f1839b48d2640735e29f0731df45463b7c5b44b8a41cfde0d0fba8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.7/ordewell-0.14.7-linux-arm64.tar.gz"
      sha256 "613abc0c543db6ef145f66ee8a8e5e9560caefeb219af1804a396a26064c040a"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.7/ordewell-0.14.7-linux-x64.tar.gz"
      sha256 "f65de0cfc87fcc81314d87ecfbaddd61bf33dfe313f95519f713dd23c97f3d40"
    end
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

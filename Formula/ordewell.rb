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
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.16/ordewell-0.14.16-darwin-arm64.tar.gz"
      sha256 "cbfb89b84431c1a4bc9ff1eb8f0c6826a935b804b0916e8e4ee780871c7b84ac"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.16/ordewell-0.14.16-darwin-x64.tar.gz"
      sha256 "7ba9e2e06956e3ca26335cdca4095f6b73e37aa803ad135aa5c47097189f1ce0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.16/ordewell-0.14.16-linux-arm64.tar.gz"
      sha256 "568a0b22477f637eef755e1338c4fc1d7c13ac184d84876c7157644ed0aa0539"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.16/ordewell-0.14.16-linux-x64.tar.gz"
      sha256 "febcf74fa154f7b1007cd1534b861bbcc2ed9bec1f452fb21b4c780ed2542318"
    end
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

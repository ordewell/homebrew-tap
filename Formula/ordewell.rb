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
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.9/ordewell-0.14.9-darwin-arm64.tar.gz"
      sha256 "ca3aa5369541ac4b97ef4bad175005c140258f8545cf9f197c7f0f103f215350"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.9/ordewell-0.14.9-darwin-x64.tar.gz"
      sha256 "eddedbff08d50b3b05617ccab2393c7f8bd51d00968195b2c4bcd15572af389f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.9/ordewell-0.14.9-linux-arm64.tar.gz"
      sha256 "5901c225e39d246840516b31427ea01a9d144aa2b4b3d857b260c892342d79ed"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.9/ordewell-0.14.9-linux-x64.tar.gz"
      sha256 "4ca8b2331c9fb389575e9024d67f416cc3422614418a2eaf09c5b3231b023632"
    end
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

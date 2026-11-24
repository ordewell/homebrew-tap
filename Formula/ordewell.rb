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
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.11/ordewell-0.14.11-darwin-arm64.tar.gz"
      sha256 "40782095c4b1172f2655a76ba58197a1475464343abeabcc1a860f81e299f2f8"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.11/ordewell-0.14.11-darwin-x64.tar.gz"
      sha256 "648220e228666c660c7e39a2bf2e15c7ce7e69ecc484a1196881b8c3b0c29cc7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.11/ordewell-0.14.11-linux-arm64.tar.gz"
      sha256 "56c32087cebc75a92701285c75df7ab2d9e8753c91b1fc30466de0e3ad3d8aaf"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.11/ordewell-0.14.11-linux-x64.tar.gz"
      sha256 "2f083f1df0cdc891e38f24c21b0287c82751ba21c0f709cff21495624e2f0ddd"
    end
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

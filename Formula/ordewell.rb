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
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.6/ordewell-0.14.6-darwin-arm64.tar.gz"
      sha256 "77522330224b52d3993a503d3d0c2282a4823c5f44456004fdad35e184a0a304"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.6/ordewell-0.14.6-darwin-x64.tar.gz"
      sha256 "56b95af3ac4195769c7cb1de55df340a4514dca0b7734d0308457ab8581243a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.6/ordewell-0.14.6-linux-arm64.tar.gz"
      sha256 "1398fa3ff0d4a5ffa73018507a3171b4d230627b644d30365f887aae44eaf9e1"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.6/ordewell-0.14.6-linux-x64.tar.gz"
      sha256 "dd8fe6102ce082750358b84785db16bcfe07713608b822271232d3d2ec96fd42"
    end
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

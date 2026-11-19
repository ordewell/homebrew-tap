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
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.3/ordewell-0.14.3-darwin-arm64.tar.gz"
      sha256 "dd2468e9933261f1ceca4a2afa6c3ac67bd4f0cd4b61a9485ccf5e6a1a047255"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.3/ordewell-0.14.3-darwin-x64.tar.gz"
      sha256 "44925b500563978473de5ae2a7fddfb17ee93383fdbf1f803cb5bc7a5d98d773"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.3/ordewell-0.14.3-linux-arm64.tar.gz"
      sha256 "339b84c84bf2419c0d05e470d71d8a564d2b6df643f004b5c006dd101936e9d5"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.3/ordewell-0.14.3-linux-x64.tar.gz"
      sha256 "94ed4074c11dcf2b18103dd5bcb35216720537eebd1a205a27184022e95c03a7"
    end
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

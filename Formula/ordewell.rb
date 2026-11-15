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
      url "https://github.com/ordewell/ordewell/releases/download/v0.13.3/ordewell-0.13.3-darwin-arm64.tar.gz"
      sha256 "839b34b5a57abe6924026230bd260a16a3bf103ccf73b7ca3ae67d1e34524c9d"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.13.3/ordewell-0.13.3-darwin-x64.tar.gz"
      sha256 "3ee30e7b9af0cbac7ebf0dba7eb753edcf680712f87dad7cf45ba685c4cecce8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.13.3/ordewell-0.13.3-linux-arm64.tar.gz"
      sha256 "203741518e4e1e0f2166d95a6f9df7f6d068e4dfe86e762aa3e54252ee901604"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.13.3/ordewell-0.13.3-linux-x64.tar.gz"
      sha256 "a597c1ef533033cb0cded7bd8ed9c080463f670d0c1e6f8f1f1cc54d5263f1b3"
    end
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

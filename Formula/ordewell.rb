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
      url "https://github.com/ordewell/ordewell/releases/download/v0.13.4/ordewell-0.13.4-darwin-arm64.tar.gz"
      sha256 "4415021443907e70c996f5297c4b50244101f9d0b188b65c35d380b65d5220ba"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.13.4/ordewell-0.13.4-darwin-x64.tar.gz"
      sha256 "9b953eaa15744ea6e32d8ded0d106168c3d1d0d1ee1a2f07afb2dd51db80d6bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.13.4/ordewell-0.13.4-linux-arm64.tar.gz"
      sha256 "a8f640f7bc5a3b6296cd6d026be63996e1366143afb52c8d15775cbc92e2039e"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.13.4/ordewell-0.13.4-linux-x64.tar.gz"
      sha256 "f0de12d8af8614974215f1e03150e4212fdd5956614b559a6e2bf77513182f6d"
    end
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

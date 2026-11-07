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
      url "https://github.com/ordewell/ordewell/releases/download/v0.13.1/ordewell-0.13.1-darwin-arm64.tar.gz"
      sha256 "57e2c3418cbbb407b2a87473841547fae11cf49ee4bcaa24edabb025ba415aea"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.13.1/ordewell-0.13.1-darwin-x64.tar.gz"
      sha256 "c900db8b89f3506be284ac547f2abeda1effc65b7810f3907e094f70aefe6604"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.13.1/ordewell-0.13.1-linux-arm64.tar.gz"
      sha256 "de78821d7f788f0a74e6aa4307896f72e8900e2bb9a7d775bd6b43db36c6326f"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.13.1/ordewell-0.13.1-linux-x64.tar.gz"
      sha256 "1965c22e09e8c30c8ef4294bab8a6fe79d24b2abc3d136db636699cc4765fd88"
    end
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

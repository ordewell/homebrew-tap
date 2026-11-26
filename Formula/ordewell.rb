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
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.14/ordewell-0.14.14-darwin-arm64.tar.gz"
      sha256 "67708b4e13888694c318f963017b276bf2fd68eacc6215a9b737a8b0fcc1aeea"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.14/ordewell-0.14.14-darwin-x64.tar.gz"
      sha256 "a3df4b240aaf976f462d08400affcaa1823835c3adc10961e84884072369d765"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.14/ordewell-0.14.14-linux-arm64.tar.gz"
      sha256 "f808b508943652fe3a578e1061cca6e446f2b6c820846e402ec6b980d0bed165"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.14/ordewell-0.14.14-linux-x64.tar.gz"
      sha256 "b54f5fe7592ab646d38d03cf96a24ac9dad9c4f4d6f46af86b6c4e29de7baf4e"
    end
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

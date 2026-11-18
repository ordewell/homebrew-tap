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
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.2/ordewell-0.14.2-darwin-arm64.tar.gz"
      sha256 "c8b7dba8c4b440e56069b5e8a8c88247b17758c87bc12fb847cce931ebbeacb0"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.2/ordewell-0.14.2-darwin-x64.tar.gz"
      sha256 "12204296b6b4792ec569537bb8b408d06c8bc7376f539c9bc0875ce9371003e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.2/ordewell-0.14.2-linux-arm64.tar.gz"
      sha256 "23d80e831062272aeb1ca54e0b9ec53fedb3ec07f2ce418739a68a9b62568c2a"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.2/ordewell-0.14.2-linux-x64.tar.gz"
      sha256 "4a08451cf7274efb222a92f2afcf4b1cdde4473033d95d7dbb1dcf1edb7e92cf"
    end
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

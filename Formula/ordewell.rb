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
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.12/ordewell-0.14.12-darwin-arm64.tar.gz"
      sha256 "e3c38e9001b45abb5f7b5bd0509ec803073efa56120580d6c8d15128371dcdd0"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.12/ordewell-0.14.12-darwin-x64.tar.gz"
      sha256 "e2f39f8c2f7132db600db85f1504623aa15d95ccbb0b206744bfe99f422816ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.12/ordewell-0.14.12-linux-arm64.tar.gz"
      sha256 "97382451128c7cfbc006922983786fbb4805ca59906009997d25734e2ecac856"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.12/ordewell-0.14.12-linux-x64.tar.gz"
      sha256 "60fdc89266f10e1d335b0c182492d9004e5bcbd67b03074abf92076428712bc3"
    end
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

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
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.10/ordewell-0.14.10-darwin-arm64.tar.gz"
      sha256 "ae96a7028451b624904cb9751aa80d38c4a94942534b46507c77f76c60078e87"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.10/ordewell-0.14.10-darwin-x64.tar.gz"
      sha256 "9b54ea674e4e024fed6e5be61ce074bfddaf60c047e2bc7da3691cd211ae6f99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.10/ordewell-0.14.10-linux-arm64.tar.gz"
      sha256 "4a9fad3b9795fbe8f9afe853c9b389399dcdce2a929a00acd378fd51ae4cfb1c"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.10/ordewell-0.14.10-linux-x64.tar.gz"
      sha256 "a1e5524fd0a006456e2c53ecf0f0312d54fbf23497e772a2933df9105bfe80e8"
    end
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

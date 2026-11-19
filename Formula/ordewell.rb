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
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.4/ordewell-0.14.4-darwin-arm64.tar.gz"
      sha256 "09904b6a1803fdaa937bfe893a8fdaa4dbb35bf14aad6e7ee29c892155e1ac38"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.4/ordewell-0.14.4-darwin-x64.tar.gz"
      sha256 "49c0febe3f21ce51bbfa5dbc0524bb8087e0ff5c9c83d11e42388cd8189cae92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.4/ordewell-0.14.4-linux-arm64.tar.gz"
      sha256 "0fc05f514ec03b58eb8cd8dceb65d791aaf753374c84a066a1777afa7fd1f91a"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.4/ordewell-0.14.4-linux-x64.tar.gz"
      sha256 "ff3cefa380772143159760c53950d3c71363d54116df48e3233865c80ffc69e5"
    end
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

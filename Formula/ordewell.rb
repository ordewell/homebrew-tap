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
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.15/ordewell-0.14.15-darwin-arm64.tar.gz"
      sha256 "85b131eb31a15e4ddb7a126fd5cdc2819a34f3909f2bc170174b704ba39a7a5c"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.15/ordewell-0.14.15-darwin-x64.tar.gz"
      sha256 "cc6d93a4c414aadfecbd17245ef5b1c17b5b5c7c40c067a4a11b75089582eb83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.15/ordewell-0.14.15-linux-arm64.tar.gz"
      sha256 "749b6e6b68d9972af9977f7f759b61eeb8032ba44af54070c788ea9ca0e1748a"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.15/ordewell-0.14.15-linux-x64.tar.gz"
      sha256 "e78e31c013e5273c361346108356f8df846c8f1dda1349f3699033be9e0cc907"
    end
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

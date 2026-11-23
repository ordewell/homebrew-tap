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
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.8/ordewell-0.14.8-darwin-arm64.tar.gz"
      sha256 "c8a7d0f951f31f660ee27a222dd0c349bc0030111d1d09e1141daf1c48cc694b"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.8/ordewell-0.14.8-darwin-x64.tar.gz"
      sha256 "f57f35030ddcaf208176d41e4742a940d37e393986465b1430a1f078e0875435"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.8/ordewell-0.14.8-linux-arm64.tar.gz"
      sha256 "9da951836098def48ce2004f499b90cad055332e1acd8c8c1064a3e74f7db574"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.8/ordewell-0.14.8-linux-x64.tar.gz"
      sha256 "fb3146cb64eb2abda0251f6a9e0a32fb611a564bc2cd56be2cd223f920c497ac"
    end
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

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
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.5/ordewell-0.14.5-darwin-arm64.tar.gz"
      sha256 "af66613c14db5bf07c4cda366c9b2fb3adfde6c8511c4b700f768aa1e13abef0"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.5/ordewell-0.14.5-darwin-x64.tar.gz"
      sha256 "106583e036088e8e15d6e45656ce773e23920bd747ee70df5c432a72e08f8d87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.5/ordewell-0.14.5-linux-arm64.tar.gz"
      sha256 "3164df24c7bf5078e37344d13f5c7e7c9d2ac5d3cf18d352fd186edc5b76d2fc"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.14.5/ordewell-0.14.5-linux-x64.tar.gz"
      sha256 "51f2c15bf48698a5b9d609020a03bfa459babc2525c25327a8bf7e2c6279af04"
    end
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

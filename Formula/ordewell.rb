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
      url "https://github.com/ordewell/ordewell/releases/download/v0.13.2/ordewell-0.13.2-darwin-arm64.tar.gz"
      sha256 "c7faf7654be3bff1c65a462551afbfc7a4898c8e125c1f2164ea841a0fbf7d38"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.13.2/ordewell-0.13.2-darwin-x64.tar.gz"
      sha256 "ef8a8ca324b488a467665f525cbc9bae637d3a54a42a710b0f3c68f4b695771b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v0.13.2/ordewell-0.13.2-linux-arm64.tar.gz"
      sha256 "79cbd465b62cf97397e9e1ee399c4886a20a7dd1cb7f0749792e725e016155c4"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v0.13.2/ordewell-0.13.2-linux-x64.tar.gz"
      sha256 "9db6a23fdf8a26343f5ce5c4d382b64a191165679b4a358c981bccafce36baa7"
    end
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

# The Homebrew formula for the command line tool, rendered by
# scripts/render-package-manifests.mjs from a release's version and SHA256SUMS
# and pushed to ordewell/homebrew-tap as Formula/ordewell.rb (ADR-0065). Do not
# edit the tap's copy by hand: the next release replaces it. The desktop app is
# the cask, ordewell-desktop.rb.tmpl.
#
# Each platform downloads the release's versioned archive, which holds one
# executable, `ordewell`: the same file the one-line installer and the
# Release's fixed-name copy carry.
class Ordewell < Formula
  desc "Turn one goal into an ordered plan of coding-agent tasks"
  homepage "https://ordewell.ai/"
  version "0.13.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v#{version}/ordewell-#{version}-darwin-arm64.tar.gz"
      sha256 "9760f139ee42ba23074f7e765dfa032fe180ef0e0590ad63bc94cc6ad2fadd37"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v#{version}/ordewell-#{version}-darwin-x64.tar.gz"
      sha256 "cff2f583697e9836409d155400911e40e8b02f4e2f25dccb377f96911ca7815b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ordewell/ordewell/releases/download/v#{version}/ordewell-#{version}-linux-arm64.tar.gz"
      sha256 "c422e8d8674aa853e1b78834d7dbcb85c98961e8926efdb14cb98d133f752dd5"
    end
    on_intel do
      url "https://github.com/ordewell/ordewell/releases/download/v#{version}/ordewell-#{version}-linux-x64.tar.gz"
      sha256 "75e0023a290545d2e93f55a87428a6ffa663fbc668d6126da1186e36a772da3a"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "ordewell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordewell --version")
  end
end

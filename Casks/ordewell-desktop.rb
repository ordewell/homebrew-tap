# The Homebrew cask, rendered by scripts/render-package-manifests.mjs from a
# release's version and SHA256SUMS and pushed to ordewell/homebrew-tap as
# Casks/ordewell-desktop.rb (ADR-0063 H11, ADR-0065 C8). Do not edit the tap's copy by hand:
# the next release replaces it. The command line tool is the formula
# ordewell.rb.tmpl, which owns the token `ordewell`.
#
# Both architectures are named by their versioned installer, so the cask's
# version, its URL and its checksums are one release's. The download is the same
# file the one-line installer and the Release's fixed-name copy carry.
cask "ordewell-desktop" do
  arch arm: "arm64", intel: "x64"

  version "0.14.7"
  sha256 arm:   "54e5afa17a330ca9720392fc39b3d0cbc94e967c4052e3e58a77264c2a36746e",
         intel: "e71cbdc6f7ffaf87ae39192e73f6d25affc384d29efa2bc7825387a2bf305594"

  url "https://github.com/ordewell/ordewell/releases/download/v#{version}/Ordewell-#{version}-mac-#{arch}.dmg"
  name "Ordewell"
  desc "Turn one goal into an ordered plan of coding-agent tasks"
  homepage "https://ordewell.ai/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Only a notarized release publishes this cask, which is the same build that
  # has electron-updater on (ADR-0063 H9): the app updates itself, and
  # `brew upgrade` installs a release the same way.
  auto_updates true
  depends_on macos: :ventura

  app "Ordewell.app"

  zap trash: [
    # Electron names the user-data folder after package.json's name, which is
    # @ordewell/desktop rather than the product name; the second path is there
    # in case that ever changes. The rest is what macOS writes for the bundle.
    "~/Library/Application Support/@ordewell/desktop",
    "~/Library/Application Support/Ordewell",
    "~/Library/Preferences/ai.ordewell.desktop.plist",
    "~/Library/Saved Application State/ai.ordewell.desktop.savedState",
  ]
end

# Release template: dist/homebrew/render.py fills every @...@ placeholder.
# Rendered as an artifact only; publishing a tap requires the owner's decision.
class Squad < Formula
  desc "Terminal chat room for multiple language models through OpenRouter"
  homepage "https://github.com/shoemoney/squad"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shoemoney/squad/releases/download/v0.2.1/squad-cli-aarch64-apple-darwin.tar.xz"
      sha256 "a2e99f9fa7814bc3326e7b0ba6d2a8e9f6276e04cd6ffc2655692484c2a73612"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/shoemoney/squad/releases/download/v0.2.1/squad-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "efca7a08574d2f456bf47430e13f0d12e880eff6e53570606da5fbb967136362"
    end
  end

  def install
    bin.install "squad"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/squad --version")
    assert_match "doctor", shell_output("#{bin}/squad --help")
  end
end

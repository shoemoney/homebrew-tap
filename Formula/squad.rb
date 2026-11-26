# Release template: dist/homebrew/render.py fills every @...@ placeholder.
# Rendered as an artifact only; publishing a tap requires the owner's decision.
class Squad < Formula
  desc "Terminal chat room for multiple language models through OpenRouter"
  homepage "https://github.com/shoemoney/squad"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shoemoney/squad/releases/download/v0.1.1/squad-cli-aarch64-apple-darwin.tar.xz"
      sha256 "c1d61165a9aaa3d5b4b2c2c09861ccbdaa76a5e9f6456cc3d092c80dd1fe4038"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/shoemoney/squad/releases/download/v0.1.1/squad-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4446abb19c275fc4aa8497c2410f148730d19619f154f6e87826f982bcf5a957"
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

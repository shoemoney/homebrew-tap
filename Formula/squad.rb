# Release template: dist/homebrew/render.py fills every @...@ placeholder.
# Rendered as an artifact only; publishing a tap requires the owner's decision.
class Squad < Formula
  desc "Terminal chat room for multiple language models through OpenRouter"
  homepage "https://github.com/shoemoney/squad"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shoemoney/squad/releases/download/v0.1.3/squad-cli-aarch64-apple-darwin.tar.xz"
      sha256 "397decd8441fd0b6fbf16c715087bb848ac61b6d1e4650228aa290e4adf02ab1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/shoemoney/squad/releases/download/v0.1.3/squad-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7a368c9ebcb857e696e66540b35ef95e001962edaf8372ad87f5a252ed79f8b5"
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

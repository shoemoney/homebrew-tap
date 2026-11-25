# Release template: dist/homebrew/render.py fills every @...@ placeholder.
# Rendered as an artifact only; publishing a tap requires the owner's decision.
class Squad < Formula
  desc "Terminal chat room for multiple language models through OpenRouter"
  homepage "https://github.com/shoemoney/squad"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shoemoney/squad/releases/download/v0.1.0/squad-cli-aarch64-apple-darwin.tar.xz"
      sha256 "112cff9d68debb55604a94592e42d1decb774f00e6d4469878e52467023d43de"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/shoemoney/squad/releases/download/v0.1.0/squad-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8af8b111115d43503c2da136997e7ebe037628dafdd4314f3110608da5b766c8"
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

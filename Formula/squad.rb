# Release template: dist/homebrew/render.py fills every @...@ placeholder.
# Rendered as an artifact only; publishing a tap requires the owner's decision.
class Squad < Formula
  desc "Terminal chat room for multiple language models through OpenRouter"
  homepage "https://github.com/shoemoney/squad"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shoemoney/squad/releases/download/v0.1.2/squad-cli-aarch64-apple-darwin.tar.xz"
      sha256 "fac91dc582abfeb75939465d687482bdb752d518a18c675ff23d9598c2be6f6c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/shoemoney/squad/releases/download/v0.1.2/squad-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "aba260f1922e3d5b0fc3f436703cac6f6b0ad5d93ae55447bab6bc1c73613b04"
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

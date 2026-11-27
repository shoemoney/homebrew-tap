# Release template: dist/homebrew/render.py fills every @...@ placeholder.
# Rendered as an artifact only; publishing a tap requires the owner's decision.
class Squad < Formula
  desc "Terminal chat room for multiple language models through OpenRouter"
  homepage "https://github.com/shoemoney/squad"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shoemoney/squad/releases/download/v0.2.0/squad-cli-aarch64-apple-darwin.tar.xz"
      sha256 "531fd4c9e671f3aab9884185ba5123a555e33cc3639c0ca42c76c7b16b70fea0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/shoemoney/squad/releases/download/v0.2.0/squad-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "fa1afe1a13246cbfeeb0bc41d92d377ff38d6d526cfee6bdecfecbef8a712af6"
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

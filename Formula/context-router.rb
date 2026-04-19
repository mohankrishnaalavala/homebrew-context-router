class ContextRouter < Formula
  desc "Minimum-context selector for AI coding agents — MCP server + CLI"
  homepage "https://github.com/mohankrishnaalavala/context-router"
  url "https://files.pythonhosted.org/packages/57/9e/6a5012eeb9fd87f2601a1b1014f12581b44afb1a08eb171096420b718330/context_router_cli-3.0.0-py3-none-any.whl"
  sha256 "0dc81fd62ed81bdbafa51bae1cf876255c7649bbe3f6111ec9aebc1dde9f4aad"
  license "MIT"
  version "3.0.0"

  depends_on "python@3.12"

  def install
    # Create an isolated virtualenv using Python 3.12.
    system "python3.12", "-m", "venv", libexec
    # Install from PyPI using binary wheels — avoids compiling tiktoken from source
    # (which would require Rust/Cargo).
    system libexec/"bin/pip", "install", "--prefer-binary", "--no-cache-dir",
           "context-router-cli==#{version}"
    bin.install_symlink libexec/"bin/context-router"
  end

  test do
    assert_match "context-router", shell_output("#{bin}/context-router --help")
    assert_match "init", shell_output("#{bin}/context-router --help")
  end
end

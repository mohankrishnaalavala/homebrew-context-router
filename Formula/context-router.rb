class ContextRouter < Formula
  desc "Minimum-context selector for AI coding agents — MCP server + CLI"
  homepage "https://github.com/mohankrishnaalavala/context-router"
  url "https://files.pythonhosted.org/packages/63/bf/43991387da30da1be3d6f63c0d3d533137dcaeca11323c162e8305f493b9/context_router_cli-2.0.0-py3-none-any.whl"
  sha256 "b78efb227876e7015addcadec708dc9b94f2d5c744986bcc8616fc440f19b01c"
  license "MIT"
  version "2.0.0"

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

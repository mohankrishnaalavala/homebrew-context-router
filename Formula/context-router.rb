class ContextRouter < Formula
  desc "Minimum-context selector for AI coding agents — MCP server + CLI"
  homepage "https://github.com/mohankrishnaalavala/context-router"
  url "https://files.pythonhosted.org/packages/3e/b5/fcd58f64b9a07c36a25b0a75c7456b29c901602d9614f5330caa86d5bd21/context_router_cli-3.2.0-py3-none-any.whl"
  sha256 "51fb816e39995daa601ef27b73620253ad59cc47fa0a9bcbe59236a803158240"
  license "MIT"
  version "3.2.0"

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

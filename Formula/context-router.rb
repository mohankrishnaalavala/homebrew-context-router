class ContextRouter < Formula
  desc "Minimum-context selector for AI coding agents — MCP server + CLI"
  homepage "https://github.com/mohankrishnaalavala/context-router"
  url "https://files.pythonhosted.org/packages/d0/f7/f446cb35f1732a69dff68276848d76c8a4b794144fe982919767599fe045/context_router_cli-0.4.0-py3-none-any.whl"
  sha256 "a4bb6bb76890bd8b0cb8a75ba918d73f12e6394e6cd29cc46509fa90944eac5f"
  license "MIT"
  version "0.4.0"

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

class ContextRouter < Formula
  desc "Minimum-context selector for AI coding agents — MCP server + CLI"
  homepage "https://github.com/mohankrishnaalavala/context-router"
  url "https://files.pythonhosted.org/packages/b7/70/1de65ebfce8e5dfb3cbdcef579383987479021b4c9ffc128c7526ce31aad/context_router_cli-0.3.0-py3-none-any.whl"
  sha256 "9d74803aa229b5c41b6111e5c661381925bb79ce10c57ad75716c2ef0a6b5122"
  license "MIT"
  version "0.3.0"

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

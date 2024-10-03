class Ntfyme < Formula
  desc "A simple notification tool to notify about your prolonged process's report"
    homepage "https://github.com/AnirudhG07/ntfyme"
    url "https://github.com/AnirudhG07/ntfyme/releases/download/v0.0.2/ntfyme-0.0.2.tar.gz"
    version "0.0.2"
    sha256 "f20ed27dbe431372e08a636e71140065bc55db92f98da3bc95e7a25d6432e84e"
    license "Apache-2.0"

    depends_on "python@3"

    resource "toml" do
      url "https://files.pythonhosted.org/packages/source/t/toml/toml-0.10.2.tar.gz"
      sha256 "b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f"
    end

    resource "tomlkit" do
      url "https://files.pythonhosted.org/packages/4b/34/f5f4fbc6b329c948a90468dd423aaa3c3bfc1e07d5a76deec269110f2f6e/tomlkit-0.13.0.tar.gz"
      sha256 "08ad192699734149f5b97b45f1f18dad7eb1b6d16bc72ad0c2335772650d7b72"
    end

    resource "requests" do
      url "https://files.pythonhosted.org/packages/source/r/requests/requests-2.32.3.tar.gz"
      sha256 "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
    end

    resource "cryptography" do
      url "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-43.0.0.tar.gz"
      sha256 "b88075ada2d51aa9f18283532c9f60e72170041bba88d7f37e49cbb10275299e"
    end

    resource "plyer" do
      url "https://files.pythonhosted.org/packages/source/p/plyer/plyer-2.1.0.tar.gz"
      sha256 "65b7dfb7e11e07af37a8487eb2aa69524276ef70dad500b07228ce64736baa61"
    end 

    resource "rich" do
      url "https://files.pythonhosted.org/packages/source/r/rich/rich-13.7.0.tar.gz"
      sha256 "9be308cb1fe2f1f57d67ce99e95af38a1e2bc71ad9813b0e247cf7ffbcc3a432"
    end

    resource "beaupy" do
      url "https://files.pythonhosted.org/packages/source/b/beaupy/beaupy-3.9.1.tar.gz"
      sha256 "4d9655aa93c099f12291290d8340dfb71796ab27a1706ce41c736c451cb9b88e"
    end

    resource "rich-click" do
      url "https://files.pythonhosted.org/packages/source/r/rich-click/rich-click-1.8.3.tar.gz"
      sha256 "6d75bdfa7aa9ed2c467789a0688bc6da23fbe3a143e19aa6ad3f8bac113d2ab3"
    end

    def install
      system "pip3", "install", ".", "--prefix=#{libexec}"
      xy = Language::Python.major_minor_version Formula["python@3"].opt_bin/"python3"
      (bin/"ntfyme").write <<~EOS
        #!/bin/bash
        PYTHONPATH="#{libexec}/lib/python#{xy}/site-packages" exec "#{libexec}/bin/ntfyme" "$@"
      EOS
    end

    def caveats
      <<~EOS
        Successfully installed ntfyme. You can run `ntfyme -h` to get started!
        For more information, visit: https://github.com/AnirudhG07/ntfyme
      EOS
    end

    test do
      system "#{bin}/ntfyme", "-v"
    end
end

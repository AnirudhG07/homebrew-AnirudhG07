class Ntfyme < Formula
    desc "A simple notification tool to notify yourself when a long running process ends with local ping, gmail, telegram, etc."
    homepage "https://github.com/AnirudhG07/ntfyme"
    url "https://github.com/AnirudhG07/ntfyme/releases/download/v0.0.1/ntfyme-0.0.1.tar.gz"
    sha256 "5afa7918671bbd627a1978db21b9bd594549e5bbdc218e12f3c082a84651ada2"
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

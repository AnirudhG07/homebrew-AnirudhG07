class Cheatshh < Formula
    desc "Cheatshh is a CLI tool to store commands and their descriptions in a place you can look into as cheatshheat so you dont have to remember them."
    homepage "https://github.com/AnirudhG07/cheatshh"
    url "https://github.com/AnirudhG07/cheatshh/releases/download/v1.1.1/cheatshh-1.1.1.tar.gz"
    sha256 "1e8e1b888ccde73686fb43e1c369c0b07a674109149c5ab47e7b1a0b5c733923"
    version "1.1.1"
    license "Apache-2.0"

    depends_on "jq"
    depends_on "yq"
    depends_on "fzf"
    depends_on "python@3"

    resource "whiptail" do
        url "https://files.pythonhosted.org/packages/source/w/whiptail/whiptail-0.2.tar.gz"
        sha256 "c3bd05674c8c22b92a0da47f0bb6cfd2da0601e69bd09b3077c92a19d8853c09"
    end

    resource "setuptools" do
        url "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-70.1.0.tar.gz"
        sha256 "01a1e793faa5bd89abc851fa15d0a0db26f160890c7102cd8dce643e886b47f5"
    end

    def install
      system "pip3", "install", ".", "--prefix=#{libexec}"
      xy = Language::Python.major_minor_version Formula["python@3"].opt_bin/"python3"
      (bin/"cheatshh").write <<~EOS
        #!/bin/bash
        PYTHONPATH="#{libexec}/lib/python#{xy}/site-packages" exec "#{libexec}/bin/cheatshh" "$@"
      EOS
    end

    def caveats
        <<~EOS
            Note: Initiall you may not see $HOME/.config/cheatshh directory.
            You can start using Cheatshh by simply running the 'cheatshh' command. This will create the directory which you can manually configure too.
            Use 'cheatshh --help' to get more information on how to use Cheatshh. 
            
            For more information, visit: https://github.com/AnirudhG07/cheatshh
        EOS
      end
    
    test do
        system "#{bin}/cheats.sh", "--version"
    end
end

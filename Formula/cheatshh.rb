class Cheatshh < Formula
    desc "Cheatshh is a CLI tool to store commands and their descriptions in a place you can look into as cheatshheat so you dont have to remember them."
    homepage "https://github.com/AnirudhG07/cheatshh"
    url "https://github.com/AnirudhG07/cheatshh/releases/download/v1.0.6/cheatshh-1.0.6.tar.gz"
    sha256 "082a17f4fc98ac1623217f16753ab95b1c479d7a1aafdad0b10e9b3b44cdf35e"
    version "1.0.6"
    license "Apache-2.0"

    depends_on "jq"
    depends_on "fzf"
    depends_on "python@3"

    resource "whiptail" do
        url "https://files.pythonhosted.org/packages/source/w/whiptail/whiptail-0.2.tar.gz"
        sha256 "c3bd05674c8c22b92a0da47f0bb6cfd2da0601e69bd09b3077c92a19d8853c09"
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
            Note: Initiall you may not see ~/.config/cheatshh directory.
            You can start using Cheatshh by simply running the 'cheatshh' command. This will create the directory which you can manually configure too.
            Use 'cheatshh --help' to get more information on how to use Cheatshh. 
            
            For more information, visit: https://github.com/AnirudhG07/cheatshh
        EOS
      end
    
    test do
        system "#{bin}/cheats.sh", "--version"
    end
end
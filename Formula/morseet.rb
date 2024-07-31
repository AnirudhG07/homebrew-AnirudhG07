class Morseet < Formula
    desc "morseet(slang for morse-it) is a command line tool to convert text to morse-code and vice versa. It has various features and customization options making it the only tool would go to." 
    homepage "https://github.com/AnirudhG07/morseet"
    url "https://github.com/AnirudhG07/morseet/releases/download/v1.0.0/morseet-1.0.0.tar.gz"
    sha256 "c746058daff004f7a85115e0e614fb3358c3aaa39d5c2ec59711c47b13946c7d"
    license "Apache-2.0"

    depends_on "python@3"

    def install
        system "pip3", "install", ".", "--prefix=#{libexec}"
        xy = Language::Python.major_minor_version Formula["python@3"].opt_bin/"python3"
        (bin/"morseet").write <<~EOS
          #!/bin/bash
          PYTHONPATH="#{libexec}/lib/python#{xy}/site-packages" exec "#{libexec}/bin/morseet" "$@"
        EOS
    end

    def caveats
        <<~EOS
            Successfully installed morseet. You can run `morseet -h` to get started!
            For more information, visit: https://github.com/AnirudhG07/morseet
        EOS
    end

    test do
        system "#{bin}/morseet", "-v"
    end
end

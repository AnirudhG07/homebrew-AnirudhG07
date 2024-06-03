class Typeinc < Formula
    desc "Typeinc is a cool ncurses based Typing Speed Test tool where you can enjoy typing experience in Terminal with different difficulty levels."
    homepage "https://github.com/AnirudhG07/Typeinc"
    url "https://github.com/AnirudhG07/Typeinc/releases/download/v1.0.0/typeinc-1.0.0.tar.gz"
    sha256 "dce90ba90b14f720c6c86ab902d4f48ffb6a668104e259522ae53a4597014b89"
    license "Apache-2.0"

    depends_on "python@3"

    def install
        system "pip3", "install", ".", "--prefix=#{libexec}"
        xy = Language::Python.major_minor_version Formula["python@3"].opt_bin/"python3"
        (bin/"typeinc").write <<~EOS
          #!/bin/bash
          PYTHONPATH="#{libexec}/lib/python#{xy}/site-packages" exec "#{libexec}/bin/typeinc" "$@"
        EOS
    end

    def caveats
        <<~EOS
            Successfully installed Typeinc. You can run `typeinc -h` to get started!
            For more information, visit: https://github.com/AnirudhG07/Typeinc
        EOS
    end

    test do
        system "#{bin}/typeinc", "-v"
    end
end

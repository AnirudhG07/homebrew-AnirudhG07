class Typeinc_mini < Formula
  desc "A miniature version of Typeinc, is a cool Typing Speed Test tool"
    homepage "https://github.com/AnirudhG07/Typeinc-mini"
    url "https://github.com/AnirudhG07/Typeinc-mini/releases/download/v1.0.0/typeinc-mini-1.0.0.tar.gz"
    version "1.0.0"
    sha256 "19a3a39a51dbc447545c4bb6d2473a23058c608c4323f3841da3df9e2ebba1b4"
    license "Apache-2.0"

    depends_on "python@3"

    def install
      system "pip3", "install", ".", "--prefix=#{libexec}"
      xy = Language::Python.major_minor_version Formula["python@3"].opt_bin/"python3"
      (bin/"typeinc").write <<~EOS
        #!/bin/bash
        PYTHONPATH="#{libexec}/lib/python#{xy}/site-packages" exec "#{libexec}/bin/typeinc-mini" "$@"
      EOS
    end

    def caveats
      <<~EOS
        Successfully installed Typeinc-mini. You can run `typeinc-mini -h` to get started!
        For more information, visit: https://github.com/AnirudhG07/Typeinc-mini
      EOS
    end

    test do
      system "#{bin}/typeinc-mini", "-v"
    end
end

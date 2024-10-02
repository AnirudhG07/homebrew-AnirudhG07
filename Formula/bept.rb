class Bept < Formula
  desc "Bept - Beginner friendly Electrostatics for Protein analysis Tool, is a cross-platform interactive and user-friendly tool for protein electrostatics using APBS and PDB2PQR."
    homepage "https://github.com/IISc-Software-iGEM/bept"
    url "https://github.com/IISc-Software-iGEM/bept/releases/download/0.1.0/bept-0.1.0.tar.gz"
    sha256 "1963bb90d4844f43f343b1639b151c9b3aa38c97ed1e64f213efc1b04fcef213"
    license "MIT"

    depends_on "python@3"

    resource "beaupy" do
        url "https://files.pythonhosted.org/packages/83/0d/8f8a9c2e48eb02e2325a11538a22b70d86f22f2a27110502b180375b45e4/beaupy-3.9.2.tar.gz"
        sha256 "b71579ba626d29ceddae96575d2de9a9508a194e1058d2095627116f349ad780"
    end

    resource "biopython" do
        url "https://files.pythonhosted.org/packages/9e/7f/eaca4de03f0ee06c9d578d2730fd55858a57cee3620c62d3bc17b5da5447/biopython-1.84.tar.gz"
        sha256 "60fbe6f996e8a6866a42698c17e552127d99a9aab3259d6249fbaabd0e0cc7b4"
    end

    resource "click" do
        url "https://files.pythonhosted.org/packages/96/d3/f04c7bfcf5c1862a2a5b845c6b2b360488cf47af55dfa79c98f6a6bf98b5/click-8.1.7.tar.gz"
        sha256 "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de"
    end

    resource "fzf-bin" do
        url "https://files.pythonhosted.org/packages/4a/b0/135e0ecfe434febea4af0cd271537438a1bd8965213df87483f0070b10a5/fzf_bin-0.55.0.tar.gz"
        sha256 "d3efab2250b458e2069194a1b3eeaaa54d5e1399039a2204f4a41109c61b0fd3"
    end

    resource "pandas" do
        url "https://files.pythonhosted.org/packages/9c/d6/9f8431bacc2e19dca897724cd097b1bb224a6ad5433784a44b587c7c13af/pandas-2.2.3.tar.gz"
        sha256 "4f18ba62b61d7e192368b84517265a99b4d7ee8912f8708660fb4a366cc82667"
    end

    resource "pdb2pqr" do
        url "https://files.pythonhosted.org/packages/c9/1e/d69094073b3f805b71594eddaf9ebf90f3d5e07492acc1e7adfccd0ea33d/pdb2pqr-3.6.2.tar.gz"
        sha256 "1dedf4d532756f35ae6f40d9e91a3f5dcf8932d2416f2ca05695a33d8e9131b0"
    end

    resource "rich-click" do
        url "https://files.pythonhosted.org/packages/3a/a9/a1f1af87e83832d794342fbc09c96cc7cd6798b8dfb8adfbe6ccbef8d70c/rich_click-1.8.3.tar.gz"
        sha256 "6d75bdfa7aa9ed2c467789a0688bc6da23fbe3a143e19aa6ad3f8bac113d2ab3"
    end

    resource "rich" do
        url "https://files.pythonhosted.org/packages/b3/78/87d00a1df7c457ad9aa0139f01b8a11c67209f27f927c503b0109bf2ed6c/rich-13.9.1.tar.gz"
        sha256 "097cffdf85db1babe30cc7deba5ab3a29e1b9885047dab24c57e9a7f8a9c1466"
    end

    resource "tabulate" do
        url "https://files.pythonhosted.org/packages/ec/fe/802052aecb21e3797b8f7902564ab6ea0d60ff8ca23952079064155d1ae1/tabulate-0.9.0.tar.gz"
        sha256 "0095b12bf5966de529c0feb1fa08671671b3368eec77d7ef7ab114be2c068b3c"
    end

    resource "textual" do
        url "https://files.pythonhosted.org/packages/2c/f0/b530868b21d68fd27a8a68f7511ef8573e0d63b359004c50da7b36b6c7b7/textual-0.81.0.tar.gz"
        sha256 "b438f7e6bb143fdec379170ccc6709a32d273bd998e70179537109263de7c818"
    end

    resource "toml" do
        url "https://files.pythonhosted.org/packages/be/ba/1f744cdc819428fc6b5084ec34d9b30660f6f9daaf70eead706e3203ec3c/toml-0.10.2.tar.gz"
        sha256 "b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f"
    end

    resource "trogon" do
      url "https://files.pythonhosted.org/packages/cf/ae/7367acac2194a215b092ba3fccde3b558272702110b8bb9bea164ab4ac42/trogon-0.6.0.tar.gz"
      sha256 "fd1abfeb7b15d79d6e6cfc9e724aad2a2728812e4713a744d975f133e7ec73a4"
    end

    def install
        system "pip3", "install", ".", "--prefix=#{libexec}"
        xy = Language::Python.major_minor_version Formula["python@3"].opt_bin/"python3"
        (bin/"bept").write <<~EOS
            #!/bin/bash
            PYTHONPATH="#{libexec}/lib/python#{xy}/site-packages" exec "#{libexec}/bin/bept" "$@"
        EOS
    end

    def caveats
        <<~EOS
            Successfully installed bept. You can run `bept --help` to get started!

            Thank you for installing Bept! It is built by IISc-Software iGEM 2024 Team.
            For more information, visit: https://github.com/IISc-Software-iGEM/bept
        EOS
    end

    test do
        system "#{bin}/bept", "-v"
    end
end

# homebrew-AnirudhG07

This repository serves as Homebrew tap for all formula's and packages I (AnirudhG07) create.
<br>Homebrew serves as an awesome package manager for MacOS only.

## Table of Contents

- [homebrew-AnirudhG07](#homebrew-anirudhg07)
  - [Downloading packages](#downloading-packages)
    - [Conflicting name](#conflicting-name)
- [Packages](#packages)
  - [1. Cheatshh](#1-cheatshh)
  - [2. Typeinc](#2-typeinc)
  - [2.5 Typeinc-mini](#25-typeinc-mini)
  - [3. Morseet](#3-morseet)
  - [4. Ntfyme](#4-ntfyme)
  - [5. Bept](#5-bept)
- [Older Versions of Packages](#older-versions-of-packages)

## Downloading packages

To download any packages using Homebrew from my tap, you have 2 options -

### Option 1: Direct Installation

You can simply directly install the package by running the following command-

```bash
brew install anirudg07/anirudhg07/formula
```

And you are done

### Option 2: Tap

First tap my directory by running the following command-

```bash
brew tap AnirudhG07/AnirudhG07
```

Once this is done, if you want to download a `formula` from `Formula` directory, you can run the following command-

```bash
brew install formula # formula.rb will be present in Formula
```

Now this should install the `formula` package in qyour device based on dependencies for each of the formula(mentioned in respective github repo's).

### Conflicting name

If Homebrew-core contains originally a formula/package with the same name as a package of mine, you can download the Homebrew-core one using-

```bash
brew install formula # where formula = package/tool/etc.
```

To install package of my name, you can run the following command-

```bash
brew install AnirudhG07/AnirudhG07/formula
```

This should download by package with the same name.

# Packages

This is a list of all my tools that can be downloaded using Homebrew using the above guidelines(which will also be mentioned in their respective github repo's too).

### 1. Cheatshh

This can be installed using

```bash
brew install anirudhg07/anirudhg07/cheatshh
```

Cheatshh is an interactive command-line cheatsheet manager, written in shell script. It is Unix mainly, though can be configured specially for windows.<br>Visit: https://github.com/AnirudhG07/cheatshh

### 2. Typeinc

This can be installed using - (after tapping this repo)

```bash
brew install anirudhg07/anirudhg07/typeinc
```

Typeinc is a really cool Typing Speed Test terminal tool. It is cross-platform since its mainly python.<br>Visit: https://github.com/AnirudhG07/Typeinc

### 2.5 Typeinc-mini

This can be installed using -

```bash
brew install anirudhg07/anirudhg07/typeinc-mini
```

This is a miniature version of Typeinc. It is cross-platform since its mainly python.<br>Visit: https://github.com/AnirudhG07/Typeinc-mini

### 3. Morseet

This can be installed using -

```bash
brew install anirudhg07/anirudhg07/morseet
```

morseet(slang for morse-it) is a command line tool to convert text to morse-code and vice versa. It has various features and customization options making it the only tool
you would go to. <br>Visit: https://github.com/AnirudhG07/morseet

### 4. Ntfyme

This can be installed using -

```bash
brew install anirudhg07/anirudhg07/ntfyme
```

ntfyme(notify-me) is a simple notification tool to notify yourself when a long running process ends with local ping, gmail, telegram, etc.
you would go to. <br>Visit: https://github.com/AnirudhG07/ntfyme

### 5. Bept

This can be installed using -

```bash
brew install anirudhg07/anirudhg07/bept
```

BEPT - Beginner friendly Electrostatics for Protein analysis Tool is made for analysing proteins which uses functionalities of pdb2pqr and apbs command line tools, but making them more beginner friendly. It is built by Anirudh Gupta along with Team IISc-Software 2024 and junior iGEMers from IISc Bangalore. <br>Visit: https://github.com/IISc-Software-iGEM/bept

# Older Versions of Packages

To download older versions of packages using Homebrew, you can see the ruby files in Oldr_Formulae directory.
<br>For example, to download an older version of `cheatshh`, check the `cheatshh` directory and select which version you would like to download. Download the ruby file and run the following-

```bash
brew install cheatshh_1.0.6.rb # Example version
```

This should download the package of the version you selected.

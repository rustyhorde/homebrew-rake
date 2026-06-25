class Rake < Formula
  desc "Configuration-driven build tool that runs Rakefile.toml targets"
  homepage "https://github.com/rustyhorde/cargo-rake"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.4.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rustyhorde/cargo-rake/releases/download/v0.4.1/rake-aarch64-apple-darwin.tar.gz"
      sha256 "2e2e01cb115b4ef76677d3270ef10898e57356e3d198cce9f6b2c86e840e9eff"
    end
  end

  def install
    bin.install "rake"
    bash_completion.install "rake.bash" => "rake"
    zsh_completion.install "_rake"
    fish_completion.install "rake.fish"
    man1.install "rake.1"
    (share/"doc/rake").install "Rakefile.toml.example" if File.exist?("Rakefile.toml.example")
  end

  test do
    system bin/"rake", "--version"
  end
end

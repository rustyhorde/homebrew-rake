class Rake < Formula
  desc "Configuration-driven build tool that runs Rakefile.toml targets"
  homepage "https://github.com/rustyhorde/cargo-rake"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rustyhorde/cargo-rake/releases/download/v0.5.2/rake-aarch64-apple-darwin.tar.gz"
      sha256 "fb3a4defe795e6eaae9cf86ffd353dad93c69c8e98a99fa9b0322812611af4c1"
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

class YabaiSb < Formula
  desc "Tiling window manager for macOS (Swift fork of yabai with an i3-style tree)"
  homepage "https://github.com/braun-steven/yabai-sb"
  url "https://github.com/braun-steven/yabai-sb/releases/download/v1.0.0/yabai-sb-v1.0.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  conflicts_with "asmvik/formulae/yabai", because: "both install a `yabai` binary"
  conflicts_with "koekeishiya/formulae/yabai", because: "both install a `yabai` binary"

  def install
    bin.install "bin/yabai"
    man1.install "doc/yabai.1"
    # examples/yabai.toml points its #:schema line at ../doc/yabai.schema.json.
    pkgshare.install "examples"
    (pkgshare/"doc").install "doc/yabai.schema.json"
    generate_completions_from_executable(bin/"yabai", "--generate-completion-script")
  end

  def caveats
    <<~EOS
      Copy the example configuration and check it:
        mkdir -p ~/.config/yabai
        cp #{opt_pkgshare}/examples/yabai.toml ~/.config/yabai/yabai.toml
        yabai --check-config

      Grant Accessibility permission to yabai, then let launchd start it at login:
        yabai --start-service

      When running as a launchd service logs will be found in:
        /tmp/yabai_<user>.[out|err].log

      If you are using the scripting addition (`[daemon] load_scripting_addition = true`),
      update your sudoers file after each upgrade:
        sudo visudo -f /private/etc/sudoers.d/yabai

      Build the configuration row by running:
        echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(\\which yabai) | cut -d " " -f 1) $(\\which yabai) --load-sa"

      See `man yabai` (CONFIGURATION, [daemon]) for the scripting addition setup.
    EOS
  end

  test do
    assert_match "yabai-sb-v#{version}", shell_output("#{bin}/yabai --version")
    system bin/"yabai", "--check-config", pkgshare/"examples/yabai.toml"
  end
end

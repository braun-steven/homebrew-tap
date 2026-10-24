# braun-steven/tap

Homebrew formulae for [yabai-sb](https://github.com/braun-steven/yabai-sb), a Swift fork of yabai
for macOS 27 on Apple Silicon.

```sh
brew install braun-steven/tap/yabai-sb
```

It conflicts with upstream's `asmvik/formulae/yabai`; uninstall that first. Releases are cut with
`just brew-release` in the yabai checkout, which bumps `Formula/yabai-sb.rb` here.

# braun-steven/tap

Homebrew formulae for [braun-steven/yabai](https://github.com/braun-steven/yabai), a Swift fork of yabai
for macOS 27 on Apple Silicon.

```sh
brew install braun-steven/tap/yabai
```

It conflicts with upstream's `asmvik/formulae/yabai`; uninstall that first. Releases are cut with
`just brew-release` in the yabai checkout, which bumps `Formula/yabai.rb` here.

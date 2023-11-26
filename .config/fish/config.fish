zoxide init fish | source
fish_add_path /opt/homebrew/bin
fish_add_path ~/scripts
fish_add_path ~/.cargo/bin

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.fish
. ~/.asdf/plugins/java/set-java-home.fish

starship init fish | source

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /Users/hassan/.ghcup/bin # ghcup-env

set -Ux JDTLS_JVM_ARGS "-javaagent:$HOME/lombok.jar"

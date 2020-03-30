cp ~/Library/Application\ Support/Code/User/settings.json ./VSCode/.
cp ~/Library/Application\ Support/Code/User/keybindings.json ./VSCode/.
cp ~/.config/fish/config.fish .

defaults write -g com.apple.mouse.scaling -float 5.0 # Increases maximum touchpad speed. requires logout/reboot.

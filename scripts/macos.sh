#! /bin/bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install openjdk
brew install node
brew install git
brew install --cask visual-studio-code
brew update

code --install-extension salesforce.salesforcedx-vscode
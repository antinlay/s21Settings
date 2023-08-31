#!/bin/bash

# Download homebrew
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew;
# Update brew and install dependiences
brew install lcov gcovr python tesseract ffmpeg node fcgi prometheus grafana

# ln -s space_notify.app ~/Library/LaunchAgents/space_notify.plist
# ln -s start_music.app ~/Library/LaunchAgents/start_music.plist
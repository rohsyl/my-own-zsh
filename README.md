# An effective terminal

# Getting started

Install zsh

```jsx
sudo apt install zsh
```

Set zsh as the default shell

```jsx
chsh -s $(which zsh)
```

Install oh my zsh framework

```jsx
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

# Plugins

You can enable the following plugins that are available out of the box

```jsx
plugins=(git npm node nvm docker)
```

If you install plugins into WSL, make sure to disable autocrlf git feature.

```jsx
git config --global core.autocrlf false
```

## zsh-autosuggestion

Install zsh-autosuggestions

```jsx
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Update .zshrc

```jsx
plugins=(... zsh-autosuggestions)
```

## zsh-syntax-highlighting

Install zsh-syntax-highlighting

```jsx
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Update .zshrc

```jsx
plugins=(... zsh-syntax-highlighting)
```

## zsh-bat

A batter cat

Install bat

```jsx
sudo apt install bat
```

Install zsh-bat

```jsx
git clone https://github.com/fdellwing/zsh-bat.git $ZSH_CUSTOM/plugins/zsh-bat
```

Update .zshrc

```jsx
plugins=(... zsh-bat)
```
# ALias

```
alias lzd='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v /yourpath/config:/.config/jesseduffield/>
alias dive="docker run -ti --rm  -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive"
alias ccat="/usr/bin/cat"
```

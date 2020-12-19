# dotfiles
My dotfiles

## Waarschuwing

Dit zijn mijn persoonlijke instellingen en mijn scripts voor eigen gebruik. Gebruik ze voor eigen risico.

## 🎬 Voorbereiding

### 🍏 macOS

Om Ansible te kunnen installeren op macOS is Python 3 nodig. Dit is standaard niet beschikbaar en moet daarom eerst apart worden geinstalleerd op een 'kale' machine. De eenvoudigste manier om dit te doen is met Homebrew. Dit levert helaas een cirkelredenering op, want Ansible kan ook [Homebrew installeren](https://brew.sh/).

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install python3
```

### Installeer Ansible

Installeer Ansible

    pip3 install ansible

Kloon deze repository

    git clone git@github.com:metbril/dotfiles.git ~/Code/dotfiles

## Gebruik

```sh
cd ~/Code/dotfiles/ansible
ansible-galaxy install -r requirements.yml
ansible-playbook macos.yml --ask-become-pass
```

## macOS

As of macOS 10.15 Catalina `zsh` has become the default shell.

## Bronnen

Een overzicht met handige en inspirerende bronnen om uit te putten.

- [dotfiles](https://dotfiles.github.io/) - Onofficiële gids over dotfiles op GitHub.
- [Mathias Bynens's dotfiles](https://github.com/mathiasbynens/dotfiles) - Inclusief zijn legendarische script met verstandige default instellingen voor macOS.
- https://github.com/mateusrevoredo/dotfiles
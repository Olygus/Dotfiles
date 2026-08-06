<div align="center">

# Dotfiles

[![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793d1?style=for-the-badge&logo=arch-linux&logoColor=white)](https://archlinux.org/)
[![Hyprland](https://img.shields.io/badge/Hyprland-00b4d8?style=for-the-badge&logo=hyprland&logoColor=white)](https://wiki.hyprland.org/)
[![Neovim](https://img.shields.io/badge/Neovim-57a143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)
[![Fish](https://img.shields.io/badge/Fish-4a8fe7?style=for-the-badge&logo=fishshell&logoColor=white)](https://fishshell.com/)
[![Kitty](https://img.shields.io/badge/Kitty-1e1e2e?style=for-the-badge&logo=kitty&logoColor=white)](https://sw.kovidgoyal.net/kitty/)
[![Waybar](https://img.shields.io/badge/Waybar-222222?style=for-the-badge&logo=wayland&logoColor=white)](https://github.com/Alexays/Waybar)
[![Rofi](https://img.shields.io/badge/Rofi-111111?style=for-the-badge&logo=linux&logoColor=white)](https://davatorium.github.io/rofi/)
[![Yazi](https://img.shields.io/badge/Yazi-0f172a?style=for-the-badge&logo=files&logoColor=white)](https://yazi-rs.github.io/)
[![Fastfetch](https://img.shields.io/badge/Fastfetch-2d3748?style=for-the-badge&logo=terminal&logoColor=white)](https://github.com/fastfetch-cli/fastfetch)

Personal Linux configuration for my main workstation.

This repo is intentionally small and focused.

Arch · Hyprland · Kitty · Fish · Starship · Waybar · Rofi · Neovim · Yazi · Fastfetch

</div>

---

## Overview

These configs for tools like Hyprland, Kitty, Fish, Starship,
Waybar, Rofi, Neovim, Yazi, Fastfetch, and related desktop pieces.

- [apps.md](apps.md) lists the packages I use on this machine.
- [setup.sh](setup.sh) installs those packages and copies the tracked config trees into `~/.config`.

This is NOT a universal installer. 

## Install

Run the bootstrap script from the repository root:

```sh
./setup.sh
```

The script expects an Arch-based system with either `yay` or `paru` available.

---

<div align="center">

[![License](https://camo.githubusercontent.com/3a15111ae5c312d0823d7cf3d1eabf7d149b59fd1fa053f5ca92e1641cd85e6a/68747470733a2f2f696d672e736869656c64732e696f2f6769746875622f6c6963656e73652f4e6163686f4f73656c6c612f446f7446696c65732d56343f7374796c653d666c61742d737175617265)](LICENSE)

Made by Olygus based on Nacho's

[NachoOsella/DotFiles-V4](https://github.com/NachoOsella/DotFiles-V4)

[Olygus/Dotfiles](https://github.com/Olygus/Dotfiles)

Portions adapted from upstream remain under their original license terms.

</div>
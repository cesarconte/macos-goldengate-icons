<img src="logo.png" alt="Logo" align="right" /> # macOS Golden Gate Icon Theme

High-fidelity macOS squircle icon theme curated and enhanced for **KDE Plasma 6 (Qt6 / Wayland)** and **CachyOS Linux**.

---

## ✨ Features & Enhancements

-  **macOS Squircle Design:** Complete application and system icon coverage following macOS HIG aesthetics.
- 🛡️ **Zero Broken Icons (Strict Fallback):** Configured with `Inherits=breeze,breeze-dark,hicolor` so any non-standard Linux app icon falls back to KDE Plasma 6's native Breeze theme seamlessly.
- 🚀 **CachyOS & Arch Linux Integration:** Includes native squircle icons for CachyOS ecosystem tools (`cachyos-hello`, `KernelManager`, `LimineSnapperSync`, `cachy-update`, `brave-origin`).
- 🖥️ **Full Wayland & Launchpad Support:** Fully tested with `macos-dock` and `p-connor.plasma-drawer` (macOS-style Launchpad).
- ⚡ **Automated Plasma 6 Cache Purge:** Built-in script to update `kdeglobals`, rebuild KSycoca database (`kbuildsycoca6 --noincremental`), and cleanly reload `plasmashell` and `macos-dock`.

---

## 📦 Installation

To install into your user directory (`~/.local/share/icons`):

```bash
git clone https://github.com/cesarconte/macos-goldengate-icons.git
cd macos-goldengate-icons
./install.sh
```

### Apply Immediately to KDE Plasma 6 & GTK

To apply the theme, refresh KDE's Sycoca cache, and reload running desktop components:

```bash
./apply-plasma.sh
```

---

## 🛠️ Options

```text
Usage: ./install.sh [OPTIONS...]

OPTIONS:
  -d, --dest DIR        Specify destination directory (Default: ~/.local/share/icons)
  -n, --name NAME       Specify theme name (Default: WhiteSur)
  -t, --theme VARIANT   Color variant [default/purple/pink/red/orange/yellow/green/grey/all]
  -a, --alternative     Install alternative redesigned icons
  -b, --bold            Install bold panel icons (for HiDPI / 4K displays)
  -p, --kde-plasma      Replace Apple logo with KDE Plasma logo
  -r, --remove          Uninstall theme
  -h, --help            Show help
```

---

## ⚖️ License & Credits

- Based on the foundational work by [Vince Liuice](https://github.com/vinceliuice/WhiteSur-icon-theme).
- Licensed under the **GNU General Public License v3.0** (`COPYING`).

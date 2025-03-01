# homebrew-mac-storage-manager

**A Homebrew tap for [Mac Storage Manager](https://github.com/NarekMosisian/mac-storage-manager) — a cross-platform shell script that helps you reclaim disk space by identifying and managing large applications on macOS and Linux.**

## Table of Contents
- [About This Tap](#about-this-tap)
- [Installation](#installation)
- [Usage](#usage)
- [Updating and Uninstalling](#updating-and-uninstalling)
- [More Information](#more-information)
- [License](#license)

---

## About This Tap

This repository provides a **Homebrew tap** so that you can easily install the Mac Storage Manager tool via Homebrew.  
The script itself is maintained in the main project repository:

- **Main Project**: [mac-storage-manager](https://github.com/NarekMosisian/mac-storage-manager)  
  There, you will find:
  - Source code and documentation
  - Screenshots and a YouTube demo video
  - A detailed guide on how to use the script

---

## Installation

1. **Add the Tap**

```bash
brew tap NarekMosisian/mac-storage-manager
```

2. **Install the Formula**

```bash
brew install mac-storage-manager
```

## Usage

1. **Run the Storage Manager**

```bash
mac-storage-manager
```

2. **Follow the Interactive Prompts**

- You may be asked if you want to use `sudo find` for a comprehensive system-wide scan (which can take a while).
- An interactive menu (using whiptail dialogs) will appear, allowing you to select applications and associated files to remove.

> **Tip:** If you encounter issues or want more details about the script’s functionality, please check the [main project’s README](https://github.com/NarekMosisian/mac-storage-manager).

## Updating and Uninstalling

- **Update**

```bash
brew update
brew upgrade mac-storage-manager
```

This will fetch and install the latest version once it’s published in this tap.

- **Uninstall**

```bash
brew uninstall mac-storage-manager
brew untap NarekMosisian/mac-storage-manager
```

This removes the tool and optionally the tap itself.

## More Information

- **Main Project**: [mac-storage-manager](https://github.com/NarekMosisian/mac-storage-manager)  
  Here you will find a detailed usage guide, screenshots, demo videos, and additional notes about limitations and dependencies.

- **Questions or Feedback**  
  Please open an issue in the [main project repository](https://github.com/NarekMosisian/mac-storage-manager/issues) if you find any bugs or have suggestions.

## License

The script is licensed under the **GNU Affero General Public License v3.0 (AGPLv3)**.  
For details, see the [LICENSE file in the main project](https://github.com/NarekMosisian/mac-storage-manager/blob/main/LICENSE).

---

**Enjoy cleaning up your disk space!**  
With this tap, you can easily install and update Mac Storage Manager via Homebrew.
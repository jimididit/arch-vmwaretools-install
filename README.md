# VMware Tools Installer Script

This Bash script automates the installation process of VMware Tools on Arch Linux systems.

## Prerequisites

- This script assumes you are running it on an Arch Linux system.
- You must have root privileges (`sudo`).

## Installation

1. Clone this repository or download the script directly:

    ```bash
    git clone https://github.com/jimididit/arch-vmwaretools-install.git
    ```

2. Make the script executable:

    ```bash
    chmod +x arch_vmwaretools_install.sh
    ```

3. Run the script as root:

    ```bash
    sudo ./arch_vmwaretools_install.sh
    ```

## Usage

- When prompted, ensure that VMware Tools is installed before proceeding.
- Follow the instructions provided by the script during the installation process.

## Notes

- This script assumes that the VMware Tools installation package is available on a mounted CD-ROM.
- Ensure that the CD-ROM containing the VMware Tools package is mounted before running this script.

## License

[MIT License](LICENSE)



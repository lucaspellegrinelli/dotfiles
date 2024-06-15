# dotfiles

This repository contains my configuration files for various development tools and applications.

## Installation

To set up these dotfiles on your system, use [GNU Stow](https://www.gnu.org/software/stow/). 

### Steps:

1. Clone this repository to your home directory (or any directory you prefer):
    ```bash
    git clone https://github.com/lucaspellegrinelli/dotfiles.git
    ```

2. Navigate into the cloned repository:
    ```bash
    cd dotfiles
    ```

3. Run `stow` to create symbolic links for all configuration files:
    ```bash
    stow */
    ```

This will symlink the configuration files to their appropriate locations in your home directory.

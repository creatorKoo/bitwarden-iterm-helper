# bitwarden-iterm-helper

for iterm2 on MacOS

* using bitwarden vault item infomation
    * ssh connect
    * autofill password
    * autofill otp

## Requirements

* [iTerm2](https://iterm2.com/)
* [bitwarden-cli](https://github.com/bitwarden/cli)
    * if you have brew
        ```
        $ brew install bitwarden-cli
        ```
* [jq](https://stedolan.github.io/jq/)
    * if you have brew
        ```
        $ brew install jq
        ```

## how to use

1. Check bitwarden-cli install path
    ```
    $ which bw
    /usr/local/bin/bw
    ```
    * Check response body same. If not, please let me know through new issue.
1. bitwarden-cli login. This need only once. If you are already login, then skip this step.
    ```
    $ bw login
    ```
1. git clone to home directory. or download and unzip home directory.
    * you must clone or unzip to home directory
    ```
    $ cd ~/
    $ git clone https://github.com/creatorKoo/bitwarden-iterm-helper.git
    ```
1. Save your ssh server info to bitwarden item by below rule.
    * name field
        * your item name
    * username field
        * ssh username
    * password field
        * ssh password
    * url 1 field
        * server address (with port)
    * totp field
        * ssh totp (optional)
    * example
        * ![bitwarden-item-example](https://raw.githubusercontent.com/creatorKoo/bitwarden-iterm-helper/17b1e6dd495ca24a12473a0ce44b36f76a9184be/img/bitwarden-item-example.png)
        It's same below command
        ```
        $ ssh ssh-user-name:ssh-password@ssh.server.domain.com
        ```
1. save bitwarden master password to iTerm
    1. Open iTerm
    1. Window -> password manager
    1. Add bitwarden master password
        * ![iTerm-password-manager-example](https://raw.githubusercontent.com/creatorKoo/bitwarden-iterm-helper/main/img/iTerm-password-manager-example.png)
1. Add iTerm profile and trigger
    1. Open preferences and go profiles tab
    1. Make new profile for helper
    1. Set auto ssh connect
        * ~/bitwarden-iterm-helper/ssh_connect.sh "<ssh_info_bitwarden_item_name>"
        * ![iTerm-profile-image-example](https://raw.githubusercontent.com/creatorKoo/bitwarden-iterm-helper/main/img/iTerm-profile-image-example.png)
    1. profile -> Advanced -> Triggers -> Edit
        * ![iTerm-profile-advanced-tab-example](https://raw.githubusercontent.com/creatorKoo/bitwarden-iterm-helper/main/img/iTerm-profile-advanced-tab-example.png)
        * ![iTerm-profile-triggers-example](https://raw.githubusercontent.com/creatorKoo/bitwarden-iterm-helper/main/img/iTerm-profile-triggers-example.png)
        * add
            * Master password:
            * Open Password Manager
            * <bitwarden_master_password_item_name_from_password_manager>
            * check
        * add
            * Password:
            * Run Coprocessor
            * ~/bitwarden-iterm-helper/get_pw.sh "<ssh_info_bitwarden_item_name>"
            * check
        * add optional
            * <your_otp_request_message>:
            * Run Coprocessor
            * ~/bitwarden-iterm-helper/get_otp.sh "<ssh_info_bitwarden_item_name>"
            * check
1. Open profile made before
    * Profiles -> Open Profiles -> select "profile name created in the previous step"
    * (known issue) The password manager window appears twice, and the second one is ignored by pressing the esc key.
    * enjoy autofill
    * ![bitwarden-iterm-helper-example](https://raw.githubusercontent.com/creatorKoo/bitwarden-iterm-helper/main/img/bitwarden-iterm-helper-example.gif)

## If Questions ?

Make issue ticket. Thank you.
# bitwarden-iterm-helper

for iterm2 on MacOS

* using bitwarden vault item infomation
    * ssh connect
    * autofill password
    * autofill otp

## Requirements

* [bitwarden-cli](https://github.com/bitwarden/cli)
* [iTerm2](https://iterm2.com/)
* [jq](https://stedolan.github.io/jq/)

## how to use

1. bitwarden-cli login. This need only once. If you already login, then skip this step.
    ```
    $ bw login
    ```
1. git clone to home directory. or download and unzip home directory. 
    ```
    $ cd ~/
    $ git clone https://github.com/creatorKoo/bitwarden-iterm-helper.git
    ```
1. set your bitwarden item info by below rule.
    * ssh username
        * name field
    * ssh password
        * password field
    * ssh url
        * first url field
    * ssh otp
        * totp field
1. set iterm profile and trigger
    1. Make new profile
    1. profile -> General -> Command -> Command
        * ~/bitwarden-iterm-helper/ssh_connect.sh "<your_bitwarden_item_name>"
    1. profile -> Advanced -> Triggers -> Edit
        * add
            * Master password:
            * Open Password Manager
            * <your_own_bitwarden_password_item>
            * check
        * add
            * Password:
            * Run Coprocessor
            * ~/bitwarden-iterm-helper/get_pw.sh "<your_bitwarden_item_name>"
            * check
        * add optional
            * <your_otp_request>:
            * Run Coprocessor
            * ~/bitwarden-iterm-helper/get_otp.sh "<your_bitwarden_item_name>"
            * check
1. open profile make before
    * enjoy autofill

## If Questions ?

Make issue ticket. Thank you.
# Add Homebrew's executable directory to the front of the PATH
function brsw {
    # You can pick a foreground (text) color between black, white, yellow, green, red, blue, cyan, and magenta
    # %n is the username of your account; %m is the MacBook’s model name; %0~ means the current working directory path where the ~ strips the $HOME directory location;
    PS1='%F{magenta}%n@%m%f %0~$'
    export PATH=/opt/goinfre/$USERNAME/homebrew/bin:$PATH
}
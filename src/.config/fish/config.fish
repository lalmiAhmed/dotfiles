### SUPPRESS INITIAL GREETING MESSAGE ###
set fish_greeting

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
    fish_vi_key_bindings
end
### END OF VI MODE ###

# Set the cursor shapes for the different vi modes.
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_visual block.

### ALIASES ###
# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# switch between shells
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

### SETTING THE STARSHIP PROMPT ###
# Install using 	-> curl -fsSL https://starship.rs/install.sh | bash
starship init fish | source

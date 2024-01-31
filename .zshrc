if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

ZSH_DISABLE_COMPFIX=true
ZSH_THEME="powerlevel10k/powerlevel10k"
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ffff00,bold"

plugins=(
  autojump
  colored-man-pages
  vi-mode
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias -g G='| grep'
alias cp='cp -i'
alias cpenv="echo \"source <(sed -E -n 's/[^#]+/export &/ p' /opt/elasticbeanstalk/deployment/custom_env_var) && cd /var/app/current && bundle exec rails c\" | pbcopy"
alias dt="node --trace-warnings --inspect-brk node_modules/.bin/jest --runInBand $1"
alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gapa='git add -p'
alias gb='git branch'
alias gbD='git branch -D'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbdm="git branch --merged | egrep -v \"(^\*|develop|master)\" | xargs git branch -d"
alias gbr='git branch -r'
alias gc!='git commit -v --amend'
alias gc='git commit -v -m'
alias gca!='git commit -v -a --amend'
alias gca='git commit -v -a -m'
alias gbc='git checkout -b'
alias gcf='git config --list'
alias gcfd='git clean -fd'
alias gcl='git clone'
alias gcn!='git commit -v --no-edit --amend'
alias gcna!='git commit -v -a --no-edit --amend'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gd='git diff'
alias gds='git diff --staged'
alias gf='git fetch'
alias gfp='git fetch --prune'
alias gg='git grep'
alias gl="git log --pretty=format:'%C(yellow)%h%x09%Cred%ad%x09%Cblue%an%x09%Cgreen%d%x09%Creset%s' --date=short"
alias glg="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias gm='git merge'
alias gma='git merge --abort'
alias gp='git push'
alias gpc='git push -u origin $(git_current_branch)'
alias gpf='git push --force'
alias gpc='git push -u origin $(git_current_branch) --force'
alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias gru='git reset --'
alias grsh='git reset --soft HEAD~'
alias gs='git stash'
alias gsa='git stash pop'
alias gsc='git stash clear'
alias gsx='git stash drop'
alias gsl='git stash list'
alias gsp='git stash push'
alias gss='git stash --include-untracked'
alias gst='git status --short'
alias mv='mv -i'
alias r='rails'
alias rc='rails c'
alias rdb='rails dbconsole'
alias rdc='rake db:create'
alias rdd='rake db:drop'
alias rdm='rake db:migrate'
alias rdr='rake db:rollback'
alias rds='rake db:seed'
alias rg='rails generate'
alias rgm='rails generate migration'
alias rm='rm -i'
alias rr='rails routes'
alias rrE='rails routes -E'
alias rrEg='rails routes -E --grep'
alias rs='rails server'
alias sw="rake rswag:specs:swaggerize PATTERN=\"spec/swagger/**/*_spec.rb\""
alias sz='source $HOME/.zshrc'
alias vz='v $HOME/.zshrc'
alias t="npm run test"
alias v='nvim'
alias cr='npx cypress run'
alias co='npx cypress open'
alias gz='git archive --format=zip --output now-insurance-api.zip HEAD'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export PATH="/usr/local/bin:$PATH"

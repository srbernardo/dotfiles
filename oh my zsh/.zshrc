export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  gitfast
  last-working-dir
  common-aliases
  history-substring-search
  ssh-agent
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Cores do tema Dracula
dracula_background="%F{235}"  # Fundo escuro
dracula_foreground="%F{231}"  # Texto branco
dracula_purple="%F{141}"      # Roxo
dracula_cyan="%F{80}"         # Ciano
dracula_green="%F{84}"        # Verde
dracula_orange="%F{215}"      # Laranja
dracula_red="%F{203}"         # Vermelho
# Comandos válidos (verde neon)
emoji_angel="🛰️"       # Para comandos corretos
emoji_demon="🚨"       # Para comandos errados
emoji_galaxy="🌌"      # Ícone de galáxia

# Comandos válidos (verde neon)
ZSH_HIGHLIGHT_STYLES[command]='fg=#50fa7b'

# Comandos inválidos (vermelho)
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff5555'

# Comandos internos do shell (ciano)
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#8be9fd'

# Alias (roxo)
ZSH_HIGHLIGHT_STYLES[alias]='fg=#bd93f9'

# Caminhos de arquivos (laranja)
ZSH_HIGHLIGHT_STYLES[path]='fg=#ffb86c'

# Substituições glob (rosa)
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#ff79c6'

# Variáveis (amarelo)
ZSH_HIGHLIGHT_STYLES[assign]='fg=#f1fa8c'
# Mensagem de boas-vindas
echo "🌌  Hey $USER -> Let's code our life? ☄️"

# Configuração do histórico
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS  # Ignora comandos duplicados
setopt HIST_FCNTL_LOCK       # Melhora desempenho no histórico

alias console="docker compose exec app rails c"

alias deploy-staging='\
  BRANCH=$(git branch --show-current); \
  git pull origin "$BRANCH"; \
  git push origin "$BRANCH"; \
  git checkout staging; \
  git pull origin staging; \
  git pull origin "$BRANCH"; \
  git push origin staging; \
  git checkout "$BRANCH"
'

alias deploy-heroku='\
  BRANCH=$(git branch --show-current); \
  git pull origin "$BRANCH"; \
  git push origin "$BRANCH"; \
  git checkout staging; \
  git pull origin staging; \
  git pull origin "$BRANCH"; \
  git push origin staging; \
  git push heroku-staging-v1 staging:master; \
  git checkout "$BRANCH"
'

export BUNDLER_EDITOR=windsurf
export EDITOR=windsurf
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

rbenv ()
{
    local command;
    command="${1:-}";
    if [ "$#" -gt 0 ]; then
        shift;
    fi;
    case "$command" in
        rehash | shell)
            eval "$(rbenv "sh-$command" "$@")"
        ;;
        *)
            command rbenv "$command" "$@"
        ;;
    esac
}

ZSH_DISABLE_COMPFIX=true

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


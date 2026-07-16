#compdef dac
# Bash completion for dac

_dac() {
  local cur prev cmd
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  if [[ ${COMP_CWORD} -eq 1 ]]; then
    COMPREPLY=( $(compgen -W "render render-all test list doctor version help" -- "$cur") )
    return 0
  fi

  cmd="${COMP_WORDS[1]}"

  case "$prev" in
    --source|--source-dir|--output|--out|--output-dir)
      COMPREPLY=( $(compgen -d -- "$cur") )
      return 0
      ;;
    --engine|-e)
      COMPREPLY=( $(compgen -W "py puml uml mermaid dot d2" -- "$cur") )
      return 0
      ;;
    --ext|--inputext)
      COMPREPLY=( $(compgen -W "py puml puml uml mermaid dot d2 mmd" -- "$cur") )
      return 0
      ;;
    *)
      ;;
  esac

  case "$cmd" in
    render)
      if [[ "$cur" == -* ]]; then
        COMPREPLY=( $(compgen -W "--source --source-dir --output --out --output-dir --engine -e --name -n --ext --inputext --help --version" -- "$cur") )
        return 0
      fi
      ;;
    render-all|test)
      if [[ "$cur" == -* ]]; then
        COMPREPLY=( $(compgen -W "--source --source-dir --output --out --output-dir --help --version" -- "$cur") )
        return 0
      fi
      ;;
    list|doctor)
      if [[ "$cur" == -* ]]; then
        COMPREPLY=( $(compgen -W "--source --source-dir --output --out --output-dir --help --version" -- "$cur") )
        return 0
      fi
      ;;
    *)
      if [[ "$cur" == -* ]]; then
        COMPREPLY=( $(compgen -W "--help --version" -- "$cur") )
        return 0
      fi
      ;;
  esac
}

complete -F _dac dac

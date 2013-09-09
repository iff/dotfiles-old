alias reload!='. ~/.zshrc'

alias 'l=ls -alF'
alias 'la=ls -la'
alias 'll=ls -l'
alias 'ls-l=ls -l'
alias 'md=mkdir -p'
alias 'open=xdg-open'
alias 'mutt=TERM=rxvt-256-color /home/iff/local/src/mutt-1.5.21/mutt'

# ssh
alias 'gof=ssh -YCAt ineichen@llcx.psi.ch ssh -YCA ineichen@felsim00.psi.ch'
alias 'gow=ssh -YCA iff@yvesineichen.com'

# mpicxx wrappers
alias 'mpicxx-clang=OMPI_CXX=clang++ mpicxx'
alias 'mpicxx-gcc=OMPI_CXX=g++ mpicxx'

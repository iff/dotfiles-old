if exists("did_load_filetypes")
      finish
endif

augroup filetypedetect
      au BufRead,BufNewFile *.ledger                  setfiletype ledger
      au BufRead,BufNewFile *.mkd                     setfiletype mkd
      au BufRead,BufNewFile *.rem                     setfiletype remind
      au BufRead,BufNewFile README*,NOTES*,TODO*      setfiletype text
augroup END

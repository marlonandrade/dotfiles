augroup filetypedetect 
  au BufNewFile,BufRead *.html.erb set filetype=html.ruby.eruby
  au BufNewFile,BufRead *.js.erb set filetype=javascript.ruby 
  au BufNewFile,BufRead *.r.erb set filetype=r.ruby 
augroup end

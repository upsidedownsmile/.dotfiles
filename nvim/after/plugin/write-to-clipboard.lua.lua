function WriteToClipboard(text, message)
  local is_tmux = os.getenv("TMUX")
  local ssh_connection = os.getenv("SSH_CONNECTION")
  if not is_tmux and not ssh_connection then
    -- Not in a SSH session, nothing to do, copy will work anyway
    return
  end

  local filename = "/tmp/vim_clipboard.tmp"
  local file = io.open(filename, "w")
  file:write(text)
  file:close()
  if is_tmux then
    -- Copy to each client because there is no way in tmux to differentiate only current client
    os.execute(
      "for pts in $(tmux list-clients -F '#{client_tty}'); do echo -ne $(cat < "
        .. filename
        .. " | base64 -w0 | sed 's/\\(.*\\)/\\\\e]52;c;\\0\\\\x07/') > $pts; done"
    )
  else
    os.execute(
      "echo -ne $(cat < " .. filename .. " | base64 -w0 | sed 's/\\(.*\\)/\\\\e]52;c;\\0\\\\x07/') > " .. ssh_connection
    )
  end
  os.remove(filename)

  print(message)
end

vim.cmd([[command -nargs=1 WriteToClipboard call v:lua.WriteToClipboard(<args>)]])
vim.cmd([[
au TextYankPost * if v:event.operator is 'y' && (v:event.regname is '+' || v:event.regname is '') | call v:lua.WriteToClipboard(join(v:event.regcontents, "\n")) | endif

" CTRL-X and SHIFT-Del are Cut
" vnoremap <C-X> "+x
" vnoremap <S-Del> "+x
" CTRL-C and CTRL-Insert are Copy
" vnoremap <C-C> "+y
" vnoremap <C-Insert> "+y
" CTRL-V and SHIFT-Insert are Paste
" map <C-V>		"+gP
" map <S-Insert>		"+gP
" cmap <C-V>		<C-R>+
" cmap <S-Insert>		<C-R>+

" source $VIMRUNTIME/mswin.vim
]])

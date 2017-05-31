My Tmux Cheatsheet
==================


as configured in my .tmux_conf (https://github.com/bdelonglee/config_files/blob/master/dotfiles/.tmux.conf)


## Sessions 

### Outside Tmux

    tmux
    tmux -2                         support for powerline features
    tmux -2 new -s myname           new named session
    tmux ls                         list sessions
    tmux -2 a                       attach to last session
    tmux -2 a -t myname             attach to myname session
    tmux kill-session -t myname     kill the named session

### Inside Tmux, `ctrl+a` as prefix

    :new<CR>        new session
    s               list sessions
    $               name sessions
    d               detach session

## Windows

    c       create window
    w       list windows
    ,       name window
    &       kill window
    1 ...   switch to window 1, ..., 10   (0 = 10)
    l       `last` previously used window
    n       next window
    p       previous window
    >       move window to the right (in windows's list)
    <       move to the left (in windows's list)
    f       find window

## Panes

    |       vertical split
    -       horizontal split
    q       show pane numbers (when the numbers show up type the key to goto that pane)
    x       kill pane
    z       toggle zoom pane (fullscreen like)
    Up      break pane into window 
    Down    restore pane from window

## Managing Split Panes

    C-h         move left
    C-Left
    C-j         move down
    C-Down
    C-k         move up
    C-Up
    C-l         move right
    C-Right

    {           move current to pane to the left
    }           move current pane to the right
    C-o         move

    

## Misc

    t       big clock
    ?       list shortcuts
    :       prompt

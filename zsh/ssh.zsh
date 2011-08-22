zstyle ':completion:*:*:(ssh|scp|sftp):*:*' hosts `grep -E "Host [^\*]" ~/.ssh/config | sed "s/^Host //" | tr ' ' '\n'`
zstyle ':completion:*:*:(ssh|scp|sftp):*:*' users

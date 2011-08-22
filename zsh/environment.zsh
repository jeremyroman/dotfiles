export PATH=$PATH:/usr/local/texlive/2007/bin/i386-darwin
export NODE_PATH=/usr/local/lib/node

# select the best available editor

editors=(mvim gvim vim vi)

for editor in $editors; do
  editor=`which $editor || continue`
  if [ -x "$editor" ]; then
    export EDITOR=$editor
    export VISUAL=$editor
    break
  fi
done


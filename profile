export GNUPGHOME=$HOME/.config/gnupg

// WSL specific processes.
if { uname -a | grep -qE microsoft; }; then
  export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | head -n1 | cut -d' ' -f2):0
fi

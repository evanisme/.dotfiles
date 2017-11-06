# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
function kill_process() {
	while pgrep $1 > /dev/null; do
		pkill -o $1
		sleep 1
	done
}

alias reboot='kill_process chrome; reboot'

# added by Miniconda3 installer
export PATH="/home/evan/miniconda3/bin:$PATH"

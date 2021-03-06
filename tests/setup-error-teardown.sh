#
# test setup error teardown
#
# Make sure that we're properly cleaning up partially built up state by
# hitting errors while setting up subsystems during mount.
#

t_require_commands sleep killall

echo "== interrupt waiting mount with no options"
t_umount_all
mount -t scoutfs $T_B0 $T_M0 &
pid="$!"
sleep .1
kill $pid
# silence terminated message
wait "$pid" 2> /dev/null
t_mount_all

t_pass

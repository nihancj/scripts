#!/bin/sh

# Like dmenu-custom but without dmenu
# To launch programs from ~/dmscripts/dmenu-run.d
# directly from the shell.

dir="$HOME/dmscripts/dmenu-custom/apps.d"
program="$1"


if [ -r "$dir/$program.cli" ]; then
        actual_command="$(cat "$dir/$program.cli")"
        cmd=${actual_command%% *}
        arguments=${actual_command#* }
        [ $cmd = $arguments ] && is_arguments=false || is_arguments=true
        if $is_arguments; then
            $TERMINAL -e $cmd $arguments
        else
            $TERMINAL -e $cmd
        fi

elif [ -r "$dir/$program.run" ]; then
        actual_command=$(cat "$dir/$program.run")
        printf '%s' "$actual_command" | /bin/sh

else
        $program | /bin/sh -s &
fi

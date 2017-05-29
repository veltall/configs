#!/bin/bash

T=" "

FG='m'
# echo -n "  "
for BG in 40m 41m 42m 43m;
	do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
done

# echo -en "\n  "
# for BG in 44m 45m 46m 47m;
	# do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
# done

# echo -en "\n  "
# for BG in 44m 45m 46m 47m;
	# do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
# done

echo;



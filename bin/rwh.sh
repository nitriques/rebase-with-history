#!/bin/sh

ED="$(dirname $0)/rwh.js";
GED="$GIT_EDITOR";

for i in "$@"
do
case $i in
	--next)
		export GIT_EDITOR="${ED}";
		git commit
	;&
	--continue)
		export GIT_EDITOR="${ED}";
		git rebase --continue
	;;
	--skip)
		export GIT_EDITOR="${ED}";
		git rebase --skip
	;;
	--version)
		node $ED --version;
		exit;
	;;
	--help)
		node $ED --help;
		exit;
	;;
	*)
		export GIT_EDITOR="${ED} ${@:2}";
		git rebase -i $1
	;;
esac
done

if [ -z "$1" ]; then
	node $ED --help;
fi

export GIT_EDITOR=$GED;

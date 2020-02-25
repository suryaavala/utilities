#!/bin/bash


function git_status () {
	if [[ -d $1/.git ]]
	then
		return $(git status $1)
	else
		return ""
	fi
}

function traverse () {
	list=$(ls "${1}")
	for p in $list
	do
		#echo "${p}: $(git_status ${p})"
		if [[ -d ${p} ]]
		then
			cd $p
			traverse "."
		fi
	done	
}

traverse "."

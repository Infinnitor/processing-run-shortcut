#!/bin/bash
echo "Under construction"
exit

final_cmd="processing-java --sketch="

sketch_name=$1
default="N"

if [ ! $1 ] || [[ $1 == -* ]]; then
	default="Y"
	sketch_name="."
fi

abs_path=$(realpath $sketch_name)

final_cmd+=$abs_path

if [ ! $2 ] && [ $default == "N" ]; then
	final_cmd+=" --run"
else
	for var in "$@"
	do
		final_cmd+=" "
		final_cmd+=$var
	done
fi

echo $final_cmd
eval $final_cmd

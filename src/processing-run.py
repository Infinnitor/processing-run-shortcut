#!/usr/bin/python3
import sys
import os
from shutil import which


def print_help():
	print("")
	print("processing-run help text:")
	print("Run a given sketch path with processing-java. The syntax for arguments is less confusing (in my humble opinion)")
	print("")
	print("Options:")
	print("--processing-run-help: Show this help text (this is the only option)")
	print("")
	sys.exit()



def main(argv):
	assert which("processing-java") is not None, "E: Couldn't find processing-java. Make sure that it is on PATH"

	args = []
	flags = []

	for a in argv:
		if a == "--processing-run-help":
			print_help()

		if a.startswith("-"):
			flags.append(a)
		else:
			args.append(a)

	if not flags:
		flags = ["--run"]

	sketch_path = "."
	if len(args) > 1:
		sketch_path = args[1]
		if sketch_path.endswith(".pde"):
			sketch_path = os.path.sep.join(sketch_path.split(os.path.sep)[0:-1])

		assert os.path.exists(os.path.abspath(sketch_path)), f"E: Sketch path \"{sketch_path}\" does not exist"

	sketch_path = os.path.abspath(sketch_path)
	cmd = f"processing-java --sketch={sketch_path} {' '.join(flags)}"
	print(cmd)
	os.system(cmd)


if __name__ == "__main__":
	try:
		main(sys.argv)
	except AssertionError as e:
		print(e)

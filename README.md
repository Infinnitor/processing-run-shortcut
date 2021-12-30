# processing-run-shortcut
A Python script I made to make the syntax for running Processing sketches from the commandline less annoying.
I personally found typing `processing-java sketch='path/to/sketch' --run` a bit annoying. I don't know if there's a reason for why the arguments are formatted like that, but I decided to make it a bit less confusing

There is also a shellscript file in the repository that attempts to do a similar thing. It currently sucks


# How to use
#### Simplest use: `processing-run`

This will treat the current directory as a sketch path and pass it to processing-java. It is the equivailent of running `processing-java sketch='/absolute/path/to/sketch'`

By default, the `--run` flag is added to line of code executed. If another flag is added, then that one will replace it

#### Provide sketch path: `processing-run path/to/sketch`

Given a path as an arguement, `processing-run` will pass that path to processing-java.

Equvailent: `processing-java sketch='provided/sketch/path'`


#### Targetting a specific file: `processing-run path/to/file.pde`

If a file is passed as an argument, and it ends in `.pde` then `processing-run` will use its parent directory as the sketch path

#### More info:
Use `processing-run --processing-run-help` to display help text


# Adding to path
There are a few ways you could make this availible to use in the terminal


- Creating an alias: `alias processing-run=path/to/file`

- Using a symlink: `sudo ln -s /absolute/path/to/file /usr/local/bin/`

- Copying/Moving python file: `sudo cp path/to/file /usr/local/bin`

- Running build.sh (make sure you are in the project root directory): `/bin/bash build.sh` or `./build.sh`

# Hubot-Symphony-Scripts
Hubot Scripts to work with Symphony

hubot-symphony-scripts

These are a collection of scripts for hubot, a chat bot for your company.

There is a new system for distributing scripts, and adding them to your own hubot. Locate the appropriate script in the hubot-scripts organization or on npm tagged as hubot-scripts, and follow the script's documentation. In general, this will be something like:

Add a line to external-scripts.json
Add a line to package.json
Add environment variables, depending on the script
Discovering

Installing

Once you have Hubot installed, you should already have hubot-scripts installed. Check package.json to be sure. If that is the case, you update hubot-scripts.json to list any scripts from this repository you want to load. The default hubot-scripts.json looks like:

["redis-brain.coffee", "shipit.coffee"]
If you update hubot-scripts in package.json, you will automatically get updates to your scripts listed here.

Alternatively, you can copy files from this repository into your scripts directory. Note that you would not get updates from the hubot-scripts repository unless you copy them yourself.

Any third-party dependencies for scripts need the addition of your package.json otherwise a lot of errors will be thrown during the start up of your hubot. You can find a list of dependencies for a script in the documentation header at the top of the script.

Restart your robot, and you're good to go.

All the scripts in this repository are located in src/scripts.

Writing

Want to write your own Hubot script? The best way is to take a look at an existing script and see how things are set up. Hubot scripts are written in CoffeeScript, a higher-level implementation of JavaScript.

Documentation

All scripts in hubot-scripts should contain a documentation header so people know everything about the script.

# Description
#   <description of the scripts functionality>
#
# Dependencies:
#   "<module name>": "<module version>"
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot <trigger> - <what the respond trigger does>
#   <trigger> - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   <github username of the original script author>
If you have nothing to fill in for a section you should include None in that section. Empty sections which are optional should be left blank. A script will be required to fill out the documentation before being merged into the repository.

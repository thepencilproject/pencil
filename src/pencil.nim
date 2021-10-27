# STANDARD LIBRARY IMPORTS
import std/strformat

# DEPENDENCIES IMPORTS
import docopt

# INTERNAL IMPORTS


const 
  VERSION* = "0.1.0"
  VERSION_TAG* = "Glamorous Moore"
  versionString* = "You are running pencil version: " & VERSION & " - " & VERSION_TAG


let doc = fmt"""

Welcome to Pencil

Nim SSG ( Static Site Generator )
Nim Version:   {NimVersion}   

Usage:
  pencil site <site>
  pencil (-h | --help)
  pencil (-v | --version)

Options:
  -h --help        Show this screen.
  -v --version     Show version.

Available Commands:
  site             Generates a new site/project.

"""

when isMainModule:
  
  # Parsing doc for commands 
  let args = docopt(doc, version = versionString)
  
  # Generate new site 
  if args["site"]: 
    echo "Site created!"

  


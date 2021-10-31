# STANDARD LIBRARY IMPORTS
import std/strformat

# DEPENDENCIES IMPORTS
import docopt
import rainbow

# INTERNAL IMPORTS
import pencil/sitegen

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

""".rfLightGoldenrod1

when isMainModule:
  
  # Parsing doc for commands 
  let args = docopt(doc, version = versionString.rfLime)
  
  # Generate new site command
  if args["site"]: 
    discard newSite($args["<site>"])

  


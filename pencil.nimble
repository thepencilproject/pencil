# Package

version       = "0.1.0"
author        = "Pencil"
description   = "Static site/blog/doc generator"
license       = "MIT"
srcDir        = "src"
bin           = @["pencil"]


# Dependencies

requires "nim >= 1.4.6"
requires "docopt >= 0.6.7"
requires "parsetoml >= 0.6.0"
requires "rainbow >= 0.2.2"

# STANDARD LIBRARY IMPORTS
import std/[os, strformat, times]

# DEPENDENCIES IMPORTS
import rainbow

# INTERNAL IMPORTS


# DEFAULT SITE STRUCTURE
type ThemeStruct* = ref object
  theme*: string   
  assetsDir*: string
  cssDir*: string
  jsDir*: string
  imgDir*: string
  layoutsDir*: string
  partialsDir*: string    
  publicDir*: string
  

# CONSTS FOR DIRECTORIES NAMES
const 
  assetsDirName = "assets"
  cssDirName = "css"
  jsDirName = "js"
  imgDirName = "img"
  layoutsDirName = "layouts"
  partialsDirName = "partials"
  publicDirName = "public"
 
  

proc newTheme*(theme:string): ThemeStruct =
# Proc for creating a new theme
  let
    dir = getCurrentDir()
    themeDir = joinpath(dir, theme)
    assets = joinpath(themeDir, assetsDirName)
    cssDir = joinpath(assets, cssDirName)
    jsDir = joinpath(assets, jsDirName)
    imagesDir = joinpath(assets, imgDirName)
    layouts = joinpath(themeDir, layoutsDirName)
    publicFiles = joinpath(themeDir, publicDirName)
    partials = joinpath(layouts, partialsDirName)

  let startTime = cpuTime()

  if not dirExists(themeDir):
    echo fmt"::Starting creating theme {theme}...".rfLime

    block createTheme:
      createDir(themeDir)
      echo fmt"|-- {theme}/".rfLime

    block createAssets:
      createDir(assets)
      echo fmt"   |-- assets/".rfLime
    
    block createCss:
      createDir(cssDir)
      echo fmt"      |-- css/".rfLime

    block createJs:
      createDir(jsDir)
      echo fmt"      |-- js/".rfLime

    block createImg:
      createDir(imagesDir)
      echo fmt"      |-- images/".rfLime


    block createLayouts:
      createDir(layouts)
      echo fmt"   |-- layouts/".rfLime

    block partialsLayouts:
      createDir(partials)
      echo fmt"      |-- partials/".rfLime

    block createPublic:
      createDir(publicFiles)
      echo fmt"   |-- public/".rfLime


    echo fmt"::Pencil creates new theme: {theme} in {cpuTime() - startTime}s".rfLime
  else:
    echo fmt"::Theme w/ theme {theme} already exists. Please choose different theme.".rfRed1
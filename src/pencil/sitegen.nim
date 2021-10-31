# STANDARD LIBRARY IMPORTS
import std/[os, strformat, times]

# DEPENDENCIES IMPORTS
import rainbow

# INTERNAL IMPORTS


# DEFAULT SITE STRUCTURE
type SiteStruct* = ref object
  site*: string   
  archetypesDir*: string  
  defaultMd*: string      
  contentDir*: string     
  pagesDir*: string       
  postsDir*: string       
  configSite*: string     
  themesDir*: string
  

# CONSTS FOR DIRECTORIES NAMES
const 
  archetypesDirName = "archetypes"  
  contentDirName = "content"       
  pagesDirName = "pages"          
  postsDirName = "posts"           
  themesDirName = "themes"         

# New site generator proc
proc newSite*(site : string): SiteStruct  =
  new result

  let
    dir = getCurrentDir()
    siteDir = joinpath(dir, site)
    startTime = cpuTime()

  if not dirExists(siteDir):
    echo fmt"[SUCCESS]::Starting creating blog/site {site}...".rfLime
    echo fmt"------------------------------------------------".rfLime
    block createSite:
      createDir(siteDir)
      echo fmt"|-- {site}/".rfLime

    result.archetypesDir = joinPath(siteDir, archetypesDirName)

    block createArchetypesDir:
      if not dirExists(result.archetypesDir):
        createDir(result.archetypesDir)
      echo fmt"   |-- archetypes/".rfLime
    
    result.contentDir = joinPath(siteDir, contentDirName)

    block createContentDir:
      if not dirExists(result.contentDir):
        createDir(result.contentDir)
      echo fmt"   |-- content/".rfLime
    
    result.postsDir = joinPath(result.contentDir, postsDirName)

    block createPostsDir:
      if not dirExists(result.postsDir):
        createDir(result.postsDir)
      echo fmt"      |-- posts/".rfLime
    
    result.pagesDir = joinPath(result.contentDir, pagesDirName)

    block createPagesDir:
      if not dirExists(result.pagesDir):
        createDir(result.pagesDir)
      echo fmt"      |-- pages/".rfLime

    result.themesDir = joinpath(siteDir, themesDirName)
    
    # TODO Add here default theme

    block createThemesDir:
      if not dirExists(result.themesDir):
        createDir(result.themesDir)
      echo fmt"   |-- themes/".rfLime


    writeFile(siteDir / "config.toml", " ")
    echo fmt"   |-- config.toml".rfLime
    echo fmt"------------------------------------------------".rfLime
    echo fmt"[SUCCESS]:: Pencil created project: “{site}“ in {cpuTime() - startTime}s".rfLime
    
  else:
    echo fmt"[WARNING]:: Directory/Site {site} already exists! Try another name.".rfRed1


 
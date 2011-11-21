module Paths_learning (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import Data.Version (Version(..))
import System.Environment (getEnv)

version :: Version
version = Version {versionBranch = [0,1], versionTags = []}

bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/cevans/.cabal/bin"
libdir     = "/home/cevans/.cabal/lib/learning-0.1/ghc-7.0.3"
datadir    = "/home/cevans/.cabal/share/learning-0.1"
libexecdir = "/home/cevans/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catch (getEnv "learning_bindir") (\_ -> return bindir)
getLibDir = catch (getEnv "learning_libdir") (\_ -> return libdir)
getDataDir = catch (getEnv "learning_datadir") (\_ -> return datadir)
getLibexecDir = catch (getEnv "learning_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)

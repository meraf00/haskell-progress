{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_secret_handshake (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,2,0,6] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Ethio\\Exercism\\haskell\\secret-handshake\\.stack-work\\install\\59205620\\bin"
libdir     = "C:\\Users\\Ethio\\Exercism\\haskell\\secret-handshake\\.stack-work\\install\\59205620\\lib\\x86_64-windows-ghc-9.0.2\\secret-handshake-1.2.0.6-L3UH68fogdyJB74PTizZtK"
dynlibdir  = "C:\\Users\\Ethio\\Exercism\\haskell\\secret-handshake\\.stack-work\\install\\59205620\\lib\\x86_64-windows-ghc-9.0.2"
datadir    = "C:\\Users\\Ethio\\Exercism\\haskell\\secret-handshake\\.stack-work\\install\\59205620\\share\\x86_64-windows-ghc-9.0.2\\secret-handshake-1.2.0.6"
libexecdir = "C:\\Users\\Ethio\\Exercism\\haskell\\secret-handshake\\.stack-work\\install\\59205620\\libexec\\x86_64-windows-ghc-9.0.2\\secret-handshake-1.2.0.6"
sysconfdir = "C:\\Users\\Ethio\\Exercism\\haskell\\secret-handshake\\.stack-work\\install\\59205620\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "secret_handshake_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "secret_handshake_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "secret_handshake_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "secret_handshake_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "secret_handshake_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "secret_handshake_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)

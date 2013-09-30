{-|
Module      :  Graphics.UI.FreeGame
Copyright   :  (C) 2013 Fumiaki Kinoshita
License     :  BSD-style (see the file LICENSE)
Maintainer  :  Fumiaki Kinoshita <fumiexcel@gmail.com>

This module just re-exports other submodules.
-}
module Graphics.UI.FreeGame
  ( -- * Examples
    -- $example
    -- * Main
    Game,
    runGame,
    def,
    -- * Reexports
    module Graphics.UI.FreeGame.Base,
    module Graphics.UI.FreeGame.Data.Bitmap,
    module Graphics.UI.FreeGame.Data.Font,
    module Graphics.UI.FreeGame.GUI,
    module Graphics.UI.FreeGame.Util,
    module Graphics.UI.FreeGame.Text,
    module Graphics.UI.FreeGame.Types,
    module Control.Monad,
    module Control.Applicative,
    module Control.Bool,
    module Data.Color,
    module Data.Color.Names,
    module Linear
) where

import Graphics.UI.FreeGame.Base
import Graphics.UI.FreeGame.GUI (GUI, GUIParam(..))
import Graphics.UI.FreeGame.Util
import Graphics.UI.FreeGame.Types
import Graphics.UI.FreeGame.Text
import Graphics.UI.FreeGame.Data.Bitmap
import Graphics.UI.FreeGame.Data.Font
import qualified Graphics.UI.FreeGame.GUI.GLFW as GLFW
import Control.Monad.Free.Church
import Data.Default
import Control.Monad
import Control.Applicative
import Control.Bool
import Data.Color
import Data.Color.Names
import Linear hiding (rotate)

-- | 'Game' is a "free" monad which describes GUIs.
-- This monad is an instance of 'Picture2D' so you can create it using 'fromBitmap' and can be transformed with 'translate', 'scale', 'rotate', 'colored'.
--
-- It is also an instance of 'Keyboard' and 'Mouse'.
--
-- You have to call 'tick' at the end of the current frame.
--
-- The only way to embody a 'Game' as a real thing is to apply 'runGame'.
type Game = F GUI

-- | Run a 'Game'.
runGame :: GUIParam -> Game a -> IO (Maybe a)
runGame = GLFW.runGame

{- $example

> import Control.Monad
> import Graphics.UI.FreeGame
> main = runGame def $ forever tick

shows a window and does nothing.

for more examples, see <https://github.com/fumieval/free-game/tree/master/examples>.

-}
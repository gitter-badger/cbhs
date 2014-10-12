module Nodes where

import Data.Tree (Tree)


class AstNode a where
  ast :: a -> Tree String
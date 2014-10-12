module Nodes where

import Data.Tree (Tree)


class AstNode a where
  tree :: a -> Tree String
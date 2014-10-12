module Nodes.Expression where

import Data.Tree (Tree (Node))
import Nodes



data Expr
  = Op { operator :: String, left :: Expr, right :: Expr }
  | StrLit { str :: String }
  | IntLit { int :: Int }
  | FloatLit { float :: Double }


instance AstNode Expr where
  tree (Op operator left right)  = Node operator [tree left, tree right]
  tree (StrLit str)              = Node ("\"" ++ str ++ "\"") []
  tree (IntLit int)              = Node (show int) []
  tree (FloatLit float)          = Node (show float) []

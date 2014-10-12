module Nodes.Expression where

import Data.Tree (Tree (Node))
import Nodes



data Expr
  = Op { operator :: String, left :: Expr, right :: Expr }
  | StrLit { str :: String }
  | IntLit { int :: Int }
  | FloatLit { float :: Double }


instance AstNode Expr where
  ast (Op operator left right)  = Node operator [ast left, ast right]
  ast (StrLit str)              = Node ("\"" ++ str ++ "\"") []
  ast (IntLit int)              = Node (show int) []
  ast (FloatLit float)          = Node (show float) []

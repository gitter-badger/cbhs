module Nodes.Statement where

import Nodes
import Nodes.Expression (Expr)

data Stmt
  = Line { expr :: Expr }

instance AstNode Stmt where
  ast (Line expr) = ast expr

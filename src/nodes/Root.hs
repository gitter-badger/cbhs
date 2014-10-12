module Nodes.Root where

import Data.Tree (Tree (Node))

import Nodes
import Nodes.Statement (Stmt)



data Root = CompilationUnit { statements :: [Stmt] }


instance AstNode Root where
  ast (CompilationUnit statements) = Node "<root>" (map ast statements)

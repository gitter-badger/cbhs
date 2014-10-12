{-# Language TemplateHaskell, QuasiQuotes, FlexibleContexts #-}
module Grammar where

import Text.Peggy hiding (Expr, space, delimiter)

import Nodes.Root (Root (CompilationUnit))
import Nodes.Statement (Stmt (Line))
import Nodes.Expression (Expr (Op, IntLit, StrLit, FloatLit))


[peggy|

root :: Root
  = rootStmt* { CompilationUnit $1 }

rootStmt :: Stmt
  = expr '\n' { Line $1 }

expr :: Expr
  = expr "+" expr { Op "+" $1 $2 }
  / expr "-" expr { Op "-" $1 $2 }
  / term

term :: Expr
  = "(" expr ")"
  / cbint         { IntLit $1 }
  / cbfloat       { FloatLit $1 }
  / cbstr         { StrLit $1 }


cbint ::: Int
  = [1-9] [0-9]*  { read ($1 : $2) }
  / [0]           { 0 }

cbfloat ::: Double
  = [0-9]* [.] [0-9]+ { read ($1 ++ [$2] ++ $3) }

cbstr ::: String
  = '\"' cbchar* '\"'

cbchar :: Char
  = [^\"\\]

space :: ()
  = [ \r\t] { () }
  -- / lineComment
  -- / recionComment

delimiter :: ()
  = [\n] { () }

|]


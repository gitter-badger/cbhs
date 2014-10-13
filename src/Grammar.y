{
module Grammar where

import Tokens
import Nodes.Root (Root (..))
import Nodes.Statement (Stmt (Line))
import Nodes.Expression (Expr (Op, IntLit, StrLit, FloatLit))


}

%name cbhs
%tokentype { Token }
%error { parseError }

%token
    INT   { TokenInt $$ }
    '+'   { TokenAdd }
    '-'   { TokenSub }
    '('   { TokenLParen }
    ')'   { TokenRParen }
    '\n'  { TokenEol }


%left '+' '-'

%%

Root : RootStmt Root               { CompilationUnit ($1 : (statements $2   )) }
     | {- empty -}                 { CompilationUnit [] }

RootStmt : Expr '\n'               { Line $1 }

Expr : Expr '+' Expr               { Op "+" $1 $3 }
     | Expr '-' Expr               { Op "-" $1 $3 }
     | Term                        { $1 }

Term : INT                         { IntLit $1 }
     | '(' Expr ')'                { $2 }


{
parseError :: [Token] -> a
parseError _ = error "Parse error"

parseExpr :: String -> Root
parseExpr = cbhs . scanTokens
}
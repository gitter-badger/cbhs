{
{-# OPTIONS_GHC -w #-}
module Tokens (Token(..),scanTokens) where

}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]
$eol   = [\n]

tokens :-

  $eol                          { \s -> TokenEol }
  $digit+                       { \s -> TokenInt (read s) }
  $alpha [$alpha $digit \_]*    { \s -> TokenIdent s }
  [\+]                          { \s -> TokenAdd }
  [\-]                          { \s -> TokenSub }
  \(                            { \s -> TokenLParen }
  \)                            { \s -> TokenRParen }
  $white+                       ;

{

data Token = TokenEol
           | TokenInt Int
           | TokenIdent String
           | TokenArrow
           | TokenEq
           | TokenAdd
           | TokenSub
           | TokenLParen
           | TokenRParen
           deriving (Eq,Show)

scanTokens = alexScanTokens

}
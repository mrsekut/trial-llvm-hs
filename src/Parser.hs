{-# LANGUAGE OverloadedStrings #-}

module Parser where

import           Data.Text
import           Data.Void
import           Text.Megaparsec
import           Text.Megaparsec.Char
import qualified Text.Megaparsec.Char.Lexer    as L
import           AST

type Parser = Parsec Void Text

prog :: Parser Expr
prog = scn *> expr <* eof

expr :: Parser Expr
expr = try (Expr <$> term <*> exprOp <*> expr) <|> ExprTerm <$> term

term :: Parser Term
term = try (Term <$> num <*> termOp <*> term) <|> TermNumber <$> num

num :: Parser Number
num = L.lexeme scn $ Number <$> L.decimal

exprOp :: Parser ExprOp
exprOp = L.lexeme scn $ choice [Add <$ char '+', Sub <$ char '-']

termOp :: Parser TermOp
termOp = L.lexeme scn $ choice [Mul <$ char '*', Div <$ char '/']

scn :: Parser ()
scn = L.space space1 (L.skipLineComment "//") (L.skipBlockComment "/*" "*/")


import Grammar (parseExpr)

import Data.Tree.Pretty (drawVerticalTree)
import Nodes


main :: IO ()
main =
  putStrLn . drawVerticalTree . ast . parsed $ "2 + 2\n(3 + 1) + 2\n"


parsed = parseExpr


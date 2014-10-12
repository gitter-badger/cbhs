
import Text.Peggy (parseString)
import Grammar (root)

import Data.Tree.Pretty (drawVerticalTree)
import Nodes


main :: IO ()
main =
  putStrLn . result . parsed $ "2 + 2\n3 + (1 + 2)\n 4 \n"


result parseResult = case parseResult of
  Right rootNode -> drawVerticalTree . ast $ rootNode
  Left  err      -> "Error: " ++ (show err)

parsed = parseString root ""


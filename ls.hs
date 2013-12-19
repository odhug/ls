import System.Directory

main :: IO ()
main =
  getDirectoryContents "." >>= \files ->
    mapM_ putStrLn files

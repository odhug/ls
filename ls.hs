import System.Directory

main :: IO ()
main =
  getDirectoryContents "." >>= \files ->
    mapM_ putStrLn (filterDots files)

filterDots :: [FilePath] -> [FilePath]
filterDots paths = filter (\path -> head path /= '.') paths

import System.Directory
import System.Environment

main :: IO ()
main =
  getDirectoryContents "." >>= \files ->
  getArgs >>= \args ->
    let
      filterFn =
        case args of
          [] -> filterDots
          ["-a"] -> id
    in mapM_ putStrLn (filterFn files)

filterDots :: [FilePath] -> [FilePath]
filterDots paths = filter (\path -> head path /= '.') paths

import System.Directory
import System.Environment
import Options.Applicative

data OptionsT = Options
  { ignoreDots :: Bool
  }

main :: IO ()
main =
  getDirectoryContents "." >>= \files ->
  getOurArgs >>= \opts ->
    let
      filterFn =
        if ignoreDots opts
          then filterDots
          else id
    in mapM_ putStrLn (filterFn files)

filterDots :: [FilePath] -> [FilePath]
filterDots paths = filter (\path -> head path /= '.') paths

getOurArgs :: IO OptionsT
getOurArgs = execParser $ info (helper <*> parser) idm
  where
    parser =
      Options <$>
        (not <$>
          switch
            (  long "all"
            <> short 'a'
            <> help "do not ignore entries starting with ."
            ))

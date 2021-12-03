-- stack --resolver lts-16.9 repl --package transformers --package http-client --package http-client-tls --package bytestring --package connection --package data-default-class
{-# LANGUAGE OverloadedStrings #-}
import Text.Printf(printf)
import Control.Exception
import System.IO
import Control.Monad.Trans.Maybe
import Control.Monad.Trans.Class
import Control.Monad.Trans.State


main = do
  putStrLn "===main==="
  hSetBuffering stdout LineBuffering
  hSetBuffering stderr LineBuffering

test :: MaybeT (StateT String IO) Int
test = do
  lift $ put "hello"
  MaybeT $ pure Nothing
  lift $ put "World"
  pure 1

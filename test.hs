-- stack --resolver lts-16.9 repl --package process --package mtl --package http-client --package http-client-tls --package bytestring --package connection --package data-default-class --package parsec --package string-conversions --package aeson --package time

import Test.Abc
import qualified Data.Time as Time

test1 n
  | n > 5 = do
  putStrLn ">5"
  | otherwise = do
  putStrLn "otherwise"

main = putStrLn hello

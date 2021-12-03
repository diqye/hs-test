-- stack --resolver lts-16.9 runhaskell --package mtl --package http-client --package http-client-tls --package bytestring --package connection --package data-default-class
{-# LANGUAGE OverloadedStrings #-}
import qualified Network.HTTP.Client as HTTP
import qualified Network.HTTP.Client.TLS as HTTPS
import qualified Data.ByteString.Lazy.Char8 as C8
import qualified Network.Connection as NC
import Data.Default.Class



main = do
  putStrLn "===main==="
  let setting'  = HTTPS.mkManagerSettings def (Just $ NC.SockSettingsSimple "localhost" 7711)
  -- required otherwise it mybe use proxy from env which does't support sockets5:xxxx
  let setting = HTTP.managerSetProxy HTTP.noProxy setting'
  manager <- HTTP.newManager setting

  -- manager <- HTTP.newManager setting
  -- let setting = HTTP.managerSetProxy (HTTP.useProxy $ HTTP.Proxy "socks5://localhost" 7711) HTTPS.tlsManagerSettings 
  -- let setting = HTTP.managerSetProxy (HTTP.proxyEnvironmentNamed "ALL_PROXY" Nothing) HTTPS.tlsManagerSettings 


  -- support sockets5 proxy from terminal env https_proxy
  -- manager <- HTTPS.newTlsManager


  text <- pure HTTP.responseBody <*> HTTP.httpLbs "https://ipinfo.io" manager
  C8.putStrLn text
module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)


view : a -> { body : List (Html msg), title : String }
view _ =
    { title = "Testing"
    , body =
        [ text "Hi 👋\u{1F913}" ]
    }


main : Program () () ()
main =
    Browser.document
        { init = \_ -> ( (), Cmd.none )
        , subscriptions = \_ -> Sub.none
        , update = \_ _ -> ( (), Cmd.none )
        , view = view
        }

module Main exposing (main)

import Animation
import Browser
import Browser.Navigation as Nav
import Html exposing (..)


view : a -> { body : List (Html msg), title : String }
view _ =
    { title = "Testing"
    , body =
        [ text "Hi 👋\u{1F913}" ]
    }


type Msg
    = Animate Animation.Msg


main : Program () () Msg
main =
    Browser.document
        { init = \_ -> ( (), Cmd.none )
        , subscriptions = \_ -> Animation.subscription Animate []
        , update = \_ _ -> ( (), Cmd.none )
        , view = view
        }

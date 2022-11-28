module Picshare exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)



-- START:model.alias


type alias Model =
    { url : String
    , caption : String
    , liked : Bool
    }



-- END:model.alias


baseUrl : String
baseUrl =
    "https://programming-elm.com/"



-- START:initialModel.annotation


initialModel : Model



-- END:initialModel.annotation


initialModel =
    { url = baseUrl ++ "1.jpg"
    , caption = "Surfing"
    , liked = False
    }


viewDetailedPhoto : Model -> Html Msg
viewDetailedPhoto model =
    div [ class "detailed-photo" ]
        [ img [ src model.url ] []
        , div [ class "photo-info" ]
            [ viewLoveButton model ]
        , h2 [ class "caption" ] [ text model.caption ]
        ]



-- START:view.annotation


view : Model -> Html Msg



-- END:view.annotation


view model =
    div []
        [ div [ class "header" ]
            [ h1 [] [ text "Picshare" ] ]
        , div [ class "content-flow" ]
            [ viewDetailedPhoto model ]
        ]


type Msg
    = ToggleLike


viewLoveButton : Model -> Html Msg
viewLoveButton model =
    let
        buttonClass =
            if model.liked then
                "fa-heart"

            else
                "fa-heart-o"
    in
    div [ class "like-button" ]
        [ i
            [ class "fa fa-2x"
            , class buttonClass
            , onClick ToggleLike
            ]
            []
        ]



-- START:update.annotation


update : Msg -> Model -> Model



-- END:update.annotation


update msg model =
    case msg of
        ToggleLike ->
            { model | liked = not model.liked }



-- START:main.annotation


main : Program () Model Msg



-- END:main.annotation


main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }

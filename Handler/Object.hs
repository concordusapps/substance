module Handler.Object where

import Import
import Control.Arrow ((&&&))
import Data.Text (pack)

getObjectR :: Handler Html
getObjectR = do
    (form, enctype) <- generateFormPost objForm
    objs <- runDB $ selectList [ObjectTypeLocalName !=. ""] []
    defaultLayout $ do
        setTitle "Create a new object type"
        $(widgetFile "object")

postObjectR :: Handler Html
postObjectR = do
    ((res, form), enctype) <- runFormPost objForm
    objs <- runDB $ selectList ([] :: [Filter ObjectType]) []
    case res of
        FormSuccess obj -> do
            _ <- runDB $ insert obj
            setMessage "Object Type created successfully"
            redirect ObjectR
        _ -> defaultLayout $(widgetFile "object")

objAForm :: AForm Handler ObjectType
objAForm = ObjectType
         <$> areq textField "Name" Nothing
         <*> pure Nothing
         <*> pure Nothing
         <*> pure Nothing
         <*> areq (selectFieldList baseTypes) "Base Type" (Just CMISDocument)
         <*> aopt textField "Description" Nothing
         <*> areq boolField "Can we create new ObjectTypes?" Nothing
         <*> areq boolField "Is this fileable?" Nothing
         <*> areq boolField "Is this queryable?" Nothing
         <*> areq boolField "is this be controlled by a policy?" Nothing
         <*> areq boolField "Is this controllable by an ACL?" Nothing
         <*> areq boolField "Is this full text searchable?" Nothing
         <*> areq boolField "Is this included in any searches of its parents?" Nothing
         <*> pure Nothing
         <*> pure Nothing
         <*> pure Nothing
         where
            baseTypes :: [(Text, CMISBase)]
            baseTypes = map (pack . drop 4 . show &&& id) [minBound..maxBound]

objForm :: Form ObjectType
objForm = renderDivs objAForm

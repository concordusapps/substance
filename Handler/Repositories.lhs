This is the main entry point for the CMIS server.
It corresponds to a call to `getRepositories`,
and returns all of the available repositories on the server.

> module Handler.Repositories where

> import Import

We need to handle the call to `getRepositories`.
There's really nothing to do here, we just need to grab every repository,
and shove them back to the user.

> getRepositoriesR :: Handler Html
> getRepositoriesR = do
>    repos <- runDB $ selectList ([] :: [Filter Repository]) []
>    defaultLayout $(widgetFile "repositories")

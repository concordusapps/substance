module Model where

import Prelude
import Yesod
import Data.Text (Text)
import Database.Persist.Quasi

import CMISTypes

share [mkPersist sqlOnlySettings, mkMigrate "migrateAll"]
    $(persistFileWith lowerCaseSettings "config/models")

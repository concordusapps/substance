module CMISTypes where

import Database.Persist.TH
import Prelude

data CMISPermission = CMISPermBasic
                    | CMISPermRepository
                    | CMISPermBoth
                    deriving (Eq, Read, Show)
derivePersistField "CMISPermission"

data CMISBase = CMISDocument
              | CMISFolder
              | CMISRelationship
              | CMISPolicy
              | CMISItem
              deriving (Bounded, Enum, Eq, Read, Show)
derivePersistField "CMISBase"

data CMISProperty = CMISString
                  | CMISBoolean
                  | CMISDecimal
                  | CMISInteger
                  | CMISDateTime
                  | CMISURI
                  | CMISID
                  | CMISHTML
                  deriving (Eq, Read, Show)
derivePersistField "CMISProperty"

data CMISCardinality = CMISSingle
                     | CMISMulti
                     deriving (Eq, Read, Show)
derivePersistField "CMISCardinality"

data CMISUpdatability = CMISReadOnly
                      | CMISReadWrite
                      | CMISWhenCheckedOut
                      | CMISOnCreate
                      deriving (Eq, Read, Show)
derivePersistField "CMISUpdatability"

data CMISResolution = CMISYear
                    | CMISDate
                    | CMISTime
                    deriving (Eq, Read, Show)
derivePersistField "CMISResolution"

data CMISPrecision = CMIS32
                   | CMIS64
                   deriving (Eq, Read, Show)
derivePersistField "CMISPrecision"

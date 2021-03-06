module Pulp.Utils where

import Prelude
import Data.Maybe
import Control.Monad.Eff.Exception (EXCEPTION, Error, error)
import Control.Monad.Error.Class (class MonadError, throwError)
import Unsafe.Coerce

orErr :: forall m a. (MonadError Error m) => String -> Maybe a -> m a
orErr msg = maybe (throw msg) pure

throw :: forall m a. (MonadError Error m) => String -> m a
throw = throwError <<< error

removeErrLabel :: forall f e a. f (err :: EXCEPTION | e) a -> f e a
removeErrLabel = unsafeCoerce

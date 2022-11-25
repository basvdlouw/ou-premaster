module Nieuw where

som xs | xs == [] = 0 | otherwise = head xs + som (tail xs)
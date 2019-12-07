# Ex 1 

Define a functor `myfmap` for given types:

 - `MyMaybe`
 - `MyList`
 - `MyBinTree`

where:

```haskell
data MyMaybe a = MyNothing | MyJust a

data MyList a = MyEnd | MyElem a (MyList a)

data MyBinTree a = MyLeaf | MyNode a (MyBinTree a) (MyBinTree a)
```

# Ex 2

Prove that functors you defined in an ex 1 work with:

 - identity
 - composition

# Ex 3

Implement instances of

 - `MyMaybe`
 - `MyList`
 - `MyBinTree`

for:

```haskell
class MyFunctor f where
    myfmap :: (a -> b) -> f a -> f b
```

# Tips

Use [this](https://repl.it/languages/haskell) tool if you do want to install Haskell.

If you define your data as follows:

```haskell
data MyType a = MyConstructor a
```

and try getting it to through the interpreter following error will occur:

```
:l main
[1 of 1] Compiling Main             ( main.hs, interpreted )
Ok, one module loaded.
   MyConstructor 3
<interactive>:34:1: error:
    • No instance for (Show (MyType Integer))
        arising from a use of ‘print’
    • In a stmt of an interactive GHCi command: print it
```

to fix it just add `deriving (Show)` like this:

```haskell
data MyType a = MyConstructor a deriving (Show)
```

and retry.
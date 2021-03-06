# Introduction to Haskell

## Len

As an example we will be implementing function getting a list and returning its length.

## Recursion

Lets start with Python/Java/C++/... approach:

```haskell
len lst = if lst == []
            then 0
            else 1 + len (tail lst)
```

Lets try defining function length (`len`) using recursion:

```haskell
len [] = 0
len (x:xs) = 1 + len xs
```

Alternatively using guards:

```haskell
len lst
  | lst == [] = 0
  | otherwise = 1 + (len (tail lst))
```

Lets do nothing and improve out code further.
Use Function application with `$`.
Read more about the `$` operator [here](http://learnyouahaskell.com/higher-order-functions)

__It is The Art of Doing NOTHING__:

```haskell
len lst
  | lst == [] = 0
  | otherwise = 1 + (len $ tail lst)
```

Or lets use Haskell `where`:

```haskell
len lst
  | lst == [] = 0
  | otherwise = 1 + tail_len
      where
        tail_len = len $ tail lst
```


Lets now try this code:

```haskell
-- compile and load a module
:l main
[1 of 1] Compiling Main             ( main.hs, interpreted )
Ok, one module loaded.
-- see the type of function len
:t len
len :: Num p => [a] -> p
-- lets try a few cases now
len []
=> 0
len [1]
=> 1
len [1,2,3]
=> 3
```

# Tail recursion

Read why tail recursion matters [here](https://stackoverflow.com/a/37010)

```haskell
taillen lst = mytaillen lst 0

mytaillen [] acc = acc
mytaillen (x:xs) acc = mytaillen xs $ acc + 1
```

```haskell
:l main
[1 of 1] Compiling Main             ( main.hs, interpreted )
Ok, one module loaded.
:t taillen
taillen :: Num t => [a] -> t
taillen []
=> 0
taillen [1]
=> 1
taillen [1,2,3]
=> 3
```

## Folding

Fold (or reduce) is a family of _higher order functions_ that process a data structure in some order and build a return value.

### How does it work?

To fold we need 3 elements:
```haskell
foldl fun init_acc lst

-- First argument is a function which takes 2 arguments:
-- - previous_accumulator which is an accumulator returned from previous operation
-- - element which is current element taken from a list
fun previous_accumulator element  = ...

-- Second argument is an initial accumulator value init_acc

-- Third argument is a collection we operate on

-- now lets consider following fold

foldl (\acc el -> acc ++ [show el]) [] [1, 2, 3, 4]
```

| Step | Acc | CurrentElem | RemainingList |
|---|---|---|---|
| 1 | [] | 1 | [2, 3, 4] | 
| 2 | ["1"] | 2 | [3, 4] | 
| 3 | ["1", "2"] | 3 | [4] | 
| 4 | ["1", "2", "3"] | 4 | [] | 
| 5 | ["1", "2", "3", "4"] | _ | [] |

Read more [here](https://wiki.haskell.org/Fold)

```haskell
fold_len lst =
  foldl add_1 0 lst

add_1 acc _ = acc + 1

fold_len_lambda lst =
  foldl (\acc el -> acc + 1) 0 lst
```

# Haskell online

You can try Haskell in a browser [here](https://repl.it/languages/haskell).

# Exercises

## Ex 1 Sum

Implement *my_sum* function which takes a list of type _a_ where _a_ is Numeric.

Next load and try it:
```haskell
:l main

my_sum []
-- should return 0
my_sum [1]
-- should return 1
my_sum [2]
-- should return 1
my_sum [1, 2, 23]
-- should return 3
-- etc
```

### Ex 1.1 Recursive implementation

Use recursion to implement it.

#### Tips

Consider 2 cases:
 - an empty list 
 - non empty list

Use _len_  as a reference.

### Ex 1.2 Recursive implementation - tail recursion

Use tail recursion to implement it.

#### Tips

Wrap you 2 argument function into 1 argument function.

### Ex 1.3 Use fold in you implementation

Use _foldl_ as in the example above

### Tips

Order fo arguments in addition does not matter.

Read more about [foldr vs foldl](https://gist.github.com/CMCDragonkai/9f5f75118dda10131764)

## Ex 2 - Use fold to do mapping

Function map takes 2 arguments:

 - one argument function f
 - a collection (list in our case)

and returns new collection were foreach element we apply function f to the element.

Example:

```haskell
map (+2) [1,2,3]
-- will return
[3, 4, 5]
```

Task: Implement my_map using _foldl_.

## Ex 3 - Even Fibonacci numbers

Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

### Tips

For this one, the approach is should be slightly different. Try using tail recursion (see Ex 2).

## Ex 4 - FizzBuzz

Write a function that returns the numbers from 1 to 100. But for multiples of three replaces a number with a type `Fizz` instead of the number and for the multiples of five replaces a number with a type `Buzz`. For numbers which are multiples of both three and five replaces a number with a type `Fizzbuzz`. All other numbers are mapped to type `N a`.

Define a type:

```haskell
data Fb a = N a | Fizz | Buzz | Fizzbuzz deriving Show
```

Expected result should me something like this:

```haskell
[ (N 1), (N 2), Fizz, (N 4), Buzz, Fizz, ...]
```

### Tips

 - Consider extracting and naming mapped function.
 - Try writing a function to determine output over a single number.
 - Use guards:

 ```haskell
-- instead of:
absolute x = if (x<0) then (-x) else x
-- write:
absolute x
  | x<0 = -x
  | otherwise = x
 ```

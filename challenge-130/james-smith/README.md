# Perl Weekly Challenge #130

You can find more information about this weeks, and previous weeks challenges at:

  https://perlweeklychallenge.org/

If you are not already doing the challenge - it is a good place to practise your
**perl** or **raku**. If it is not **perl** or **raku** you develop in - you can
submit solutions in whichever language you feel comfortable with.

You can find the solutions here on github at:

https://github.com/drbaggy/perlweeklychallenge-club/tree/master/challenge-130/james-smith/perl

# Task 1 -  Odd Number

***You are given an array of positive integers, such that all the numbers appear even number of times except one number.***

## The solution

For each of the inputs we need to keep a tally of how many times we've seen them (or more simply if we have seen them an odd or even number of times). To achieve the latter we use the **xor** operator or `^` in perl.

For each number we update the "count" to be 0 if 1 and 1 if 0, using `$x{$_}^=1`.

Only entries for which `$x{$_}` is "true" have odd counts. So we get the (only one) odd count by `grep`ing the list and returning the (1) key.

```perl
sub find_odd {
  my %x;
  $x{$_}^=1 foreach @{$_[0]};
  return ( grep { $x{$_} } keys %x )[0];
}
```

# Task 2 - Binary Search Tree

***You are given a tree.  Write a script to find out if the given tree is Binary Search Tree (BST).***

## Solution

If we flatten the tree in the order - left-subtree - value - right-subtree. We just need to check the
values are in ascending order... If any isn't larger than it's previous value we know it isn't a BST.

From the BinaryTree class we use "in-order" ordering to flatten the tree... Then we loop through the
values, checking the value against the previous value.

```perl
sub is_bst {
  my( $p, @values ) = shift->flatten( sub { return $_[0]; }, 'in' );
  ( $values[0] < $p ) ? ( return 0 ) : ( $p = shift @values ) while @values;
  return 1;
}
```

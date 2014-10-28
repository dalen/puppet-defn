A Puppet function to define Puppet functions in Puppet
======================================================

Requires the future parser to work.

Example:
--------

    defn(higher) |$a,$b| { if $a > $b { $a } else { $b } }
    notice(higher(3,2))

*Output:* 3

Quicksort example:
------------------

```puppet
class quicksort {
  $size=lambda() |$list| {
    reduce($list,0) |$a,$b| {
      $a+1
    }
  }
  $sort=lambda() |$list| {
    if apply($size,[$list]) > 2 {
      $pivot=$list[apply($size,[$list])/2]
      apply($sort,[filter($list) |$i| { $i < $pivot }]) + $same + apply($sort,[])
      $low=filter($list) |$i| {
        $i < $pivot
      }
      $high=filter($list) |$i| {
        $i > $pivot
      }
      $same=filter($list) |$i| {
        $i == $pivot
      }
    } elsif apply($size,[$list]) == 2 {
      if $list[0] > $list[1] {
        [$list[1], $list[0]]
      } else {
        $list
      }
    } else {
      $list
    }
  }
}

include quicksort
apply($quicksort::sort, [[3,7,4,8,6]]).each |$i| { notice($i) }
```

Known issues
------------

Nesting defn statements or referencing variables from outside of the block can
lead to undefined behaviour.

Also closures aren't supported by Puppet with lambdas.

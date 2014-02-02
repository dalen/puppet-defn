class stdlib {
  $max=lambda() |$a| {
    reduce($a) |$b,$c| {
      if $b > $c {
        $b
      } else {
        $c
      }
    }
  }

  $min=lambda() |$a| {
    reduce($a) |$b,$c| {
      if $b < $c {
        $b
      } else {
        $c
      }
    }
  }

  $pick=lambda() |$a| {
    reduce($a,undef) |$b,$c| {
      if $b {
        $b
      } else {
        $c
      }
    }
  }

}


include stdlib

notice(apply($stdlib::max,[[0,5,8,9.6,3]]))
notice(apply($stdlib::min,[[0,5,8,9.6,3]]))
notice(apply($stdlib::pick,[[undef,1,undef]]))

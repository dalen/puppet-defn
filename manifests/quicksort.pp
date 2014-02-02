class quicksort {
  $size=lambda() |$list| {
    reduce($list,0) |$a,$b| {
      $a+1
    }
  }
  $sort=lambda() |$list| {
    if apply($size,[$list]) > 2 {
      $pivot=$list[apply($size,[$list])/2]
      $low=filter($list) |$i| {
        $i < $pivot
      }
      $high=filter($list) |$i| {
        $i > $pivot
      }
      $same=filter($list) |$i| {
        $i == $pivot
      }
      apply($sort,[$low]) + $same + apply($sort,[$high])
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

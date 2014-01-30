A Puppet function to define Puppet functions in Puppet
======================================================

Example:
--------

    defn(higher) |$a,$b| { if $a > $b { $a } else { $b } }
    notice(higher(3,2))

*Output:* 3

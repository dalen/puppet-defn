Puppet::Parser::Functions::newfunction(
  :apply,
  :type => :rvalue,
  :arity => -3,
  :doc => <<-'ENDHEREDOC') do |args|
    Call a Puppet lambda
  ENDHEREDOC

  require 'puppet/parser/ast/lambda'

  if args.length == 2
    lam, arglist = *args
  else
    lam, arglist, pblock  = *args
    unless pblock.respond_to?(:puppet_lambda)
      raise ArgumentError, ("apply(): wrong argument type (#{pblock.class}; must be a parameterized block.")
    end
  end

  unless lam.respond_to?(:puppet_lambda)
    raise ArgumentError, ("apply(): wrong argument type (#{lam.class} first param; must be a parameterized block.")
  end

  ret = lam.call(self,*arglist)
  if pblock
    pblock.call(self,ret)
  else
    ret
  end
end

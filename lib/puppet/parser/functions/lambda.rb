Puppet::Parser::Functions::newfunction(
  :lambda,
  :type => :rvalue,
  :arity => 1,
  :doc => <<-'ENDHEREDOC') do |args|
    Return a Puppet lambda
  ENDHEREDOC

  require 'puppet/parser/ast/lambda'

  pblock = args[0]

  unless pblock.respond_to?(:puppet_lambda)
    raise ArgumentError, ("lambda(): wrong argument type (#{pblock.class}; must be a parameterized block.")
  end
  pblock
end

Puppet::Parser::Functions::newfunction(
  :defn,
  :type => :statement,
  :arity => 2,
  :doc => <<-'ENDHEREDOC') do |args|
    Define a new function using a block of Puppet code.
  ENDHEREDOC

  require 'puppet/parser/ast/lambda'

  name, pblock = *args

  unless name.respond_to?(:to_sym)
    raise ArgumentError, ("defn(): wrong argument type (#{name.class}; must be a string.")
  end
  unless pblock.respond_to?(:puppet_lambda)
    raise ArgumentError, ("defn(): wrong argument type (#{pblock.class}; must be a parameterized block.")
  end

  Puppet::Parser::Functions::newfunction(name.to_sym, :type => :rvalue) do |args|
    pblock.call(self, *args)
  end
end

# L - Liskov Substitution (LSP)
#
# Derived classes must be substitutable for their base classes.
#

#
# bad
#
# AttackMidfield returns hash instead of array, wrong usage of inheritance
# would break Liskov Substitution Principle as well.
#
class Midfield
  def create_chance
    %w[short cross]
  end
end

class AttackMidfield < Midfield
  def create_chance
    {
      safe:     'short',
      pressure: 'cross',
      chance:   'cutback'
    }
  end
end

#
# good
#
class Midfield
  def create_chance
    %w[short cross]
  end
end

class AttackMidfield < Midfield
  def create_chance
    %w[short cross cutback]
  end
end

# reference: http://rubyblog.pro/2017/06/solid-liskov-substitution-principle

# S - Single-Responsibility principle (S.R.P)
#
# A class should have one, and only one, reason to change.
#

#
# bad
#
# Midfield does more than one responsibilitity (attack and defend)
#
class Midfield
  def attack
    puts 'midfield - attack'
  end

  def defend
    puts 'midfield - defend'
  end
end

mf = Midfield.new
mf.attack
mf.defend

#
# good
#
class Midfield
end

class AttackMidfield < Midfield
  def attack
    puts 'amc - attack'
  end
end

class DefenseMidfield < Midfield
  def defend
    puts 'dmc - defend'
  end
end

amc = AttackMidfield.new
amc.attack

dmc = DefenseMidfield.new
dmc.defend

# reference: http://rubyblog.pro/2017/05/solid-single-responsibility-principle-by-example

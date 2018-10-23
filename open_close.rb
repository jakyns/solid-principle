# O - Open/Close (OCP)
#
# Software entities (classes, modules, functions, etc.) should be open for
# extension, but closed for modification.
#

#
# bad
#
# Can't scale properly when we want a new type of midfield
#
class Midfield
  def pass(type)
    case type
    when 'attack_midfield'  then puts 'try to cut back'
    when 'defense_midfield' then puts 'always pass easily'
    end
  end
end

amf = Midfield.new
amf.pass('attack_midfield')

dmf = Midfield.new
dmf.pass('defense_midfield')

#
# good
#
class Midfield
  def pass(klass)
    klass.new.pass
  end
end

class AttackMidfield
  def pass
    puts 'try to cut back'
  end
end

class DefenseMidfield
  def pass
    puts 'always pass easily'
  end
end

mf = Midfield.new
mf.pass(AttackMidfield)
mf.pass(DefenseMidfield)

# reference: http://rubyblog.pro/2017/05/solid-open-closed-principle-by-example

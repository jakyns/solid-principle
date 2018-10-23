# I - Interface Segregation (ISP)
#
# Clients should not be forced to implement interfaces they do not use.
#
# This principle can not apply to Ruby or any duck typing languages.
# BTW, I try to adapt and and create a similar example from Ruby behaviour 
# that relevant to the concept instead.
#

#
# bad
#
# It has to pass some weird boolean that changes behavior of method.
# It could add default value but it wouldn't help if it has additional params
#
class Midfield
  def get_pressing(situation:)
    puts 'flip the crisis as an opportunity'
    puts 'try to create a chance for teammate' if situation == 'attack'
  end
end

mf = Midfield.new
mf.get_pressing(situation: 'defense')
mf.get_pressing(situation: 'attack')

#
# good
#
class Midfield
  def get_pressing
    puts 'flip the crisis as an opportunity'
  end

  def create_chance
    puts 'try to create chance for teammate'
  end
end

mf = Midfield.new
mf.get_pressing
mf.create_chance

# reference: http://rubyblog.pro/2017/07/solid-interface-segregation-principle

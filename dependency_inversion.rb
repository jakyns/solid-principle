# D - Dependency Inversion (DIP)
#
# Depend on abstractions, not on concretions.
#

#
# bad
#
# The Dependency Inversion Principle has to do with
# high-level (think business logic) objects not depending on
# low-level (think database querying and IO) implementation details.
#
# This is a functioning pass method, but right now it is tied to the
# PremierLeague and LaLiga object. What if we change the name of the
# transfer country class? What if we add more transfer country?
#
class Transfer
  def retrieve(type)
    case type
    when 'premier_league' then PremierLeague.new.retrieve
    when 'la_liga'        then LaLiga.new.retrieve
    end
  end
end

class PremierLeague
  def retrieve
    puts 'Premier League all transfer history'
  end
end

class LaLiga
  def retrieve
    puts 'La Liga all transfer history'
  end
end

mf = Transfer.new
mf.retrieve('premier_league')
mf.retrieve('la_liga')

#
# good
#
# As you can see, our high-level object, transfer, does not depend
# directly on an implementation of a lower-level object
#
class TransferRepository
  attr_reader :source

  def initialize(source:)
    @source = source
  end

  def retrieve
    source.retrieve
  end
end

module English
  class Transfer
    def retrieve
      puts 'Premier League all transfer history'
    end
  end
end

module Spain
  class Transfer
    def retrieve
      puts 'La Liga all transfer history'
    end
  end
end

premier = English::Transfer.new
premier_league_transfer = TransferRepository.new(source: premier)
premier_league_transfer.retrieve

laliga = Spain::Transfer.new
la_liga_transfer = TransferRepository.new(source: laliga)
la_liga_transfer.retrieve

# reference: http://rubyblog.pro/2017/07/solid-dependency-inversion-principle

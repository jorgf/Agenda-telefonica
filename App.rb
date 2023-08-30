require_relative 'classes/Command.rb'
require_relative 'classes/Files.rb'

commando = Command.new
loop do
    commando.menu
    commando.execute
end

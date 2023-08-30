require_relative "Files.rb"

class Schedule
  def initialize
    @schedule = Files.new("./contacts.json")
  end

  def add(name, phone)
    data = {"name" => name, "phone"=> phone}
    @schedule.write_file(data)
  end

  def list
    @schedule.read_file
  end

  def edit(name) #TODO
    @schedule.each do |contact|
      if contact[:name].downcase == name.downcase
        temp = contact[:name]
        puts "novo nome (Enter para manter o atual): "
        new_name = gets.chomp
        contact[:name] = new_name
        contact[:name] = contact[:name].empty? ? temp : contact[:name]
        
        temp_phone = contact[:phone]
        puts "novo numero (Enter para manter o atual): "
        new_phone = gets.chomp
        contact[:phone] = new_phone
        contact[:phone] = contact[:phone].empty? ? temp_phone : contact[:phone]
      end
    end
  end

  def remove(name) #TODO
    @schedule.each do |contact|
      if contact[:name].downcase == name.downcase
        index = @schedule.index(contact)
        return @schedule.delete_at(index)
      end
    end
  end
end
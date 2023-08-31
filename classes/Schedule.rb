require_relative "Files.rb"

class Schedule
  def initialize
    @file = Files.new("./contacts.json")
  end

  def add(name, phone)
    data = {"name" => name, "phone"=> phone}
    @file.write_file(data)
  end

  def list
    @file.read_file
  end

  def edit(name) #TODO
    @file.each do |contact|
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
    @data_hash = @file.read_file
    for i in @data_hash
      if i["name"].downcase == name.downcase
        index = @data_hash.index(i)
        @data_hash.delete_at(index)
        @file.update_file(@data_hash)
      end
    end
  end
end
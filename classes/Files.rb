require 'json'

class Files
  
  def initialize(path)
    file = File.read(path)
    @data_hash = JSON.parse(file)
  end
  
  def read_file
    @data_hash["contacts"]
  end
  
  def write_file(data)
    data_save = data
    @data_hash["contacts"] << data_save
    File.write('./contacts.json', JSON.pretty_generate(@data_hash,{indent:' '}))
  end
  
  def update_file(data)
    @data_hash["contacts"] = data
    File.write('./contacts.json', JSON.pretty_generate(@data_hash,{indent:' '}))
  end
  
end
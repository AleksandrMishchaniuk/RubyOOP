module DataManager

  def init
    lines = File.readlines('data/'+self.to_s.downcase+'.data')
    lines.each do |line|
      line.chomp!
      i = line.split(' --:-- ')
      self.new(*i)
    end
    self.instances
  end

  def save
    File.open('data/'+self.to_s.downcase+'.data', 'w') do |f|
      self.instances.each do |item|
        f.puts(item.to_str(' --:-- '))
      end
    end
  end

  def get_by_id(id)
    self.instances.find { |item| id.to_i == item.id }
  end

  def instances
      class_variable_get(:@@instances)
  end

end
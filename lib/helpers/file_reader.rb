class FileReader

  def self.array_of_ints(file_path)
    array_of_strings(file_path).map(&:to_i)
  end

  def self.array_of_strings(file_path)
    data = File.open(file_path).read.split("\n")
    data.pop if data.last == ''
    data
  end

end

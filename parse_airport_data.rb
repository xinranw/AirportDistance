require 'json'
def parseAirportData original_file, dest_file 
  count = 0
  name = ""
  code = ""
  latitude = 0.0
  longitude = 0.0
  last = 0
  dictionary = {}
  File.open(original_file, "r").each_line do |line|
    # puts line[0]
    next if !(line.include? "US-" and line.include? "large_airport")
    length = line.length
    count = 0
    for i in 0..length-1
      if line[i].eql? ","
        count += 1
        case count
        when 4
          name = line[last+2..i-2]
        when 5        
          latitude = line[last+1..i-1]
        when 6
          longitude = line[last+1..i-1]
        when 15
          code = line[last+2..i-2]
        end
        last = i
      end
    end
    dictionary[code] = {:name => name, :code => code, :latitude => latitude, :longitude => longitude}
    dictionary[name] = {:name => name, :code => code, :latitude => latitude, :longitude => longitude}
  end
  puts dictionary.inspect
  File.open(dest_file, "w") do |file|
    file.truncate(0)
    file.write(dictionary.to_json)
  end
  # result = dictionary.to_json
end
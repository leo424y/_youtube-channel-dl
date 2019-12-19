file=File.readlines('index')
file.each do |line| @order = line end
list = File.readlines('channels')
list.each_with_index do |line, index| 
  %x(curl "http://localhost:3000/?yurl=#{line.chomp}") if (index == @order.to_i)  
end
len = list.length
@more = (@order.to_i+1) % len
File.open('index', 'w') { |file| file.write(@more) }

text = []
input = File.read("parseddmbloyalty.html")
text = input.split("\n")
stringeddata = text.to_s
open('stringeddata', 'a+') { |f|
  f.puts text.uniq
}

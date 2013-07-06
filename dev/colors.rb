 f = File.read('../css/syntax.scss') 
#f = File.read('1.css') 
colors = f.scan(/#[a-zA-Z0-9]+/)
puts colors.uniq!.inspect

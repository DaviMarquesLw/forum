@blacklist = ['batata', 'cenoura', 'banana']
titulo = 'Eu amo batata com cenoura e banana'
	
@blacklist.each do |word|
		if titulo.include? word
			titulo[word] = 'x' * word.length
		end
	end

puts titulo

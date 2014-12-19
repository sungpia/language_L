def add(*numbers)
	return numbers.inject(0) { |sum, number| sum + number}
end

def subtract(*numbers)
	first=numbers.shift
	return numbers.inject(first) { |ans, number| ans - number}

end

def calculate(*arguments)
end


numbers = [1,3,5,7]
add(numbers)
subtract(numbers)
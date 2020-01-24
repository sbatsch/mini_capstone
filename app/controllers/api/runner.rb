def take(array, n=1)
    new_array = []
    array.each do |value|
        if value > n 
            new_array << value 
        end 
    end 
    return new_array
end 

p take([1,2,3],  2)

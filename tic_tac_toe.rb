def computer_move(a1,a2,a3,a4,a5,a6,a7,a8,a9)
	all_hash = {1 => a1, 2 => a2, 3 => a3, 4 => a4, 5 => a5, 6 => a6, 7 => a7, 8 => a8, 9 => a9}
	all_spaces = [a1,a2,a3,a4,a5,a6,a7,a8,a9]
	win_one = {1 => a1, 2 => a2, 3 => a3}
	win_two = {4 => a4, 5 => a5, 6 => a6}
	win_three = {7 => a7, 8 => a8, 9 => a9}
	win_four = {1 => a1, 4 => a4, 7 => a7}
	win_five = {1 => a1, 5 => a5, 9 => a9}
	win_six = {3 => a3, 5 => a5, 7 => a7}
	win_seven = {2 => a2, 5 => a5, 8 => a8}
	win_eight = {3 => a3, 6 => a6, 9 => a9}
	
	middle_spaces = {2 => a2, 4 => a4, 6 => a6, 8 => a8}
	middle_spaces.each do |key, value|
		if value == ""
			$computer_pick = key
		end
	end
	corner_spaces = {1 => a1, 3 => a3, 7 => a7, 9 => a9}
	corner_spaces.each do |key, value|
		if value == ""
		$computer_pick = key
		end
	end 
	
	win_combinations = [win_one,win_two,win_three, win_four, win_five, win_six, win_seven, win_eight]
	(0..8).each do |i|
		win_set = win_combinations[i]
		x = win_set.select{|k,v| v == "X"}
    	o = win_set.select {|k,v| v == "O"}
   		empty = win_set.select {|k,v| v == ""}
	    if X.length == 2
		    if O.length < 1
		    $computer_pick = empty.key("")
			end
		end 
	end

	(0..8).each do |i|
		win_set = win_combinations[i]
		x = win_set.select{|k,v| v == "X"}
		o = win_set.select{|k,v| v == "O"}
		empty = win_set.select{|k,v| v == ""}
		if o.length == 2
			if x.length < 1
			$computer_pick = empty.key("")
			end
		end
	end
	
	a = "a"
	out = a <<$computer_pick.to_s
	return out
end

	

def plays_random(a1,a2,a3,a4,a5,a6,a7,a8,a9) #this function randomly selects a square from the remaining empty squares for the next "O" play. It takes in contents of all 9 squares (a through i) as input.
	all_hash = {1 => a1, 2 => a2, 3 => a3, 4 => a4, 5 => a5, 6 => a6, 7 => a7, 8 => a8, 9 => a9}
	puts "all_hash  is #{all_hash}"
	all_squares = [1,2,3,4,5,6,7,8,9]
	puts "all_squares is #{all_squares}"
	used_squares = [] #initiates an array that will contain untaken squares
	(1..9).each do |i|
		if all_hash[i] != """" #if a square is taken then it is pushed into the taken_squares array
			used_squares.push(i)
		end
	end
	puts "used_squares  is #{used_squares}"
	available_squares = all_squares - used_squares
	puts "available_squares pick  is #{available_squares}"	
	random_pick = available_squares.shuffle.pop.to_s #randommly selects a square from the untaken squares
	puts "random pick  is #{random_pick}"
	a = "a"
	out = a + random_pick 
	puts "out is #{out}"
	return out
end

def winner(a1, a2, a3, a4, a5, a6, a7, a8, a9)
   if a1 == "X" && a1 == a2 && a2 == a3 || a4 == "X" && a4 == a5 && a5 == a6 || a7 == "X" && a7 == a8 && a8 == a9 || a1 == "X" && a1 == "X" && a1 == a4 && a4 == a7 || a2 == "X" && a2 == a5 && a5 == a8 || a3 == "X" && a3 == a6 && a6 == a9|| a1 == "X" && a1 == a5 && a5 == a9 || a3  == "X" &&a3 == a5 && a5 == a7
        winner = "X"
   elsif a1 == "O" && a1 == a2 && a2 == a3 || a4 == "O" && a4 == a5 && a5 == a6 || a7 == "O" && a7 == a8 && a8 == a9 || a1 == "O" && a1 == "O" && a1 == a4 && a4 == a7 || a2 == "O" && a2 == a5 && a5 == a8 || a3 == "O" && a3 == a6 && a6 == a9|| a1 == "O" && a1 == a5 && a5 == a9 || a3  == "O" &&a3 == a5 && a5 == a7
        winner = "O"
    else
    	winner = "noone"
    end
    puts winner
    return winner
end


# integer
ashes = 2019
typeof(ashes)

# boolean
garbageCanFell = true

# String
favourite_player = "Virat Kohli, He's gonna do it again. he is gonna do it again, 
he's gonna.... We're gonna lose another one because of Kohli. 
I've never seen batting like that, breaks your heart. They're gonna steal an unwinnable game. 
We're gonna lose another one."
typeof(favourite_player)

# Unicode
unicode_character = "Δ"

π
ℯ


# methodswith
methodswith(String)

# bitwise and bool operations
true && false
1 & 9

# select a part of code and run to get result of just that part
(2 * 4 * 4)

# comparision using isa
isa(1, Int)

# defining a vector Vector{Int64} and a Matrix
vec = [1, 2, 3, 4, 5]
typeof(vec)
mat = [1, 2, 3, 4, 5; 6, 7, 8, 9, 10]
mat = [1 2 3 4 5; 6 7 8 9 10]
mat = ["sam" "sach" "sahi"; "shrey" "abhi" "sethu"]
typeof(mat)
Π = π
another_vec = [1 "h8" 3.1 false]

#pushing element into a vector.

push!(vec, 6)
push!(vec, 7.0)
push!(vec, "hello")


# if elseif else
if (vec[1] == 1)
    println("vec[1] is 1")
end

if 5 == 5
    println("5 == 5")
else
    println("5 != 5")
end

if 3 > 2
    println("3 > 2")
elseif 3 < 2
    println("3 < 2")
else
    println("3 == 2")
end


# what quadrant point is located in
x, y = rand(-1.0:0.1:1.0, 2) # generate two random numbers as a vector of range -1 to 1 with steps of 0.1
if x > 0 && y > 0
    println("Q1")
elseif x < 0 && y > 0
    println("Q2")
elseif x < 0 && y < 0
    println("Q3")
elseif x > 0 && y < 0
    println("Q4")
elseif x != 0 && y == 0
    println("On x-axis")
elseif x == 0 && y != 0
    println("On y-axis")
else
    println("Origin")
end


# while
n = 1
while n < 8
    println(n)
    n += 1
end


# functions
function fun()

end
typeof(fun())

function sum_two(x, y)
    return x + y
end

function sum_two_with_keywords_args(x, y; key1=1, key2=10)
    return sum([x, y, key1, key2])
end

sum_two_with_keywords_args(1, 2; key1=10, key2=19)


# anonymous funtion
filter(x -> x < 9, 1:10)

# struct

struct IPLTeamDef
    name::String
    city::String
    players::Vector{String}
end


CSK = IPLTeamDef("CSK", "Mumbai", ["Virat Kohli", "Rohit Sharma", "Yuvraj Singh"])
CSK.city
CSK.city = "Pune"
# this struct is immutable, cannot change value, to make it mutable, define a new struct as mutable struct
mutable struct IPLTeamDefMutable
    name::String
    city::String
    players::Vector{String}
    num_players::Int64
end

MI = IPLTeamDefMutable("MI", "Mumbai", ["Rohit Sharma", "Yuvraj Singh", "Dhawan"], 24)
MI.city = "Pune"

using Revise

module IPL
struct IPLTeam
    name::String
    city::String
    players::Vector{String}
    num_players::Int64
    purseLeft::Float64
    owner::String
end
end

RCB = IPL.IPLTeam("RCB", "Mumbai", ["Virat Kohli", "Rohit Sharma", "Yuvraj Singh"], 24, 3.5)
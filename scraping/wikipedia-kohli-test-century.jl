using HTTP
# get all information from the website
url = "https://en.wikipedia.org/wiki/List_of_international_cricket_centuries_by_Virat_Kohli"
# get the html code
r = HTTP.get(url)
# parsing HTML with GUmbo
using Gumbo
h = parsehtml(String(r.body))
# in julia index starts from 1, index 1 is head and we need the body
# which will be at index 2
body = h.root[2]

# use cascadia to find specific css class elements

using Cascadia
eachmatch(Selector("table"), body)
# but table is not what we need, we need "wikitable sortable plainrowheaders"
# class within the table which has test centuries list  of Virat_Kohli

#eachmatch(Selector(".wikitable sortable plainrowheaders"),body)
# cascadia does not like white space as delimiters, so we need to use . instead
s = eachmatch(Selector(".wikitable.sortable.plainrowheaders"), body)

# identifying pattern
s[1]
s[1][1]
s[1][2]
s[1][2].children
table = s[1][2]
nrow = length(table.children)
table[1]
table[2]
table[1][1]
# first index is row and second index is column

table[2][3]
table[2][3][1]
table[2][3][2][1]
table[2][7][2][1]
table[2][4][1]

# there are two patterns 
# table[row][column][1].text
# table[row][column][2][1].text

test_centuries = String[]
col = 1
for row in 2:nrow
    try
        push!(test_centuries, rstrip(table[row][col][1].text))
    catch
        push!(test_centuries, rstrip(table[row][col][1].text))
    end
end
test_centuries


table[2][2][2].text
score = String[]
col = 2
# pattern for score is table[row][col][2].text
for row in 2:nrow
    push!(score, rstrip(table[row][col][2].text))
end
score


table[2][3][2][1].text
table[2][3]
table[3][3][1][2][1].text
# for country pattern is either 
country = String[]
col = 3
for row in 2:nrow
    try
        push!(country, table[row][col][2][1].text)
    catch
        push!(country, table[row][col][1][2][1].text)
    end
end
country

pos = String[]
col = 4
for row in 2:nrow
    push!(pos, table[row][col][1].text)
end
pos

inn = String[]
col = 5
for row in 2:nrow
    push!(inn, table[row][col][1].text)
end
inn

test = String[]
col = 6
for row in 2:nrow
    push!(test, table[row][col][1].text)
end
test

venue = String[]
col = 7
for row in 2:nrow
    try
        push!(venue, table[row][col][2][1].text)
    catch
        push!(venue, table[row][col][1][2][1].text)
    end
end
venue

home_away = String[]
col = 8
for row in 2:nrow
    push!(home_away, table[row][col][1].text)
end
home_away

# pattern for date is table[row][col][1][1].text
table[2][9][1][1].text
date = String[]
col = 9
for row in 2:nrow
    push!(date, table[row][col][1][1].text)
end
date

result = String[]
col = 10
for row in 2:nrow
    push!(result, table[row][col][1].text)
end
result


# assemble data
data = [test_centuries score country pos inn test venue home_away date result]

# create header
header = ["number" "score" "country" "pos" "inn" "test" "venue" "home_away" "date" "result"]

# assemble matrix 
matrix = [header; data]

# save csv file 
using DelimitedFiles
writedlm("kohli-test-century.csv", matrix, ",")
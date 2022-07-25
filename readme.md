These are basically the stuff I learnt while playing around with the language.

***starting a repl***

cmd+shift+p - julia start repl

![Pasted image](static/startREPL.png)

use "]" to play around with packages in julia and backspace to return to normal state. 
use "?" to go to help.

***Importing libraries in your files***

we use the *using* keyword to import libraries in Julia. to run a line, we need ot press cmd+enter keys. It runs the program line by line.


***packages***

Basic commands are ```add <package-name>, rm <package-name>, status``` to know packages present. To add specific versions of packages, add ```@<version-number>``` after package name.

![Pasted image](static/addPackage.png)

upadting is just up or update <package-name>
gc for garbage collection and gc --all to force delete stuff.


***variables***

Variables are similar to any other language, typeof() func to check type of a variable.

In Julia, '' is for character literal and "" is for strings.

Best part of Julia is it allows for Unicode characters using LaTeX, so we can use LaTeX to use whichever character we want.

In Julia you can just use \pi and \euler to get values of pi and e.
![Pasted image](static/piANDe.png)


***methodswith***

Function signature  methodswith(typ[, module or function]; supertypes::Bool=false])
It returns all the possible methods that require argument of given type.

***comparision expressions***

AND - &&

OR - ||

NOT - !

If we use simple & then that would be bitwise AND.

We can even use LaTeX symbols for less than or equal to and other expressions.

```isa``` is one of the thigns we can use to check truth of the expression.


***running part of the code***

If you just want to run a part of the code, just select part you want to run and you will get result of just that.

![pasted image](static/runPartOfCode.png)

***Vectors, Matrices***
 
Vector type in Julia is ```Vector{typ}```

So a vector ```x=[1,2,3,4,5]``` is ```Vector{Int64}```

For matrix we define it as ```y = [1 2 3;4 5 6]```, we separate elements using space and not comma as Julia assumes comma separated one as an array and will throw an error. Similar to Vector, y matrix would be of type ```Matrix{Int64}```

![Pasted image 20220724114414.png](static/matrix.png)

If we have multiple types of elements in our array then it will be of type ```{any}```

***operations on vector***
If we want to append an element into a vector we use push command.

```push!(vec, <val>)```

In Julia if a Vector is of type ```Vector{Int64}``` and we try to push a Float, it will convert value to an integer whereas in python it will append the float itself and it we try to push a string it will give an error.
![Pasted image 20220724193630.png](static/vector.png)


***if elseif else***

```
if <statement>
    <code>
elseif <statement>
    <code>
else
    <code>
end
```

***for loop***

```
for i in vec
    println(i)
end
```

```
for i in 1:2:10 # to access elements in steps of 2
    println(i)
end
```

***while***

```
while <cond>
    body
end
```

***functions***

```
function func_name(<parameters>)
    code
end
```

short form of the same

```
function_name<parameters> = code
```

Julia does not care about indentation.

we separate positional arguments and keyword arguments using semi colon

```
function sum_two(x,y)
    return x+y
end

function sum_two_with_keywords_args(x,y;key1=1,key2=10)
    return sum_two([x,y,key1,key2])
end
```

***anonymous function***

same as lambda function, we can define a lambda function in Julia too.

```
(x->x*7)(8)
or
filter(x->x<9, 1:10)
``` 

***struct***

Structs are pretty simple to define, structs are default immutable, to make it immutable, need to define it as ```mutable struct``` and to define a type for the struct add ```::typ```. If we do not give a type, it will take type as ```any```.

```
mutable struct point
    x_coord::Float64
    y_coord::Float64
end
```


Once definition we cannot to change the struct definition i.e in that specific repl, if we have really have to change it, we need to restart the REPL, or other solution is definie a struct within a module.

There is another workaround using **Revise.jl**, add the package **Revise** and define the struct within a module, say ```MyModule```, then you can redefine the struct and run it again without getting any errors.

```
module MyModule
struct <make whatever changes you need>
end
```
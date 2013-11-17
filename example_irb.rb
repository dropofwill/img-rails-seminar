# This is a comment
=begin
This is a multiline comment
No-one really uses them
=end

#for this program this:
#=>
#represents what the function returns

# Everything is an object.

# Numbers are objects
3.class #=> Fixnum
  
#and can be converted to strings
3.to_s #=> "3"
3.to_s.class #=> String

# Special values are objects
nil # Nothing to see here
true # truth
false # falsehood

nil.class #=> NilClass
true.class #=> TrueClass
false.class #=> FalseClass
  

# Some basic arithmetic
1 + 1 #=> 2
8 - 1 #=> 7
10 * 2 #=> 20
35 / 5 #=> 7
2 ** 2 #=> 4
  
# There are no ++ or -- operators, but in their place we have a ton of X= operators:
a_num = 1
a_num += 1 #=> 2
a_num -= 1 #=> 1
a_num *= 3 #=> 6
#a_num /= 3 #=> 2
#a_num **= 3 #=> 8
  
  
# Arithmetic is just syntactic sugar
# for calling a method on an object
1.+(3) #=> 4
10.* 5 #=> 50

# Equality
1 == 1 #=> true
2 == 1 #=> false

# Inequality
1 != 1 #=> false
2 != 1 #=> true
!true  #=> false
!false #=> true

# apart from false itself, nil is the only other 'falsey' value

!nil   #=> true
!false #=> true
!0     #=> false

# More comparisons
1 < 10 #=> true
1 > 10 #=> false
2 <= 2 #=> true
2 >= 2 #=> true

placeholder = "use string interpolation"
"I can #{placeholder} when using double quoted strings"
#=> "I can use string interpolation when using double quoted strings"


# print to the output
  puts "I'm printing! With puts so there is a line break"
  print "I'm printing with print"
  print "so there is no line break"

# Variables
x = 25 #=> 25
x #=> 25

# Note that assignment returns the value assigned
# This means you can do multiple assignment:

x = y = 10 #=> 10
x #=> 10
y #=> 10

# By convention, use snake_case for variable names
snake_case = true

# Symbols (are objects)
# Symbols are immutable, reusable constants represented internally by an
# integer value. They're often used instead of strings to efficiently convey
# specific, meaningful values

:pending.class #=> Symbol

status = :pending

status == :pending #=> true

status == 'pending' #=> false

status == :approved #=> false
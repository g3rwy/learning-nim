##[ 

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.

]##

var sum = 0

for i in 1 .. 1000 - 1:
  if i mod 3 == 0 or i mod 5 == 0:
    sum += i

echo sum
#[ Branchless version
sum = 0
for i in 1 .. 1000 - 1:
  sum += i * cast[int]((i mod 3 == 0 or i mod 5 == 0))

echo sum
]#

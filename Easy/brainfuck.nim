import os

let code = string(readfile(paramStr(1))) ## the brainfuck code we want to interpret, add it as param when running the binary

var
    cells : array[0'u16 .. uint16.high,uint8] ## memory cells
    pter : uint16 = 0                         ## used to go around memory in brainfuck
    c : uint = 0                              ## the character index in code that we made decisions from 
    loop_ptrs : seq[uint]                     ## sequence storing our loop pointers

proc show_buffer() = 
    echo cells[0 .. 20]

while c < uint(code.len):
    case code[c]
    of '>':
        inc pter # go to memory cell on the right
    of '<':
        dec pter # go to memory cell on the left
    of '+':
        inc cells[pter] # increment memory cell
    of '-':
        dec cells[pter] # decrement memory cell
    of '.':
        stdout.write(char(cells[pter])) # write out what is inside cell as character
        #echo cells[pter]
    of ',':
        cells[pter] = stdin.readChar().ord.uint8 # read one character from input

    of '[':
        loop_ptrs.add(c) # add point to go back to when looping (its an array because there could be loop inside of loop so it needs to store multiple of them)
    of ']':
        if cells[pter] == 0: # if the current cell has 0 in it, go out of the loop
            loop_ptrs.del(loop_ptrs.high)
        else:
            c = loop_ptrs[loop_ptrs.high]
    of '#':
        break
    else:
        discard
    inc c # go to another character

show_buffer()
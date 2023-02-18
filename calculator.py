from tkinter import *
root = Tk()
root.title("Simple calculator")

# create the widget to enter text and define grid dimensions
# use columnspan= in grid() to define number of columns to stretch the widget  
e = Entry(root, width=35,borderwidth=5)
e.grid(row=0,column=0,columnspan=3,padx=10,pady=10)


# function creates buttons
def button_click(number):

    # get() captures the text in the entry box 
    # delete what is already in the entry box
    # insert new text
    current = e.get()
    e.delete(0,END)
    e.insert(0,str(current) + str(number))

# function for the clear button
def buttonClear():
    e.delete(0,END)

# function for the addition button
def buttonAdd():
    first_number = e.get()

    # define a global variable to use outside of the function
    global num1
    global math
    math = "addition"
    num1 = int(first_number)
    e.delete(0,END)

# similar functionality as the buttonAdd() func
def buttonSubtract():
    first_number = e.get()
    global num1
    global math
    math = "subtraction"
    num1 = int(first_number)
    e.delete(0,END)

def buttonMultiply():
    first_number = e.get()
    global num1
    global math
    math = "multiplication"
    num1 = int(first_number)
    e.delete(0,END)
    
def buttonDivide():
    first_number = e.get()
    global num1
    global math
    math = "division"
    num1 = int(first_number)
    e.delete(0,END)

def buttonEqual():
    # define and capture the second number 
    second_number = e.get()
    e.delete(0,END)
    num2 = int(second_number)   
    
    # operator functionality 
    if math == "addition":
        result =  num1 + num2
        e.insert(0,result)
    elif math == "subtraction":
        result = num1 - num2
        e.insert(0, result)
    elif math == "multiplication":
        result = num1 * num2
        e.insert(0, result)
    elif math =="division":
        result = num1 / num2
        e.insert(0, result)

# define buttons 
# adjustment: add button functionality
# lambda function passes button number into the button_click function
button_1 = Button(root,text="1",padx=40,pady=20,command=lambda: button_click(1))
button_2 = Button(root,text="2",padx=40,pady=20,command=lambda: button_click(2))
button_3 = Button(root,text="3",padx=40,pady=20,command=lambda: button_click(3))
button_4 = Button(root,text="4",padx=40,pady=20,command=lambda: button_click(4))
button_5 = Button(root,text="5",padx=40,pady=20,command=lambda: button_click(5))
button_6 = Button(root,text="6",padx=40,pady=20,command=lambda: button_click(6))
button_7 = Button(root,text="7",padx=40,pady=20,command=lambda: button_click(7))
button_8 = Button(root,text="8",padx=40,pady=20,command=lambda: button_click(8))
button_9 = Button(root,text="9",padx=40,pady=20,command=lambda: button_click(9))
button_0 = Button(root,text="0",padx=40,pady=20,command=lambda: button_click(0))

# define operator and command buttons
# adjustment: add button functionality and change the function name
# operators don't require lambda function becuase no parameters passed
button_equal = Button(root,text="=",padx=91,pady=20,command=buttonEqual)
button_addition = Button(root,text="+", padx=39, pady=20,command=buttonAdd)
button_clear = Button(root,text="Clear",padx=79,pady=20,command=buttonClear)


# add more button operators
button_subtraction = Button(root,text="-",padx=41,pady=20,command=buttonSubtract)
button_multiplication = Button(root,text="x", padx=40, pady=20,command=buttonMultiply)
button_division = Button(root,text="/",padx=41,pady=20,command=buttonDivide)

# place the buttons on the screen
# 1,2,3 buttons on fourth row (index 3)
button_2.grid(row=3, column=0)
button_1.grid(row=3, column=1)
button_3.grid(row=3, column=2)

# 4,5,6 buttons on third row (index 2)
button_4.grid(row=2, column=0)
button_5.grid(row=2, column=1)
button_6.grid(row=2, column=2)

# 7,8,9 buttons on second row (index 1)
button_7.grid(row=1, column=0)
button_8.grid(row=1, column=1)
button_9.grid(row=1, column=2)

# ** if there is no columnspan= the there will be space gaps between buttons
# use columnspan= in grid() to define number of columns to stretch the buttons
button_0.grid(row=4, column=0)
button_clear.grid(row=4, column=1, columnspan=2)
button_addition.grid(row=5,column=0)
button_equal.grid(row=5,column=1, columnspan=2)

button_subtraction.grid(row=6,column=0)
button_multiplication.grid(row=6,column=1)
button_division.grid(row=6,column=2)

root.mainloop()


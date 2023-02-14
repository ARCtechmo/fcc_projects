from tkinter import *
root = Tk()

# create an entry widget (input box)
# used to input data into your program
# adjust the parameters using fg='color' bg='color'
# adjust the border width
e = Entry(root, width=25)
e.pack()

# insert default value in the insert box
# the index is 0 because there is only one col row
e.insert(0,"Enter your name")

# make this button active
# add the .get() method to the text= variable
def myClick():
    hello = 'Hello ' + e.get()
    myLabel = Label(root, text=hello)
    myLabel.pack()

# create a button widget
# states: active, normal (default), disabled
# padx adds horizontal padding; pady adds vertical padding
# add the myClick function to the variable - DO NOT CALL THE function 
# change the 'text' to enter a name
# myClick func assigned to the command variable and outputs text=e.get()
myButton = Button(root, 
                text="Enter Your name", 
                padx=15, pady=15, 
                command=myClick, fg="black", bg="#ffffff"
                )

# pack the button (widget) to place it within the window
myButton.pack()

root.mainloop()
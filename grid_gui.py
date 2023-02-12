# import the module
from tkinter import *
from tkinter import ttk

# create the root widget
root = Tk()

# There are steps to creat a widget
# 1. Define it
# 2. Put the object on a screen (pack the widget)

# Create a label widget
myLabel1 = Label(root, text="Hello World")
myLabel2 = Label(root, text="My name is John Doe")
myLabel3 = Label(root, text="My name is Mary Jane")

# place the text on the gird
# this will keep the text in place 
# resizing the window will not move the text
myLabel1.grid(row=0,column=0)
myLabel2.grid(row=1,column=5)

# add a third column and the appearance changes
# the column are in relative position
myLabel3.grid(row=2,column=1)

# Pack the widget onto a screen
# myLabel1.pack()

# create the main loop of the program using the root widget
root.mainloop()



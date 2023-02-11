# import the module
from tkinter import *
from tkinter import ttk

# create the root widget
root = Tk()

# There are steps to creat a widget
# 1. Define it
# 2. Put the object on a screen (pack the widget)

# Create a label widget
myLabel = Label(root, text="Hello World")

# Pack the widget onto a screen
myLabel.pack()

# create the main loop of the program using the root widget
root.mainloop()



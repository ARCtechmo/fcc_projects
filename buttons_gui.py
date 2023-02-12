from tkinter import *

root = Tk()

# make this button active
def myClick():
    myLabel = Label(root, text="Look, I cliked a button!")
    myLabel.pack()

# create a button
# a button is a widget
# states: active, normal (default), disabled
# use padx to add horizontal padding (similar to HTML)
# use pady to add vertical padding
# add the myClick function to the variable - DO NOT CALL THE function 
myButton = Button(root, text="Click Me!", padx=50, pady=50, command=myClick, fg="green", bg="#ffffff")

# pack the button (widget) to place it within the window
myButton.pack()

root.mainloop()
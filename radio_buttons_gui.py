from tkinter import *
root = Tk()
root.title('Learn To Code at FreeCodeCamp.org')


# define Tkinter variable
# allows Tkinter to keep track of changes to the variable
r = IntVar()

# get the variable at the moment
r.get()

# this will select "2" automatically
r.set("2")

# ouput selected value when user selects the button
def clicked(value):
    myLabel = Label(root, text=value)
    myLabel.pack()

# assign variables and call the function
Radiobutton(root, text="Option 1", variable=r, value=1, command=lambda: clicked(r.get())).pack()
Radiobutton(root, text="Option 2", variable=r, value=2, command=lambda: clicked(r.get())).pack()


# normal button creates the same output
# user click the button and generates output
myButton = Button(root, text="Click Me!", command=lambda: clicked(r.get()))
myButton.pack()
root.mainloop()
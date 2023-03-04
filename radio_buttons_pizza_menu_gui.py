from tkinter import *
from PIL import Image, ImageTk
root = Tk()
root.title('Learn To Code at FreeCodeCamp.org')

# menu selection
Toppings = [
    ("Pepperoni"),("Pepperoni"),
    ("Cheese"),("Cheese"),
    ("Mushrooms"),("Mushrooms"),
    ("Sausage"),("Sausage")
]

# assign and get the current variable
pizza = StringVar()
pizza.set("Pepperoni")

# the anchor will anchor the selections to the left (left justify)
for text, topping in Toppings:
    Radiobutton(root, text=text, variable=pizza, value=topping).pack()

# output selected value when user selects the button
def clicked(value):
    myLabel = Label(root, text=value)
    myLabel.pack()

myLabel = Label(root, text=pizza.get())
myLabel.pack()

# normal button creates the same output
# user clicks the button and generates output
myButton = Button(root, text="Click Me!", command=lambda: clicked(pizza.get()))
myButton.pack()
mainloop()
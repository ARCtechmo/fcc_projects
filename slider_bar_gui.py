from tkinter import *
from PIL import Image, ImageTk
root = Tk()
root.title('Learn To Code at FreeCodeCamp.org')

# designate how big you want your box
root.geometry("400x400")

# define where to start and stop the vertical bar
# Note: your must pack them on a separate line
verical = Scale(root,from_=0, to=200)
verical.pack()

horizontal = Scale(root, from_=0, to=200, orient=HORIZONTAL)
horizontal.pack()

my_label = Label(root, text=horizontal.get()).pack()

def slide():
    my_label = Label(root, text=horizontal.get()).pack()

my_btn = Button(root, text="Click Me!", command=slide).pack()

mainloop()
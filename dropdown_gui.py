from tkinter import *
from PIL import Image, ImageTk
root = Tk()
root.title('Learn To Code at FreeCodeCamp.org')

# designate how big you want your box
root.geometry("100x100")


def show():
    myLabel = Label(root, text=clicked.get()).pack()

options = ["Mon","Tues","Wed","Thrs","Fri"]

# Drop Down Boxes
clicked = StringVar()
clicked.set(options[0])
drop = OptionMenu(root, clicked, *options)
drop.pack()

my_Button = Button(root, text="Show Selection", command=show).pack()


mainloop()
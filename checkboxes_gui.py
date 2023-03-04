from tkinter import *
from PIL import Image, ImageTk
root = Tk()
root.title('Learn To Code at FreeCodeCamp.org')

# designate how big you want your box
root.geometry("100x100")


def show():
    my_label = Label(root,text=var.get()).pack()

# create checkboxes
# 1 = checked 0 = unchecked
var = IntVar()
c = Checkbutton(root, text="Check this box!", variable=var)
c.pack()
my_Button = Button(root, text="Show Selection",command=show).pack()

mainloop()
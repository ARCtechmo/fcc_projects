from tkinter import *
from PIL import Image, ImageTk
root = Tk()
root.title('Learn To Code at FreeCodeCamp.org')

# control when the new window opens
# open an image in a new window
def open():

    # default root window
    window1 = Label(root, text="Default Window")
    window1.pack()

    # new window
    global myimage
    top = Toplevel()
    top.title('My Second Window')
    myimage = ImageTk.PhotoImage(Image.open("images/jwst1.jpeg"))
    lbl = Label(top, image=myimage).pack()
    btn2 = Button(top, text="close window", command=top.destroy).pack()

btn = Button(root, text="Open Second Window", command=open).pack()


mainloop()
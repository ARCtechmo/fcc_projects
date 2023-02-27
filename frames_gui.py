from tkinter import *
from PIL import ImageTk,Image
root = Tk()
root.title('Learn to code at FreeCodeCamp.org')

# create frames and put it on the screen
frame = LabelFrame(root, text="This is my frame...",padx=50,pady=50)
frame.pack(padx=10,pady=10)

# create button insdie the frame
b = Button(frame,text="don't click here!!")

# create a second button inside the frame
b2 = Button(frame,text="or here either!!")

# place the frames on the grid
b.grid(row=0,column=0)
b2.grid(row=1,column=1)

root.mainloop()


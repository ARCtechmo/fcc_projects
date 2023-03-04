from tkinter import *
from PIL import Image, ImageTk
from tkinter import messagebox
root = Tk()
root.title('Learn To Code at FreeCodeCamp.org')

# types of error messages
# showinfo, showwarning, showerror, askquestion, askokcancel, askyesno

# def popup():
#     messagebox.showinfo("This is my popup", "Hello World!")

def popup():
    messagebox.showerror("This is my popup", "Something Went Wrong!")
Button(root, text="Popup", command=popup).pack()
mainloop()





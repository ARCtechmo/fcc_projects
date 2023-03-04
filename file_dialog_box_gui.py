from tkinter import *
from PIL import Image, ImageTk
from tkinter import filedialog
root = Tk()
root.title('Learn To Code at FreeCodeCamp.org')

# click the open button opens the file or directory
# a fewo options:
# askopenfilename, askopenfilenames, askopenfile, 
# askopenfiles, asksaveasfilename, asksaveasfilename, etc...
def open():
    global my_image
    root.filename = filedialog.askopenfilename(
        initialdir="./images", 
        title="select a file",
        filetypes=(("jpeg files", "*.jpeg"),("any file","*.*"))
        )

    my_label = Label(root, text=root.filename).pack()
    my_image = ImageTk.PhotoImage(Image.open(root.filename))
    my_image_label = Label(image=my_image).pack()

my_btn = Button(root, text="open file", command=open).pack()

root.mainloop()
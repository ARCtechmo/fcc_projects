from tkinter import *
from PIL import Image, ImageTk
root = Tk()
root.title('Learn to Code at FreeCodeCamp.com')

# append an icon to the webframe
# root.iconbitmap('')

# create an exit button
button_quit = Button(root, text='Exit Program', command=root.quit)
button_quit.pack()

# palce an image on the screen
my_img = ImageTk.PhotoImage(Image.open("747.jpeg"))
my_label = Label(image=my_img)
my_label.pack()

root.mainloop()
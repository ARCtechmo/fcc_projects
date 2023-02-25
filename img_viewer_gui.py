from tkinter import *
from PIL import Image, ImageTk
root = Tk()
root.title('Learn to Code at FreeCodeCamp.com')

# create an image viewer
my_img1 = ImageTk.PhotoImage(Image.open("images/jwst2.jpeg"))
my_img2 = ImageTk.PhotoImage(Image.open("images/jwst1.jpeg"))
my_img3 = ImageTk.PhotoImage(Image.open("images/jwst3.jpeg"))
my_img4 = ImageTk.PhotoImage(Image.open("images/jwst4.jpeg"))

img_lst = [my_img1,my_img2,my_img3,my_img4]

my_label = Label(image=my_img1)
my_label.grid(row=0,column=0,columnspan=3)

# add button functionality

def forward(image_number):
    global my_label
    global button_forward
    global button_back

    # forward click removes previous image to avoid overlaping with the next image
    # so you when you click the forward button the current image should disappear
    # apply the .grid_forget() method to accomplish this
    my_label.grid_forget()

    # define the lable
    # forward click now defines the new image
    # since you passed image number 2 into the lambda function 
    # the next image in the list index is 2 - 1 = index 1
    my_label = Label(image=img_lst[image_number - 1])

    # update the lambda function to move to the next image
    # redfine the button_forward variable
    button_forward = Button(root,text=">>", command=lambda: forward(image_number + 1))

    # adjust the back button
    button_back = Button(root,text="<<", command=lambda: back(image_number - 1))

    # disable forward click on the last image
    if image_number == 4:
        button_forward = Button(root, text=">>", state=DISABLED)

    # place the labels on the screen
    my_label.grid(row=0,column=0,columnspan=3)
    button_back.grid(row=1,column=0)
    button_forward.grid(row=1,column=2)

def back(image_number):
    global my_label
    global button_forward
    global button_back

    my_label.grid_forget()
    my_label = Label(image=img_lst[image_number - 1])
    button_forward = Button(root,text=">>", command=lambda: forward(image_number + 1))
    button_back = Button(root,text="<<", command=lambda: back(image_number - 1))


    # disable forward click on the last image
    if image_number == 1:
        button_back = Button(root, text="<<", state=DISABLED)

    # place the labels on the screen
    my_label.grid(row=0,column=0,columnspan=3)
    button_back.grid(row=1,column=0)
    button_forward.grid(row=1,column=2)

# add buttons
# button functionality: apply a lambda function to pass something through a button command
# lambda function not necessary on the back() because...
# when you first start the program the first image is displayed so you do not need want it to go back
# disable the state of the back_button
button_back = Button(root,text="<<", command=back, state=DISABLED)
button_exit = Button(root,text="Exit Program",command=root.quit)
button_forward = Button(root,text=">>",command=lambda: forward(2))

# place the buttons on the screen
button_back.grid(row=1,column=0)
button_exit.grid(row=1,column=1)
button_forward.grid(row=1,column=2)

root.mainloop()
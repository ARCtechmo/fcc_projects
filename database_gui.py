from tkinter import *
from PIL import Image, ImageTk
import sqlite3

# databases

root = Tk()
root.title('Learn To Code at FreeCodeCamp.org')

# designate how big you want your box
root.geometry("100x100")

# create a connection to the database
# create the cursor to execute commands
conn = sqlite3.connect("address_book.db")
cur = conn.cursor()

# Delete the table (if necessary)
# cur.execute("DROP TABLE addresses")

# create a table
cur.execute(""" 
        CREATE TABLE IF NOT EXISTS addresses (
        first_name text,
        last_name text,
        address text,
        city text,
        state text,
        zipcode interger )""")

# update a record
def update():
    conn = sqlite3.connect("address_book.db")   
    cur = conn.cursor()

    record_id = delete_box.get()
    with conn:
        cur.execute(""" UPDATE addresses SET 
                first_name = :first,
                last_name = :last, 
                address = :address,
                city = :city, 
                state = :state,
                zipcode = :zipcode

                WHERE oid = :oid""",
                {'first': f_name_editor.get(),
                 'last': l_name_editor.get(),
                 'address': address_editor.get(),
                 'city': city_editor.get(),
                 'state': state_editor.get(),
                 'zipcode': zipcode_editor.get(),

                 'oid': record_id
                } )

        conn.commit()
        editor.destroy()

# select a record to edit in a new window
def edit():
    global editor
    editor = Tk()
    editor.title('Edit A Record')
    editor.geometry("50x50")
    
    conn = sqlite3.connect("address_book.db")   
    cur = conn.cursor()

    # retrieve the record
    record_id = delete_box.get()

    # query the database
    with conn:
        cur.execute("SELECT * FROM addresses WHERE oid = " + record_id)
        records = cur.fetchall()
    
        # create global variables for text box names
        global f_name_editor
        global l_name_editor
        global address_editor
        global city_editor
        global state_editor
        global zipcode_editor

        # create text boxes
        f_name_editor = Entry(editor,width=30)
        f_name_editor.grid(row=0, column=1, padx=20, pady=(10,0))

        l_name_editor = Entry(editor,width=30)
        l_name_editor.grid(row=1, column=1)

        address_editor = Entry(editor,width=30)
        address_editor.grid(row=2, column=1)

        city_editor = Entry(editor,width=30)
        city_editor.grid(row=3, column=1)

        state_editor = Entry(editor,width=30)
        state_editor.grid(row=4, column=1)

        zipcode_editor = Entry(editor,width=30)
        zipcode_editor.grid(row=5, column=1)
                                                        
        # create text box labels
        f_name_label_editor = Label(editor, text="First Name")
        f_name_label_editor.grid(row=0,column=0, pady=(10,0))

        l_name_label_editor = Label(editor, text="Last Name")
        l_name_label_editor.grid(row=1,column=0)

        address_label_editor = Label(editor, text="Address")
        address_label_editor.grid(row=2,column=0)

        city_label_editor = Label(editor, text="City")
        city_label_editor.grid(row=3,column=0)

        state_label_editor = Label(editor, text="State")
        state_label_editor.grid(row=4,column=0)

        zipcode_label_editor = Label(editor, text="Zipcode")
        zipcode_label_editor.grid(row=5,column=0)

      # loop through results
        for record in records:
            f_name_editor.insert(0,record[0])
            l_name_editor.insert(0,record[1])
            address_editor.insert(0,record[2])
            city_editor.insert(0,record[3])
            state_editor.insert(0,record[4])
            zipcode_editor.insert(0,record[5])

        # save changes to the edited record
        save_btn = Button(editor,text="Save Record", command=update)
        save_btn.grid(row=11,column=0, columnspan=2, padx=10, pady=10, ipadx=145)

# delete records
def delete():
    conn = sqlite3.connect("address_book.db")
    cur = conn.cursor()

    with conn:
        cur.execute("DELETE FROM addresses WHERE oid = " + delete_box.get())

        # commit the changes
        conn.commit()

# create a new record
def submit():
    # reconnect to the database and recreate the cursor
    # otherwise you will get an error message "cannot operate on a closed database"
    conn = sqlite3.connect("address_book.db")
    cur = conn.cursor()
    
    # create context manager to add records
    with conn:
        cur.execute("INSERT INTO addresses VALUES(:f_name, :l_name, :address, :city, :state, :zipcode)",
                        {
                        'f_name': f_name.get(),
                        'l_name': l_name.get(),
                        'address': address.get(),
                        'city': city.get(),
                        'state': state.get(),
                        'zipcode': zipcode.get()
                        } )
        
        # commit the changes
        conn.commit()

    # clear the text boxes
    f_name.delete(0, END)
    l_name.delete(0, END)
    address.delete(0, END)
    city.delete(0, END)
    state.delete(0, END)
    zipcode.delete(0, END)

# query the database
def query():
    conn = sqlite3.connect("address_book.db")
    cur = conn.cursor()   
    with conn:
        cur.execute("SELECT *, oid FROM addresses")
        records = cur.fetchall()
        # print(records)

        # Loop through the records
        print_records = ''
        for record in records:
            print_records += str(record) + "\n"
        query_label = Label(root, text=print_records)
        query_label.grid(row=12,column=0,columnspan=2)
    
    conn.commit()

# create text boxes
f_name = Entry(root,width=30)
f_name.grid(row=0, column=1, padx=20, pady=(10,0))

l_name = Entry(root,width=30)
l_name.grid(row=1, column=1)

address = Entry(root,width=30)
address.grid(row=2, column=1)

city = Entry(root,width=30)
city.grid(row=3, column=1)

state = Entry(root,width=30)
state.grid(row=4, column=1)

zipcode = Entry(root,width=30)
zipcode.grid(row=5, column=1)

delete_box = Entry(root, width=30)
delete_box.grid(row=9, column=1)

# create text box labels
f_name_label = Label(root, text="First Name")
f_name_label.grid(row=0,column=0, pady=(10,0))

l_name_label = Label(root, text="Last Name")
l_name_label.grid(row=1,column=0)

address_label = Label(root, text="Address")
address_label.grid(row=2,column=0)

city_label = Label(root, text="City")
city_label.grid(row=3,column=0)

state_label = Label(root, text="State")
state_label.grid(row=4,column=0)

zipcode_label = Label(root, text="Zipcode")
zipcode_label.grid(row=5,column=0)

delete_box_Label = Label(root, text="Select ID")
delete_box_Label.grid(row=9, column=0)

# create a submit button
submit_btn = Button(root, text="Add Record to Database", command=submit)
submit_btn.grid(row=6,column=0,columnspan=2,padx=10, pady=10, ipadx=100)

# create a query button
query_btn = Button(root, text="Show Records", command=query)
query_btn.grid(row=7, column=0,columnspan=2,pady=10,padx=10,ipadx=137)

# create a delete button
delete_btn = Button(root,text="Delete Record", command=delete)
delete_btn.grid(row=10, column=0, columnspan=2, padx=10, pady=10,ipadx=136)

# create an edit button
edit_btn = Button(root,text="Edit Record", command=edit)
edit_btn.grid(row=11,column=0, columnspan=2, padx=10, pady=10, ipadx=145)

# close connection
conn.close()
root.mainloop()
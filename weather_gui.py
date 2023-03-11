from tkinter import *
from PIL import ImageTk, Image
import requests
import json

root = Tk()
root.title("Weather App")
root.geometry("600x100")

# create zipcode lookup function
def zipLookup():

    # connect to a weather API
    # https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=22203&distance=5&API_KEY=3CF3355B-EE06-404B-8EE8-304D38439866
    try:
        api_requests = requests.get("https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=" + zip.get() +"&distance=5&API_KEY=3CF3355B-EE06-404B-8EE8-304D38439866")
        api = json.loads(api_requests.content)
        city = api[0]['ReportingArea']
        quality = api[0]['AQI']
        category = api[0]['Category']['Name']

        # change background color based on air quality category
        if category == "Good":
            weather_color = "#96ff33"
        elif category == "Moderate":
            weather_color = "#fcff33"
        elif category == "USG":
            weather_color = "#ffc433"
        elif category == "Unhealthy":
            weather_color = "#ff33d4"
        elif category == "Very Unhealthy":
            weather_color = "#c14a0f"
        elif category == "Hazardous":
            weather_color = "#ff335e"
        
        root.configure(background=weather_color)
        my_label = Label(root, text=city +" " + "Air Quality" + " " + str(quality) + " " + category, font=('Helvetica', 20), background=weather_color)
        my_label.grid(row=1, column=0, columnspan=2)

    except Exception as e:
        api = "Error..."

# create a box to enter the zip code 
zip = Entry(root)
zip.grid(row=0, column=0, sticky=W+E+N+S)

# create button to send the input for the zip code
zipButton = Button(root, text='Look up Zipcode', command=zipLookup)
zipButton.grid(row=0, column=1, sticky=W+E+N+S)
root.mainloop()
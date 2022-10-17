#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome to My Salon, how can I help you?"

# Service Menu
function SERVICE_MENU(){
  if [[ $1 ]]; then
    echo -e "\n$1"
  fi
  SERVICES=$($PSQL "SELECT * FROM services")
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
    do
      echo "$SERVICE_ID) $NAME"
    done
}

# Customer Selection
function CUSTOMER_SELECTION(){
  read -p "Are you an existing customer: (Y/N): " ANS
  if [[ "$ANS" == 'Y' || "$ANS" == 'y' ]]; then
    read -p "Enter the service_id, your phone number(555-5555), and appointment time: " SERVICE_ID_SELECTED CUSTOMER_PHONE SERVICE_TIME
    
    # send to service menu if user does not enter a number
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]; then
      SERVICE_MENU "I could not find that service. What would you like today?" 
      read -p "Enter the service id, your phone number, name, and appointment time: " SERVICE_ID_SELECTED CUSTOMER_PHONE CUSTOMER_NAME SERVICE_TIME
    fi
  
  elif [[  "$ANS" == 'N' || "$ANS" == 'n' ]]; then
    read -p "Enter the service_id, your phone number(555-5555), name, and appointment time: " SERVICE_ID_SELECTED CUSTOMER_PHONE CUSTOMER_NAME SERVICE_TIME
    
    # send to service menu if user does not enter a number
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]; then
      SERVICE_MENU "I could not find that service. What would you like today?" 
      read -p "Enter the service id, your phone number, name, and appointment time: " SERVICE_ID_SELECTED CUSTOMER_PHONE CUSTOMER_NAME SERVICE_TIME
    fi
  else
    case "$SERVICE_ID_SELECTED" in
      1 | 2 | 3)  
        SEARCH_CUSTOMER_PHONE_ID=$($PSQL "SELECT customer_id FROM customers WHERE name = '$CUSTOMER_NAME'")
        if [[ -z $SEARCH_CUSTOMER_PHONE_ID ]]; then
          SEARCH_CUSTOMER_PHONE=$($PSQL "SELECT phone FROM customers WHERE phone ILIKE '%$CUSTOMER_PHONE%'")
          if [[ -z $SEARCH_CUSTOMER_PHONE ]]; then
            INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
          fi
        fi
        ;;

      *) SERVICE_MENU "Please enter a valid selection" ;;
    esac
  fi
}

function EXIT_MENU(){
  echo -e "\nHave a nice day. Goodbye!"
}

SERVICE_MENU
CUSTOMER_SELECTION


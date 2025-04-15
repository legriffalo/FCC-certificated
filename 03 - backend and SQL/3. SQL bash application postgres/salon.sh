#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Booking appointments ~~~~~\n"


MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "What service do you need?" 
  echo -e "\n1) Quaffering\n2) Cut and style\n3) Trim\n4) Exit"
  read SERVICE_ID_SELECTED
  
  if [[ $SERVICE_ID_SELECTED -gt 3 || $SERVICE_ID_SELECTED -lt 1 ]]
  then 
    # show the list again
    MAIN_MENU "Please enter a valid option."
  else
  # 
  NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  echo -e "\nYou have selected $NAME_SELECTED"
  echo -e "\n Enter your phone number"
  
  read CUSTOMER_PHONE
  # check is in database
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  
  # if not add to db
   if [[ -z $CUSTOMER_NAME ]]
        then
        # get new customer name
        echo -e "\nWhat's your name?"
        read CUSTOMER_NAME
        # insert new customer
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
        fi
    # get time
  echo -e "\n What time would you like your appointment"
  read SERVICE_TIME

  # write to appointments table
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (service_id, customer_id, time) VALUES ($SERVICE_ID_SELECTED, $CUSTOMER_ID , '$SERVICE_TIME')")
  BOOKED_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  
  echo -e "\n I have put you down for a $BOOKED_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."

  fi
}



MAIN_MENU

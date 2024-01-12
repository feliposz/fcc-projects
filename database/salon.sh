#!/bin/bash
PSQL='psql -X --username=freecodecamp --dbname=salon --tuples-only -c'

echo 'Welcome to My Salon, how can I help you?'

while true
do
  SERVICES_LIST=$($PSQL "select service_id, name from services order by service_id")
  echo "$SERVICES_LIST" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "select name from services where service_id = '$SERVICE_ID_SELECTED'")
  if [[ -n $SERVICE_NAME ]]
  then
    break
  fi
done

echo "What's your phone number?"
read CUSTOMER_PHONE
CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]
then
  echo "I don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  CUSTOMER_INSERT_RESULT=$($PSQL "insert into customers (name, phone) values ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
fi
CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
echo "What time would you like your cut, $CUSTOMER_NAME?"
read SERVICE_TIME
APPOINTMENT_INSERT_RESULT=$($PSQL "insert into appointments (customer_id, service_id, time) values ('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")
echo "I have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."

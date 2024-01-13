#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where symbol = '$1' or name = '$1'")
  else
    ATOMIC_NUMBER=$1
  fi
  ELEMENT_INFO=$($PSQL "select atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements join properties using (atomic_number) join types using (type_id) where atomic_number = '$ATOMIC_NUMBER'")
  if [[ -z $ELEMENT_INFO ]]
  then
    echo I could not find that element in the database.
  else
    echo $ELEMENT_INFO | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR TYPE BAR MASS BAR MELT BAR BOIL
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
    done
  fi
fi
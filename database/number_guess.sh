#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"
SECRET_NUMBER=$(($RANDOM % 1000 + 1))
echo Enter your username:
read USERNAME

USER_INFO=$($PSQL "select games_played, best_game from users where name = '$USERNAME'")

if [[ -z $USER_INFO ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_RESULT=$($PSQL "insert into users values ('$USERNAME', 0, null)")
else
  echo $USER_INFO | while read GAMES_PLAYED BAR BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

echo "Guess the secret number between 1 and 1000:"
NUMBER_OF_GUESSES=0
while true
do
  #echo DEBUG: SECRET_NUMBER=$SECRET_NUMBER
  read USER_GUESS
  NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
  if [[ $USER_GUESS =~ ^[0-9]+$ ]]
  then
    if [[ $USER_GUESS -gt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    elif [[ $USER_GUESS -lt $SECRET_NUMBER ]]    
    then
      echo "It's higher than that, guess again:"
    else
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
      UPDATE_RESULT=$($PSQL "update users set games_played = games_played + 1, best_game = least('$NUMBER_OF_GUESSES', best_game) where name = '$USERNAME'")
      break
    fi
  else
    echo "That is not an integer, guess again:"
  fi
done

#!/bin/bash
#useless comment to hit commit count
# another comment for commit count
# set up for psql cli
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# get user name 
echo Enter your username:
read USER_NAME

# test show username
echo $USER_NAME

#check if in users
IFS='|' read -r USER_ID USER_FOUND GAMES BEST <<< $($PSQL "SELECT * FROM users WHERE username = '$USER_NAME'")
# if its new user
if [[ -z $USER_ID ]]
then
  # add to db 
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
  #add user 
  INSERT=$($PSQL "INSERT INTO users (username, games, best) VALUES ('$USER_NAME', 1, 1000);")
  BEST=1000
else 
  # standard greeting
  echo Welcome back, $USER_FOUND! You have played $GAMES games, and your best game took $BEST guesses.
  UPDATE=$($PSQL "UPDATE users SET games = games + 1 WHERE username = '$USER_FOUND'")

fi

echo Guess the secret number between 1 and 1000:
#generate the number
RANDOM_NUMBER=$((1 + $RANDOM % 1000))
#test number
echo $RANDOM_NUMBER

counter=0

# play the game
GUESSING_GAME() {
  local NUM=$1
  local INPUT

  until [ "$INPUT" == "$NUM" ]; do  
    read -p "Guess the number: " INPUT
    

    if [[ $INPUT =~ ^[0-9]+$ ]]
      then 
        if [ $INPUT -gt $NUM ]; then
          echo "It's lower than that, guess again:"
        elif [ $INPUT -lt $NUM ]; then
          echo "It's higher than that, guess again:"
        fi
        ((counter++))
      else
        echo That is not an integer, guess again:
      fi
  done
}

GUESSING_GAME $RANDOM_NUMBER 
 # check against best score
  if [[ $counter -lt $BEST ]]
  # update data base
  then
    # echo new high score
    UPDATE=$($PSQL "UPDATE users SET best = $counter WHERE username = '$USER_FOUND' OR username = '$USER_NAME'")
  fi

echo "You guessed it in $counter tries. The secret number was $RANDOM_NUMBER. Nice job!"

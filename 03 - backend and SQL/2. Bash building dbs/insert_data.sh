#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# clear all tables
echo $($PSQL "TRUNCATE games, teams"; )
echo $($PSQL "SELECT setval('games_game_id_seq', 1, false); ")
echo $($PSQL "SELECT setval('teams_team_id_seq', 1, false); ")

# Do not change code above this line. Use the PSQL variable above to query your database.



# open the games.csv file and create variables from it
cat games.csv | while IFS="," read YEAR ROUND TEAM OPPONENT WINNER_GOALS OPPONENTS_GOALS
do

  # get all the teams from the winners column
  if [[ $TEAM != "winner" ]]
  then
  # get check if in teams table
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM'")

    # if not found then it needs to be added to the table
    if [[ -z $TEAM_ID ]]
    then
      # insert major
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$TEAM')")
      
      # check the insert worked
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted a new team into teams, $TEAM with id: $TEAM_ID"
      fi

    fi
    
    # get all the teams who haven't won a game
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # if not found then it needs to be added to the table
    if [[ -z $OPPONENT_ID ]]
    then
      # insert opponent
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted a new team into teams, $OPPONENT with id: $OPPONENT_ID"
      fi
    fi
  fi
done

# open the games.csv file and create variables from it
cat games.csv | while IFS="," read YEAR ROUND TEAM OPPONENT WINNER_GOALS OPPONENTS_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$TEAM' LIMIT 1;" | xargs)
    OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT' LIMIT 1;" | xargs)
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE (round = '$ROUND' AND year = $YEAR AND winner_id = $TEAM_ID AND opponent_id = $OPP_ID) ;")
    
#     GAME_ID=$($PSQL "
#     SELECT game_id
# FROM games
# JOIN teams 
#   ON games.winner_id = teams.team_id OR games.loser_id = teams.team_id
# WHERE teams.name = '$TEAM' OR teams.name = '$OPPONENT';
# ")

    echo "$TEAM_ID,$OPP_ID,$GAME_ID"

    # if not found then it needs to be added to the table
    if [[ -z $GAME_ID ]]
    then
                                                                                                                          #YEAR ROUND TEAM OPPONENT WINNER_GOALS OPPONENTS_GOALS
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals ) VALUES($YEAR, '$ROUND', $TEAM_ID, $OPP_ID, $WINNER_GOALS, $OPPONENTS_GOALS)")
      if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted a new game into games, $GAME_ID with team ids: $OPP_ID, $TEAM_ID"
      fi

    fi
  fi
done

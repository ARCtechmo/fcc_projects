#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# loop over the file
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ ${year} != 'year' ]]; then

    # query the teams table
    select_team_winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='${winner}'")

    # if not found
    if [[ -z ${select_team_winner_id} ]]; then

      # insert winners
      insert_winner=$($PSQL "INSERT INTO teams(name) VALUES('${winner}')")
      if [[ ${insert_winner} == "INSERT 0 1" ]]; then
        echo "Inserted into teams table, ${winner}"
      fi
    fi

    # query the teams table
    select_team_opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='${opponent}'")

    # if not found
    if [[ -z ${select_team_opponent_id} ]]; then

      # insert opponents
      insert_opponent=$($PSQL "INSERT INTO teams(name) VALUES('${opponent}')")
      if [[ ${insert_opponent} == "INSERT 0 1" ]]; then
        echo "Inserted into teams table, ${opponent}"
      fi
    fi
  fi
done
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ ${year} != 'year' ]]; then
    select_team_winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='${winner}'")
    select_team_opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='${opponent}'")
    data=$(echo "${year},'${round}',${select_team_winner_id},${select_team_opponent_id},${winner_goals},${opponent_goals}")

    insert_games_result=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES(${data})")
    if [[ ${insert_games_result} == 'INSERT 0 1' ]]; then
      echo "Inserted into games ${data}"
    fi
  fi
done

#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

$PSQL "truncate table games, teams"

TEAMS=$(\
  (tail -n +2 games.csv | cut -d, -f3; tail -n +2 games.csv | cut -d, -f4) \
  | sort \
  | uniq \
  | sed -e "s/^/('/" -e "s/$/')/" \
  | tr '\n' ',' \
  | sed "s/,$//" \
)

$PSQL "insert into teams (name) values $TEAMS"

INSERT_GAMES_CMD="insert into games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) values "

cat games.csv | { 
unset ROWS
while IFS="," read Y R WIN OPP WIN_G OPP_G
do
  if [[ $Y == "year" ]]
  then
    continue
  fi

  if [[ -n $ROWS ]]
  then
    ROWS+=", "
  fi
  ROWS+="($Y, '$R', (select team_id from teams where name = '$WIN'), (select team_id from teams where name = '$OPP'), $WIN_G, $OPP_G)"
done
$PSQL "$INSERT_GAMES_CMD $ROWS"
}

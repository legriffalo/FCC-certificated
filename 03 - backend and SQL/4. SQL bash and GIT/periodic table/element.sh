#!/bin/bash
## pointless comment
## commenting to make commit target
if [[ $1 ]]
then

  INPUT="$1"

  if [[ "$INPUT" =~ ^[0-9]+$ ]]; then
    # It's a number → atomic number
    WHERE="atomic_number = $INPUT"
  elif [[ ${#INPUT} -le 2 ]]; then
    # Short input → probably a symbol
    WHERE="symbol = '$INPUT'"
  else
    # Otherwise assume name
    WHERE="name = '$INPUT'"
  fi


  PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
  IFS='|' read -r TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE <<<$($PSQL "\
  SELECT * FROM elements\
  JOIN properties\
  USING (atomic_number)\
  JOIN types\
  USING(type_id)\
  WHERE $WHERE;")  

  if [[ -z $ATOMIC_NUMBER ]]
  then 
    echo "I could not find that element in the database."

  else
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius." 

  fi

else 

echo "Please provide an element as an argument."

fi
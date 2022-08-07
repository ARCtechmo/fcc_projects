#! /bin/bash

# create or remove the test file
function create_remove_file(){
  local fname1=$1
  local fname2=$2
  if [[ ! -e ${fname2} ]]; then
    echo "creating the test file ${fname2}..."
    sleep 1
    cp ${fname1} ./${fname2}

  elif [[ -e ${fname2} ]]; then
    read -p "Would you like to delete the file ${fname2}? " ans
    case "${ans}" in
      "Y" | "y" | "Yes" | "yes")
        echo "removing ${fname2} and creating a new copy..."
        sleep 1
        rm "${fname2}"
        ;;

      "N" | "n" | "No" | "no")
        echo "Ok ${fname2} remains in the directory"
        ;;

      *)
        echo "Wrong answer provided"
        exit
        ;;
    esac

  fi
}
create_remove_file games.csv games2.csv

# read original file
function read_original_file(){
  cat games.csv | while IFS=",", read year round winner opponent winner_goals opponent_goals
    do
      if [[ ${year} != 'year' ]]; then
        echo ${year} ${round} ${winner} ${opponent} ${winner_goals} ${opponent_goals}
      fi
    done
    count=$(cat games.csv | wc -l) && echo "${count} lines in the file"
}
# read_original_file

function create_team_id(){
  local fname1=$1
  local fname2=$2

  if [[ -e ${fname2} ]]; then

    cat ${fname2} | IFS="," |
    sed -i 's/France/1/g;s/Croatia/2/g;s/Belgium/3/g;s/England/4/g;s/Russia/5/g;s/Sweden/6/g;
    s/Brazil/7/g;s/Uruguay/8/g;s/Colombia/9/g;s/Switzerland/10/g;s/Japan/11/g;s/Mexico/12/g;
    s/Denmark/13/g;s/Spain/14/g;s/Portugal/15/g;s/Argentina/16/g;s/Germany/17/g;s/Netherlands/18/g;
    s/Costa Rica/19/g;s/Chile/20/g;s/Nigeria/21/g;s/Algeria/22/g;s/Greecel/23/g;s/United States/24/g' ${fname2}

  fi
}
create_team_id games.csv games2.csv

# read the new modified file
function read_newfile(){
  local fname1=$1
  local fname2=$2
  echo -e "\n----------------read the lines in ${fname2}-----------------------"

  cat ${fname2} | while IFS=",", read year round winner opponent winner_goals opponent_goals
  do
    if [[ ${year} != 'year' ]]; then
      echo ${year} ${round} ${winner} ${opponent} ${winner_goals} ${opponent_goals}
    fi
  done
  echo -e '\n'
  count=$(cat games.csv | wc -l) && echo "${count} lines in the file"
}
read_newfile games.csv games2.csv

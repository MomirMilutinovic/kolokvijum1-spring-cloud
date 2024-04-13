BASE_URL=$1
if [ $# != 1 ]; then
    >&2 echo "Illegal number of parameters"
    >&2 echo "Usage send_requests.sh <base_url>"
    exit
fi

add_film () {
    curl --silent -i "$BASE_URL:8080/api/film" \
    -H "Accept: application/json" \
    -H "Content-Type:application/json" \
    -X POST --data "$1" \
    | jq -Rr '. as $line | (fromjson? | .) // $line'
}

get_films () {
    curl --silent -i "$BASE_URL:8080/api/film" \
    -H "Accept: application/json" \
    -H "Content-Type:application/json" \
    | jq -Rr '. as $line | (fromjson? | .) // $line'
}

add_film '{
    "name": "Spy X Family: Code White",
    "genre": "Animation",
    "year": 2023
}'

add_film '{
    "name": "The Big Short",
    "genre": "Biography",
    "year": 2015
}'

add_film '{
    "name": "The Imitation Game",
    "genre": "Drama",
    "year": 2014
}'

add_film '{
    "name": "Gran Turismo",
    "genre": "Action",
    "year": 2023
}'

add_film '{
    "name": "Catch Me If You Can",
    "genre": "Crime",
    "year": 2002
}'

add_film '{
    "name": "Mission: Impossible - Dead Reckoning Part One",
    "genre": "Action",
    "year": 2023
}'

get_films

#! /usr/bin/bash

INPUT=./movies.csv 
declare -a genres=("Action" "Adventure" "Animation" 
"Children" "Comedy" "Crime" "Documentary" "Drama" "Fantasy" "Film-Noir"
"Horror" "IMAX" "Musical" "Mystery" "Romance" "Sci-Fi" 
"Thriller" "War" "Western")

for i in {1915..2018}
do
	grep "($i)" $INPUT > ./totalMovies.txt
	totalCount=`awk 'END { print NR }' ./totalMovies.txt`
	echo "$i - Total Movies: $totalCount" >> ./movieDistribution.txt

	for g in "${genres[@]}"
	do
		awk "/$g/ {print}" totalMovies.txt > ./genreCount.txt
		count=`awk 'END { print NR }' ./genreCount.txt`
		echo "$g : $count" >> ./movieDistribution.txt
	done
	echo "----------------" >> ./movieDistribution.txt
done

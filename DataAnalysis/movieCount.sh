#! /usr/bin/bash

#Data set from MovieLens from 1915 to 2018
INPUT=./movies.csv 

#An array of all the genres
declare -a genres=("Action" "Adventure" "Animation" 
"Children" "Comedy" "Crime" "Documentary" "Drama" "Fantasy" "Film-Noir"
"Horror" "IMAX" "Musical" "Mystery" "Romance" "Sci-Fi" 
"Thriller" "War" "Western")

for i in {1915..2018}
do
	grep "($i)" $INPUT > ./totalMovies.txt
	totalCount=`awk 'END { print NR }' ./totalMovies.txt`
	echo "$i - Total Movies: $totalCount" >> ./movieDistribution.txt

	#Filter out movies by their genres, do a count for each genre, and send it to genreCount.txt
	for g in "${genres[@]}"
	do
		awk "/$g/ {print}" totalMovies.txt > ./genreCount.txt
		count=`awk 'END { print NR }' ./genreCount.txt`
		echo "$g : $count" >> ./movieDistribution.txt
	done
	#The comprehensive list for all years and the frequency of genres is printed to movieDistribution.txt
	echo "----------------" >> ./movieDistribution.txt
done

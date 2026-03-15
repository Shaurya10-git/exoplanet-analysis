#!/bin/bash

# ---------------------------------------------------------
# Exoplanet Exploration Script
# This script explores the NASA confirmed exoplanet dataset
# and finds some interesting discoveries using awk.
# ---------------------------------------------------------

DATA="exoplanets.csv"

echo "---------------------------------------------"
echo " Exploring the Exoplanet Dataset"
echo "---------------------------------------------"
echo ""

# 1. Closest planet to Earth
echo "Finding the closest known exoplanet..."

awk -F',' 'NR>1 && $3!="" { 
    if(min=="" || $3 < min){
        min=$3
        planet=$1
    }
}
END {
    print "Closest planet discovered:", planet
    print "Distance from Earth:", min, "parsecs"
}' $DATA

echo ""

# 2. Planet with the shortest orbital period
echo "Searching for the planet with the fastest orbit..."

awk -F',' 'NR>1 && $4!="" {
    if(min=="" || $4 < min){
        min=$4
        planet=$1
    }
}
END {
    print "Planet with shortest orbital period:", planet
    print "Orbital period:", min, "days"
}' $DATA

echo ""

# 3. Most massive planet discovered
echo "Looking for the most massive planet..."

awk -F',' 'NR>1 && $5!="" {
    if($5 > max){
        max=$5
        planet=$1
    }
}
END {
    print "Most massive planet:", planet
    print "Mass:", max, "Jupiter masses"
}' $DATA

echo ""
echo "---------------------------------------------"
echo " Exploration complete!"
echo "---------------------------------------------"

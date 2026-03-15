#!/bin/bash

DATA="exoplanets.csv"

echo "Exploring Exoplanet Dataset"

# Closest planet
awk -F',' 'NR>1 {if(min=="" || $2<min){min=$2;planet=$1}} END{print "Closest planet:",planet,"Distance:",min}' $DATA

# Shortest orbital period
awk -F',' 'NR>1 {if(min=="" || $3<min){min=$3;planet=$1}} END{print "Shortest orbit:",planet,"Period:",min}' $DATA

# Most massive planet
awk -F',' 'NR>1 {if($4>max){max=$4;planet=$1}} END{print "Most massive planet:",planet,"Mass:",max}' $DATA
#!/bin/bash

declare -A TodasPalavras

Minimo=3

for Palavra in $(tr -d [:punct:][:digit:] < $1 | tr A-Z a-z)
do
  ((${#Palavra} < Minimo)) && continue
  let TodasPalavras[$Palavra]++
done
paste <(tr ' ' '\n' <<< ${TodasPalavras[@]}) <(tr ' ' '\n' <<< ${!TodasPalavras[@]}) | sort -nr


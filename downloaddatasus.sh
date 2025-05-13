#!/bin/bash


URL="ftp://ftp.datasus.gov.br/dissemin/publicos/SIASUS/200801_/Dados/"

curl --list-only $URL | grep PASC 

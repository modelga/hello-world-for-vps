reveal(){
  if [ -e terraform.tfstate ]
  then
    HIDE=0
  else
    git secret reveal
    HIDE=1
  fi
}

hide(){
  if [[ $1 == 1 ]]
  then
    git secret hide -d
  fi
}

reveal
operate $@
hide $HIDE
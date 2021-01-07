#!/bin/bash

function deleteAllAt(){
  if [ $# == 0 ]; then
    return
  fi

  for dir2del in "$1"/* ; do
  if [ -d "$dir2del" ]; then
    rm -rf "$dir2del"
  fi
  done

  rm -if "$1"/*
}

function transformFileName() {
  # $1: src path
  # $2: tar path
  # $3: transform src keyword
  # $4: transform tar keyword
  for file in `ls $1`; do
    tarFile=$2"/"${file//$3/$4}
    if [ -d $1"/"$file ]; then
      mkdir $tarFile
      echo " ├───────── "
      echo " ├ make dir $tarFile"
      transformFileName $1"/"$file $tarFile $3 $4
    else
      srcFile=$1"/"$file
      cp $srcFile $tarFile
      echo " ├ generate file $tarFile"
    fi
  done
}

echo "please input repo name:"
read repoName
if [ ${#$repoName} == 0 ]; then
  echo '$className cannot be empty'
  exit 1;
fi
businessFileName=$repoName
businessName=$businessFileName
echo "Start generating code:"
resultDirTmp="ThirdPartFrameworks/$businessName"
if [ -d "$resultDirTmp" ]; then
  deleteAllAt "$resultDirTmp"
else
  mkdir -p "$resultDirTmp"
fi
templateDir="ThirdPartFrameworks/Template"
templateName="Template"
transformFileName $templateDir $resultDirTmp $templateName $businessName
sed -i '.bak' 's/Template/'$repoName'/g' `grep Template -rl $resultDirTmp`
find $resultDirTmp -name '*.bak' -exec rm -rf {} \;
echo " └─✅ Done, bye!"

echo "Start generating Podfile"
sed -i '' "s/def localPods/def localPods\n\  pod \'$repoName\', :path => \'\.\/ThirdPartFrameworks\/$repoName\'/g" Podfile
echo " ✅ Done, bye!"

pod install

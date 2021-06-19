rm prev-envconfig.json
rm commit
git log -1  --skip 1 --pretty=format:"%h">>commit
commit=`cat commit`
echo "$commit"
git cat-file -p $commit:./envconfig.json>>prev-envconfig.json
j=1
jq -c '.[]' envconfig.json | while read i; do
    # extract versions
    echo $i  | jq .version>>versionfile$j    
    echo $i  | jq .runtimeVersion
    echo $i  | jq .keywords[0]>>checkprimary$j
    echo "************"
    j=$((j+1))
done
j=1
jq -c '.[]' prev-envconfig.json | while read i; do
    # do stuff with $i
    echo $i  | jq .version>>prev-versionfile$j    
    echo $i  | jq .runtimeVersion>>runtimeversion
    echo $i  | jq .keywords[0]
    echo "************"
     j=$((j+1))
done

for (( i=1; i<=j; ++i)); do
    if [ -n "$(cmp versionfile$i prev-versionfile$i)" ]
then
    echo different version detected
    if [ $(cat checkprimary$i) == "primary" ]
  then
   #make $path-env-img TAG=$version
   echo "makepath Dockerfile: $path-env-img $(cat versionfile$1)" 
  else
else
  echo same version detected on changed file
  echo aborting release
  exit 1
fi

done

 
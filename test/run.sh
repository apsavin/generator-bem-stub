START=$(date +%s)

echo 'Running tests...'

if ! [ -d output ]; then
    mkdir output
else
    echo clearing...
    rm -rf output/*
fi

k=0

if [ "$1" = "" ] || [ "$1" = 'basic' ]; then
    folder='basic'
elif [ "$1" = 'techs' ]; then
    folder='techs'
else
    echo '==> FAIL -> Invalid parameter'
    exit 1
fi

for j in $folder/* ;
do
    i=$j/${j:6}.json
    cd output

    yo bemgen ../$i

    len=${#i}
    projectName=${i:6:(len-12)/2}
    cd $projectName
    
    if [ $folder = 'basic' ]; then
        if ! diff ../../$j/package.json package.json; then
            echo '==> FAIL ->' $j/package.json '!==' output/$projectName/package.json
            exit 1
        elif ! diff ../../$j/make.js .bem/make.js; then
            echo '==> FAIL ->' $j/make.js '!==' output/$projectName/.bem/make.js
            exit 1
        elif ! diff ../../$j/level.js desktop.bundles/.bem/level.js; then
            echo '==> FAIL ->' $j/level.js '!==' output/$projectName/desktop.bundles/.bem/level.js
            exit 1
        elif ! diff ../../$j/blocks.js .bem/levels/blocks.js; then
            echo '==> FAIL ->' $j/blocks.js '!==' output/$projectName/.bem/levels/blocks.js
            exit 1
        elif ! diff ../../$j/index.bemjson.js desktop.bundles/index/index.bemjson.js; then
            echo '==> FAIL ->' $j/index.bemjson.js '!==' output/$projectName/desktop.bundles/index/index.bemjson.js
            exit 1
        fi
    fi 

    k=$(( $k + 1 ))
    npm install
    ./node_modules/.bin/bem make

    if [ "$?" -ne "0" ]
    then    
        echo output/$projectName '==> FAIL -> ./node_modules/.bin/bem make'
        exit 1
    fi

    cd ../..
done

echo
echo '==> OK! -> '$k 'tests'

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "It took $DIFF seconds"

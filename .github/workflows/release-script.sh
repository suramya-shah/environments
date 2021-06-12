    pwd=`pwd`;echo ${{ matrix.run }}>>$pwd/folder; 
    cat $pwd/folder | cut -d '/' -f1>>$pwd/path ;
    cat $pwd/folder | cut -d '-' -f2>>$pwd/ver ; 
    s=$(cat $pwd/folder); echo "${s##*/}">>$pwd/dockerfile;
    echo "ver="; cat $pwd/ver;  echo "dockerfile="; 
    cat $pwd/dockerfile ; echo "path=";
    cat $pwd/path; path=$(cat $pwd/path); 
    if [[ $(cat $pwd/dockerfile) == 'Dockerfile' ]]; then version=$(cat $path/version); else ver=-$(cat $pwd/ver) && cd $path && version=$(cat version$ver); fi; 
    echo "version=$version" >> $GITHUB_ENV ;   
    echo "path=$path" >> $GITHUB_ENV ;
    cat $path/version | cut -d ':' -f1>>$pwd/dockerRepo;
    dockerRepo=$(cat $pwd/dockerRepo);    
    echo "dockerRepo=$dockerRepo" >> $GITHUB_ENV ;
    rm $pwd/ver; rm $pwd/folder; rm $pwd/path; rm $pwd/dockerfile;

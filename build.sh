#!/bin/sh
STC_PATH="/home/q/php/STC"
path=`dirname $0`;
first=${path:0:1};
if [[ $first != '/' ]];then
    path=$(pwd);
fi

if [ -d ${path}"/output" ];then
	rm -rf ${path}"/output";
fi
mkdir ${path}"/output";
if [ ! -f ${path}"/config.php" ];then
	cp $STC_PATH/config/config.php ${path};
fi
#path=$(pwd);
/usr/local/bin/php $STC_PATH/index.php ${path} ly.so.com $1;
if [ -f ${path}"/stc.error.log" ]; then
    rm -rf ${path}"/stc.error.log";
    exit 1;
fi

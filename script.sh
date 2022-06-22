#!/bin/bash

function unique_up_list {
    echo -en "list of unique ip addresses with how many requests each ip address did, sorted by request number ascending \n"
    cat $FILE_NAME | awk '{print $1}' | cut -d ' ' -f2 | sort | uniq -c | sort -rn 
}
function most_requested_url {
    echo -ne "The most requested url \n"
    cat $FILE_NAME | awk '{print $7}' | uniq -c | sort -rn | head -1 | awk '{print $2}'
}
function total_body_magabytes {
    echo -ne "Total “body_bytes_sent” in megabytes \n"
    cat $FILE_NAME | awk '{sum+=$10}END{print sum/1048576;}'
}
function file_size {
    echo -ne "size of the file in a human readable format \n" 
    du $FILE_NAME -h
}
function compress_file {
    echo -ne "Compress the file to multiple compressed files \n" 
    tar -czf - $FILE_NAME | split -b 20k - $FILE_NAME.tar.gz
}


FILE_NAME=$1
IS_ALL=$2
if ((  $IS_ALL == "all"))
    then
        option='ALL'
    else
        echo -ne "1- A list of unique ip addresses with how many requests each ip address did, sorted by request number ascending

        2- Get the most requested url in the file

        3- Print the total “body_bytes_sent” for all the requests converted to megabytes

        4- Print the size of the file in a human readable format

        5- Compress the file to multiple compressed files each with size of 20 KB 

        6- DO IT ALL \n"

        read option
    fi
case $option in

  1)
        unique_up_list
    ;;

  2)
        most_requested_url
    ;;
  3)
        total_body_magabytes
    ;;
  4)
        file_size
    ;;
  5)
        compress_file   
    ;;
  6 | ALL)
        unique_up_list
        most_requested_url
        total_body_magabytes
        file_size
        compress_file
  ;;
  *)
    echo -ne "unknown"
    ;;
esac

# nginx-log-parsing
a bash script to extract the following data from the log file:

1- A list of unique ip addresses with how many requests each ip address did, sorted by request number ascending

2- Get the most requested url in the file

3- Print the total “body_bytes_sent” for all the requests converted to megabytes

4- Print the size of the file in a human readable format

5- Compress the file to multiple compressed files each with size of 20 KB


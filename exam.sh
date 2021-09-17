#! /bin/bash  

#a)

read -p "Enter a directory name: " directory_name
read -p "Enter a max size(Mb): " max_size

directory_size=$(du -shm ~/$directory_name | cut -f1)

if [ $directory_size -gt $max_size ]
then
echo "The directory size is greater than the given number:"
ls ~/$directory_name
elif [ $directory_size -eq $max_size ]
then
echo "The given number and directory size are equal!"
elif [ $directory_size -lt $max_size ]
then
echo "The given number is greater!"
fi

#b)

TIMESTAMP_=$(date "+%Y.%m.%d-%H.%M.%S")

for NUM in {1..10}
do
touch ~/Documents/test_$TIMESTAMP_$NUM.txt
random_string=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1000)
echo "$random_string" > ~/Documents/test_$TIMESTAMP_$NUM.txt
done
#To schedule this code to run every 6 hours I will use crontab: 0 */6 * * * /home/misha/[directory]/[file_name].sh

#c)

lsof | grep -i java > ~/tmp/investigation/access_PID.txt
# Scaler-Bash-Assignment 
quest1.sh  

Let me explain how the script works:

The script checks if the log file exists and is readable. If not, it prints an error message and exits with a status code 1.
The script uses wc -l to count the total number of lines in the log file, which represents the total number of requests.
The script uses grep to count the number of successful requests (HTTP status codes in the range 200-299).
The -c option tells grep to count the matches, and the -E option enables extended regular expressions.
The script uses awk to calculate the percentage of successful requests. 
The BEGIN block is used to perform the calculation, and printf is used to format the output as a percentage with two decimal places.
The script uses awk to extract the IP addresses from the log file, and then pipes the output to sort, uniq -c, and sort -rn to find the most active user.
The head -1 command is used to extract the top result.
You can save this script to a file (e.g., log_analyzer.sh), make it executable with chmod +x log_analyzer.sh, and then run it with ./log_analyzer.sh <log_file_path>.

ques2.sh

find "$directory" -type f -print: This finds all files (not directories) in the specified directory and its subdirectories, and prints their paths.
awk -F '.' '{print tolower($NF)}': This uses Awk to process the output of find. It sets the field separator to . (dot) and prints the last field ($NF) in lowercase using tolower(). This effectively extracts the file extension (e.g., .txt, .jpg, etc.).
sort: This sorts the output of Awk in alphabetical order.
uniq -c: This counts the number of occurrences of each file extension and prints the count along with the extension.
sort -rn: This sorts the output of uniq in reverse numerical order (i.e., most frequent extensions first).
awk '{printf "%-10s %s\n", $2, $1}': This uses Awk again to format the output. It prints the file extension ( $2 ) followed by the count ( $1 ) with a fixed width of 10 characters for the extension.
ex- 0/p 
File Type Counts:
.txt      10
.jpg       5
.pdf       3
.doc       2
This script assumes that file extensions are separated from the file name by a dot (.). If your file naming conventions use a different separator, you'll need to adjust the script accordingly.



ques3.sh
if [ $# -ne 1 ]; then
  echo "Usage: $0 <service_name>"
  exit 1
fi
This block checks if the script is called with exactly one command-line argument (i.e., the service name). If not, it prints an error message and exits with a non-zero status code (1)
The script uses a for loop to iterate over the command-line arguments ($@), which contains all the service names passed as arguments.
if [ "$(ps -ef | grep -v grep | grep $SERVICE_NAME | wc -l)" -gt 0 ]; then
  # ...
else
  # ...
fi
The script checks the status of each service using the same logic as before.
Example O/P-
./script.sh apache2 sshd postfix
This would check the status of the apache2, sshd, and postfix services.
--this script assumes that the service names are exact matches.

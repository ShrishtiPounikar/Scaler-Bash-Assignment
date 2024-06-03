# Scaler-Bash-Assignment 
quest1.sh  $0 <log_file_path>"

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

ques1.sh

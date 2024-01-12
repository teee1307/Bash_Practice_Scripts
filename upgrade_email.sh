output_file=/home/tanaya/Bash_Scripts_Practice/upgrade_log/upgrades.txt
sudo apt list --upgradable > "$output_file"

mpack -s "upgrades available" $output_file tanayas728@gmail.com
#task 3

#!/bin/bash

# Menyesuaikan filter untuk file dengan ekstensi .txt dan .py
files=$(ls $1/*.txt $1/*.py 2>/dev/null)
if [ -z "$files" ]; then
    echo "No text or Python files found in the directory."
    exit 1
fi

# Menampilkan header tabel
printf "%-30s %-10s %-10s %-10s\n" "File Name" "Lines" "Words" "Characters"
printf "%s\n" "------------------------------------------------------------"

# Menghitung statistik untuk setiap file
for file in $files; do
    num_lines=$(wc -l < "$file")
    num_words=$(wc -w < "$file")
    num_chars=$(wc -m < "$file")

    # Menampilkan hasil dalam format tabel
    printf "%-30s %-10s %-10s %-10s\n" "$(basename $file)" "$num_lines" "$num_words" "$num_chars"
done

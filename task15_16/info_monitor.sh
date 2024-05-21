#task 16

#!/bin/bash

echo "Hostname: $(hostname)"

echo "Waktu sistem saat ini: $(date)"

echo "Jumlah pengguna yang sedang login: $(who | wc -l)"

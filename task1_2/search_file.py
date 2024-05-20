import os
import sys

def search_files(directory, extension):
    found_files = []
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(extension):
                found_files.append(os.path.join(root, file))
    return found_files

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python3 search_file.py <directory> <extension>")
        sys.exit(1)
    
    directory = sys.argv[1]
    extension = sys.argv[2]

    files = search_files(directory, extension)
    if files:
        print("Found files:")
        for file in files:
            print(file)
    else:
        print("No files found with extension", extension)

# Check if the directory C:\temp exists, create it if it doesn't
if (-not (Test-Path -Path "C:\temp")) {
    New-Item -ItemType Directory -Path "C:\temp" | Out-Null
}

# Create the file flag1.txt in C:\temp
New-Item -ItemType File -Path "C:\temp\flag1.txt" | Out-Null

# Exit the script
Exit

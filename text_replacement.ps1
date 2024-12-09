# Define the root directory
$RootDirectory = "C:\sample"

# Define the strings to search and replace
$SearchString = "company one"
$ReplaceString = "company two"

# Get all files in the directory and subdirectories
$Files = Get-ChildItem -Path $RootDirectory -Recurse -File

# Iterate through each file
foreach ($File in $Files) {
    try {
        # Read the file content
        $Content = Get-Content -Path $File.FullName -Raw -ErrorAction Stop

        # Check if the file contains the search string
        if ($Content -match [regex]::Escape($SearchString)) {
            # Replace the string
            $UpdatedContent = $Content -replace [regex]::Escape($SearchString), $ReplaceString
            
            # Write the updated content back to the file
            Set-Content -Path $File.FullName -Value $UpdatedContent -ErrorAction Stop
            Write-Host "Updated file: $($File.FullName)" -ForegroundColor Green
        }
    } catch {
        Write-Host "Failed to process file: $($File.FullName). Error: $_" -ForegroundColor Red
    }
}

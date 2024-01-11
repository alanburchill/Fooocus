# PowerShell Script for Launching entry_with_update.py with Options

# Function to run the Python script with selected options
function Run-PythonScript {
    param (
        [string]$preset,
        [bool]$debugMode
    )

    $pythonPath = ".\python_embeded\python.exe"
    $scriptPath = "Fooocus\entry_with_update.py"
    $debugFlag = ""

    if ($debugMode) {
        $debugFlag = "--debug-mode"
    }

    $command = "$pythonPath -s $scriptPath --preset $preset $debugFlag"
    Write-Host "Running command: $command"
    Invoke-Expression $command
}

# Menu options
Write-Host "Select a preset to run:"
Write-Host "1: sai - Designed for the PaintTool SAI software."
Write-Host "2: realistic - Aims to provide a more realistic painting experience."
Write-Host "3: lcm - Designed for the Live2D Cubism Modeler software."
Write-Host "4: anime - Designed for anime-style artwork."
Write-Host "5: No preset - Use this if you don't want to use any preset."
$choice = Read-Host "Enter your choice (1-5)"

# Debug mode option
Write-Host "Include debug mode? (y/n) - Debug mode provides more detailed output, which can be helpful for troubleshooting issues."
$debug = Read-Host "Enter your choice (y/n)"

# Mapping choice to preset
switch ($choice) {
    "1" { $preset = "sai" }
    "2" { $preset = "realistic" }
    "3" { $preset = "lcm" }
    "4" { $preset = "anime" }
    "5" { $preset = $null }
    default { Write-Host "Invalid choice"; exit }
}

# Check for debug mode
$debugMode = $false
if ($debug -eq "y") {
    $debugMode = $true
}

# Run the script with selected options
Run-PythonScript -preset $preset -debugMode $debugMode

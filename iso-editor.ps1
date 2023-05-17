<#
.SYNOPSIS
 Simple ISO editor Windows iso files

.DESCRIPTION
 Edit Windows ISOs bundled packages to create a minimal iso file

.INPUTS
  <Inputs if any, otherwise state None>

.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>

.NOTES
  Version:        1.1
  Author:         Bevan Stanely
  Creation Date:  2023/05/10
  Purpose/Change: Initial script development

.EXAMPLE
  <Example goes here. Repeat this attribute for more than one example>
#>

# ------------------------------ [Initialisations] ------------------------------ #

# Get command line arguments.
# https://stackoverflow.com/a/5592684/6346131
# https://www.red-gate.com/simple-talk/sysadmin/powershell/how-to-use-parameters-in-powershell/
Param(
  [Parameter(Mandatory=$true)]
  [ValidatePattern("^[d-z]$")][string]$driveletter
  )

# Set Error Action to Silently Continue
#$ErrorActionPreference = "SilentlyContinue"

# Dot Source required Function Libraries
#. "C:\Scripts\Functions\Logging_Functions.ps1"

# -------------------------------- [Declarations] ------------------------------- #

# Script Version
$sScriptVersion = "1.1"

# Log File Info
$sLogPath = "C:\Windows\Temp"

# --------------------------------- [Functions] --------------------------------- #

Function Check-ISO{
  Param()

  Begin{
    Write-Host "Checking the provided DRIVE"
  }

  Process{
    Try{
      if ((-not (Test-Path -Path "$driveletter\sources\boot.wim")) `
        -or (-not (Test-Path -Path "$driveletter\sources\install.wim"))){

        throw "Can't find Windows OS Installation files in $driveletter:\"

      }
    }

    Catch{
      Write-Host "Please enter the correct Drive Letter for the iso/dvd"
      Break
    }
  }
}

# --------------------------------- [Execution] --------------------------------- #

Start-Transcript -OutputDirectory $sLogPath

# Script Execution goes here
# ...
Check-ISO

Write-Host "Outside"

Stop-Transcript
# ------------------------------------ [END] ------------------------------------ #

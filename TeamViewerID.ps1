<#
Allows Absolute Console to use the parameters:
.param
#>
#Array for possible paths to the TeamViewer logs
$tvpaths = 'c:\program files (x86)\TeamViewer\TeamViewer13_Logfile.log','c:\program files (x86)\TeamViewer\TeamViewer12_Logfile.log','c:\program files (x86)\TeamViewer\TeamViewer11_Logfile.log','c:\program files (x86)\TeamViewer\TeamViewer10_Logfile.log','c:\program files (x86)\TeamViewer\TeamViewer9_Logfile.log','c:\program files (x86)\TeamViewer\TeamViewer8_Logfile.log','c:\program files (x86)\TeamViewer\TeamViewer7_Logfile.log'

#String to match, searching for the TeamViewer host ID
$testString = "ID:                 \d\d\d\d\d\d\d\d\d"

#original test string to verify data exists on test machine
#if (Test-Path 'C:\Program Files (x86)\TeamViewer\TeamViewer13_Logfile.log') = $True

$matchString = $testString -match '/a\w*\s' | % {$Matches.Values -replace '/','' -replace'\s','' -replace '                 ',''}
Get-Content $tvpaths | Select-String -pattern $testString -CaseSensitive |select-object -First 1

Write-Host $matchString

$tvpaths = 'c:\program files (x86)\TeamViewer\TeamViewer13_Logfile.log','c:\program files (x86)\TeamViewer\TeamViewer12_Logfile.log','c:\program files (x86)\TeamViewer\TeamViewer11_Logfile.log','c:\program files (x86)\TeamViewer\TeamViewer10_Logfile.log','c:\program files (x86)\TeamViewer\TeamViewer9_Logfile.log','c:\program files (x86)\TeamViewer\TeamViewer8_Logfile.log','c:\program files (x86)\TeamViewer\TeamViewer7_Logfile.log'
$tvpaths | Foreach {if ($_){Test-Path $_}}
write-host "Variable `$tvpaths contains $($tvpaths.count) paths, and $($true.count) were found valid"
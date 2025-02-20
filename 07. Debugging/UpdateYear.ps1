function AgeOutput {
    Param(
        $User
    )

    Write-Output "$($User.Name) is $($User.Age) this year."
} 
function UpdateYear {
    param (
        #$DatabaseFile = "$PSScriptRoot\..\LabFiles\MyLabFile.csv"
        $DatabaseFile = "C:\Users\fm\PSAdvrepo\Labfiles\MyLabFile.csv"
    )

    $MyUserList = Get-Content -Path $DatabaseFile | ConvertFrom-Csv
    foreach ($User in $MyUserList) {
        [int]$User.age = [int]$User.Age + 1
        #$User.age = $User.Age + 1 
        AgeOutput $User
    }
    Set-Content -Value $($MyUserList | ConvertTo-Csv  -notypeInformation) -Path $DatabaseFile -WhatIf
}

UpdateYear
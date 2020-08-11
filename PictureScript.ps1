$mainDir = (Get-Location)
$CurrentDepartment = Read-Host -Prompt 'Input Current Department'
    


$choices = [System.Management.Automation.Host.ChoiceDescription[]] @("&YES","&NO")
while ( $true ) {


    $CurrentLab = Read-Host -Prompt 'Input Current Lab Room'


    if(Test-Path $CurrentDepartment){
        Write-Output "No New folder created, it already exists :)"
    }else{
        New-Item -Name "$CurrentDepartment" -ItemType "directory"
    }

    cd $CurrentDepartment

    if(Test-Path $CurrentLab){
        Write-Output "No New filder created, it already exists :)"
    }else{
        New-Item -Name "$CurrentLab" -ItemType "directory"
    }

    cd $mainDir

    $filename = Read-Host -Prompt 'Input current SAP ID Number'
    Write-Warning "Have you taken all pictures of the device" -WarningAction Inquire
    



    $files = Get-ChildItem *.jpg
    $counter = 0


    foreach ($file in $files) {
        $counter++
        Write-Output $file.FullName
        Move-Item $file -Destination "$CurrentDepartment\$CurrentLab\$filename_$counter.jpg"
    }

    Write-Host "Files moved and renamed"
    $choice = $Host.UI.PromptForChoice("Repeat the script?","",$choices,0)
  if ( $choice -ne 0 ) {
    break
  }
}
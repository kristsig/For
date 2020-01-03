Clear-Host
Function Stop-Computers{
   $FileName = "C:\temp\ComputerList.txt"
   if([System.IO.File]::Exists($FileName)){
      $tempList = Get-Content @($FileName)
      $tempList | ForEach-Object{
         if($_.length -gt 5){
            $FisrtsCommand = ("""shutdown /s /t 2 /m \\$_""")
            $SecondCommand = ("""Stop-Computer $_""")
            Write-Host "Stopping: $_"
            try{
               Start-Process powershell.exe -ArgumentList $FisrtsCommand
            }Catch{}
            try{
               Start-Process powershell.exe -ArgumentList $SecondCommand
            }Catch{}
         }
      }
   }
   else{Write-Host "File not found"}
}
Stop-Computers

Exit
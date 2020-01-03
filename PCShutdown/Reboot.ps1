Clear-Host
Function Restart-Computers{
   $FileName = "C:\temp\HostList.txt"
   if([System.IO.File]::Exists($FileName)){
      $tempList = Get-Content @($FileName)
      $tempList | ForEach-Object{
         if($_.length -gt 5){
            $FisrtsCommand = ("""shutdown /r /t 2 /m \\$_""")
            $SecondCommand = ("""Restart-Computer $_""")
            Write-Host "Restarting: $_"
            try{
               Start-Process -WindowStyle Hidden powershell.exe -ArgumentList $FisrtsCommand
            }Catch{}
            try{
               Start-Process -WindowStyle Hidden powershell.exe -ArgumentList $SecondCommand
            }Catch{}
         }
      }
   }
   else{Write-Host "File not found"}
}
Restart-Computers

Exit
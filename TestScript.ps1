. .\"Logger.ps1"

$UniqueId = [System.Guid]::NewGuid().ToString()
$startTime = Get-Date
$ScriptVersion = "1.1.1"
$ScriptName = "TestScript"

Log-Script -ScriptName $ScriptName -ScriptVersion $ScriptVersion -UniqueId $UniqueId -MessageType "Start" -ErrorCode 0

try {
    Log-Script -ScriptName $ScriptName -ScriptVersion $ScriptVersion -UniqueId $UniqueId -MessageType "Info" -ErrorCode 0 -ErrorDescription "Try"
    Start-Sleep -Seconds 10
    $a = 1/0
    
} catch {
    $ErrorCode = $_.Exception.HResult
    $ErrorMessage = $_.Exception.Message

    Log-Script -ScriptName $ScriptName -ScriptVersion $ScriptVersion -UniqueId $UniqueId -MessageType "Error" -ErrorCode $ErrorCode -ErrorDescription $ErrorMessage 
}

$endTime = Get-Date
$elapsedTime = ($endTime - $startTime).TotalMilliseconds

Log-Script -ScriptName $ScriptName -ScriptVersion $ScriptVersion -UniqueId $UniqueId -MessageType "End" -ErrorCode 0 -ExecutionTime $elapsedTime
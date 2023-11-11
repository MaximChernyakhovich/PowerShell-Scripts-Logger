# logger.ps1

function Log-Script {
    param (
        [string]$ScriptName,
        [string]$ScriptVersion,
        [string]$UniqueId,
        [string]$MessageType,
        [string]$ErrorCode,
        [string]$ErrorDescription,
        [string]$ExecutionTime
    )

    # Получение имени ПК
    $PCName = $env:COMPUTERNAME

    # Отметка о времени запуска скрипта
    $LogTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss.fff"
    
    # Формат даты для имени файла лога
    $ScriptDate = (Get-Date).ToString("ddMMyyyy")

    # Путь к файлу лога
    $LogFilePath = "\path\to\log\logger_$ScriptDate.log"

    $LogDirectory = (Split-Path -Path $LogFilePath)
    if (-not (Test-Path -Path $LogDirectory)) {
        New-Item -ItemType Directory -Path $LogDirectory -Force
    }

    $Process = Get-Process -Id $PID

    #RAM
    $WorkingSet = $Process.WorkingSet
    $PrivateMemorySize = $Process.PrivateMemorySize
    
    # Создание словаря
    $LogEntry = @{
        "DateTime" = $LogTime
        "PCName" = $PCName
        "ScriptName" = $ScriptName
        "ScriptVersion" = $ScriptVersion
        "UniqueId" = $UniqueId
        "MessageType" = $MessageType
        "ErrorCode" = $ErrorCode
        "ErrorDescription" = $ErrorDescription
        "ExecutionTime" = $ExecutionTime
        "WorkingSet" = $WorkingSet
        "PrivateMemorySize" = $PrivateMemorySize
    }
    
    # Создание упорядоченного словаря
    $LogEntryOrdered = [ordered]@{
        "DateTime" = $LogEntry["DateTime"] 
        "PCName" = $LogEntry["PCName"]
        "ScriptName" = $LogEntry["ScriptName"] 
        "ScriptVersion" = $LogEntry["ScriptVersion"]
        "UniqueId" = $LogEntry["UniqueId"] 
        "MessageType" = $LogEntry["MessageType"] 
        "ErrorCode" = $LogEntry["ErrorCode"] 
        "ErrorDescription" = $LogEntry["ErrorDescription"] 
        "ExecutionTime" = $LogEntry["ExecutionTime"]
        "WorkingSet" = $LogEntry["WorkingSet"] 
        "PrivateMemorySize" = $LogEntry["PrivateMemorySize"]
    }
    
    # Преобразование записи в строку с разделителем
    $LogLine += ($LogEntryOrdered.Values | ForEach-Object { $_.ToString() }) -join '|'

    # Добавление записи в файл лога
    Add-Content -Path $LogFilePath -Value $LogLine -Encoding UTF8
}

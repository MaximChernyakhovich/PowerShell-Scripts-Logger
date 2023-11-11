# PowerShell-Scripts-Logger

# Описание

Функция логирования скриптов.

# Формат лога

| DateTime | PCName | ScriptName | ScriptVersion | UniqueId | MessageType | ErrorCode | ErrorDescription | ExecutionTime | WorkingSet | PrivateMemorySize |
|-------------|-------------|------------|---------------|-------------|-----------|----------------|------------|---------------------|-------------|-------------|
| 2023-11-11 14:07:00.353  | PCName | TestScript | 1.1.1 | 31144bf9-9a45-45b4-86ad-7810a2bb66a5 | Start | 0 |  |  | 219299840  | 236494848 |
| 2023-11-11 14:07:00.377  | PCName | TestScript | 1.1.1 | 31144bf9-9a45-45b4-86ad-7810a2bb66a5 | Info | 0 | Start try |  | 219299840  | 236494848 |
| 2023-11-11 14:07:10.412  | PCName | TestScript | 1.1.1 | 31144bf9-9a45-45b4-86ad-7810a2bb66a5 | Error | -2146233087 | Попытка деления на нуль. | | 219303936 | 236466176 |
| 2023-11-11 14:07:10.433  | PCName | TestScript | 1.1.1 | 31144bf9-9a45-45b4-86ad-7810a2bb66a5 | End | 0 | | 10079.8316 | 219308032  | 236466176 |

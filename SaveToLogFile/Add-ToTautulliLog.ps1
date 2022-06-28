param
(
[string]$MovieTitle,
[switch]$Start,
[switch]$Stop
)
$NowStr = (Get-Date -format MM/dd/yyyy-hh:mm:ss).ToString()
$DateStr = (Get-Date -format yyyy-MM-dd).ToString()
$Path = "C:\TautulliLogs"
$LogFile = "$($Path)\$($DateStr).log"
IF ($Start.IsPresent -eq $true)
{
$Action = "Started"
}
IF ($Stop.IsPresent -eq $true)
{
$Action = "Stopped"
}
if ((Test-Path -path $LogFile) -eq $false)
{
$String = "$($NowStr) -- Playback $($Action) -- [$($MovieTitle)]"
$String | Out-File $LogFile -Force
}
else
{
$String = "$($NowStr) -- Playback $($Action) -- [$($MovieTitle)]"
$String | Out-File $LogFile -Force -Append
}
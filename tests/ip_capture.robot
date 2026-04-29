*** Settings ***
Library    Process
Library    String

*** Test Cases ***
Print Laptop IPv4 Address
    ${result}=    Run Process    powershell    -NoProfile    -Command    (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.IPAddress -ne '127.0.0.1' -and $_.IPAddress -notlike '169.254.*' -and $_.InterfaceAlias -notmatch 'Loopback' } | Select-Object -First 1 -ExpandProperty IPAddress)    stdout=PIPE    stderr=PIPE
    ${ip}=    Strip String    ${result.stdout}
    Should Not Be Empty    ${ip}
    Log To Console    ${ip}

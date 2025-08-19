# 1. Enable TCP/IP Protocol for SQL Server via WMI
Write-Host "Enabling TCP/IP in SQL Server Configuration..."

$instanceName = "MSSQLSERVER"
$wmi = Get-WmiObject -namespace "root\Microsoft\SqlServer\ComputerManagement15" -class ServerNetworkProtocol
$tcp = $wmi | Where-Object { $_.ProtocolName -eq "Tcp" -and $_.InstanceName -eq $instanceName }
$tcp.SetEnable($true)

# 2. Set TCP Port to 1433 and clear dynamic ports
Write-Host "⚙Setting TCP port 1433 and clearing dynamic ports..."
$tcpProps = Get-WmiObject -namespace "root\Microsoft\SqlServer\ComputerManagement15" -class ServerNetworkProtocolProperty
$tcpProps | Where-Object { $_.PropertyName -eq "TcpDynamicPorts" -and $_.InstanceName -eq $instanceName -and $_.IPAddressName -eq "IPAll" } | ForEach-Object { $_.SetStringValue("") }
$tcpProps | Where-Object { $_.PropertyName -eq "TcpPort" -and $_.InstanceName -eq $instanceName -and $_.IPAddressName -eq "IPAll" } | ForEach-Object { $_.SetStringValue("1433") }

# 3. Open port 1433 in firewall
Write-Host "Allowing port 1433 through Windows Firewall..."
New-NetFirewallRule -DisplayName "Allow SQL Server TCP 1433" -Direction Inbound -Protocol TCP -LocalPort 1433 -Action Allow -Profile Any -ErrorAction SilentlyContinue

# 4. Restart SQL Server Service
Write-Host "Restarting SQL Server service..."
Restart-Service -Name 'MSSQLSERVER' -Force

# 5. Validate SQL Server is listening on port 1433
Write-Host "Checking if SQL Server is listening on TCP 1433..."
Start-Sleep -Seconds 5
netstat -an | Select-String ":1433"

# 6. Test TCP connection
Write-Host "Testing TCP connection to localhost:1433..."
Test-NetConnection -ComputerName localhost -Port 1433

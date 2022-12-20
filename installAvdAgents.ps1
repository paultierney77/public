[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"

#Agent Installer:         https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RWrmXv
#BootLoader Installer:    https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RWrxrH

$files = @('RWrmXv','RWrxrH')
for($i=0;$i -le $files.Length-1; $i++) {
    $webRequestURL = 'https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/'+$files[$i]
    $msiFileName = $files[$i]+'.msi'

    Invoke-WebRequest -UseBasicParsing $webRequestURL -OutFile $msiFileName;
    (Start-Process msiexec.exe -ArgumentList '/i', $msiFileName, '/quiet' -NoNewWindow -Wait -PassThru).ExitCode;
}
$VS_URI     = 'https://aka.ms/vs/15/release/799c44140/vs_buildtools.exe'
$VS_SHA256  = 'fa29eb83297aecadb0c4cd41e54512c953164e64eedd9fb9d3bf9bd70c9a2d29'
$VS_OUTFILE = 'C:\vs_buildtools.exe'

Invoke-WebRequest -Uri $VS_URI -OutFile $VS_OUTFILE
if ((Get-FileHash -Path $VS_OUTFILE -Algorithm SHA256).Hash -ne $VS_SHA256) { throw 'Visual Studio SHA256 does not match' }
Start-Process -Wait -PassThru -FilePath $VS_OUTFILE -ArgumentList '--nocache --wait --quiet --installPath C:\BuildTools --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended'

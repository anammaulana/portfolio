$ErrorActionPreference = 'Stop'

$projectRoot = Split-Path -Parent $PSScriptRoot
$sourceDocx = Join-Path $projectRoot 'AMAULANA Resume Jobstreet .docx'
$outputDocx = Join-Path $projectRoot 'Anam-Maulana-CV.docx'
$buildDir = Join-Path ([IO.Path]::GetTempPath()) 'anam-cv-build'

if (Test-Path -LiteralPath $buildDir) {
    $existing = Get-Item -LiteralPath $buildDir -Force
    if (($existing.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { throw 'Unsafe temporary build path.' }
    Remove-Item -LiteralPath $buildDir -Recurse -Force
}

New-Item -ItemType Directory -Path $buildDir | Out-Null
$archive = Join-Path $buildDir 'template.zip'
$package = Join-Path $buildDir 'package'
Copy-Item -LiteralPath $sourceDocx -Destination $archive
Expand-Archive -LiteralPath $archive -DestinationPath $package

$documentXml = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:body>
    <w:p><w:pPr><w:jc w:val="center"/><w:spacing w:after="80"/></w:pPr><w:r><w:rPr><w:b/><w:sz w:val="36"/><w:color w:val="13261D"/></w:rPr><w:t>ANAM MAULANA</w:t></w:r></w:p>
    <w:p><w:pPr><w:jc w:val="center"/><w:spacing w:after="80"/></w:pPr><w:r><w:rPr><w:b/><w:sz w:val="22"/><w:color w:val="4E6B5D"/></w:rPr><w:t>Software Engineer | DevOps &amp; Server Specialist</w:t></w:r></w:p>
    <w:p><w:pPr><w:jc w:val="center"/><w:spacing w:after="260"/></w:pPr><w:r><w:rPr><w:sz w:val="18"/></w:rPr><w:t>Jakarta, Indonesia  |  +62 831-1423-7048  |  anammaulana210447@gmail.com</w:t></w:r></w:p>
    <w:p><w:pPr><w:jc w:val="center"/><w:spacing w:after="260"/></w:pPr><w:hyperlink r:id="rIdPortfolio" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"><w:r><w:rPr><w:color w:val="2E7D5B"/><w:u w:val="single"/><w:sz w:val="18"/></w:rPr><w:t>anammaulana.github.io/portfolio</w:t></w:r></w:hyperlink><w:r><w:t xml:space="preserve">  |  </w:t></w:r><w:hyperlink r:id="rIdGithub" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"><w:r><w:rPr><w:color w:val="2E7D5B"/><w:u w:val="single"/><w:sz w:val="18"/></w:rPr><w:t>github.com/anammaulana</w:t></w:r></w:hyperlink></w:p>

    <w:p><w:pPr><w:spacing w:before="120" w:after="100"/><w:pBdr><w:bottom w:val="single" w:sz="8" w:color="B7F34A"/></w:pBdr></w:pPr><w:r><w:rPr><w:b/><w:sz w:val="23"/><w:color w:val="13261D"/></w:rPr><w:t>PROFIL PROFESIONAL</w:t></w:r></w:p>
    <w:p><w:pPr><w:spacing w:after="220"/><w:jc w:val="both"/></w:pPr><w:r><w:rPr><w:sz w:val="20"/></w:rPr><w:t>Software Engineer dengan pengalaman mengembangkan aplikasi pelayanan pelanggan dan mendukung operasional layanan pada lingkungan server. Menangani pengembangan aplikasi, otomasi CI/CD, deployment, monitoring, serta troubleshooting. Terbiasa menjembatani kebutuhan software dan infrastructure untuk menghasilkan layanan yang stabil, mudah dirawat, dan siap berkembang.</w:t></w:r></w:p>

    <w:p><w:pPr><w:spacing w:before="120" w:after="100"/><w:pBdr><w:bottom w:val="single" w:sz="8" w:color="B7F34A"/></w:pBdr></w:pPr><w:r><w:rPr><w:b/><w:sz w:val="23"/><w:color w:val="13261D"/></w:rPr><w:t>PENGALAMAN</w:t></w:r></w:p>
    <w:p><w:pPr><w:spacing w:after="20"/></w:pPr><w:r><w:rPr><w:b/><w:sz w:val="21"/></w:rPr><w:t>Junior Software Engineer | DevOps &amp; Server Specialist</w:t></w:r></w:p>
    <w:p><w:pPr><w:spacing w:after="90"/></w:pPr><w:r><w:rPr><w:i/><w:color w:val="4E6B5D"/><w:sz w:val="19"/></w:rPr><w:t>PT Indonesia Comnets Plus (PLN Icon Plus), Jakarta | 2024—Sekarang</w:t></w:r></w:p>
    <w:p><w:pPr><w:numPr><w:ilvl w:val="0"/><w:numId w:val="1"/></w:numPr><w:spacing w:after="40"/></w:pPr><w:r><w:rPr><w:sz w:val="19"/></w:rPr><w:t>Mengembangkan dan meningkatkan sistem aplikasi pelayanan pelanggan PLN.</w:t></w:r></w:p>
    <w:p><w:pPr><w:numPr><w:ilvl w:val="0"/><w:numId w:val="1"/></w:numPr><w:spacing w:after="40"/></w:pPr><w:r><w:rPr><w:sz w:val="19"/></w:rPr><w:t>Mendukung otomasi build dan deployment melalui pipeline CI/CD.</w:t></w:r></w:p>
    <w:p><w:pPr><w:numPr><w:ilvl w:val="0"/><w:numId w:val="1"/></w:numPr><w:spacing w:after="40"/></w:pPr><w:r><w:rPr><w:sz w:val="19"/></w:rPr><w:t>Menangani konfigurasi, monitoring, dan troubleshooting server aplikasi.</w:t></w:r></w:p>
    <w:p><w:pPr><w:numPr><w:ilvl w:val="0"/><w:numId w:val="1"/></w:numPr><w:spacing w:after="180"/></w:pPr><w:r><w:rPr><w:sz w:val="19"/></w:rPr><w:t>Berkolaborasi lintas tim untuk menjaga stabilitas dan keberlanjutan layanan.</w:t></w:r></w:p>
    <w:p><w:pPr><w:spacing w:after="20"/></w:pPr><w:r><w:rPr><w:b/><w:sz w:val="21"/></w:rPr><w:t>Website Developer Intern</w:t></w:r></w:p>
    <w:p><w:pPr><w:spacing w:after="90"/></w:pPr><w:r><w:rPr><w:i/><w:color w:val="4E6B5D"/><w:sz w:val="19"/></w:rPr><w:t>Dinas Komunikasi dan Informatika | Jan 2023—Mar 2024</w:t></w:r></w:p>
    <w:p><w:pPr><w:numPr><w:ilvl w:val="0"/><w:numId w:val="1"/></w:numPr><w:spacing w:after="40"/></w:pPr><w:r><w:rPr><w:sz w:val="19"/></w:rPr><w:t>Berkontribusi pada pengembangan website dan pengelolaan basis data.</w:t></w:r></w:p>
    <w:p><w:pPr><w:numPr><w:ilvl w:val="0"/><w:numId w:val="1"/></w:numPr><w:spacing w:after="220"/></w:pPr><w:r><w:rPr><w:sz w:val="19"/></w:rPr><w:t>Menerapkan kemampuan pemrograman web dan pemecahan masalah pada kebutuhan nyata.</w:t></w:r></w:p>

    <w:p><w:pPr><w:spacing w:before="120" w:after="100"/><w:pBdr><w:bottom w:val="single" w:sz="8" w:color="B7F34A"/></w:pBdr></w:pPr><w:r><w:rPr><w:b/><w:sz w:val="23"/><w:color w:val="13261D"/></w:rPr><w:t>PROYEK &amp; PRAKTIK TEKNIS</w:t></w:r></w:p>
    <w:p><w:pPr><w:spacing w:after="50"/></w:pPr><w:r><w:rPr><w:b/><w:sz w:val="20"/></w:rPr><w:t>Home Lab &amp; Infrastructure</w:t></w:r><w:r><w:rPr><w:sz w:val="19"/></w:rPr><w:t xml:space="preserve"> — Lingkungan eksperimental untuk networking, server, deployment, monitoring, dan reliability.</w:t></w:r></w:p>
    <w:p><w:pPr><w:spacing w:after="220"/></w:pPr><w:r><w:rPr><w:b/><w:sz w:val="20"/></w:rPr><w:t>Customer Service Platform</w:t></w:r><w:r><w:rPr><w:sz w:val="19"/></w:rPr><w:t xml:space="preserve"> — Pengembangan aplikasi pelayanan pelanggan dengan perhatian pada integrasi, performa, dan kemudahan operasional.</w:t></w:r></w:p>

    <w:p><w:pPr><w:spacing w:before="120" w:after="100"/><w:pBdr><w:bottom w:val="single" w:sz="8" w:color="B7F34A"/></w:pBdr></w:pPr><w:r><w:rPr><w:b/><w:sz w:val="23"/><w:color w:val="13261D"/></w:rPr><w:t>KEAHLIAN</w:t></w:r></w:p>
    <w:p><w:pPr><w:spacing w:after="70"/></w:pPr><w:r><w:rPr><w:b/><w:sz w:val="19"/></w:rPr><w:t>Development: </w:t></w:r><w:r><w:rPr><w:sz w:val="19"/></w:rPr><w:t>HTML, CSS, JavaScript, React, Node.js, PHP, Laravel, CodeIgniter, Java, Quarkus</w:t></w:r></w:p>
    <w:p><w:pPr><w:spacing w:after="70"/></w:pPr><w:r><w:rPr><w:b/><w:sz w:val="19"/></w:rPr><w:t>Data: </w:t></w:r><w:r><w:rPr><w:sz w:val="19"/></w:rPr><w:t>MySQL, PostgreSQL, perancangan dan pengelolaan basis data</w:t></w:r></w:p>
    <w:p><w:pPr><w:spacing w:after="220"/></w:pPr><w:r><w:rPr><w:b/><w:sz w:val="19"/></w:rPr><w:t>Operations: </w:t></w:r><w:r><w:rPr><w:sz w:val="19"/></w:rPr><w:t>Linux, Docker, Jenkins, CI/CD, deployment, monitoring, troubleshooting server</w:t></w:r></w:p>

    <w:p><w:pPr><w:spacing w:before="120" w:after="100"/><w:pBdr><w:bottom w:val="single" w:sz="8" w:color="B7F34A"/></w:pBdr></w:pPr><w:r><w:rPr><w:b/><w:sz w:val="23"/><w:color w:val="13261D"/></w:rPr><w:t>PENDIDIKAN</w:t></w:r></w:p>
    <w:p><w:pPr><w:spacing w:after="20"/></w:pPr><w:r><w:rPr><w:b/><w:sz w:val="20"/></w:rPr><w:t>Diploma III Manajemen Informatika</w:t></w:r></w:p>
    <w:p><w:pPr><w:spacing w:after="200"/></w:pPr><w:r><w:rPr><w:sz w:val="19"/><w:color w:val="4E6B5D"/></w:rPr><w:t>Akademi Manajemen Informatika dan Komputer YPAT | Lulus 2023</w:t></w:r></w:p>
    <w:p><w:pPr><w:spacing w:before="120" w:after="100"/><w:pBdr><w:bottom w:val="single" w:sz="8" w:color="B7F34A"/></w:pBdr></w:pPr><w:r><w:rPr><w:b/><w:sz w:val="23"/><w:color w:val="13261D"/></w:rPr><w:t>BAHASA</w:t></w:r></w:p>
    <w:p><w:r><w:rPr><w:sz w:val="19"/></w:rPr><w:t>Bahasa Indonesia — Aktif</w:t></w:r></w:p>
    <w:sectPr><w:pgSz w:w="11906" w:h="16838"/><w:pgMar w:top="850" w:right="900" w:bottom="850" w:left="900" w:header="400" w:footer="400" w:gutter="0"/></w:sectPr>
  </w:body>
</w:document>
'@

$documentPath = Join-Path $package 'word\document.xml'
[IO.File]::WriteAllText($documentPath, $documentXml, [Text.UTF8Encoding]::new($false))

$relsPath = Join-Path $package 'word\_rels\document.xml.rels'
[xml]$rels = Get-Content -Raw $relsPath
$relationshipNamespace = 'http://schemas.openxmlformats.org/package/2006/relationships'
foreach ($link in @(
    @{ Id = 'rIdPortfolio'; Target = 'https://anammaulana.github.io/portfolio/' },
    @{ Id = 'rIdGithub'; Target = 'https://github.com/anammaulana' }
)) {
    $relationship = $rels.CreateElement('Relationship', $relationshipNamespace)
    $relationship.SetAttribute('Id', $link.Id)
    $relationship.SetAttribute('Type', 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/hyperlink')
    $relationship.SetAttribute('Target', $link.Target)
    $relationship.SetAttribute('TargetMode', 'External')
    [void]$rels.DocumentElement.AppendChild($relationship)
}
$rels.Save($relsPath)

$zipOutput = Join-Path $buildDir 'Anam-Maulana-CV.zip'
Compress-Archive -Path (Join-Path $package '*') -DestinationPath $zipOutput -CompressionLevel Optimal
Copy-Item -LiteralPath $zipOutput -Destination $outputDocx -Force
Write-Output "Created: $outputDocx"

# java -jar .\BitsNPicas.jar convertbitmap -f ttf -o bitka.ttf .\bitka.sfd

foreach ($file in Get-ChildItem)
{
    if ($file.Extension -eq ".sfd")
    {
        $name = Split-Path $file -LeafBase

        if (Test-Path "build\$name.ttf" -PathType Leaf)
        {
            Remove-Item "build\$name.ttf"
        }
		
		Copy-Item "$name.sfd" "build/$name.sfd"

        java -jar ".\BitsNPicas.jar" convertbitmap -f ttf -o "build/$name.ttf" "build/$name.sfd"
        Write-Host "Converted $name to ttf."
    }
}

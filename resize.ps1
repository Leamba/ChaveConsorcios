Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile("c:\Users\abnae\Documents\Projeto Consórcio - Carta Contemplada\Chave Consórcios - Arquivos do Site Publicado\perfil-abnael.png")
$size = 400
$bmp = New-Object System.Drawing.Bitmap($size, $size)
$graphics = [System.Drawing.Graphics]::FromImage($bmp)
$graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
$graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
$graphics.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
# Draw image preserving aspect ratio and cropping center to make it a square
$aspect = $img.Width / $img.Height
$srcX = 0; $srcY = 0; $srcW = $img.Width; $srcH = $img.Height
if ($aspect -gt 1) {
    $srcW = $img.Height
    $srcX = ($img.Width - $img.Height) / 2
} else {
    $srcH = $img.Width
    $srcY = ($img.Height - $img.Width) / 2
}
$destRect = New-Object System.Drawing.Rectangle(0, 0, $size, $size)
$srcRect = New-Object System.Drawing.Rectangle($srcX, $srcY, $srcW, $srcH)
$graphics.DrawImage($img, $destRect, $srcRect, [System.Drawing.GraphicsUnit]::Pixel)
$bmp.Save("c:\Users\abnae\Documents\Projeto Consórcio - Carta Contemplada\Chave Consórcios - Arquivos do Site Publicado\perfil-abnael-resized.png", [System.Drawing.Imaging.ImageFormat]::Png)
$graphics.Dispose()
$bmp.Dispose()
$img.Dispose()

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk" { BITMAPINFOHEADER }

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct EXBMINFOHEADER {
    #StructPack 4

    bmi : BITMAPINFOHEADER

    biExtDataOffset : UInt32

}

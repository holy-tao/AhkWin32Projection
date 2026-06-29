#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\PALETTEENTRY.ahk" { PALETTEENTRY }

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct ICPALETTE {
    #StructPack 8

    dwFlags : UInt32

    iStart : Int32

    iLen : Int32

    lppe : PALETTEENTRY.Ptr

}

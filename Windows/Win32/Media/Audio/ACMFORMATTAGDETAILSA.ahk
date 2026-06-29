#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Media.Audio
 * @charset ANSI
 */
export default struct ACMFORMATTAGDETAILSA {
    #StructPack 4

    cbStruct : UInt32

    dwFormatTagIndex : UInt32

    dwFormatTag : UInt32

    cbFormatSize : UInt32

    fdwSupport : UInt32

    cStandardFormats : UInt32

    szFormatTag : CHAR[48]

}

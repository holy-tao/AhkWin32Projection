#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Media.Audio
 * @charset ANSI
 */
export default struct ACMFILTERTAGDETAILSA {
    #StructPack 4

    cbStruct : UInt32

    dwFilterTagIndex : UInt32

    dwFilterTag : UInt32

    cbFilterSize : UInt32

    fdwSupport : UInt32

    cStandardFilters : UInt32

    szFilterTag : CHAR[48]

}

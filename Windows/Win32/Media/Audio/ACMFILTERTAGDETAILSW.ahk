#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.Audio
 * @charset Unicode
 */
export default struct ACMFILTERTAGDETAILSW {
    #StructPack 4

    cbStruct : UInt32

    dwFilterTagIndex : UInt32

    dwFilterTag : UInt32

    cbFilterSize : UInt32

    fdwSupport : UInt32

    cStandardFilters : UInt32

    szFilterTag : WCHAR[48]

}

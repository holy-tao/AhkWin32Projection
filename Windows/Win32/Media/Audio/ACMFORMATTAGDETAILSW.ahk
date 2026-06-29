#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.Audio
 * @charset Unicode
 */
export default struct ACMFORMATTAGDETAILSW {
    #StructPack 4

    cbStruct : UInt32

    dwFormatTagIndex : UInt32

    dwFormatTag : UInt32

    cbFormatSize : UInt32

    fdwSupport : UInt32

    cStandardFormats : UInt32

    szFormatTag : WCHAR[48]

}

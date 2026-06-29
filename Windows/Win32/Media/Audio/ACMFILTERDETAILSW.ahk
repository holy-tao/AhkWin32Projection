#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WAVEFILTER.ahk" { WAVEFILTER }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.Audio
 * @charset Unicode
 */
export default struct ACMFILTERDETAILSW {
    #StructPack 8

    cbStruct : UInt32

    dwFilterIndex : UInt32

    dwFilterTag : UInt32

    fdwSupport : UInt32

    pwfltr : WAVEFILTER.Ptr

    cbwfltr : UInt32

    szFilter : WCHAR[128]

}

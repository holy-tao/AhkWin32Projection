#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WAVEFILTER.ahk" { WAVEFILTER }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Media.Audio
 * @charset ANSI
 */
export default struct ACMFILTERDETAILSA {
    #StructPack 8

    cbStruct : UInt32

    dwFilterIndex : UInt32

    dwFilterTag : UInt32

    fdwSupport : UInt32

    pwfltr : WAVEFILTER.Ptr

    cbwfltr : UInt32

    szFilter : CHAR[128]

}

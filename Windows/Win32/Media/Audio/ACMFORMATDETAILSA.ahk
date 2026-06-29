#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Media.Audio
 */
export default struct ACMFORMATDETAILSA {
    #StructPack 8

    cbStruct : UInt32

    dwFormatIndex : UInt32

    dwFormatTag : UInt32

    fdwSupport : UInt32

    pwfx : WAVEFORMATEX.Ptr

    cbwfx : UInt32

    szFormat : CHAR[128]

}

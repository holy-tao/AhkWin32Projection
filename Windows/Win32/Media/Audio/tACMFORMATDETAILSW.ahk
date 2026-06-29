#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.Audio
 */
export default struct tACMFORMATDETAILSW {
    #StructPack 8

    cbStruct : UInt32

    dwFormatIndex : UInt32

    dwFormatTag : UInt32

    fdwSupport : UInt32

    pwfx : WAVEFORMATEX.Ptr

    cbwfx : UInt32

    szFormat : WCHAR[128]

}

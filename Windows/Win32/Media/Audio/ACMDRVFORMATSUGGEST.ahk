#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WAVEFORMATEX.ahk" { WAVEFORMATEX }

/**
 * @namespace Windows.Win32.Media.Audio
 */
export default struct ACMDRVFORMATSUGGEST {
    #StructPack 8

    cbStruct : UInt32

    fdwSuggest : UInt32

    pwfxSrc : WAVEFORMATEX.Ptr

    cbwfxSrc : UInt32

    pwfxDst : WAVEFORMATEX.Ptr

    cbwfxDst : UInt32

}

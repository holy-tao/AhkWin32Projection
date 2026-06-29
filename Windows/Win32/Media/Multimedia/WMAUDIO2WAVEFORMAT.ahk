#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct WMAUDIO2WAVEFORMAT {
    #StructPack 4

    wfx : WAVEFORMATEX

    dwSamplesPerBlock : UInt32

    wEncodeOptions : UInt16

    dwSuperBlockAlign : UInt32

}

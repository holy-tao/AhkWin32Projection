#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct CREATIVEFASTSPEECH8WAVEFORMAT {
    #StructPack 4

    wfx : WAVEFORMATEX

    wRevision : UInt16

}

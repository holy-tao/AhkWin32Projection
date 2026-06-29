#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\WAVEFORMATEX.ahk" { WAVEFORMATEX }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DMUS_WAVE {
    #StructPack 4

    ulFirstExtCkIdx : UInt32

    ulCopyrightIdx : UInt32

    ulWaveDataIdx : UInt32

    WaveformatEx : WAVEFORMATEX

}

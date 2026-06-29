#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DMUS_PORTPARAMS7 {
    #StructPack 4

    dwSize : UInt32

    dwValidParams : UInt32

    dwVoices : UInt32

    dwChannelGroups : UInt32

    dwAudioChannels : UInt32

    dwSampleRate : UInt32

    dwEffectFlags : UInt32

    fShare : BOOL

}

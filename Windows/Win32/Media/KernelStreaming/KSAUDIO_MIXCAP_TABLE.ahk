#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSAUDIO_MIX_CAPS.ahk" { KSAUDIO_MIX_CAPS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSAUDIO_MIXCAP_TABLE {
    #StructPack 4

    InputChannels : UInt32

    OutputChannels : UInt32

    Capabilities : KSAUDIO_MIX_CAPS[1]

}

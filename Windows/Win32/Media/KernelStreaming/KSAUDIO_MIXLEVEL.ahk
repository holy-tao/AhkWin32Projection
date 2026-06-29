#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSAUDIO_MIXLEVEL {
    #StructPack 4

    Mute : BOOL

    Level : Int32

}

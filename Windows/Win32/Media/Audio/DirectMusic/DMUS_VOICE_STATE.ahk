#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * DMUS_VOICE_STATE is not supported and may be altered or unavailable in the future.
 * @see https://learn.microsoft.com/windows/win32/api/dmusics/ns-dmusics-dmus_voice_state
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DMUS_VOICE_STATE {
    #StructPack 8

    bExists : BOOL

    spPosition : Int64

}

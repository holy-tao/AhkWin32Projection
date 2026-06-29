#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\TIMECODE.ahk" { TIMECODE }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AVITCDLINDEX_ENTRY {
    #StructPack 8

    dwTick : UInt32

    time : TIMECODE

    dwSMPTEflags : UInt32

    dwUser : UInt32

    szReelId : Int8[12]

}

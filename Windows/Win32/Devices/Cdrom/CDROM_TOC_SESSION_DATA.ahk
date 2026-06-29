#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TRACK_DATA.ahk" { TRACK_DATA }

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_TOC_SESSION_DATA {
    #StructPack 1

    Length : Int8[2]

    FirstCompleteSession : Int8

    LastCompleteSession : Int8

    TrackData : TRACK_DATA[1]

}

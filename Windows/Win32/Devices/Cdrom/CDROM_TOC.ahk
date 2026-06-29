#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TRACK_DATA.ahk" { TRACK_DATA }

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_TOC {
    #StructPack 1

    Length : Int8[2]

    FirstTrack : Int8

    LastTrack : Int8

    TrackData : TRACK_DATA[100]

}

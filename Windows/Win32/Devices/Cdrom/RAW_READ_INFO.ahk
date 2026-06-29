#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TRACK_MODE_TYPE.ahk" { TRACK_MODE_TYPE }

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct RAW_READ_INFO {
    #StructPack 8

    DiskOffset : Int64

    SectorCount : UInt32

    TrackMode : TRACK_MODE_TYPE

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_ZONE_TYPES.ahk" { STORAGE_ZONE_TYPES }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_ZONE_GROUP {
    #StructPack 8

    ZoneCount : UInt32

    ZoneType : STORAGE_ZONE_TYPES

    ZoneSize : Int64

}

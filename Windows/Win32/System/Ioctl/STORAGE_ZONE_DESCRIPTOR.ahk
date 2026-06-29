#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\STORAGE_ZONE_TYPES.ahk" { STORAGE_ZONE_TYPES }
#Import ".\STORAGE_ZONE_CONDITION.ahk" { STORAGE_ZONE_CONDITION }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_ZONE_DESCRIPTOR {
    #StructPack 8

    Size : UInt32

    ZoneType : STORAGE_ZONE_TYPES

    ZoneCondition : STORAGE_ZONE_CONDITION

    ResetWritePointerRecommend : BOOLEAN

    Reserved0 : Int8[3]

    ZoneSize : Int64

    WritePointerOffset : Int64

}

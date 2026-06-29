#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_ZONE_DESCRIPTOR.ahk" { STORAGE_ZONE_DESCRIPTOR }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\STORAGE_ZONE_TYPES.ahk" { STORAGE_ZONE_TYPES }
#Import ".\STORAGE_ZONES_ATTRIBUTES.ahk" { STORAGE_ZONES_ATTRIBUTES }
#Import ".\STORAGE_ZONE_CONDITION.ahk" { STORAGE_ZONE_CONDITION }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_DSM_REPORT_ZONES_DATA {
    #StructPack 8

    Size : UInt32

    ZoneCount : UInt32

    Attributes : STORAGE_ZONES_ATTRIBUTES

    Reserved0 : UInt32

    ZoneDescriptors : STORAGE_ZONE_DESCRIPTOR[1]

}

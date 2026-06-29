#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_TIER_MEDIA_TYPE.ahk" { STORAGE_TIER_MEDIA_TYPE }
#Import ".\STORAGE_TIER.ahk" { STORAGE_TIER }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\STORAGE_TIER_CLASS.ahk" { STORAGE_TIER_CLASS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DEVICE_TIERING_DESCRIPTOR {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    Flags : UInt32

    TotalNumberOfTiers : UInt32

    NumberOfTiersReturned : UInt32

    Tiers : STORAGE_TIER[1]

}

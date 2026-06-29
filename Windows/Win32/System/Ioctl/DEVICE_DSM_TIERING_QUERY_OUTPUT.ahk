#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_TIER_REGION.ahk" { STORAGE_TIER_REGION }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_DSM_TIERING_QUERY_OUTPUT {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    Flags : UInt32

    Reserved : UInt32

    Alignment : Int64

    TotalNumberOfRegions : UInt32

    NumberOfRegionsReturned : UInt32

    Regions : STORAGE_TIER_REGION[1]

}

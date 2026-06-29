#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CONFIGURATION_INFORMATION {
    #StructPack 4

    DiskCount : UInt32

    FloppyCount : UInt32

    CdRomCount : UInt32

    TapeCount : UInt32

    ScsiPortCount : UInt32

    SerialCount : UInt32

    ParallelCount : UInt32

    AtDiskPrimaryAddressClaimed : BOOLEAN

    AtDiskSecondaryAddressClaimed : BOOLEAN

    Version : UInt32

    MediumChangerCount : UInt32

}

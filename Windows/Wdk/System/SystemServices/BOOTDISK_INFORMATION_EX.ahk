#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct BOOTDISK_INFORMATION_EX {
    #StructPack 8

    BootPartitionOffset : Int64

    SystemPartitionOffset : Int64

    BootDeviceSignature : UInt32

    SystemDeviceSignature : UInt32

    BootDeviceGuid : Guid

    SystemDeviceGuid : Guid

    BootDeviceIsGpt : BOOLEAN

    SystemDeviceIsGpt : BOOLEAN

}

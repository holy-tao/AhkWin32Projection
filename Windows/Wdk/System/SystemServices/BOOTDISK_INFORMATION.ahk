#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct BOOTDISK_INFORMATION {
    #StructPack 8

    BootPartitionOffset : Int64

    SystemPartitionOffset : Int64

    BootDeviceSignature : UInt32

    SystemDeviceSignature : UInt32

}

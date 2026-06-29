#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FILE_FS_DEVICE_INFORMATION {
    #StructPack 4

    DeviceType : UInt32

    Characteristics : UInt32

}

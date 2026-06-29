#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEBUGGING_DEVICE_IN_USE_INFORMATION {
    #StructPack 8

    DeviceCount : UInt32

    Device : IntPtr[1]

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FUNCTION_LEVEL_DEVICE_RESET_PARAMETERS {
    #StructPack 8

    Size : UInt32

    DeviceResetCompletion : IntPtr

    CompletionContext : IntPtr

}

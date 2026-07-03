#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PDEVICE_RESET_COMPLETION.ahk" { PDEVICE_RESET_COMPLETION }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FUNCTION_LEVEL_DEVICE_RESET_PARAMETERS {
    #StructPack 8

    Size : UInt32

    DeviceResetCompletion : PDEVICE_RESET_COMPLETION

    CompletionContext : IntPtr

}

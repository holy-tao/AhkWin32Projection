#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEVICE_FAULT_CONFIGURATION {
    #StructPack 8

    FaultHandler : IntPtr

    FaultContext : IntPtr

}

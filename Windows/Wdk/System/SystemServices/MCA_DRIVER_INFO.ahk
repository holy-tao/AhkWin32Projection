#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct MCA_DRIVER_INFO {
    #StructPack 8

    ExceptionCallback : IntPtr

    DpcCallback : IntPtr

    DeviceContext : IntPtr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_THROTTLE_PCIE_REMOVE_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    Address : IntPtr

    Mask : UInt32

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_COMMON_CONFIG {
    #StructPack 8

    Base : IntPtr

    DeviceSpecific : Int8[192]

}

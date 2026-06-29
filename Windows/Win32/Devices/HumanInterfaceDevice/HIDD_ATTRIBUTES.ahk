#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct HIDD_ATTRIBUTES {
    #StructPack 4

    Size : UInt32

    VendorID : UInt16

    ProductID : UInt16

    VersionNumber : UInt16

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_DEVICE_PRESENCE_PARAMETERS {
    #StructPack 4

    Size : UInt32

    Flags : UInt32

    VendorID : UInt16

    DeviceID : UInt16

    RevisionID : Int8

    SubVendorID : UInt16

    SubSystemID : UInt16

    BaseClass : Int8

    SubClass : Int8

    ProgIf : Int8

}

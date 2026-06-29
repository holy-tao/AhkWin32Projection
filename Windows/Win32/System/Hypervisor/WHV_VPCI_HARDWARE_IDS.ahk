#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_VPCI_HARDWARE_IDS {
    #StructPack 2

    VendorID : UInt16

    DeviceID : UInt16

    RevisionID : Int8

    ProgIf : Int8

    SubClass : Int8

    BaseClass : Int8

    SubVendorID : UInt16

    SubSystemID : UInt16

}

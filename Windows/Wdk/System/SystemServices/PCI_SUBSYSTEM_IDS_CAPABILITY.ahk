#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_SUBSYSTEM_IDS_CAPABILITY {
    #StructPack 8

    Header : IntPtr

    Reserved : UInt16

    SubVendorID : UInt16

    SubSystemID : UInt16

}

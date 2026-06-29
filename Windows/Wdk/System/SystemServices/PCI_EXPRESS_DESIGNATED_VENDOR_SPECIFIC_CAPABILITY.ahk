#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_DESIGNATED_VENDOR_SPECIFIC_CAPABILITY {
    #StructPack 8

    Header : IntPtr

    DvsecHeader1 : IntPtr

    DvsecHeader2 : IntPtr

    DvsecRegisters : UInt16[1]

}

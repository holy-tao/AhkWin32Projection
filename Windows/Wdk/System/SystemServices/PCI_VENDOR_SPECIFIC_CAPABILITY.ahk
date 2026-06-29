#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_VENDOR_SPECIFIC_CAPABILITY {
    #StructPack 8

    Header : IntPtr

    VscLength : Int8

    VendorSpecific : Int8

}

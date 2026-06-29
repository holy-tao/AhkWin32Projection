#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_CXL_DVSEC_CAPABILITY {
    #StructPack 8

    Header : IntPtr

    DvsecHeader1 : IntPtr

    DvsecHeader2 : IntPtr

    Reserved : Int8[46]

}

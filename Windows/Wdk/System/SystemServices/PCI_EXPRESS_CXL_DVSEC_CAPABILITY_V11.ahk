#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_CXL_DVSEC_CAPABILITY_V11 {
    #StructPack 8

    Header : IntPtr

    DvsecHeader1 : IntPtr

    DvsecHeader2 : IntPtr

    Capability : IntPtr

    Control : IntPtr

    Status : IntPtr

    Control2 : UInt16

    Status2 : UInt16

    Lock : IntPtr

    Reserved : UInt16

    Range1SizeHigh : IntPtr

    Range1SizeLow : IntPtr

    Range1BaseHigh : IntPtr

    Range1BaseLow : IntPtr

    Range2SizeHigh : IntPtr

    Range2SizeLow : IntPtr

    Range2BaseHigh : IntPtr

    Range2BaseLow : IntPtr

}

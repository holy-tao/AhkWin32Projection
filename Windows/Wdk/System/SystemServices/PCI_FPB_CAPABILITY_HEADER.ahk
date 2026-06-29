#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_FPB_CAPABILITY_HEADER {
    #StructPack 8

    Header : IntPtr

    Reserved : UInt16

}

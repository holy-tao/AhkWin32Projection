#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_MSIX_TABLE_CONFIG_INTERFACE {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : IntPtr

    InterfaceDereference : IntPtr

    SetTableEntry : IntPtr

    MaskTableEntry : IntPtr

    UnmaskTableEntry : IntPtr

    GetTableEntry : IntPtr

    GetTableSize : IntPtr

}

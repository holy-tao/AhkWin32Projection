#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PINTERFACE_DEREFERENCE.ahk" { PINTERFACE_DEREFERENCE }
#Import ".\PINTERFACE_REFERENCE.ahk" { PINTERFACE_REFERENCE }
#Import ".\PPCI_MSIX_GET_ENTRY.ahk" { PPCI_MSIX_GET_ENTRY }
#Import ".\PPCI_MSIX_GET_TABLE_SIZE.ahk" { PPCI_MSIX_GET_TABLE_SIZE }
#Import ".\PPCI_MSIX_MASKUNMASK_ENTRY.ahk" { PPCI_MSIX_MASKUNMASK_ENTRY }
#Import ".\PPCI_MSIX_SET_ENTRY.ahk" { PPCI_MSIX_SET_ENTRY }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_MSIX_TABLE_CONFIG_INTERFACE {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : PINTERFACE_REFERENCE

    InterfaceDereference : PINTERFACE_DEREFERENCE

    SetTableEntry : PPCI_MSIX_SET_ENTRY

    MaskTableEntry : PPCI_MSIX_MASKUNMASK_ENTRY

    UnmaskTableEntry : PPCI_MSIX_MASKUNMASK_ENTRY

    GetTableEntry : PPCI_MSIX_GET_ENTRY

    GetTableSize : PPCI_MSIX_GET_TABLE_SIZE

}

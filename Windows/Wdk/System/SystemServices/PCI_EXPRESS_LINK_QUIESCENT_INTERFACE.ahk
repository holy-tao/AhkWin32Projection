#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PINTERFACE_DEREFERENCE.ahk" { PINTERFACE_DEREFERENCE }
#Import ".\PINTERFACE_REFERENCE.ahk" { PINTERFACE_REFERENCE }
#Import ".\PPCI_EXPRESS_ENTER_LINK_QUIESCENT_MODE.ahk" { PPCI_EXPRESS_ENTER_LINK_QUIESCENT_MODE }
#Import ".\PPCI_EXPRESS_EXIT_LINK_QUIESCENT_MODE.ahk" { PPCI_EXPRESS_EXIT_LINK_QUIESCENT_MODE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_LINK_QUIESCENT_INTERFACE {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : PINTERFACE_REFERENCE

    InterfaceDereference : PINTERFACE_DEREFERENCE

    PciExpressEnterLinkQuiescentMode : PPCI_EXPRESS_ENTER_LINK_QUIESCENT_MODE

    PciExpressExitLinkQuiescentMode : PPCI_EXPRESS_EXIT_LINK_QUIESCENT_MODE

}

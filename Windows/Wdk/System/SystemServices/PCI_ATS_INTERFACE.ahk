#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PPCI_SET_ATS.ahk" { PPCI_SET_ATS }
#Import ".\PINTERFACE_DEREFERENCE.ahk" { PINTERFACE_DEREFERENCE }
#Import ".\PINTERFACE_REFERENCE.ahk" { PINTERFACE_REFERENCE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_ATS_INTERFACE {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : PINTERFACE_REFERENCE

    InterfaceDereference : PINTERFACE_DEREFERENCE

    SetAddressTranslationServices : PPCI_SET_ATS

    InvalidateQueueDepth : Int8

}

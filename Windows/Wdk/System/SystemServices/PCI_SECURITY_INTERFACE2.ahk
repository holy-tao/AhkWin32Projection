#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PPCI_SET_ACS2.ahk" { PPCI_SET_ACS2 }
#Import ".\PINTERFACE_DEREFERENCE.ahk" { PINTERFACE_DEREFERENCE }
#Import ".\PINTERFACE_REFERENCE.ahk" { PINTERFACE_REFERENCE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_SECURITY_INTERFACE2 {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : PINTERFACE_REFERENCE

    InterfaceDereference : PINTERFACE_DEREFERENCE

    Flags : UInt32

    SupportedScenarios : UInt32

    SetAccessControlServices : PPCI_SET_ACS2

}

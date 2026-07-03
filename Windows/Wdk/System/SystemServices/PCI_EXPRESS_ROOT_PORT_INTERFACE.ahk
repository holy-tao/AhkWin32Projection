#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PINTERFACE_DEREFERENCE.ahk" { PINTERFACE_DEREFERENCE }
#Import ".\PINTERFACE_REFERENCE.ahk" { PINTERFACE_REFERENCE }
#Import ".\PPCI_EXPRESS_ROOT_PORT_READ_CONFIG_SPACE.ahk" { PPCI_EXPRESS_ROOT_PORT_READ_CONFIG_SPACE }
#Import ".\PPCI_EXPRESS_ROOT_PORT_WRITE_CONFIG_SPACE.ahk" { PPCI_EXPRESS_ROOT_PORT_WRITE_CONFIG_SPACE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_ROOT_PORT_INTERFACE {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : PINTERFACE_REFERENCE

    InterfaceDereference : PINTERFACE_DEREFERENCE

    ReadConfigSpace : PPCI_EXPRESS_ROOT_PORT_READ_CONFIG_SPACE

    WriteConfigSpace : PPCI_EXPRESS_ROOT_PORT_WRITE_CONFIG_SPACE

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PINTERFACE_DEREFERENCE.ahk" { PINTERFACE_DEREFERENCE }
#Import ".\PINTERFACE_REFERENCE.ahk" { PINTERFACE_REFERENCE }
#Import ".\PPCI_IS_DEVICE_PRESENT.ahk" { PPCI_IS_DEVICE_PRESENT }
#Import ".\PPCI_IS_DEVICE_PRESENT_EX.ahk" { PPCI_IS_DEVICE_PRESENT_EX }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_DEVICE_PRESENT_INTERFACE {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : PINTERFACE_REFERENCE

    InterfaceDereference : PINTERFACE_DEREFERENCE

    IsDevicePresent : PPCI_IS_DEVICE_PRESENT

    IsDevicePresentEx : PPCI_IS_DEVICE_PRESENT_EX

}

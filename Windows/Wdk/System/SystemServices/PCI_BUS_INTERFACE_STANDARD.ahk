#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PPCI_EXPRESS_WAKE_CONTROL.ahk" { PPCI_EXPRESS_WAKE_CONTROL }
#Import ".\PPCI_LINE_TO_PIN.ahk" { PPCI_LINE_TO_PIN }
#Import ".\PPCI_PREPARE_MULTISTAGE_RESUME.ahk" { PPCI_PREPARE_MULTISTAGE_RESUME }
#Import ".\PPCI_READ_WRITE_CONFIG.ahk" { PPCI_READ_WRITE_CONFIG }
#Import ".\PPCI_ROOT_BUS_CAPABILITY.ahk" { PPCI_ROOT_BUS_CAPABILITY }
#Import ".\PPCI_PIN_TO_LINE.ahk" { PPCI_PIN_TO_LINE }
#Import ".\PINTERFACE_DEREFERENCE.ahk" { PINTERFACE_DEREFERENCE }
#Import ".\PINTERFACE_REFERENCE.ahk" { PINTERFACE_REFERENCE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_BUS_INTERFACE_STANDARD {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : PINTERFACE_REFERENCE

    InterfaceDereference : PINTERFACE_DEREFERENCE

    ReadConfig : PPCI_READ_WRITE_CONFIG

    WriteConfig : PPCI_READ_WRITE_CONFIG

    PinToLine : PPCI_PIN_TO_LINE

    LineToPin : PPCI_LINE_TO_PIN

    RootBusCapability : PPCI_ROOT_BUS_CAPABILITY

    ExpressWakeControl : PPCI_EXPRESS_WAKE_CONTROL

    PrepareMultistageResume : PPCI_PREPARE_MULTISTAGE_RESUME

}

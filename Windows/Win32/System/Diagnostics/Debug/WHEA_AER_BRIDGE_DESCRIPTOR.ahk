#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AER_BRIDGE_DESCRIPTOR_FLAGS.ahk" { AER_BRIDGE_DESCRIPTOR_FLAGS }
#Import ".\WHEA_PCI_SLOT_NUMBER.ahk" { WHEA_PCI_SLOT_NUMBER }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WHEA_AER_BRIDGE_DESCRIPTOR {
    #StructPack 4

    Type : UInt16

    Enabled : BOOLEAN

    Reserved : Int8

    BusNumber : UInt32

    Slot : WHEA_PCI_SLOT_NUMBER

    DeviceControl : UInt16

    Flags : AER_BRIDGE_DESCRIPTOR_FLAGS

    UncorrectableErrorMask : UInt32

    UncorrectableErrorSeverity : UInt32

    CorrectableErrorMask : UInt32

    AdvancedCapsAndControl : UInt32

    SecondaryUncorrectableErrorMask : UInt32

    SecondaryUncorrectableErrorSev : UInt32

    SecondaryCapsAndControl : UInt32

}

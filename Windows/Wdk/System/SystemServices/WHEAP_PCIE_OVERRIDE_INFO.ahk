#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_PCIE_OVERRIDE_INFO {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    Segment : UInt32

    Bus : UInt32

    Device : UInt32

    Function : UInt32

    ValidBits : Int8

    Reserved : Int8[3]

    UncorrectableErrorMask : UInt32

    UncorrectableErrorSeverity : UInt32

    CorrectableErrorMask : UInt32

    CapAndControl : UInt32

}

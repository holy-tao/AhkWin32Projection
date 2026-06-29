#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_AER_CAPABILITY {
    #StructPack 8

    Header : IntPtr

    UncorrectableErrorStatus : IntPtr

    UncorrectableErrorMask : IntPtr

    UncorrectableErrorSeverity : IntPtr

    CorrectableErrorStatus : IntPtr

    CorrectableErrorMask : IntPtr

    CapabilitiesAndControl : IntPtr

    HeaderLog : UInt32[4]

    SecUncorrectableErrorStatus : IntPtr

    SecUncorrectableErrorMask : IntPtr

    SecUncorrectableErrorSeverity : IntPtr

    SecCapabilitiesAndControl : IntPtr

    SecHeaderLog : UInt32[4]

}

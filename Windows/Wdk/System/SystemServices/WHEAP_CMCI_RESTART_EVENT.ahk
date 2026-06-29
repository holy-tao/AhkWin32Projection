#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_CMCI_RESTART_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    CmciRestoreAttempts : UInt32

    MaxCmciRestoreLimit : UInt32

    MaxCorrectedErrorsFound : UInt32

    MaxCorrectedErrorLimit : UInt32

}

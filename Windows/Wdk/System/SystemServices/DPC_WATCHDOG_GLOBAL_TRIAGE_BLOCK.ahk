#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DPC_WATCHDOG_GLOBAL_TRIAGE_BLOCK {
    #StructPack 4

    Signature : UInt32

    Revision : UInt16

    Size : UInt16

    DpcWatchdogProfileOffset : UInt16

    DpcWatchdogProfileLength : UInt32

}

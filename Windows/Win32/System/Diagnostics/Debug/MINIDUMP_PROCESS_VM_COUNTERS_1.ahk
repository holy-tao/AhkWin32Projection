#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_PROCESS_VM_COUNTERS_1 {
    #StructPack 8

    Revision : UInt16

    PageFaultCount : UInt32

    PeakWorkingSetSize : Int64

    WorkingSetSize : Int64

    QuotaPeakPagedPoolUsage : Int64

    QuotaPagedPoolUsage : Int64

    QuotaPeakNonPagedPoolUsage : Int64

    QuotaNonPagedPoolUsage : Int64

    PagefileUsage : Int64

    PeakPagefileUsage : Int64

    PrivateUsage : Int64

}

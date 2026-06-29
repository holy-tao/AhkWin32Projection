#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_PROCESS_VM_COUNTERS_2 {
    #StructPack 8

    Revision : UInt16

    Flags : UInt16

    PageFaultCount : UInt32

    PeakWorkingSetSize : Int64

    WorkingSetSize : Int64

    QuotaPeakPagedPoolUsage : Int64

    QuotaPagedPoolUsage : Int64

    QuotaPeakNonPagedPoolUsage : Int64

    QuotaNonPagedPoolUsage : Int64

    PagefileUsage : Int64

    PeakPagefileUsage : Int64

    PeakVirtualSize : Int64

    VirtualSize : Int64

    PrivateUsage : Int64

    PrivateWorkingSetSize : Int64

    SharedCommitUsage : Int64

    JobSharedCommitUsage : Int64

    JobPrivateCommitUsage : Int64

    JobPeakPrivateCommitUsage : Int64

    JobPrivateCommitLimit : Int64

    JobTotalCommitLimit : Int64

}

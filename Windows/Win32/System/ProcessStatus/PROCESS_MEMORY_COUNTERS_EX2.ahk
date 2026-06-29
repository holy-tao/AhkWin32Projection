#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ProcessStatus
 */
export default struct PROCESS_MEMORY_COUNTERS_EX2 {
    #StructPack 8

    cb : UInt32

    PageFaultCount : UInt32

    PeakWorkingSetSize : IntPtr

    WorkingSetSize : IntPtr

    QuotaPeakPagedPoolUsage : IntPtr

    QuotaPagedPoolUsage : IntPtr

    QuotaPeakNonPagedPoolUsage : IntPtr

    QuotaNonPagedPoolUsage : IntPtr

    PagefileUsage : IntPtr

    PeakPagefileUsage : IntPtr

    PrivateUsage : IntPtr

    PrivateWorkingSetSize : IntPtr

    SharedCommitUsage : Int64

}

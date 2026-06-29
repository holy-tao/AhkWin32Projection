#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains extended memory statistics for a process.
 * @see https://learn.microsoft.com/windows/win32/api/psapi/ns-psapi-process_memory_counters_ex
 * @namespace Windows.Win32.System.ProcessStatus
 */
export default struct PROCESS_MEMORY_COUNTERS_EX {
    #StructPack 8

    /**
     * The size of the structure, in bytes.
     */
    cb : UInt32

    /**
     * The number of page faults.
     */
    PageFaultCount : UInt32

    /**
     * The peak working set size, in bytes.
     */
    PeakWorkingSetSize : IntPtr

    /**
     * The current working set size, in bytes.
     */
    WorkingSetSize : IntPtr

    /**
     * The peak paged pool usage, in bytes.
     */
    QuotaPeakPagedPoolUsage : IntPtr

    /**
     * The current paged pool usage, in bytes.
     */
    QuotaPagedPoolUsage : IntPtr

    /**
     * The peak nonpaged pool usage, in bytes.
     */
    QuotaPeakNonPagedPoolUsage : IntPtr

    /**
     * The current nonpaged pool usage, in bytes.
     */
    QuotaNonPagedPoolUsage : IntPtr

    /**
     * The Commit Charge value in bytes for this process. Commit Charge is the total amount of private memory that the memory manager has committed for a running process.
     * 
     * <b>Windows 7 and Windows Server 2008 R2 and earlier:  </b><b>PagefileUsage</b> is always zero. Check <b>PrivateUsage</b> instead.
     */
    PagefileUsage : IntPtr

    /**
     * The peak value in bytes of the Commit Charge during the lifetime of this process.
     */
    PeakPagefileUsage : IntPtr

    /**
     * Same as <b>PagefileUsage</b>. The Commit Charge value in bytes for this process. Commit Charge is the total amount of private memory that the memory manager has committed for a running process.
     */
    PrivateUsage : IntPtr

}

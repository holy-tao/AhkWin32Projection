#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PSS_PROCESS_FLAGS.ahk" { PSS_PROCESS_FLAGS }
#Import "..\..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Holds process information returned by PssQuerySnapshot.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-pssquerysnapshot">PssQuerySnapshot</a> returns a <b>PSS_PROCESS_INFORMATION</b> structure when the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_query_information_class">PSS_QUERY_INFORMATION_CLASS</a> member that the caller provides it is  <b>PSS_QUERY_PROCESS_INFORMATION</b>.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ns-processsnapshot-pss_process_information
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 */
export default struct PSS_PROCESS_INFORMATION {
    #StructPack 8

    /**
     * The exit code of the process. If the process has not exited, this is set to <b>STILL_ACTIVE</b> (259).
     */
    ExitStatus : UInt32

    /**
     * The address to the process environment block (PEB). Reserved for use by the operating system.
     */
    PebBaseAddress : IntPtr

    /**
     * The affinity mask of the process.
     */
    AffinityMask : IntPtr

    /**
     * The base priority level of the process.
     */
    BasePriority : Int32

    /**
     * The process ID.
     */
    ProcessId : UInt32

    /**
     * The parent process ID.
     */
    ParentProcessId : UInt32

    /**
     * Flags about the process. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_process_flags">PSS_PROCESS_FLAGS</a>.
     */
    Flags : PSS_PROCESS_FLAGS

    /**
     * The time the process was created. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     */
    CreateTime : FILETIME

    /**
     * If the process exited, the time of the exit. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     */
    ExitTime : FILETIME

    /**
     * The amount of time the process spent executing in kernel-mode. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     */
    KernelTime : FILETIME

    /**
     * The amount of time the process spent executing in user-mode. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     */
    UserTime : FILETIME

    /**
     * The priority class.
     */
    PriorityClass : UInt32

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     */
    PeakVirtualSize : IntPtr

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     */
    VirtualSize : IntPtr

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     */
    PageFaultCount : UInt32

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     */
    PeakWorkingSetSize : IntPtr

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     */
    WorkingSetSize : IntPtr

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     */
    QuotaPeakPagedPoolUsage : IntPtr

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     */
    QuotaPagedPoolUsage : IntPtr

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     */
    QuotaPeakNonPagedPoolUsage : IntPtr

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     */
    QuotaNonPagedPoolUsage : IntPtr

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     */
    PagefileUsage : IntPtr

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     */
    PeakPagefileUsage : IntPtr

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     */
    PrivateUsage : IntPtr

    /**
     * Reserved for use by the operating system.
     */
    ExecuteFlags : UInt32

    /**
     * The full path to the process executable. If the path exceeds the allocated buffer size, it is truncated.
     */
    ImageFileName : WCHAR[260]

}

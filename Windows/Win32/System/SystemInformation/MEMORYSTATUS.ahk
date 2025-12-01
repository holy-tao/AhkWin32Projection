#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the current state of both physical and virtual memory.
 * @remarks
 * <b>MEMORYSTATUS</b> reflects the state of memory at the time of the call. It also reflects the size of the paging file at that time. The operating system can enlarge the paging file up to the maximum size set by the administrator.
 * 
 * On computers with more than 4 GB of memory, the 
 * <b>MEMORYSTATUS</b> structure can return incorrect information, reporting a value of –1 to indicate an overflow. If your application is at risk for this behavior, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-globalmemorystatusex">GlobalMemoryStatusEx</a> function instead of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalmemorystatus">GlobalMemoryStatus</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-memorystatus
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class MEMORYSTATUS extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The size of the 
     * <b>MEMORYSTATUS</b> data structure, in bytes. You do not need to set this member before calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalmemorystatus">GlobalMemoryStatus</a> function; the function sets it.
     * @type {Integer}
     */
    dwLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A number between 0 and 100 that specifies the approximate percentage of physical memory that is in use (0 indicates no memory use and 100 indicates full memory use).
     * @type {Integer}
     */
    dwMemoryLoad {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The amount of actual physical memory, in bytes.
     * @type {Pointer}
     */
    dwTotalPhys {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The amount of physical memory currently available, in bytes. This is the amount of physical memory that can be immediately reused without having to write its contents to disk first. It is the sum of the size of the standby, free, and zero lists.
     * @type {Pointer}
     */
    dwAvailPhys {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The current size of the committed memory limit, in bytes. This is physical memory plus the size of the page file, minus a small overhead.
     * @type {Pointer}
     */
    dwTotalPageFile {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The maximum amount of memory the current process can commit, in bytes. This value should be smaller than the system-wide available commit. To calculate this value, call <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getperformanceinfo">GetPerformanceInfo</a> and subtract the value of <b>CommitTotal</b> from <b>CommitLimit</b>.
     * @type {Pointer}
     */
    dwAvailPageFile {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The size of the user-mode portion of the virtual address space of the calling process, in bytes. This value depends on the type of process, the type of processor, and the configuration of the operating system. For example, this value is approximately 2 GB for most 32-bit processes on an x86 processor and approximately 3 GB for 32-bit processes that are large address aware running on a system with 4 GT RAM Tuning enabled.
     * @type {Pointer}
     */
    dwTotalVirtual {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The amount of unreserved and uncommitted memory currently in the user-mode portion of the virtual address space of the calling process, in bytes.
     * @type {Pointer}
     */
    dwAvailVirtual {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}

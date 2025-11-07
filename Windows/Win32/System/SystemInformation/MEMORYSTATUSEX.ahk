#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the current state of both physical and virtual memory, including extended memory.
 * @remarks
 * 
 * <b>MEMORYSTATUSEX</b> reflects the state of memory at the time of the call. It also reflects the size of the paging file at that time. The operating system can enlarge the paging file up to the maximum size set by the administrator.
 * 
 * The physical memory sizes returned include the memory from all nodes. 
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/ns-sysinfoapi-memorystatusex
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class MEMORYSTATUSEX extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The size of the 
     * structure, in bytes. You must set this member before calling  
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-globalmemorystatusex">GlobalMemoryStatusEx</a>.
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
     * @type {Integer}
     */
    ullTotalPhys {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The amount of physical memory currently available, in bytes. This is the amount of physical memory that can be immediately reused without having to write its contents to disk first. It is the sum of the size of the standby, free, and zero lists.
     * @type {Integer}
     */
    ullAvailPhys {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The current committed memory limit for the system or the current process, whichever is smaller, in bytes. To get the system-wide committed memory limit, call <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getperformanceinfo">GetPerformanceInfo</a>.
     * @type {Integer}
     */
    ullTotalPageFile {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The maximum amount of memory the current process can commit, in bytes. This value is equal to or smaller than the system-wide available commit value. To calculate the system-wide available commit value, call <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getperformanceinfo">GetPerformanceInfo</a> and subtract the value of <b>CommitTotal</b> from the value of <b>CommitLimit</b>.
     * @type {Integer}
     */
    ullAvailPageFile {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The size of the user-mode portion of the virtual address space of the calling process, in bytes. This value depends on the type of process, the type of processor, and the configuration of the operating system. For example, this value is approximately 2 GB for most 32-bit processes on an x86 processor and approximately 3 GB for 32-bit processes that are large address aware running on a system with <a href="https://docs.microsoft.com/windows/desktop/Memory/4-gigabyte-tuning">4-gigabyte tuning</a> enabled.
     * @type {Integer}
     */
    ullTotalVirtual {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The amount of unreserved and uncommitted memory currently in the user-mode portion of the virtual address space of the calling process, in bytes.
     * @type {Integer}
     */
    ullAvailVirtual {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Reserved. This value is always 0.
     * @type {Integer}
     */
    ullAvailExtendedVirtual {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}

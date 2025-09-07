#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains extended memory statistics for a process.
 * @see https://learn.microsoft.com/windows/win32/api/psapi/ns-psapi-process_memory_counters_ex
 * @namespace Windows.Win32.System.ProcessStatus
 * @version v4.0.30319
 */
class PROCESS_MEMORY_COUNTERS_EX extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of page faults.
     * @type {Integer}
     */
    PageFaultCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The peak working set size, in bytes.
     * @type {Pointer}
     */
    PeakWorkingSetSize {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The current working set size, in bytes.
     * @type {Pointer}
     */
    WorkingSetSize {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The peak paged pool usage, in bytes.
     * @type {Pointer}
     */
    QuotaPeakPagedPoolUsage {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The current paged pool usage, in bytes.
     * @type {Pointer}
     */
    QuotaPagedPoolUsage {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The peak nonpaged pool usage, in bytes.
     * @type {Pointer}
     */
    QuotaPeakNonPagedPoolUsage {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The current nonpaged pool usage, in bytes.
     * @type {Pointer}
     */
    QuotaNonPagedPoolUsage {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The Commit Charge value in bytes for this process. Commit Charge is the total amount of private memory that the memory manager has committed for a running process.
     * 
     * <b>Windows 7 and Windows Server 2008 R2 and earlier:  </b><b>PagefileUsage</b> is always zero. Check <b>PrivateUsage</b> instead.
     * @type {Pointer}
     */
    PagefileUsage {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The peak value in bytes of the Commit Charge during the lifetime of this process.
     * @type {Pointer}
     */
    PeakPagefileUsage {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Same as <b>PagefileUsage</b>. The Commit Charge value in bytes for this process. Commit Charge is the total amount of private memory that the memory manager has committed for a running process.
     * @type {Pointer}
     */
    PrivateUsage {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}

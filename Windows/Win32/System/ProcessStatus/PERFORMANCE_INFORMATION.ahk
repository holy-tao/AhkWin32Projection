#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains performance information.
 * @see https://docs.microsoft.com/windows/win32/api//psapi/ns-psapi-performance_information
 * @namespace Windows.Win32.System.ProcessStatus
 * @version v4.0.30319
 */
class PERFORMANCE_INFORMATION extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of pages currently committed by the system. Note that committing pages (using <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> with MEM_COMMIT) changes this value immediately; however, the physical memory is not charged until the pages are accessed.
     * @type {Pointer}
     */
    CommitTotal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The current maximum number of pages that can be committed by the system without extending the paging file(s). This number can change if memory is added or deleted, or if pagefiles have grown, shrunk, or been added. If the paging file can be extended, this is a soft limit.
     * @type {Pointer}
     */
    CommitLimit {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The maximum number of pages that were simultaneously in the committed state since the last system reboot.
     * @type {Pointer}
     */
    CommitPeak {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The amount of actual physical memory, in pages.
     * @type {Pointer}
     */
    PhysicalTotal {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The amount of physical memory currently available, in pages.  This is the amount of physical memory that can be immediately reused without having to write its contents to disk first. It is the sum of the size of the standby, free, and zero lists.
     * @type {Pointer}
     */
    PhysicalAvailable {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The amount of system cache memory, in pages. This is the size of the standby list plus the system working set.
     * @type {Pointer}
     */
    SystemCache {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The sum of the memory currently in the paged and nonpaged kernel pools, in pages.
     * @type {Pointer}
     */
    KernelTotal {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The memory currently in the paged kernel pool, in pages.
     * @type {Pointer}
     */
    KernelPaged {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The memory currently in the nonpaged kernel pool, in pages.
     * @type {Pointer}
     */
    KernelNonpaged {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The size of a page, in bytes.
     * @type {Pointer}
     */
    PageSize {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * The current number of open handles.
     * @type {Integer}
     */
    HandleCount {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * The current number of processes.
     * @type {Integer}
     */
    ProcessCount {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * The current number of threads.
     * @type {Integer}
     */
    ThreadCount {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }
}

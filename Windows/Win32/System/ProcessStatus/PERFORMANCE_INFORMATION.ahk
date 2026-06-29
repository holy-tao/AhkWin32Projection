#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains performance information. (PERFORMANCE_INFORMATION)
 * @see https://learn.microsoft.com/windows/win32/api/psapi/ns-psapi-performance_information
 * @namespace Windows.Win32.System.ProcessStatus
 */
export default struct PERFORMANCE_INFORMATION {
    #StructPack 8

    /**
     * The size of this structure, in bytes.
     */
    cb : UInt32

    /**
     * The number of pages currently committed by the system. Note that committing pages (using <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> with MEM_COMMIT) changes this value immediately; however, the physical memory is not charged until the pages are accessed.
     */
    CommitTotal : IntPtr

    /**
     * The current maximum number of pages that can be committed by the system without extending the paging file(s). This number can change if memory is added or deleted, or if pagefiles have grown, shrunk, or been added. If the paging file can be extended, this is a soft limit.
     */
    CommitLimit : IntPtr

    /**
     * The maximum number of pages that were simultaneously in the committed state since the last system reboot.
     */
    CommitPeak : IntPtr

    /**
     * The amount of actual physical memory, in pages.
     */
    PhysicalTotal : IntPtr

    /**
     * The amount of physical memory currently available, in pages.  This is the amount of physical memory that can be immediately reused without having to write its contents to disk first. It is the sum of the size of the standby, free, and zero lists.
     */
    PhysicalAvailable : IntPtr

    /**
     * The amount of system cache memory, in pages. This is the size of the standby list plus the system working set.
     */
    SystemCache : IntPtr

    /**
     * The sum of the memory currently in the paged and nonpaged kernel pools, in pages.
     */
    KernelTotal : IntPtr

    /**
     * The memory currently in the paged kernel pool, in pages.
     */
    KernelPaged : IntPtr

    /**
     * The memory currently in the nonpaged kernel pool, in pages.
     */
    KernelNonpaged : IntPtr

    /**
     * The size of a page, in bytes.
     */
    PageSize : IntPtr

    /**
     * The current number of open handles.
     */
    HandleCount : UInt32

    /**
     * The current number of processes.
     */
    ProcessCount : UInt32

    /**
     * The current number of threads.
     */
    ThreadCount : UInt32

}

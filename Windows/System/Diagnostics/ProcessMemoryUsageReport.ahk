#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProcessMemoryUsageReport.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data about the memory usage of the process.
 * @remarks
 * Call [GetReport](processmemoryusage_getreport_610268658.md) to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processmemoryusagereport
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ProcessMemoryUsageReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProcessMemoryUsageReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProcessMemoryUsageReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the amount of non-paged memory available to the process, in bytes.
     * @remarks
     * The value returned by this property represents the current size of nonpaged system memory used by the process. System memory is the physical memory used by the operating system, and is divided into paged and nonpaged pools. Nonpaged memory allocations remain in system memory and are not paged out to the virtual memory paging file.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processmemoryusagereport.nonpagedpoolsizeinbytes
     * @type {Integer} 
     */
    NonPagedPoolSizeInBytes {
        get => this.get_NonPagedPoolSizeInBytes()
    }

    /**
     * Gets the number of memory page faults.
     * @remarks
     * A memory page fault occurs when requested data is not found in memory. The system generates a fault, which normally indicates that the system looks for data in the paging file. In this circumstance, however, the missing data is identified as being located within an area of memory that cannot be paged out to disk. The system faults, but cannot find, the data and is unable to recover. Faulty hardware, a buggy system service, antivirus software, and a corrupted NTFS volume can all generate this type of error.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processmemoryusagereport.pagefaultcount
     * @type {Integer} 
     */
    PageFaultCount {
        get => this.get_PageFaultCount()
    }

    /**
     * Gets the size of the memory page file in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processmemoryusagereport.pagefilesizeinbytes
     * @type {Integer} 
     */
    PageFileSizeInBytes {
        get => this.get_PageFileSizeInBytes()
    }

    /**
     * Gets the amount of paged memory available to the process, in bytes.
     * @remarks
     * The value returned by this property represents the current size of memory in the virtual memory paging file used by the process. The operating system uses the virtual memory paging file in conjunction with physical memory to manage the virtual address space for each process. When pageable memory is not in use, it can be transferred to the virtual memory paging file on disk.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processmemoryusagereport.pagedpoolsizeinbytes
     * @type {Integer} 
     */
    PagedPoolSizeInBytes {
        get => this.get_PagedPoolSizeInBytes()
    }

    /**
     * Gets the maximum amount of non-paged memory used by the process, in bytes.
     * @remarks
     * The value returned by this property value represents the maximum size of non-paged memory used by the process since it started. The operating system uses the virtual memory paging file in conjunction with physical memory to manage the virtual address space for each process. When pageable memory is not in use, it can be transferred to the virtual memory paging file on disk.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processmemoryusagereport.peaknonpagedpoolsizeinbytes
     * @type {Integer} 
     */
    PeakNonPagedPoolSizeInBytes {
        get => this.get_PeakNonPagedPoolSizeInBytes()
    }

    /**
     * Gets the maximum size of the memory page file used by the process, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processmemoryusagereport.peakpagefilesizeinbytes
     * @type {Integer} 
     */
    PeakPageFileSizeInBytes {
        get => this.get_PeakPageFileSizeInBytes()
    }

    /**
     * Gets the maximum amount of paged memory used by the process, in bytes.
     * @remarks
     * The value returned by this property value represents the maximum size of memory in the virtual memory paging file used by the process since it started. The operating system uses the virtual memory paging file in conjunction with physical memory to manage the virtual address space for each process. When pageable memory is not in use, it can be transferred to the virtual memory paging file on disk.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processmemoryusagereport.peakpagedpoolsizeinbytes
     * @type {Integer} 
     */
    PeakPagedPoolSizeInBytes {
        get => this.get_PeakPagedPoolSizeInBytes()
    }

    /**
     * Gets the maximum amount of virtual memory used by the associated process.
     * @remarks
     * The value returned by this property represents the maximum size of virtual memory used by the process since it started. The operating system maps the virtual address space for each process either to pages loaded in physical memory, or to pages stored in the virtual memory paging file on disk.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processmemoryusagereport.peakvirtualmemorysizeinbytes
     * @type {Integer} 
     */
    PeakVirtualMemorySizeInBytes {
        get => this.get_PeakVirtualMemorySizeInBytes()
    }

    /**
     * Gets the maximum amount of physical memory used by the associated process.
     * @remarks
     * The value returned by this property represents the maximum size of working set memory used by the process since it started. The working set of a process is the set of memory pages currently visible to the process in physical RAM memory. These pages are resident and available for an application to use without triggering a page fault.
     * 
     * The working set includes both shared and private data. The shared data includes the pages that contain all the instructions that the process executes, including instructions from the process modules and the system libraries.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processmemoryusagereport.peakworkingsetsizeinbytes
     * @type {Integer} 
     */
    PeakWorkingSetSizeInBytes {
        get => this.get_PeakWorkingSetSizeInBytes()
    }

    /**
     * Gets the number of private memory pages allocated for the associated process.
     * @remarks
     * The value returned by this property represents the current number of memory pages used by the process that cannot be shared with other processes.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processmemoryusagereport.privatepagecount
     * @type {Integer} 
     */
    PrivatePageCount {
        get => this.get_PrivatePageCount()
    }

    /**
     * Gets the amount of the virtual memory allocated for the associated process.
     * @remarks
     * The value returned by this property represents the current size of virtual memory used by the process. The operating system maps the virtual address space for each process either to pages loaded in physical memory, or to pages stored in the virtual memory paging file on disk.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processmemoryusagereport.virtualmemorysizeinbytes
     * @type {Integer} 
     */
    VirtualMemorySizeInBytes {
        get => this.get_VirtualMemorySizeInBytes()
    }

    /**
     * Gets the amount of physical memory allocated for the associated process.
     * @remarks
     * The value returned by this property represents the current size of working set memory used by the process. The working set of a process is the set of memory pages currently visible to the process in physical RAM memory. These pages are resident and available for an application to use without triggering a page fault.
     * 
     * The working set includes both shared and private data. The shared data includes the pages that contain all the instructions that the process executes, including instructions in the process modules and the system libraries.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processmemoryusagereport.workingsetsizeinbytes
     * @type {Integer} 
     */
    WorkingSetSizeInBytes {
        get => this.get_WorkingSetSizeInBytes()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NonPagedPoolSizeInBytes() {
        if (!this.HasProp("__IProcessMemoryUsageReport")) {
            if ((queryResult := this.QueryInterface(IProcessMemoryUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessMemoryUsageReport := IProcessMemoryUsageReport(outPtr)
        }

        return this.__IProcessMemoryUsageReport.get_NonPagedPoolSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PageFaultCount() {
        if (!this.HasProp("__IProcessMemoryUsageReport")) {
            if ((queryResult := this.QueryInterface(IProcessMemoryUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessMemoryUsageReport := IProcessMemoryUsageReport(outPtr)
        }

        return this.__IProcessMemoryUsageReport.get_PageFaultCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PageFileSizeInBytes() {
        if (!this.HasProp("__IProcessMemoryUsageReport")) {
            if ((queryResult := this.QueryInterface(IProcessMemoryUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessMemoryUsageReport := IProcessMemoryUsageReport(outPtr)
        }

        return this.__IProcessMemoryUsageReport.get_PageFileSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PagedPoolSizeInBytes() {
        if (!this.HasProp("__IProcessMemoryUsageReport")) {
            if ((queryResult := this.QueryInterface(IProcessMemoryUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessMemoryUsageReport := IProcessMemoryUsageReport(outPtr)
        }

        return this.__IProcessMemoryUsageReport.get_PagedPoolSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PeakNonPagedPoolSizeInBytes() {
        if (!this.HasProp("__IProcessMemoryUsageReport")) {
            if ((queryResult := this.QueryInterface(IProcessMemoryUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessMemoryUsageReport := IProcessMemoryUsageReport(outPtr)
        }

        return this.__IProcessMemoryUsageReport.get_PeakNonPagedPoolSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PeakPageFileSizeInBytes() {
        if (!this.HasProp("__IProcessMemoryUsageReport")) {
            if ((queryResult := this.QueryInterface(IProcessMemoryUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessMemoryUsageReport := IProcessMemoryUsageReport(outPtr)
        }

        return this.__IProcessMemoryUsageReport.get_PeakPageFileSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PeakPagedPoolSizeInBytes() {
        if (!this.HasProp("__IProcessMemoryUsageReport")) {
            if ((queryResult := this.QueryInterface(IProcessMemoryUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessMemoryUsageReport := IProcessMemoryUsageReport(outPtr)
        }

        return this.__IProcessMemoryUsageReport.get_PeakPagedPoolSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PeakVirtualMemorySizeInBytes() {
        if (!this.HasProp("__IProcessMemoryUsageReport")) {
            if ((queryResult := this.QueryInterface(IProcessMemoryUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessMemoryUsageReport := IProcessMemoryUsageReport(outPtr)
        }

        return this.__IProcessMemoryUsageReport.get_PeakVirtualMemorySizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PeakWorkingSetSizeInBytes() {
        if (!this.HasProp("__IProcessMemoryUsageReport")) {
            if ((queryResult := this.QueryInterface(IProcessMemoryUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessMemoryUsageReport := IProcessMemoryUsageReport(outPtr)
        }

        return this.__IProcessMemoryUsageReport.get_PeakWorkingSetSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrivatePageCount() {
        if (!this.HasProp("__IProcessMemoryUsageReport")) {
            if ((queryResult := this.QueryInterface(IProcessMemoryUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessMemoryUsageReport := IProcessMemoryUsageReport(outPtr)
        }

        return this.__IProcessMemoryUsageReport.get_PrivatePageCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VirtualMemorySizeInBytes() {
        if (!this.HasProp("__IProcessMemoryUsageReport")) {
            if ((queryResult := this.QueryInterface(IProcessMemoryUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessMemoryUsageReport := IProcessMemoryUsageReport(outPtr)
        }

        return this.__IProcessMemoryUsageReport.get_VirtualMemorySizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WorkingSetSizeInBytes() {
        if (!this.HasProp("__IProcessMemoryUsageReport")) {
            if ((queryResult := this.QueryInterface(IProcessMemoryUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessMemoryUsageReport := IProcessMemoryUsageReport(outPtr)
        }

        return this.__IProcessMemoryUsageReport.get_WorkingSetSizeInBytes()
    }

;@endregion Instance Methods
}

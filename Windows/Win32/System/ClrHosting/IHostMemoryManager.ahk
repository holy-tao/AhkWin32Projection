#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHostMalloc.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostMemoryManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostMemoryManager
     * @type {Guid}
     */
    static IID => Guid("{7bc698d1-f9e3-4460-9cde-d04248e9fa25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMalloc", "VirtualAlloc", "VirtualFree", "VirtualQuery", "VirtualProtect", "GetMemoryLoad", "RegisterMemoryNotificationCallback", "NeedsVirtualAddressSpace", "AcquiredVirtualAddressSpace", "ReleasedVirtualAddressSpace"]

    /**
     * 
     * @param {Integer} dwMallocType 
     * @returns {IHostMalloc} 
     */
    CreateMalloc(dwMallocType) {
        result := ComCall(3, this, "uint", dwMallocType, "ptr*", &ppMalloc := 0, "HRESULT")
        return IHostMalloc(ppMalloc)
    }

    /**
     * Reserves, commits, or changes the state of a region of pages in the virtual address space of the calling process. (VirtualAlloc)
     * @remarks
     * Each page has an associated [page state](/windows/win32/Memory/page-state). The **VirtualAlloc** function can perform the following operations:
     * 
     * - Commit a region of reserved pages
     * - Reserve a region of free pages
     * - Simultaneously reserve and commit a region of free pages
     * 
     * **VirtualAlloc** cannot reserve a reserved page. It can commit a page that is already committed. This means you can commit a range of pages, regardless of whether they have already been committed, and the function will not fail.
     * 
     * You can use **VirtualAlloc** to reserve a block of pages and then make additional calls to **VirtualAlloc** to commit individual pages from the reserved block. This enables a process to reserve a range of its virtual address space without consuming physical storage until it is needed.
     * 
     * If the _lpAddress_ parameter is not **NULL**, the function uses the _lpAddress_ and _dwSize_ parameters to compute the region of pages to be allocated. The current state of the entire range of pages must be compatible with the type of allocation specified by the _flAllocationType_ parameter. Otherwise, the function fails and none of the pages are allocated. This compatibility requirement does not preclude committing an already committed page, as mentioned previously.
     * 
     * To execute dynamically generated code, use **VirtualAlloc** to allocate memory and the [VirtualProtect](/windows/win32/api/memoryapi/nf-memoryapi-virtualprotect) function to grant **PAGE_EXECUTE** access.
     * 
     * The **VirtualAlloc** function can be used to reserve an [Address Windowing Extensions](/windows/win32/Memory/address-windowing-extensions) (AWE) region of memory within the virtual address space of a specified process. This region of memory can then be used to map physical pages into and out of virtual memory as required by the application. The **MEM_PHYSICAL** and **MEM_RESERVE** values must be set in the _AllocationType_ parameter. The **MEM_COMMIT** value must not be set. The page protection must be set to **PAGE_READWRITE**.
     * 
     * The [VirtualFree](/windows/win32/api/memoryapi/nf-memoryapi-virtualfree) function can decommit a committed page, releasing the page's storage, or it can simultaneously decommit and release a committed page. It can also release a reserved page, making it a free page.
     * 
     * When creating a region that will be executable, the calling program bears responsibility for ensuring cache coherency via an appropriate call to [FlushInstructionCache](/windows/win32/api/processthreadsapi/nf-processthreadsapi-flushinstructioncache) once the code has been set in place. Otherwise attempts to execute code out of the newly executable region may produce unpredictable results.
     * @param {Pointer<Void>} pAddress 
     * @param {Pointer} dwSize The size of the region, in bytes. If the _lpAddress_ parameter is **NULL**, this value is rounded up to the next page boundary. Otherwise, the allocated pages include all pages containing one or more bytes in the range from _lpAddress_ to _lpAddress_+_dwSize_. This means that a 2-byte range straddling a page boundary causes both pages to be included in the allocated region.
     * @param {Integer} flAllocationType 
     * @param {Integer} flProtect The memory protection for the region of pages to be allocated. If the pages are being committed, you can specify any one of the [memory protection constants](/windows/win32/Memory/memory-protection-constants).
     * @param {Integer} eCriticalLevel 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualalloc
     */
    VirtualAlloc(pAddress, dwSize, flAllocationType, flProtect, eCriticalLevel) {
        pAddressMarshal := pAddress is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pAddressMarshal, pAddress, "ptr", dwSize, "uint", flAllocationType, "uint", flProtect, "int", eCriticalLevel, "ptr*", &ppMem := 0, "HRESULT")
        return ppMem
    }

    /**
     * Releases, decommits, or releases and decommits a region of pages within the virtual address space of the calling process.
     * @remarks
     * Each page of memory in a process virtual address space has a [Page State](/windows/win32/Memory/page-state). The **VirtualFree** function can decommit a range of pages that are in different states, some committed and some uncommitted. This means that you can decommit a range of pages without first determining the current commitment state of each page. Decommitting a page releases its physical storage, either in memory or in the paging file on disk.
     * 
     * If a page is decommitted but not released, its state changes to reserved. Subsequently, you can call [VirtualAlloc](/windows/win32/api/memoryapi/nf-memoryapi-virtualalloc) to commit it, or **VirtualFree** to release it. Attempts to read from or write to a reserved page results in an access violation exception.
     * 
     * The **VirtualFree** function can release a range of pages that are in different states, some reserved and some committed. This means that you can release a range of pages without first determining the current commitment state of each page. The entire range of pages originally reserved by the [VirtualAlloc](nf-memoryapi-virtualalloc.md) function must be released at the same time.
     * 
     * If a page is released, its state changes to free, and it is available for subsequent allocation operations. After memory is released or decommited, you can never refer to the memory again. Any information that may have been in that memory is gone forever. Attempting to read from or write to a free page results in an access violation exception. If you need to keep information, do not decommit or free memory that contains the information.
     * 
     * The **VirtualFree** function can be used on an AWE region of memory, and it invalidates any physical page mappings in the region when freeing the address space. However, the physical page is not deleted, and the application can use them. The application must explicitly call [FreeUserPhysicalPages](nf-memoryapi-freeuserphysicalpages.md) to free the physical pages. When the process is terminated, all resources are cleaned up automatically.
     * 
     * **Windows 10, version 1709 and later and Windows 11:** To delete the enclave when you finish using it, call [DeleteEnclave](../enclaveapi/nf-enclaveapi-deleteenclave.md). You cannot delete a VBS enclave by calling the **VirtualFree** or [VirtualFreeEx](nf-memoryapi-virtualfreeex.md) function. You can still delete an SGX enclave by calling **VirtualFree** or **VirtualFreeEx**.
     * 
     * **Windows 10, version 1507, Windows 10, version 1511, Windows 10, version 1607 and Windows 10, version 1703:** To delete the enclave when you finish using it, call the **VirtualFree** or [VirtualFreeEx](nf-memoryapi-virtualfreeex.md) function and specify the following values:
     * 
     * - The base address of the enclave for the _lpAddress_ parameter.
     * - 0 for the _dwSize_ parameter.
     * - **MEM_RELEASE** for the _dwFreeType_ parameter.
     * @param {Pointer<Void>} lpAddress A pointer to the base address of the region of pages to be freed.
     * 
     * If the _dwFreeType_ parameter is **MEM_RELEASE**, this parameter must be the base address returned by the [VirtualAlloc](/windows/win32/api/memoryapi/nf-memoryapi-virtualalloc) function when the region of pages is reserved.
     * @param {Pointer} dwSize The size of the region of memory to be freed, in bytes.
     * 
     * If the _dwFreeType_ parameter is **MEM_RELEASE**, this parameter must be 0 (zero). The function frees the entire region that is reserved in the initial allocation call to [VirtualAlloc](/windows/win32/api/memoryapi/nf-memoryapi-virtualalloc).
     * 
     * If the _dwFreeType_ parameter is **MEM_DECOMMIT**, the function decommits all memory pages that contain one or more bytes in the range from the _lpAddress_ parameter to `(lpAddress+dwSize)`. This means, for example, that a 2-byte region of memory that straddles a page boundary causes both pages to be decommitted. If _lpAddress_ is the base address returned by [VirtualAlloc](/windows/win32/api/memoryapi/nf-memoryapi-virtualalloc) and _dwSize_ is 0 (zero), the function decommits the entire region that is allocated by **VirtualAlloc**. After that, the entire region is in the reserved state.
     * @param {Integer} dwFreeType 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualfree
     */
    VirtualFree(lpAddress, dwSize, dwFreeType) {
        lpAddressMarshal := lpAddress is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, lpAddressMarshal, lpAddress, "ptr", dwSize, "uint", dwFreeType, "HRESULT")
        return result
    }

    /**
     * Retrieves information about a range of pages in the virtual address space of the calling process.
     * @remarks
     * <b>VirtualQuery</b> provides information about a region of consecutive pages beginning at a specified address that share the following attributes:
     * 
     * <ul>
     * <li>The state of all pages is the same (<b>MEM_COMMIT</b>, <b>MEM_RESERVE</b>, <b>MEM_FREE</b>, <b>MEM_PRIVATE</b>, <b>MEM_MAPPED</b>, or <b>MEM_IMAGE</b>).</li>
     * <li>If the initial page is not free, all pages in the region are part of the same initial allocation of pages created by a single call to <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a>, <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a>, or one of the following extended versions of these functions: <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualallocex">VirtualAllocEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualallocexnuma">VirtualAllocExNuma</a>, <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffileex">MapViewOfFileEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-mapviewoffileexnuma">MapViewOfFileExNuma</a>.</li>
     * <li>The access granted to all pages is the same (<b>PAGE_READONLY</b>, <b>PAGE_READWRITE</b>, <b>PAGE_NOACCESS</b>, <b>PAGE_WRITECOPY</b>, <b>PAGE_EXECUTE</b>, <b>PAGE_EXECUTE_READ</b>, <b>PAGE_EXECUTE_READWRITE</b>, <b>PAGE_EXECUTE_WRITECOPY</b>, <b>PAGE_GUARD</b>, or <b>PAGE_NOCACHE</b>).</li>
     * </ul>
     * The function determines the attributes of the first page in the region and then scans subsequent pages until it scans the entire range of pages or until it encounters a page with a nonmatching set of attributes. The function returns the attributes and the size of the region of pages with matching attributes, in bytes. For example, if there is a 40 megabyte (MB) region of free memory, and 
     * <b>VirtualQuery</b> is called on a page that is 10 MB into the region, the function will obtain a state of <b>MEM_FREE</b> and a size of 30 MB.
     * 
     * If a shared copy-on-write page is modified, it becomes private to the process that modified the page. However, the <b>VirtualQuery</b> function will continue to report such pages as <b>MEM_MAPPED</b> (for data views) or <b>MEM_IMAGE</b> (for executable image views) rather than <b>MEM_PRIVATE</b>. To detect whether copy-on-write has occurred for a specific page, either access the page or lock it using the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtuallock">VirtualLock</a> function to make sure the page is resident in memory, then use the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-queryworkingsetex">QueryWorkingSetEx</a> function to check the <b>Shared</b> bit in the extended working set information for the page. If the <b>Shared</b> bit is clear, the page is private.
     * 
     * This function reports on a region of pages in the memory of the calling process, and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualqueryex">VirtualQueryEx</a> function reports on a region of pages in the memory of a specified process.
     * @param {Pointer<Void>} lpAddress A pointer to the base address of the region of pages to be queried. This value is rounded down to the next page boundary. To determine the size of a page on the host computer, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function.
     * 
     * If <i>lpAddress</i> specifies an address above the highest memory address accessible to the process, the function fails with <b>ERROR_INVALID_PARAMETER</b>.
     * @param {Pointer<Void>} lpBuffer A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a> structure in which information about the specified page range is returned.
     * @param {Pointer} dwLength The size of the buffer pointed to by the <i>lpBuffer</i> parameter, in bytes.
     * @param {Pointer<Pointer>} pResult 
     * @returns {HRESULT} The return value is the actual number of bytes returned in the information buffer.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include <b>ERROR_INVALID_PARAMETER</b>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualquery
     */
    VirtualQuery(lpAddress, lpBuffer, dwLength, pResult) {
        lpAddressMarshal := lpAddress is VarRef ? "ptr" : "ptr"
        lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"
        pResultMarshal := pResult is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, lpAddressMarshal, lpAddress, lpBufferMarshal, lpBuffer, "ptr", dwLength, pResultMarshal, pResult, "HRESULT")
        return result
    }

    /**
     * Changes the protection on a region of committed pages in the virtual address space of the calling process. (VirtualProtect)
     * @remarks
     * You can set the access protection value on committed pages only. If the state of any page in the specified region is not committed, the function fails and returns without modifying the access protection of any pages in the specified region.
     * 
     * The **PAGE_GUARD** protection modifier establishes guard pages. Guard pages act as one-shot access alarms. For more information, see [Creating Guard Pages](/windows/win32/Memory/creating-guard-pages).
     * 
     * It is best to avoid using **VirtualProtect** to change page protections on memory blocks allocated by [GlobalAlloc](/windows/win32/api/winbase/nf-winbase-globalalloc), [HeapAlloc](/windows/win32/api/heapapi/nf-heapapi-heapalloc), or [LocalAlloc](/windows/win32/api/winbase/nf-winbase-localalloc), because multiple memory blocks can exist on a single page. The heap manager assumes that all pages in the heap grant at least read and write access.
     * 
     * When protecting a region that will be executable, the calling program bears responsibility for ensuring cache coherency via an appropriate call to [FlushInstructionCache](/windows/win32/api/processthreadsapi/nf-processthreadsapi-flushinstructioncache) once the code has been set in place.  Otherwise attempts to execute code out of the newly executable region may produce unpredictable results.
     * @param {Pointer<Void>} lpAddress The address of the starting page of the region of pages whose access protection attributes are to be changed.
     * 
     * All pages in the specified region must be within the same reserved region allocated when calling the [VirtualAlloc](/windows/win32/api/memoryapi/nf-memoryapi-virtualalloc) or [VirtualAllocEx](/windows/win32/api/memoryapi/nf-memoryapi-virtualallocex) function using **MEM_RESERVE**. The pages cannot span adjacent reserved regions that were allocated by separate calls to **VirtualAlloc** or **VirtualAllocEx** using **MEM_RESERVE**.
     * @param {Pointer} dwSize The size of the region whose access protection attributes are to be changed, in bytes. The region of affected pages includes all pages containing one or more bytes in the range from the ***lpAddress*** parameter to `(lpAddress+dwSize)`. This means that a 2-byte range  straddling a page boundary causes the protection attributes of both pages to be changed.
     * @param {Integer} flNewProtect The memory protection option. This parameter can be one of the [memory protection constants](/windows/win32/Memory/memory-protection-constants).
     * 
     * For mapped views, this value must be compatible with the access protection specified when the view was mapped (see [MapViewOfFile](/windows/win32/api/memoryapi/nf-memoryapi-mapviewoffile), [MapViewOfFileEx](/windows/win32/api/memoryapi/nf-memoryapi-mapviewoffileex), and [MapViewOfFileExNuma](/windows/win32/api/winbase/nf-winbase-mapviewoffileexnuma)).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualprotect
     */
    VirtualProtect(lpAddress, dwSize, flNewProtect) {
        lpAddressMarshal := lpAddress is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, lpAddressMarshal, lpAddress, "ptr", dwSize, "uint", flNewProtect, "uint*", &pflOldProtect := 0, "HRESULT")
        return pflOldProtect
    }

    /**
     * 
     * @param {Pointer<Integer>} pMemoryLoad 
     * @param {Pointer<Pointer>} pAvailableBytes 
     * @returns {HRESULT} 
     */
    GetMemoryLoad(pMemoryLoad, pAvailableBytes) {
        pMemoryLoadMarshal := pMemoryLoad is VarRef ? "uint*" : "ptr"
        pAvailableBytesMarshal := pAvailableBytes is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, pMemoryLoadMarshal, pMemoryLoad, pAvailableBytesMarshal, pAvailableBytes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICLRMemoryNotificationCallback} pCallback 
     * @returns {HRESULT} 
     */
    RegisterMemoryNotificationCallback(pCallback) {
        result := ComCall(9, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} startAddress 
     * @param {Pointer} _size 
     * @returns {HRESULT} 
     */
    NeedsVirtualAddressSpace(startAddress, _size) {
        startAddressMarshal := startAddress is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, startAddressMarshal, startAddress, "ptr", _size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} startAddress 
     * @param {Pointer} _size 
     * @returns {HRESULT} 
     */
    AcquiredVirtualAddressSpace(startAddress, _size) {
        startAddressMarshal := startAddress is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, startAddressMarshal, startAddress, "ptr", _size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} startAddress 
     * @returns {HRESULT} 
     */
    ReleasedVirtualAddressSpace(startAddress) {
        startAddressMarshal := startAddress is VarRef ? "ptr" : "ptr"

        result := ComCall(12, this, startAddressMarshal, startAddress, "HRESULT")
        return result
    }
}

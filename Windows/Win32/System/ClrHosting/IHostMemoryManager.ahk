#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IHostMalloc>} ppMalloc 
     * @returns {HRESULT} 
     */
    CreateMalloc(dwMallocType, ppMalloc) {
        result := ComCall(3, this, "uint", dwMallocType, "ptr*", ppMalloc, "HRESULT")
        return result
    }

    /**
     * Reserves, commits, or changes the state of a region of pages in the virtual address space of the calling process.
     * @param {Pointer<Void>} pAddress 
     * @param {Pointer} dwSize The size of the region, in bytes. If the <i>lpAddress</i> parameter is 
     *       <b>NULL</b>, this value is rounded up to the next page boundary. Otherwise, the allocated 
     *       pages include all pages containing one or more bytes in the range from <i>lpAddress</i> to 
     *       <i>lpAddress</i>+<i>dwSize</i>. This means that a 2-byte range straddling 
     *       a page boundary causes both pages to be included in the allocated region.
     * @param {Integer} flAllocationType 
     * @param {Integer} flProtect The memory protection for the region of pages to be allocated. If the pages are being committed, you can 
     *       specify any one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/Memory/memory-protection-constants">memory protection constants</a>.
     * @param {Integer} eCriticalLevel 
     * @param {Pointer<Pointer<Void>>} ppMem 
     * @returns {HRESULT} If the function succeeds, the return value is the base address of the allocated region of pages.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-virtualalloc
     */
    VirtualAlloc(pAddress, dwSize, flAllocationType, flProtect, eCriticalLevel, ppMem) {
        pAddressMarshal := pAddress is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pAddressMarshal, pAddress, "ptr", dwSize, "uint", flAllocationType, "uint", flProtect, "int", eCriticalLevel, "ptr*", ppMem, "HRESULT")
        return result
    }

    /**
     * Releases, decommits, or releases and decommits a region of pages within the virtual address space of the calling process.
     * @param {Pointer<Void>} lpAddress A pointer to the base address of the region of pages to be freed. 
     * 
     * 
     * 
     * 
     * If the <i>dwFreeType</i> parameter is <b>MEM_RELEASE</b>, this parameter must be the base address returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> function when the region of pages is reserved.
     * @param {Pointer} dwSize The size of the region of memory to be freed, in bytes. 
     * 
     * 
     * 
     * 
     * If the <i>dwFreeType</i> parameter is <b>MEM_RELEASE</b>, this parameter must be 0 (zero). The function frees the entire region that is reserved in the initial allocation call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a>.
     * 
     * If the <i>dwFreeType</i> parameter is <b>MEM_DECOMMIT</b>, the function decommits all memory pages that contain one or more bytes in the range from the <i>lpAddress</i> parameter to <c>(lpAddress+dwSize)</c>. This means, for example, that a 2-byte region of memory that straddles a page boundary causes both pages to be decommitted. If <i>lpAddress</i> is the base address returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> and <i>dwSize</i> is 0 (zero), the function decommits the entire region that is allocated by 
     * <b>VirtualAlloc</b>. After that, the entire region is in the reserved state.
     * @param {Integer} dwFreeType 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-virtualfree
     */
    VirtualFree(lpAddress, dwSize, dwFreeType) {
        lpAddressMarshal := lpAddress is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, lpAddressMarshal, lpAddress, "ptr", dwSize, "uint", dwFreeType, "HRESULT")
        return result
    }

    /**
     * Retrieves information about a range of pages in the virtual address space of the calling process.
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
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include <b>ERROR_INVALID_PARAMETER</b>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-virtualquery
     */
    VirtualQuery(lpAddress, lpBuffer, dwLength, pResult) {
        lpAddressMarshal := lpAddress is VarRef ? "ptr" : "ptr"
        lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"
        pResultMarshal := pResult is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, lpAddressMarshal, lpAddress, lpBufferMarshal, lpBuffer, "ptr", dwLength, pResultMarshal, pResult, "HRESULT")
        return result
    }

    /**
     * Changes the protection on a region of committed pages in the virtual address space of the calling process.
     * @param {Pointer<Void>} lpAddress The address of the starting page of the region of pages whose access protection attributes are to be changed.
     * 
     * All pages in the specified region must be within the same reserved region allocated when calling the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> or 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualallocex">VirtualAllocEx</a> function using 
     *        <b>MEM_RESERVE</b>. The pages cannot span adjacent reserved regions that were allocated by 
     *        separate calls to <b>VirtualAlloc</b> or 
     *        <b>VirtualAllocEx</b> using 
     *        <b>MEM_RESERVE</b>.
     * @param {Pointer} dwSize The size of the region whose access protection attributes are to be changed, in bytes. The region of 
     *       affected pages includes all pages containing one or more bytes in the range from the 
     *       <i>lpAddress</i> parameter to 
     *       <c>(lpAddress+dwSize)</c>. This means that a 2-byte range 
     *       straddling a page boundary causes the protection attributes of both pages to be changed.
     * @param {Integer} flNewProtect The memory protection option. This parameter can be one of the 
     *        <a href="https://docs.microsoft.com/windows/desktop/Memory/memory-protection-constants">memory protection constants</a>.
     * 
     * For mapped views, this value must be compatible with the access protection specified when the view was 
     *        mapped (see <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a>, 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffileex">MapViewOfFileEx</a>, and 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-mapviewoffileexnuma">MapViewOfFileExNuma</a>).
     * @param {Pointer<Integer>} pflOldProtect 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-virtualprotect
     */
    VirtualProtect(lpAddress, dwSize, flNewProtect, pflOldProtect) {
        lpAddressMarshal := lpAddress is VarRef ? "ptr" : "ptr"
        pflOldProtectMarshal := pflOldProtect is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, lpAddressMarshal, lpAddress, "ptr", dwSize, "uint", flNewProtect, pflOldProtectMarshal, pflOldProtect, "HRESULT")
        return result
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
     * @param {Pointer} size 
     * @returns {HRESULT} 
     */
    NeedsVirtualAddressSpace(startAddress, size) {
        startAddressMarshal := startAddress is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, startAddressMarshal, startAddress, "ptr", size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} startAddress 
     * @param {Pointer} size 
     * @returns {HRESULT} 
     */
    AcquiredVirtualAddressSpace(startAddress, size) {
        startAddressMarshal := startAddress is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, startAddressMarshal, startAddress, "ptr", size, "HRESULT")
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

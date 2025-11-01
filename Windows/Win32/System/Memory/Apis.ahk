#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\MEMORY_MAPPED_VIEW_ADDRESS.ahk
#Include ..\..\Foundation\HGLOBAL.ahk
#Include ..\..\Foundation\HLOCAL.ahk

/**
 * @namespace Windows.Win32.System.Memory
 * @version v4.0.30319
 */
class Memory {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CACHE_MAX_HARD_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CACHE_MAX_HARD_DISABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CACHE_MIN_HARD_ENABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CACHE_MIN_HARD_DISABLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MEHC_PATROL_SCRUBBER_PRESENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIN32_MEMORY_NUMA_PERFORMANCE_ALL_TARGET_NODE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static WIN32_MEMORY_NUMA_PERFORMANCE_READ_LATENCY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIN32_MEMORY_NUMA_PERFORMANCE_READ_BANDWIDTH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIN32_MEMORY_NUMA_PERFORMANCE_WRITE_LATENCY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIN32_MEMORY_NUMA_PERFORMANCE_WRITE_BANDWIDTH => 8
;@endregion Constants

;@region Methods
    /**
     * Creates a private heap object that can be used by the calling process. The function reserves space in the virtual address space of the process and allocates physical storage for a specified initial portion of this block.
     * @param {Integer} flOptions 
     * @param {Pointer} dwInitialSize The initial size of the heap, in bytes. This value determines the initial amount of memory that is committed for the heap. The value is rounded up to a multiple of the system page size. The value must be smaller than <i>dwMaximumSize</i>.
     * 
     * If this parameter is 0, the function commits one page. To determine the size of a page on the host computer, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function.
     * @param {Pointer} dwMaximumSize The maximum size of the heap, in bytes. The 
     * <b>HeapCreate</b> function rounds <i>dwMaximumSize</i> up to a multiple of the system page size and then reserves a block of that size in the process's virtual address space for the heap. If allocation requests made by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heaprealloc">HeapReAlloc</a> functions exceed the size specified by <i>dwInitialSize</i>, the system commits additional pages of memory for the heap, up to the heap's maximum size. 
     * 
     * If <i>dwMaximumSize</i> is not zero, the heap size is fixed and cannot grow beyond the maximum size. Also, the largest memory block that can be allocated from the heap is slightly less than 512 KB for a 32-bit process and slightly less than 1,024 KB for a 64-bit process. Requests to allocate larger blocks fail, even if the maximum size of the heap is large enough to contain the block. 
     * 
     * 
     * 
     * 
     * If <i>dwMaximumSize</i> is 0, the heap can grow in size. The heap's size is limited only by the available memory. Requests to allocate memory blocks larger than the limit for a fixed-size heap do not automatically fail; instead, the system calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> function to obtain the memory that is needed for large blocks. Applications that need to allocate large memory blocks should set <i>dwMaximumSize</i> to 0.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the newly created heap.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//heapapi/nf-heapapi-heapcreate
     * @since windows5.1.2600
     */
    static HeapCreate(flOptions, dwInitialSize, dwMaximumSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\HeapCreate", "uint", flOptions, "ptr", dwInitialSize, "ptr", dwMaximumSize, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Destroys the specified heap object. It decommits and releases all the pages of a private heap object, and it invalidates the handle to the heap.
     * @param {HANDLE} hHeap A handle to the heap to be destroyed. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> function. Do not use the handle to the process heap returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//heapapi/nf-heapapi-heapdestroy
     * @since windows5.1.2600
     */
    static HeapDestroy(hHeap) {
        hHeap := hHeap is Win32Handle ? NumGet(hHeap, "ptr") : hHeap

        A_LastError := 0

        result := DllCall("KERNEL32.dll\HeapDestroy", "ptr", hHeap, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates a block of memory from a heap. The allocated memory is not movable.
     * @param {HANDLE} hHeap A handle to the heap from which the memory will be allocated. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function.
     * @param {Integer} dwFlags The heap allocation options. Specifying any of these values will override the corresponding value specified when the heap was created with
     * @param {Pointer} dwBytes The number of bytes to be allocated.
     * 
     * If the heap specified by the <i>hHeap</i> parameter is a "non-growable" heap, <i>dwBytes</i> must be less than 0x7FFF8. You create a non-growable heap by calling the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> function with a nonzero value.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a pointer to the allocated memory block.
     * 
     * If the function fails and you have not specified <b>HEAP_GENERATE_EXCEPTIONS</b>, the return value is <b>NULL</b>.
     * 
     * If the function fails and you have specified <b>HEAP_GENERATE_EXCEPTIONS</b>, the function may generate either of the exceptions listed in the following table. The particular exception depends upon the nature of the heap corruption. For more information, see <a href="/windows/desktop/Debug/getexceptioncode">GetExceptionCode</a>.
     * 
     * <table>
     * <tr>
     * <th>Exception code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>STATUS_NO_MEMORY</b></td>
     * <td>The allocation attempt failed because of a lack of available memory or heap corruption.</td>
     * </tr>
     * <tr>
     * <td><b>STATUS_ACCESS_VIOLATION</b></td>
     * <td>The allocation attempt failed because of heap corruption or improper function parameters.</td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails, it does not call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a>. An application cannot call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information.
     * @see https://docs.microsoft.com/windows/win32/api//heapapi/nf-heapapi-heapalloc
     * @since windows5.1.2600
     */
    static HeapAlloc(hHeap, dwFlags, dwBytes) {
        hHeap := hHeap is Win32Handle ? NumGet(hHeap, "ptr") : hHeap

        result := DllCall("KERNEL32.dll\HeapAlloc", "ptr", hHeap, "uint", dwFlags, "ptr", dwBytes, "ptr")
        return result
    }

    /**
     * Reallocates a block of memory from a heap. This function enables you to resize a memory block and change other memory block properties.
     * @param {HANDLE} hHeap A handle to the heap from which the memory is to be reallocated. This handle is a returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function.
     * @param {Integer} dwFlags The heap reallocation options. Specifying a value overrides the corresponding value specified in the <i>flOptions</i> parameter when the heap was created by using the
     * @param {Pointer<Void>} lpMem A pointer to the block of memory that the function reallocates. This pointer is returned by an earlier call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> or 
     * <b>HeapReAlloc</b> function.
     * @param {Pointer} dwBytes The new size of the memory block, in bytes. A memory block's size can be increased or decreased by using this function.
     * 
     * If the heap specified by the <i>hHeap</i> parameter is a "non-growable" heap, <i>dwBytes</i> must be less than 0x7FFF8. You create a non-growable heap by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> function with a nonzero value.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a pointer to the reallocated memory block.
     * 
     * If the function fails and you have not specified <b>HEAP_GENERATE_EXCEPTIONS</b>, the return value is <b>NULL</b>. 
     * 
     * If the function fails and you have specified <b>HEAP_GENERATE_EXCEPTIONS</b>, the function may generate either of the exceptions listed in the following table. For more information, see <a href="/windows/desktop/Debug/getexceptioncode">GetExceptionCode</a>.
     * 
     * <table>
     * <tr>
     * <th>Exception code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>STATUS_NO_MEMORY</b></td>
     * <td>The allocation attempt failed because of a lack of available memory or heap corruption.</td>
     * </tr>
     * <tr>
     * <td><b>STATUS_ACCESS_VIOLATION</b></td>
     * <td>The allocation attempt failed because of heap corruption or improper function parameters.</td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails, it does not call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a>. An application cannot call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information.
     * @see https://docs.microsoft.com/windows/win32/api//heapapi/nf-heapapi-heaprealloc
     * @since windows5.1.2600
     */
    static HeapReAlloc(hHeap, dwFlags, lpMem, dwBytes) {
        hHeap := hHeap is Win32Handle ? NumGet(hHeap, "ptr") : hHeap

        result := DllCall("KERNEL32.dll\HeapReAlloc", "ptr", hHeap, "uint", dwFlags, "ptr", lpMem, "ptr", dwBytes, "ptr")
        return result
    }

    /**
     * Frees a memory block allocated from a heap by the HeapAlloc or HeapReAlloc function.
     * @param {HANDLE} hHeap A handle to the heap whose memory block is to be freed. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function.
     * @param {Integer} dwFlags The heap free options. Specifying the following value overrides the corresponding value specified in the <i>flOptions</i> parameter when the heap was created by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> function. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HEAP_NO_SERIALIZE"></a><a id="heap_no_serialize"></a><dl>
     * <dt><b>HEAP_NO_SERIALIZE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Serialized access will not be used. For more information, see Remarks.
     * 
     * To ensure that serialized access is disabled for all calls to this function, specify <b>HEAP_NO_SERIALIZE</b> in the call to <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a>. In this case, it is not necessary to additionally specify <b>HEAP_NO_SERIALIZE</b> in this function call.
     * 
     * Do not specify this value when accessing the process heap. The system may create additional threads within the application's process, such as a CTRL+C handler, that simultaneously access the process heap.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} lpMem A pointer to the memory block to be freed. This pointer is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heaprealloc">HeapReAlloc</a> function. This pointer can be <b>NULL</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. An application can call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information.
     * @see https://docs.microsoft.com/windows/win32/api//heapapi/nf-heapapi-heapfree
     * @since windows5.1.2600
     */
    static HeapFree(hHeap, dwFlags, lpMem) {
        hHeap := hHeap is Win32Handle ? NumGet(hHeap, "ptr") : hHeap

        A_LastError := 0

        result := DllCall("KERNEL32.dll\HeapFree", "ptr", hHeap, "uint", dwFlags, "ptr", lpMem, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the size of a memory block allocated from a heap by the HeapAlloc or HeapReAlloc function.
     * @param {HANDLE} hHeap A handle to the heap in which the memory block resides. This handle is returned by either the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> or 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function.
     * @param {Integer} dwFlags The heap size options. Specifying the following value overrides the corresponding value specified in the 
     *       <i>flOptions</i> parameter when the heap was created by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> function.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HEAP_NO_SERIALIZE"></a><a id="heap_no_serialize"></a><dl>
     * <dt><b>HEAP_NO_SERIALIZE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Serialized access will not be used. For more information, see Remarks.
     * 
     * To ensure that serialized access is disabled for all calls to this function, specify 
     *          <b>HEAP_NO_SERIALIZE</b> in the call to 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a>. In this case, it is not necessary to 
     *          additionally specify <b>HEAP_NO_SERIALIZE</b> in this function call.
     * 
     * This value should not be specified when accessing the process heap. The system may create additional 
     *          threads within the application's process, such as a CTRL+C handler, that simultaneously access the process 
     *          heap.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} lpMem A pointer to the memory block whose size the function will obtain. This is a pointer returned by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> or 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heaprealloc">HeapReAlloc</a> function. The memory block must 
     *       be from the heap specified by the <i>hHeap</i> parameter.
     * @returns {Pointer} If the function succeeds, the return value is the requested size of the allocated memory block, in bytes.
     * 
     * If the function fails, the return value is <code>(SIZE_T)-1</code>. 
     *        The function does not call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a>. An 
     *        application cannot call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended 
     *        error information.
     * 
     * If the <i>lpMem</i> parameter refers to a heap allocation that is not in the heap 
     *        specified by the <i>hHeap</i> parameter, the behavior of the 
     *        <b>HeapSize</b> function is undefined.
     * @see https://docs.microsoft.com/windows/win32/api//heapapi/nf-heapapi-heapsize
     * @since windows5.1.2600
     */
    static HeapSize(hHeap, dwFlags, lpMem) {
        hHeap := hHeap is Win32Handle ? NumGet(hHeap, "ptr") : hHeap

        result := DllCall("KERNEL32.dll\HeapSize", "ptr", hHeap, "uint", dwFlags, "ptr", lpMem, "ptr")
        return result
    }

    /**
     * Retrieves a handle to the default heap of the calling process.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the calling process's heap.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//heapapi/nf-heapapi-getprocessheap
     * @since windows5.1.2600
     */
    static GetProcessHeap() {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetProcessHeap", "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, False)
    }

    /**
     * Returns the size of the largest committed free block in the specified heap. If the Disable heap coalesce on free global flag is set, this function also coalesces adjacent free blocks of memory in the heap.
     * @param {HANDLE} hHeap A handle to the heap. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function.
     * @param {Integer} dwFlags The heap access options. This parameter can be the following value. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HEAP_NO_SERIALIZE"></a><a id="heap_no_serialize"></a><dl>
     * <dt><b>HEAP_NO_SERIALIZE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Serialized access will not be used. 
     * 
     * 
     * For more information, see Remarks.
     * 
     * To ensure that serialized access is disabled for all calls to this function, specify <b>HEAP_NO_SERIALIZE</b> in the call to <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a>. In this case, it is not necessary to additionally specify <b>HEAP_NO_SERIALIZE</b> in this function call.
     * 
     * Do not specify this value when accessing the process heap. The system may create additional threads within the application's process, such as a CTRL+C handler, that simultaneously access the process heap.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Pointer} If the function succeeds, the return value is the size of the largest committed free block in the heap, in bytes.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * In the unlikely case that there is absolutely no space available in the heap, the function return value is zero, and <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns the value NO_ERROR.
     * @see https://docs.microsoft.com/windows/win32/api//heapapi/nf-heapapi-heapcompact
     * @since windows5.1.2600
     */
    static HeapCompact(hHeap, dwFlags) {
        hHeap := hHeap is Win32Handle ? NumGet(hHeap, "ptr") : hHeap

        A_LastError := 0

        result := DllCall("KERNEL32.dll\HeapCompact", "ptr", hHeap, "uint", dwFlags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enables features for a specified heap.
     * @param {HANDLE} HeapHandle A handle to the heap where information is to be set. This handle is returned by either the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> or 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function.
     * @param {Integer} HeapInformationClass 
     * @param {Pointer} HeapInformation The heap information buffer. The format of this data depends on the value of the 
     *        <i>HeapInformationClass</i> parameter.
     * 
     * If the <i>HeapInformationClass</i> parameter is 
     *        <b>HeapCompatibilityInformation</b>, the <i>HeapInformation</i> 
     *        parameter is a pointer to a <b>ULONG</b> variable.
     * 
     * If the <i>HeapInformationClass</i> parameter is 
     *        <b>HeapEnableTerminationOnCorruption</b>, the <i>HeapInformation</i> 
     *        parameter should be <b>NULL</b> and <i>HeapInformationLength</i> should 
     *        be 0
     * @param {Pointer} HeapInformationLength The size of the <i>HeapInformation</i> buffer, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//heapapi/nf-heapapi-heapsetinformation
     * @since windows5.1.2600
     */
    static HeapSetInformation(HeapHandle, HeapInformationClass, HeapInformation, HeapInformationLength) {
        HeapHandle := HeapHandle is Win32Handle ? NumGet(HeapHandle, "ptr") : HeapHandle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\HeapSetInformation", "ptr", HeapHandle, "int", HeapInformationClass, "ptr", HeapInformation, "ptr", HeapInformationLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Validates the specified heap. The function scans all the memory blocks in the heap and verifies that the heap control structures maintained by the heap manager are in a consistent state.
     * @param {HANDLE} hHeap A handle to the heap to be validated. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function.
     * @param {Integer} dwFlags The heap access options. This parameter can be the following value. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HEAP_NO_SERIALIZE"></a><a id="heap_no_serialize"></a><dl>
     * <dt><b>HEAP_NO_SERIALIZE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Serialized access will not be used. For more information, see Remarks.
     * 
     * To ensure that serialized access is disabled for all calls to this function, specify <b>HEAP_NO_SERIALIZE</b> in the call to <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a>. In this case, it is not necessary to additionally specify <b>HEAP_NO_SERIALIZE</b> in this function call.
     * 
     * This value should not be specified when accessing the process default heap. The system may create additional threads within the application's process, such as a CTRL+C handler, that simultaneously access the process default heap.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} lpMem A pointer to a memory block within the specified heap. This parameter may be <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * If this parameter is <b>NULL</b>, the function attempts to validate the entire heap specified by <i>hHeap</i>.
     * 
     * If this parameter is not <b>NULL</b>, the function attempts to validate the memory block pointed to by <i>lpMem</i>. It does not attempt to validate the rest of the heap.
     * @returns {BOOL} If the specified heap or memory block is valid, the return value is nonzero.
     * 
     * If the specified heap or memory block is invalid, the return value is zero. On a system set up for debugging, the 
     * <b>HeapValidate</b> function then displays debugging messages that describe the part of the heap or memory block that is invalid, and stops at a hard-coded breakpoint so that you can examine the system to determine the source of the invalidity. The 
     * <b>HeapValidate</b> function does not set the thread's last error value. There is no extended error information for this function; do not call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//heapapi/nf-heapapi-heapvalidate
     * @since windows5.1.2600
     */
    static HeapValidate(hHeap, dwFlags, lpMem) {
        hHeap := hHeap is Win32Handle ? NumGet(hHeap, "ptr") : hHeap

        result := DllCall("KERNEL32.dll\HeapValidate", "ptr", hHeap, "uint", dwFlags, "ptr", lpMem, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hHeap A handle to the heap to be summarized. This handle is returned by either the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> or 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function.
     * @param {Integer} dwFlags The heap summary options.
     * @param {Pointer<HEAP_SUMMARY>} lpSummary Receives a pointer to a [Heap_Summary](ns-heapapi-heap_summary.md) structure representing the heap summary.
     * @returns {BOOL} Returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//heapapi/nf-heapapi-heapsummary
     */
    static HeapSummary(hHeap, dwFlags, lpSummary) {
        hHeap := hHeap is Win32Handle ? NumGet(hHeap, "ptr") : hHeap

        result := DllCall("KERNEL32.dll\HeapSummary", "ptr", hHeap, "uint", dwFlags, "ptr", lpSummary, "int")
        return result
    }

    /**
     * Returns the number of active heaps and retrieves handles to all of the active heaps for the calling process.
     * @param {Integer} NumberOfHeaps The maximum number of heap handles that can be stored into the buffer pointed to by <i>ProcessHeaps</i>.
     * @param {Pointer<HANDLE>} ProcessHeaps A pointer to a buffer that receives an array of heap handles.
     * @returns {Integer} The return value is the number of handles to heaps that are active for the calling process.
     * 
     * If the return value is less than or equal to <i>NumberOfHeaps</i>, the function has stored that number of heap handles in the buffer pointed to by <i>ProcessHeaps</i>.
     * 
     * If the return value is greater than <i>NumberOfHeaps</i>, the buffer pointed to by <i>ProcessHeaps</i> is too small to hold all the heap handles for the calling process, and the function stores <i>NumberOfHeaps</i> handles in the buffer. Use the return value to allocate a buffer that is large enough to receive all of the handles, and call the function again.
     * 
     * If the return value is zero, the function has failed because every process has at least one active heap, the default heap for the  process. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//heapapi/nf-heapapi-getprocessheaps
     * @since windows5.1.2600
     */
    static GetProcessHeaps(NumberOfHeaps, ProcessHeaps) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetProcessHeaps", "uint", NumberOfHeaps, "ptr", ProcessHeaps, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Attempts to acquire the critical section object, or lock, that is associated with a specified heap.
     * @param {HANDLE} hHeap A handle to the heap to be locked. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//heapapi/nf-heapapi-heaplock
     * @since windows5.1.2600
     */
    static HeapLock(hHeap) {
        hHeap := hHeap is Win32Handle ? NumGet(hHeap, "ptr") : hHeap

        A_LastError := 0

        result := DllCall("KERNEL32.dll\HeapLock", "ptr", hHeap, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Releases ownership of the critical section object, or lock, that is associated with a specified heap.
     * @param {HANDLE} hHeap A handle to the heap to be unlocked. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//heapapi/nf-heapapi-heapunlock
     * @since windows5.1.2600
     */
    static HeapUnlock(hHeap) {
        hHeap := hHeap is Win32Handle ? NumGet(hHeap, "ptr") : hHeap

        A_LastError := 0

        result := DllCall("KERNEL32.dll\HeapUnlock", "ptr", hHeap, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates the memory blocks in the specified heap.
     * @param {HANDLE} hHeap A handle to the heap. This handle is returned by either the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> or 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function.
     * @param {Pointer<PROCESS_HEAP_ENTRY>} lpEntry A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-process_heap_entry">PROCESS_HEAP_ENTRY</a> structure 
     *        that maintains state information for a particular heap enumeration.
     * 
     * If the <b>HeapWalk</b> function succeeds, returning the value 
     *        <b>TRUE</b>, this structure's members contain information about the next memory block in the 
     *        heap.
     * 
     * To initiate a heap enumeration, set the <b>lpData</b> field of the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-process_heap_entry">PROCESS_HEAP_ENTRY</a> structure to 
     *        <b>NULL</b>. To continue a particular heap enumeration, call the 
     *        <b>HeapWalk</b> function repeatedly, with no changes to 
     *        <i>hHeap</i>, <i>lpEntry</i>, or any of the members of the 
     *        <b>PROCESS_HEAP_ENTRY</b> structure.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the heap enumeration terminates successfully by reaching the end of the heap, the function returns 
     *        <b>FALSE</b>, and <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> 
     *        returns the error code <b>ERROR_NO_MORE_ITEMS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//heapapi/nf-heapapi-heapwalk
     * @since windows5.1.2600
     */
    static HeapWalk(hHeap, lpEntry) {
        hHeap := hHeap is Win32Handle ? NumGet(hHeap, "ptr") : hHeap

        A_LastError := 0

        result := DllCall("KERNEL32.dll\HeapWalk", "ptr", hHeap, "ptr", lpEntry, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the specified heap.
     * @param {HANDLE} HeapHandle A handle to the heap whose information is to be retrieved. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function.
     * @param {Integer} HeapInformationClass The class of information to be retrieved. This parameter can be the following value from the <b>HEAP_INFORMATION_CLASS</b> enumeration type.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HeapCompatibilityInformation"></a><a id="heapcompatibilityinformation"></a><a id="HEAPCOMPATIBILITYINFORMATION"></a><dl>
     * <dt><b>HeapCompatibilityInformation</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the heap features that are enabled. 
     * 
     * 
     * 
     * 
     * The <i>HeapInformation</i> parameter is a pointer to a <b>ULONG</b> variable.
     * 
     * If <i>HeapInformation</i> is 0, the heap is a standard heap that does not support look-aside lists.
     * 
     * If <i>HeapInformation</i> is 1, the heap supports look-aside lists. For more information, see Remarks.
     * 
     * If <i>HeapInformation</i> is 2, the <a href="https://docs.microsoft.com/windows/desktop/Memory/low-fragmentation-heap">low-fragmentation heap</a> (LFH) has been enabled for the heap. Enabling the LFH disables look-aside lists.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} HeapInformation A pointer to a buffer that receives the heap information. The format of this data depends on the value of the <i>HeapInformationClass</i> parameter.
     * @param {Pointer} HeapInformationLength The size of the heap information being queried, in bytes.
     * @param {Pointer<Pointer>} ReturnLength A pointer to a variable that receives the length of data written to the <i>HeapInformation</i> buffer. If the buffer is too small, the function fails and <i>ReturnLength</i> specifies the minimum size required for the buffer. 
     * 
     * 
     * 
     * 
     * If you do not want to receive this information, specify <b>NULL</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//heapapi/nf-heapapi-heapqueryinformation
     * @since windows5.1.2600
     */
    static HeapQueryInformation(HeapHandle, HeapInformationClass, HeapInformation, HeapInformationLength, ReturnLength) {
        HeapHandle := HeapHandle is Win32Handle ? NumGet(HeapHandle, "ptr") : HeapHandle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\HeapQueryInformation", "ptr", HeapHandle, "int", HeapInformationClass, "ptr", HeapInformation, "ptr", HeapInformationLength, "ptr*", ReturnLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reserves, commits, or changes the state of a region of pages in the virtual address space of the calling process.
     * @param {Pointer<Void>} lpAddress The starting address of the region to allocate. If the memory is being reserved, the specified address is 
     *       rounded down to the nearest multiple of the allocation granularity. If the memory is already reserved and is 
     *       being committed, the address is rounded down to the next page boundary. To determine the size of a page and the 
     *       allocation granularity on the host computer, use the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function. If this parameter is 
     *       <b>NULL</b>, the system determines where to allocate the region.
     * 
     * If this address is within an enclave that you have not initialized by calling <a href="https://docs.microsoft.com/windows/desktop/api/enclaveapi/nf-enclaveapi-initializeenclave">InitializeEnclave</a>, <b>VirtualAlloc</b> allocates a page of zeros for the enclave at that address. The page must be previously uncommitted, and will not be measured with the EEXTEND instruction of the Intel Software Guard Extensions programming model. 
     * 
     * If the address in within an enclave that you initialized, then the allocation operation fails with the <b>ERROR_INVALID_ADDRESS</b> error.
     * @param {Pointer} dwSize The size of the region, in bytes. If the <i>lpAddress</i> parameter is 
     *       <b>NULL</b>, this value is rounded up to the next page boundary. Otherwise, the allocated 
     *       pages include all pages containing one or more bytes in the range from <i>lpAddress</i> to 
     *       <i>lpAddress</i>+<i>dwSize</i>. This means that a 2-byte range straddling 
     *       a page boundary causes both pages to be included in the allocated region.
     * @param {Integer} flAllocationType 
     * @param {Integer} flProtect The memory protection for the region of pages to be allocated. If the pages are being committed, you can 
     *       specify any one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/Memory/memory-protection-constants">memory protection constants</a>.
     * @returns {Pointer<Void>} If the function succeeds, the return value is the base address of the allocated region of pages.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-virtualalloc
     * @since windows5.1.2600
     */
    static VirtualAlloc(lpAddress, dwSize, flAllocationType, flProtect) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\VirtualAlloc", "ptr", lpAddress, "ptr", dwSize, "uint", flAllocationType, "uint", flProtect, "ptr")
        if(A_LastError)
            throw OSError()

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
     * @param {Pointer<Integer>} lpflOldProtect A pointer to a variable that receives the previous access protection value of the first page in the 
     *       specified region of pages. If this parameter is <b>NULL</b> or does not point to a valid 
     *       variable, the function fails.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-virtualprotect
     * @since windows5.1.2600
     */
    static VirtualProtect(lpAddress, dwSize, flNewProtect, lpflOldProtect) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\VirtualProtect", "ptr", lpAddress, "ptr", dwSize, "uint", flNewProtect, "uint*", lpflOldProtect, "int")
        if(A_LastError)
            throw OSError()

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
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-virtualfree
     * @since windows5.1.2600
     */
    static VirtualFree(lpAddress, dwSize, dwFreeType) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\VirtualFree", "ptr", lpAddress, "ptr", dwSize, "uint", dwFreeType, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about a range of pages in the virtual address space of the calling process.
     * @param {Pointer<Void>} lpAddress A pointer to the base address of the region of pages to be queried. This value is rounded down to the next page boundary. To determine the size of a page on the host computer, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function.
     * 
     * If <i>lpAddress</i> specifies an address above the highest memory address accessible to the process, the function fails with <b>ERROR_INVALID_PARAMETER</b>.
     * @param {Pointer} lpBuffer A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a> structure in which information about the specified page range is returned.
     * @param {Pointer} dwLength The size of the buffer pointed to by the <i>lpBuffer</i> parameter, in bytes.
     * @returns {Pointer} The return value is the actual number of bytes returned in the information buffer.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include <b>ERROR_INVALID_PARAMETER</b>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-virtualquery
     * @since windows5.1.2600
     */
    static VirtualQuery(lpAddress, lpBuffer, dwLength) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\VirtualQuery", "ptr", lpAddress, "ptr", lpBuffer, "ptr", dwLength, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reserves, commits, or changes the state of a region of memory within the virtual address space of a specified process. The function initializes the memory it allocates to zero.
     * @param {HANDLE} hProcess The handle to a process. The function allocates memory within the virtual address space of this process.
     * 
     * The handle must have the <b>PROCESS_VM_OPERATION</b> access right. For more information, 
     *        see 
     *        <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Void>} lpAddress The pointer that specifies a desired starting address for the region of pages that you want to allocate.
     * 
     * If you are reserving memory, the function rounds this address down to the nearest multiple of the allocation 
     *        granularity.
     * 
     * If you are committing memory that is already reserved, the function rounds this address down to the nearest 
     *        page boundary. To determine the size of a page and the allocation granularity on the host computer, use the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function.
     * 
     * If <i>lpAddress</i> is <b>NULL</b>, the function determines where to 
     *        allocate the region.
     * 
     * If this address is within an enclave that you have not initialized by calling <a href="https://docs.microsoft.com/windows/desktop/api/enclaveapi/nf-enclaveapi-initializeenclave">InitializeEnclave</a>, <b>VirtualAllocEx</b> allocates a page of zeros for the enclave at that address. The page must be previously uncommitted, and will not be measured with the EEXTEND instruction of the Intel Software Guard Extensions programming model. 
     * 
     * If the address in within an enclave that you initialized, then the allocation operation fails with the <b>ERROR_INVALID_ADDRESS</b> error.
     * @param {Pointer} dwSize The size of the region of memory to allocate, in bytes.
     * 
     * If <i>lpAddress</i> is <b>NULL</b>, the function rounds 
     *        <i>dwSize</i> up to the next page boundary.
     * 
     * If <i>lpAddress</i> is not <b>NULL</b>, the function allocates all 
     *        pages that contain one or more bytes in the range from <i>lpAddress</i> to 
     *        <i>lpAddress</i>+<i>dwSize</i>. This means, for example, that a 2-byte 
     *        range that straddles a page boundary causes the function to allocate both pages.
     * @param {Integer} flAllocationType 
     * @param {Integer} flProtect The memory protection for the region of pages to be allocated. If the pages are being committed, you can 
     *       specify any one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/Memory/memory-protection-constants">memory protection constants</a>.
     * @returns {Pointer<Void>} If the function succeeds, the return value is the base address of the allocated region of pages.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-virtualallocex
     * @since windows5.1.2600
     */
    static VirtualAllocEx(hProcess, lpAddress, dwSize, flAllocationType, flProtect) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\VirtualAllocEx", "ptr", hProcess, "ptr", lpAddress, "ptr", dwSize, "uint", flAllocationType, "uint", flProtect, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Changes the protection on a region of committed pages in the virtual address space of a specified process.
     * @param {HANDLE} hProcess A handle to the process whose memory protection is to be changed. The handle must have the 
     *       <b>PROCESS_VM_OPERATION</b> access right. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Void>} lpAddress A pointer to the base address of the region of pages whose access protection attributes are to be changed.
     * 
     * All pages in the specified region must be within the same reserved region allocated when calling the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> or 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualallocex">VirtualAllocEx</a> function using 
     *        <b>MEM_RESERVE</b>. The pages cannot span adjacent reserved regions that were allocated by 
     *        separate calls to <b>VirtualAlloc</b> or 
     *        <b>VirtualAllocEx</b> using 
     *        <b>MEM_RESERVE</b>.
     * @param {Pointer} dwSize The size of the region whose access protection attributes are changed, in bytes. The region of affected 
     *      pages includes all pages containing one or more bytes in the range from the <i>lpAddress</i> 
     *      parameter to <c>(lpAddress+dwSize)</c>. This means that a 2-byte 
     *      range straddling a page boundary causes the protection attributes of both pages to be changed.
     * @param {Integer} flNewProtect The memory protection option. This parameter can be one of the 
     *        <a href="https://docs.microsoft.com/windows/desktop/Memory/memory-protection-constants">memory protection constants</a>.
     * 
     * For mapped views, this value must be compatible with the access protection specified when the view was 
     *        mapped (see <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a>, 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffileex">MapViewOfFileEx</a>, and 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-mapviewoffileexnuma">MapViewOfFileExNuma</a>).
     * @param {Pointer<Integer>} lpflOldProtect A pointer to a variable that receives the previous access protection of the first page in the specified 
     *       region of pages. If this parameter is <b>NULL</b> or does not point to a valid variable, the 
     *       function fails.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-virtualprotectex
     * @since windows5.1.2600
     */
    static VirtualProtectEx(hProcess, lpAddress, dwSize, flNewProtect, lpflOldProtect) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\VirtualProtectEx", "ptr", hProcess, "ptr", lpAddress, "ptr", dwSize, "uint", flNewProtect, "uint*", lpflOldProtect, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about a range of pages within the virtual address space of a specified process.
     * @param {HANDLE} hProcess A handle to the process whose memory information is queried. The handle must have been opened with the <b>PROCESS_QUERY_INFORMATION</b> access right, which enables using the handle to read information from the process object. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Void>} lpAddress A pointer to the base address of the region of pages to be queried. This value is rounded down to the next page boundary. To determine the size of a page on the host computer, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function.
     * 
     * If <i>lpAddress</i> specifies an address above the highest memory address accessible to the process, the function fails with <b>ERROR_INVALID_PARAMETER</b>.
     * @param {Pointer} lpBuffer A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a> structure in which information about the specified page range is returned.
     * @param {Pointer} dwLength The size of the buffer pointed to by the <i>lpBuffer</i> parameter, in bytes.
     * @returns {Pointer} The return value is the actual number of bytes returned in the information buffer.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include <b>ERROR_INVALID_PARAMETER</b>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-virtualqueryex
     * @since windows5.1.2600
     */
    static VirtualQueryEx(hProcess, lpAddress, lpBuffer, dwLength) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\VirtualQueryEx", "ptr", hProcess, "ptr", lpAddress, "ptr", lpBuffer, "ptr", dwLength, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates or opens a named or unnamed file mapping object for a specified file.
     * @param {HANDLE} hFile A handle to the file from which to create a file mapping object.
     * 
     * The file must be opened with access rights that are compatible with the protection flags that the 
     *        <i>flProtect</i> parameter specifies. It is not required, but it is recommended that files 
     *        you intend to map be opened for exclusive access. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-security-and-access-rights">File Security and Access Rights</a>.
     * 
     * If <i>hFile</i> is <b>INVALID_HANDLE_VALUE</b>, the calling process 
     *        must also specify a size for the file mapping object in the <i>dwMaximumSizeHigh</i> and 
     *        <i>dwMaximumSizeLow</i> parameters. In this scenario, 
     *        <b>CreateFileMapping</b> creates a file mapping object 
     *        of a specified size  that is backed by the system paging file instead of by a file in the file system.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpFileMappingAttributes A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> 
     *        structure that determines whether a returned handle can be inherited by child processes. The 
     *       <b>lpSecurityDescriptor</b> member of the 
     *       <b>SECURITY_ATTRIBUTES</b> structure specifies a 
     *       security descriptor for a new file mapping object.
     * 
     * If <i>lpAttributes</i> is <b>NULL</b>, the handle cannot be inherited 
     *       and the file mapping object gets a default security descriptor. The access control lists (ACL) in the default 
     *       security descriptor for a file mapping object come from the primary or impersonation token of the creator. For 
     *       more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/Memory/file-mapping-security-and-access-rights">File Mapping Security and Access Rights</a>.
     * @param {Integer} flProtect Specifies the page protection of the file mapping object. All mapped views of the object must be compatible 
     *        with this protection.
     * @param {Integer} dwMaximumSizeHigh The high-order <b>DWORD</b> of the maximum size of the file mapping object.
     * @param {Integer} dwMaximumSizeLow The low-order <b>DWORD</b> of the maximum size of the file mapping object.
     * 
     * If this parameter and <i>dwMaximumSizeHigh</i> are 0 (zero), the maximum size of the file 
     *        mapping object is equal to the current size of the file that  <i>hFile</i> identifies.
     * 
     * An attempt to map a file with a length of 0 (zero) fails with an error code of 
     *        <b>ERROR_FILE_INVALID</b>. Applications should test for files with a length of 0 (zero) and 
     *        reject those files.
     * @param {PWSTR} lpName The name of the file mapping object.
     * 
     * If this parameter matches the name of an existing mapping object, the function requests access to the 
     *        object with the protection that <i>flProtect</i> specifies.
     * 
     * If this parameter is <b>NULL</b>, the file mapping object is created without a name.
     * 
     * If <i>lpName</i> matches the name of an existing event, semaphore, mutex, waitable timer, or 
     *        job object, the function fails, and the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> 
     *        function returns <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the 
     *        same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the 
     *        object in the global or session namespace. The remainder of the name can contain any character except the 
     *        backslash character (\\). Creating a file mapping object in the global namespace from a session other than 
     *        session zero requires the 
     *        <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">SeCreateGlobalPrivilege</a> 
     *        privilege. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>.
     * 
     * Fast user switching is implemented by using Terminal Services sessions. The first user to log on uses session 
     *        0 (zero), the next user to log on uses session 1 (one), and so on. Kernel object names must follow the 
     *        guidelines that are outlined for Terminal Services so that applications can support multiple users.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the newly created file mapping object.
     * 
     * If the object exists before the function call, the function returns a handle to the existing object (with its 
     *        current size, not the specified size), and <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-createfilemappingw
     * @since windows5.1.2600
     */
    static CreateFileMappingW(hFile, lpFileMappingAttributes, flProtect, dwMaximumSizeHigh, dwMaximumSizeLow, lpName) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateFileMappingW", "ptr", hFile, "ptr", lpFileMappingAttributes, "uint", flProtect, "uint", dwMaximumSizeHigh, "uint", dwMaximumSizeLow, "ptr", lpName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Opens a named file mapping object.
     * @param {Integer} dwDesiredAccess The access to the file mapping object. This access is checked against any security descriptor on the target 
     *       file mapping object. For a list of values, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/Memory/file-mapping-security-and-access-rights">File Mapping Security and Access Rights</a>.
     * @param {BOOL} bInheritHandle If this parameter is <b>TRUE</b>, a process created by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function can inherit the handle; 
     *       otherwise, the handle cannot be inherited.
     * @param {PWSTR} lpName The name of the file mapping object to be opened. If there is an open handle to a file mapping object by 
     *       this name and the security descriptor on the mapping object does not conflict with the 
     *       <i>dwDesiredAccess</i> parameter, the open operation succeeds. The name can have a 
     *       "Global\" or "Local\" prefix to explicitly open an object in the global or 
     *       session namespace. The remainder of the name can contain any character except the backslash character (\\). For 
     *       more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user 
     *       switching is implemented using Terminal Services sessions. The first user to log on uses session 0, the next 
     *       user to log on uses session 1, and so on. Kernel object names must follow the guidelines outlined for Terminal 
     *       Services so that applications can support multiple users.
     * @returns {HANDLE} If the function succeeds, the return value is an open handle to the specified file mapping object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-openfilemappingw
     * @since windows5.1.2600
     */
    static OpenFileMappingW(dwDesiredAccess, bInheritHandle, lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\OpenFileMappingW", "uint", dwDesiredAccess, "int", bInheritHandle, "ptr", lpName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Maps a view of a file mapping into the address space of a calling process.
     * @param {HANDLE} hFileMappingObject A handle to a file mapping object. The 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfilemappinga">CreateFileMapping</a> and 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openfilemappinga">OpenFileMapping</a> functions return this handle.
     * @param {Integer} dwDesiredAccess The type of access to a file mapping object, which determines the page protection of the pages. This
     * @param {Integer} dwFileOffsetHigh A high-order <b>DWORD</b> of the file offset where the view begins.
     * @param {Integer} dwFileOffsetLow A low-order <b>DWORD</b> of the file offset where the view is to begin. The combination 
     *        of the high and low offsets must specify an offset within the file mapping. They must also match the  memory 
     *        allocation granularity of the system. That is, the offset must be a multiple of the allocation granularity. To 
     *        obtain the memory allocation granularity of the system, use the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function, which fills in the members of 
     *        a <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/ns-sysinfoapi-system_info">SYSTEM_INFO</a> structure.
     * @param {Pointer} dwNumberOfBytesToMap The number of bytes of a file mapping to map to the view. All bytes must be within the maximum size specified 
     *        by <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfilemappinga">CreateFileMapping</a>. If this parameter is 0 
     *        (zero), the mapping extends from the specified offset to the end of the file mapping.
     * @returns {MEMORY_MAPPED_VIEW_ADDRESS} If the function succeeds, the return value is the starting address of the mapped view.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-mapviewoffile
     * @since windows5.1.2600
     */
    static MapViewOfFile(hFileMappingObject, dwDesiredAccess, dwFileOffsetHigh, dwFileOffsetLow, dwNumberOfBytesToMap) {
        hFileMappingObject := hFileMappingObject is Win32Handle ? NumGet(hFileMappingObject, "ptr") : hFileMappingObject

        A_LastError := 0

        result := DllCall("KERNEL32.dll\MapViewOfFile", "ptr", hFileMappingObject, "uint", dwDesiredAccess, "uint", dwFileOffsetHigh, "uint", dwFileOffsetLow, "ptr", dwNumberOfBytesToMap, "ptr")
        if(A_LastError)
            throw OSError()

        return MEMORY_MAPPED_VIEW_ADDRESS({Value: result}, True)
    }

    /**
     * Maps a view of a file mapping into the address space of a calling process. A caller can optionally specify a suggested base memory address for the view.
     * @param {HANDLE} hFileMappingObject A handle to a file mapping object. The 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfilemappinga">CreateFileMapping</a> and 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openfilemappinga">OpenFileMapping</a> functions return this handle.
     * @param {Integer} dwDesiredAccess The type of access to a file mapping object, which determines the page protection of the pages. This
     * @param {Integer} dwFileOffsetHigh The high-order <b>DWORD</b> of the file offset where the view is to begin.
     * @param {Integer} dwFileOffsetLow The low-order <b>DWORD</b> of the file offset where the view is to begin. The 
     *       combination of the high and low offsets must specify an offset within the file mapping. They must also match the 
     *       memory allocation granularity of the system. That is, the offset must be a multiple of the allocation 
     *       granularity. To obtain the memory allocation granularity of the system, use the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function, which fills in the members of 
     *       a <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/ns-sysinfoapi-system_info">SYSTEM_INFO</a> structure.
     * @param {Pointer} dwNumberOfBytesToMap The number of bytes of a file mapping to map to a view. All bytes must be within the maximum size specified 
     *       by <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfilemappinga">CreateFileMapping</a>. If this parameter is 0 
     *       (zero), the mapping extends from the specified offset to the end of the file mapping.
     * @param {Pointer<Void>} lpBaseAddress A pointer to the memory address in the calling process address space where mapping begins. This must be a 
     *        multiple of the system's memory allocation granularity, or the function fails. To determine the memory 
     *        allocation granularity of the system, use the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function. If there is not enough 
     *        address space at the specified address, the function fails.
     * 
     * If <i>lpBaseAddress</i> is <b>NULL</b>, the operating system chooses 
     *        the mapping address. In this scenario, the function is equivalent to the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> function.
     * 
     * While it is possible to specify an address that is safe now (not used by the operating system), there is no 
     *        guarantee that the address will remain safe over time. Therefore, it is better to let the operating system 
     *        choose the address. In this case, you would not store pointers in the memory mapped file, you would store 
     *        offsets from the base of the file mapping so that the mapping can be used at any address.
     * @returns {MEMORY_MAPPED_VIEW_ADDRESS} If the function succeeds, the return value is the starting address of the mapped view.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-mapviewoffileex
     * @since windows5.1.2600
     */
    static MapViewOfFileEx(hFileMappingObject, dwDesiredAccess, dwFileOffsetHigh, dwFileOffsetLow, dwNumberOfBytesToMap, lpBaseAddress) {
        hFileMappingObject := hFileMappingObject is Win32Handle ? NumGet(hFileMappingObject, "ptr") : hFileMappingObject

        A_LastError := 0

        result := DllCall("KERNEL32.dll\MapViewOfFileEx", "ptr", hFileMappingObject, "uint", dwDesiredAccess, "uint", dwFileOffsetHigh, "uint", dwFileOffsetLow, "ptr", dwNumberOfBytesToMap, "ptr", lpBaseAddress, "ptr")
        if(A_LastError)
            throw OSError()

        return MEMORY_MAPPED_VIEW_ADDRESS({Value: result}, True)
    }

    /**
     * Releases, decommits, or releases and decommits a region of memory within the virtual address space of a specified process.
     * @param {HANDLE} hProcess A handle to a process. The function frees memory within the virtual address space of the process. 
     * 
     * 
     * 
     * 
     * The handle must have the <b>PROCESS_VM_OPERATION</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Void>} lpAddress A pointer to the starting address of the region of memory to be freed. 
     * 
     * 
     * 
     * 
     * If the <i>dwFreeType</i> parameter is <b>MEM_RELEASE</b>, <i>lpAddress</i> must be the base address returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualallocex">VirtualAllocEx</a> function when the region is reserved.
     * @param {Pointer} dwSize The size of the region of memory to free, in bytes. 
     * 
     * 
     * 
     * 
     * If the <i>dwFreeType</i> parameter is <b>MEM_RELEASE</b>, <i>dwSize</i> must be 0 (zero). The function frees the entire region that is reserved in the initial allocation call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualallocex">VirtualAllocEx</a>.
     * 
     * If <i>dwFreeType</i> is <b>MEM_DECOMMIT</b>, the function decommits all memory pages that contain one or more bytes in the range from the <i>lpAddress</i> parameter to <c>(lpAddress+dwSize)</c>. This means, for example, that a 2-byte region of memory that straddles a page boundary causes both pages to be decommitted. If <i>lpAddress</i> is the base address returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualallocex">VirtualAllocEx</a> and <i>dwSize</i> is 0 (zero), the function decommits the entire region that is allocated by 
     * <b>VirtualAllocEx</b>. After that, the entire region is in the reserved state.
     * @param {Integer} dwFreeType 
     * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-virtualfreeex
     * @since windows5.1.2600
     */
    static VirtualFreeEx(hProcess, lpAddress, dwSize, dwFreeType) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\VirtualFreeEx", "ptr", hProcess, "ptr", lpAddress, "ptr", dwSize, "uint", dwFreeType, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Writes to the disk a byte range within a mapped view of a file.
     * @param {Pointer<Void>} lpBaseAddress A pointer to the base address of the byte range to be flushed to the disk representation of the mapped file.
     * @param {Pointer} dwNumberOfBytesToFlush The number of bytes to be flushed. If <i>dwNumberOfBytesToFlush</i> is zero, the file is flushed from the base address to the end of the mapping.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-flushviewoffile
     * @since windows5.1.2600
     */
    static FlushViewOfFile(lpBaseAddress, dwNumberOfBytesToFlush) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\FlushViewOfFile", "ptr", lpBaseAddress, "ptr", dwNumberOfBytesToFlush, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Unmaps a mapped view of a file from the calling process's address space.
     * @param {MEMORY_MAPPED_VIEW_ADDRESS} lpBaseAddress A pointer to the base address of the mapped view of a file that is to be unmapped. This value must be identical to the value returned by a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffileex">MapViewOfFileEx</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-unmapviewoffile
     * @since windows5.1.2600
     */
    static UnmapViewOfFile(lpBaseAddress) {
        lpBaseAddress := lpBaseAddress is Win32Handle ? NumGet(lpBaseAddress, "ptr") : lpBaseAddress

        A_LastError := 0

        result := DllCall("KERNEL32.dll\UnmapViewOfFile", "ptr", lpBaseAddress, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the minimum size of a large page.
     * @returns {Pointer} If the processor supports large pages, the return value is the minimum size of a large page.
     * 
     * If the processor does not support large pages, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-getlargepageminimum
     * @since windows6.0.6000
     */
    static GetLargePageMinimum() {
        result := DllCall("KERNEL32.dll\GetLargePageMinimum", "ptr")
        return result
    }

    /**
     * Retrieves the minimum and maximum working set sizes of the specified process.
     * @remarks
     * 
     * The "working set" of a process is the set of memory pages currently visible to the process in physical RAM memory. These pages are resident and available for an application to use without triggering a page fault. The minimum and maximum working set sizes affect the virtual memory paging behavior of a process.
     * 
     * 
     * @param {HANDLE} hProcess A handle to the process whose working set sizes will be obtained. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003:  </b>The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right.
     * @param {Pointer<Pointer>} lpMinimumWorkingSetSize A pointer to a variable that receives the minimum working set size of the specified process, in bytes. The virtual memory manager attempts to keep at least this much memory resident in the process whenever the process is active.
     * @param {Pointer<Pointer>} lpMaximumWorkingSetSize A pointer to a variable that receives the maximum working set size of the specified process, in bytes. The virtual memory manager attempts to keep no more than this much memory resident in the process whenever the process is active when memory is in short supply.
     * @param {Pointer<Integer>} Flags The flags that control the enforcement of the minimum and maximum working set sizes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QUOTA_LIMITS_HARDWS_MIN_DISABLE"></a><a id="quota_limits_hardws_min_disable"></a><dl>
     * <dt><b>QUOTA_LIMITS_HARDWS_MIN_DISABLE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The working set may fall below the minimum working set limit if memory demands are high.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QUOTA_LIMITS_HARDWS_MIN_ENABLE"></a><a id="quota_limits_hardws_min_enable"></a><dl>
     * <dt><b>QUOTA_LIMITS_HARDWS_MIN_ENABLE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The working set will not fall below the minimum working set limit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QUOTA_LIMITS_HARDWS_MAX_DISABLE"></a><a id="quota_limits_hardws_max_disable"></a><dl>
     * <dt><b>QUOTA_LIMITS_HARDWS_MAX_DISABLE</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The working set may exceed the maximum working set limit if there is abundant memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QUOTA_LIMITS_HARDWS_MAX_ENABLE"></a><a id="quota_limits_hardws_max_enable"></a><dl>
     * <dt><b>QUOTA_LIMITS_HARDWS_MAX_ENABLE</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The working set will not exceed the maximum working set limit.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-getprocessworkingsetsizeex
     * @since windows6.0.6000
     */
    static GetProcessWorkingSetSizeEx(hProcess, lpMinimumWorkingSetSize, lpMaximumWorkingSetSize, Flags) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        result := DllCall("KERNEL32.dll\GetProcessWorkingSetSizeEx", "ptr", hProcess, "ptr*", lpMinimumWorkingSetSize, "ptr*", lpMaximumWorkingSetSize, "uint*", Flags, "int")
        return result
    }

    /**
     * Sets the minimum and maximum working set sizes for the specified process.
     * @param {HANDLE} hProcess A handle to the process whose working set sizes is to be set.
     * 
     * The handle must have <b>PROCESS_SET_QUOTA</b> access rights. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer} dwMinimumWorkingSetSize The minimum working set size for the process, in bytes. The virtual memory manager attempts to keep at least this much memory resident in the process whenever the process is active.
     * 
     * This parameter must be greater than zero but less than or equal to the maximum working set size. The default size is 50 pages (for example, this is 204,800 bytes on systems with a 4K page size). If the value is greater than zero but less than 20 pages, the minimum value is set to 20 pages.
     * 
     * If both <i>dwMinimumWorkingSetSize</i> and <i>dwMaximumWorkingSetSize</i> have the value (<b>SIZE_T</b>)–1, the function removes as many pages as possible from the working set of the specified process.
     * @param {Pointer} dwMaximumWorkingSetSize The maximum working set size for the process, in bytes. The virtual memory manager attempts to keep no more than this much memory resident in the process whenever the process is active and available memory is low.
     * 
     * This parameter must be greater than or equal to 13 pages (for example, 53,248 on systems with a 4K page size), and less than the system-wide maximum (number of available pages minus 512 pages). The default size is 345 pages (for example, this is 1,413,120 bytes on systems with a 4K page size).
     * 
     * If both <i>dwMinimumWorkingSetSize</i> and <i>dwMaximumWorkingSetSize</i> have the value (<b>SIZE_T</b>)–1, the function removes as many pages as possible from the working set of the specified process. For details, see Remarks.
     * @param {Integer} Flags The flags that control the enforcement of the minimum and maximum working set sizes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QUOTA_LIMITS_HARDWS_MIN_DISABLE"></a><a id="quota_limits_hardws_min_disable"></a><dl>
     * <dt><b>QUOTA_LIMITS_HARDWS_MIN_DISABLE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The working set may fall below the minimum working set limit if memory demands are high.
     * 
     * This flag cannot be used with <b>QUOTA_LIMITS_HARDWS_MIN_ENABLE</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QUOTA_LIMITS_HARDWS_MIN_ENABLE"></a><a id="quota_limits_hardws_min_enable"></a><dl>
     * <dt><b>QUOTA_LIMITS_HARDWS_MIN_ENABLE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The working set will not fall below the minimum working set limit.
     * 
     * This flag cannot be used with <b>QUOTA_LIMITS_HARDWS_MIN_DISABLE</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QUOTA_LIMITS_HARDWS_MAX_DISABLE"></a><a id="quota_limits_hardws_max_disable"></a><dl>
     * <dt><b>QUOTA_LIMITS_HARDWS_MAX_DISABLE</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>The working set may exceed the maximum working set limit if there is abundant memory.</i>
     * 
     * This flag cannot be used with <b>QUOTA_LIMITS_HARDWS_MAX_ENABLE</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QUOTA_LIMITS_HARDWS_MAX_ENABLE"></a><a id="quota_limits_hardws_max_enable"></a><dl>
     * <dt><b>QUOTA_LIMITS_HARDWS_MAX_ENABLE</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The working set will not exceed the maximum working set limit.
     * 
     * This flag cannot be used with <b>QUOTA_LIMITS_HARDWS_MAX_DISABLE</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} If the function is succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the function fails, the return value is zero. To get extended error information, call 
     * <b>GetLastError</b>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-setprocessworkingsetsizeex
     * @since windows6.0.6000
     */
    static SetProcessWorkingSetSizeEx(hProcess, dwMinimumWorkingSetSize, dwMaximumWorkingSetSize, Flags) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetProcessWorkingSetSizeEx", "ptr", hProcess, "ptr", dwMinimumWorkingSetSize, "ptr", dwMaximumWorkingSetSize, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locks the specified region of the process's virtual address space into physical memory, ensuring that subsequent access to the region will not incur a page fault.
     * @param {Pointer<Void>} lpAddress A pointer to the base address of the region of pages to be locked.
     * @param {Pointer} dwSize The size of the region to be locked, in bytes. The region of affected pages includes all pages that contain one or more bytes in the range from the <i>lpAddress</i> parameter to <c>(lpAddress+dwSize)</c>. This means that a 2-byte range straddling a page boundary causes both pages to be locked.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-virtuallock
     * @since windows5.1.2600
     */
    static VirtualLock(lpAddress, dwSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\VirtualLock", "ptr", lpAddress, "ptr", dwSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Unlocks a specified range of pages in the virtual address space of a process, enabling the system to swap the pages out to the paging file if necessary.
     * @param {Pointer<Void>} lpAddress A pointer to the base address of the region of pages to be unlocked.
     * @param {Pointer} dwSize The size of the region being unlocked, in bytes. The region of affected pages includes all pages containing one or more bytes in the range from the <i>lpAddress</i> parameter to <c>(lpAddress+dwSize)</c>. This means that a 2-byte range straddling a page boundary causes both pages to be unlocked.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-virtualunlock
     * @since windows5.1.2600
     */
    static VirtualUnlock(lpAddress, dwSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\VirtualUnlock", "ptr", lpAddress, "ptr", dwSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the addresses of the pages that are written to in a region of virtual memory.
     * @param {Integer} dwFlags Indicates whether the function resets the write-tracking state. 
     * 
     * To reset the write-tracking state, set this 
     *       parameter to <b>WRITE_WATCH_FLAG_RESET</b>. If this parameter is 0 (zero), 
     *       <b>GetWriteWatch</b> does not reset the write-tracking state. 
     *       For more information, see the Remarks section of this topic.
     * @param {Pointer<Void>} lpBaseAddress The base address of the memory region for which to retrieve write-tracking information. 
     * 
     * This address must be in 
     *       a memory region that is allocated by the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> 
     *       function using <b>MEM_WRITE_WATCH</b>.
     * @param {Pointer} dwRegionSize The size of the memory region for which to retrieve write-tracking information, in bytes.
     * @param {Pointer<Pointer<Void>>} lpAddresses A pointer to a buffer that receives an array of page addresses in the memory region. 
     * 
     * The addresses indicate 
     *       the pages that have been written to since the region has been allocated or the write-tracking state has been reset.
     * @param {Pointer<Pointer>} lpdwCount On input, this variable indicates the size of the <i>lpAddresses</i> array, in array 
     *      elements. 
     * 
     * On output, the variable receives the number of page addresses that are returned in the array.
     * @param {Pointer<Integer>} lpdwGranularity A pointer to a variable that receives the page size, in bytes.
     * @returns {Integer} If the function succeeds, the return value is 0 (zero).
     * 
     * If the function fails, the return value is a nonzero value.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-getwritewatch
     * @since windows5.1.2600
     */
    static GetWriteWatch(dwFlags, lpBaseAddress, dwRegionSize, lpAddresses, lpdwCount, lpdwGranularity) {
        result := DllCall("KERNEL32.dll\GetWriteWatch", "uint", dwFlags, "ptr", lpBaseAddress, "ptr", dwRegionSize, "ptr*", lpAddresses, "ptr*", lpdwCount, "uint*", lpdwGranularity, "uint")
        return result
    }

    /**
     * Resets the write-tracking state for a region of virtual memory. Subsequent calls to the GetWriteWatch function only report pages that are written to since the reset operation.
     * @param {Pointer<Void>} lpBaseAddress A pointer to the base address of the memory region for which to reset the write-tracking state. 
     * 
     * This address 
     *       must be in a memory region that is allocated by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> function with <b>MEM_WRITE_WATCH</b>.
     * @param {Pointer} dwRegionSize The size of the memory region for which to reset the write-tracking information, in bytes.
     * @returns {Integer} If the function succeeds, the return value is 0 (zero).
     * 
     * If the function fails, the return value is a nonzero value.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-resetwritewatch
     * @since windows5.1.2600
     */
    static ResetWriteWatch(lpBaseAddress, dwRegionSize) {
        result := DllCall("KERNEL32.dll\ResetWriteWatch", "ptr", lpBaseAddress, "ptr", dwRegionSize, "uint")
        return result
    }

    /**
     * Creates a memory resource notification object.
     * @param {Integer} NotificationType The memory condition under which the object is to be signaled. This parameter can be one of the following 
     *       values from the <b>MEMORY_RESOURCE_NOTIFICATION_TYPE</b> enumeration.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LowMemoryResourceNotification"></a><a id="lowmemoryresourcenotification"></a><a id="LOWMEMORYRESOURCENOTIFICATION"></a><dl>
     * <dt><b>LowMemoryResourceNotification</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Available physical memory is running low.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HighMemoryResourceNotification"></a><a id="highmemoryresourcenotification"></a><a id="HIGHMEMORYRESOURCENOTIFICATION"></a><dl>
     * <dt><b>HighMemoryResourceNotification</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Available physical memory is high.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HANDLE} If the function succeeds, the return value is a handle to a memory resource notification object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended  information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-creatememoryresourcenotification
     * @since windows5.1.2600
     */
    static CreateMemoryResourceNotification(NotificationType) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateMemoryResourceNotification", "int", NotificationType, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Retrieves the state of the specified memory resource object.
     * @param {HANDLE} ResourceNotificationHandle A handle to a memory resource notification object. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-creatememoryresourcenotification">CreateMemoryResourceNotification</a> function returns this handle.
     * @param {Pointer<BOOL>} ResourceState The memory pointed to by this parameter receives the state of the memory resource notification object. The value of this parameter is set to <b>TRUE</b> if the specified memory condition exists, and  <b>FALSE</b> if the specified memory condition does not exist.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. For more error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-querymemoryresourcenotification
     * @since windows5.1.2600
     */
    static QueryMemoryResourceNotification(ResourceNotificationHandle, ResourceState) {
        ResourceNotificationHandle := ResourceNotificationHandle is Win32Handle ? NumGet(ResourceNotificationHandle, "ptr") : ResourceNotificationHandle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\QueryMemoryResourceNotification", "ptr", ResourceNotificationHandle, "ptr", ResourceState, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the current size limits for the working set of the system cache.
     * @param {Pointer<Pointer>} lpMinimumFileCacheSize A pointer to a variable that receives the minimum size of the file cache, in bytes. The virtual memory manager attempts to keep at least this much memory resident in the system file cache, if there is a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-setsystemfilecachesize">SetSystemFileCacheSize</a> function with the <b>FILE_CACHE_MIN_HARD_ENABLE</b> flag.
     * @param {Pointer<Pointer>} lpMaximumFileCacheSize A pointer to a variable that receives the maximum size of the file cache, in bytes. The virtual memory manager enforces this limit only if there is a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-setsystemfilecachesize">SetSystemFileCacheSize</a> with the <b>FILE_CACHE_MAX_HARD_ENABLE</b> flag.
     * @param {Pointer<Integer>} lpFlags The flags that indicate which of the file cache limits are enabled.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_CACHE_MAX_HARD_ENABLE"></a><a id="file_cache_max_hard_enable"></a><dl>
     * <dt><b>FILE_CACHE_MAX_HARD_ENABLE</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The maximum size limit is enabled. If this flag is not present, this limit is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_CACHE_MIN_HARD_ENABLE"></a><a id="file_cache_min_hard_enable"></a><dl>
     * <dt><b>FILE_CACHE_MIN_HARD_ENABLE</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The minimum size limit is enabled. If this flag is not present, this limit is disabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-getsystemfilecachesize
     * @since windows6.0.6000
     */
    static GetSystemFileCacheSize(lpMinimumFileCacheSize, lpMaximumFileCacheSize, lpFlags) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetSystemFileCacheSize", "ptr*", lpMinimumFileCacheSize, "ptr*", lpMaximumFileCacheSize, "uint*", lpFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Limits the size of the working set for the file system cache.
     * @param {Pointer} MinimumFileCacheSize The minimum size of the file cache, in bytes. The virtual memory manager attempts to keep at least this much memory resident in the system file cache.
     * 
     * To flush the cache, specify <c>(SIZE_T) -1</c>.
     * @param {Pointer} MaximumFileCacheSize The maximum size of the file cache, in bytes. The virtual memory manager enforces this limit only if this call or a previous call to <b>SetSystemFileCacheSize</b> specifies <b>FILE_CACHE_MAX_HARD_ENABLE</b>.
     * 
     * To flush the cache, specify <c>(SIZE_T) -1</c>.
     * @param {Integer} Flags The flags that enable or disable the file cache limits. If this parameter is 0 (zero), the size limits retain the current setting, which is either disabled or enabled.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_CACHE_MAX_HARD_DISABLE"></a><a id="file_cache_max_hard_disable"></a><dl>
     * <dt><b>FILE_CACHE_MAX_HARD_DISABLE</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable the maximum size limit.
     * 
     * The <b>FILE_CACHE_MAX_HARD_DISABLE</b> and <b>FILE_CACHE_MAX_HARD_ENABLE</b> flags are mutually exclusive.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_CACHE_MAX_HARD_ENABLE"></a><a id="file_cache_max_hard_enable"></a><dl>
     * <dt><b>FILE_CACHE_MAX_HARD_ENABLE</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enable the maximum size limit.
     * 
     * The <b>FILE_CACHE_MAX_HARD_DISABLE</b> and <b>FILE_CACHE_MAX_HARD_ENABLE</b> flags are mutually exclusive.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_CACHE_MIN_HARD_DISABLE"></a><a id="file_cache_min_hard_disable"></a><dl>
     * <dt><b>FILE_CACHE_MIN_HARD_DISABLE</b></dt>
     * <dt>0x8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable the minimum size limit.
     * 
     * The <b>FILE_CACHE_MIN_HARD_DISABLE</b> and <b>FILE_CACHE_MIN_HARD_ENABLE</b> flags are mutually exclusive.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_CACHE_MIN_HARD_ENABLE"></a><a id="file_cache_min_hard_enable"></a><dl>
     * <dt><b>FILE_CACHE_MIN_HARD_ENABLE</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enable the minimum size limit.
     * 
     * The <b>FILE_CACHE_MIN_HARD_DISABLE</b> and <b>FILE_CACHE_MIN_HARD_ENABLE</b> flags are mutually exclusive.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-setsystemfilecachesize
     * @since windows6.0.6000
     */
    static SetSystemFileCacheSize(MinimumFileCacheSize, MaximumFileCacheSize, Flags) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetSystemFileCacheSize", "ptr", MinimumFileCacheSize, "ptr", MaximumFileCacheSize, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates or opens a named or unnamed file mapping object for a specified file and specifies the NUMA node for the physical memory.
     * @param {HANDLE} hFile A handle to the file from which to create a file mapping object. 
     * 
     * The file must be opened with access 
     *        rights that are compatible with the protection flags that the <i>flProtect</i> parameter 
     *        specifies. It is not required, but it is recommended that files you intend to map be opened for exclusive 
     *        access. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-security-and-access-rights">File Security and Access Rights</a>.
     * 
     * If <i>hFile</i> is <b>INVALID_HANDLE_VALUE</b>, the calling process 
     *        must also specify a size for the file mapping object in the <i>dwMaximumSizeHigh</i> and 
     *        <i>dwMaximumSizeLow</i> parameters. In this scenario, 
     *        <b>CreateFileMappingNuma</b> creates a file mapping 
     *        object of a specified size  that is backed by the system paging file instead of by a file in the file 
     *        system.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpFileMappingAttributes A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> 
     *        structure that determines whether a returned handle can be inherited by child processes. The 
     *        <b>lpSecurityDescriptor</b> member of the  
     *        <b>SECURITY_ATTRIBUTES</b> structure specifies a 
     *        security descriptor for a new file mapping object.
     * 
     * If <i>lpFileMappingAttributes</i> is <b>NULL</b>, the handle cannot be 
     *        inherited and the file mapping object gets a default security descriptor. The access control lists (ACL) in the 
     *        default security descriptor for a file mapping object come from the primary or impersonation token of the 
     *        creator. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Memory/file-mapping-security-and-access-rights">File Mapping Security and Access Rights</a>.
     * @param {Integer} flProtect Specifies the page protection of the file mapping object. All mapped views of the object must be compatible 
     *        with this protection.
     * @param {Integer} dwMaximumSizeHigh The high-order <b>DWORD</b> of the maximum size of the file mapping object.
     * @param {Integer} dwMaximumSizeLow The low-order <b>DWORD</b> of the maximum size of the file mapping object.
     * 
     * If this parameter and the <i>dwMaximumSizeHigh</i> parameter are 0 (zero), the maximum 
     *         size of the file mapping object is equal to the current size of the file that the 
     *         <i>hFile</i> parameter identifies.
     * 
     * An attempt to map a file with a length of 0 (zero) fails with an error code of 
     *         <b>ERROR_FILE_INVALID</b>. Applications should test for files with a length of 0 (zero) and 
     *         reject those files.
     * @param {PWSTR} lpName The name of the file mapping object.
     * 
     * If this parameter matches the name of an existing file mapping object, the function requests access to the 
     *         object with the protection that the <i>flProtect</i> parameter specifies.
     * 
     * If this parameter is <b>NULL</b>, the file mapping object is created without a name.
     * 
     * If the <i>lpName</i> parameter matches the name of an existing event, semaphore, mutex, 
     *         waitable timer, or job object, the function fails and the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns 
     *         <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the 
     *         object in the global or session namespace. The remainder of the name can contain any character except the 
     *         backslash character (\\). Creating a file mapping object in the global namespace requires the 
     *         <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">SeCreateGlobalPrivilege</a> 
     *         privilege. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>.
     * 
     * Fast user switching is implemented by using Terminal Services sessions. The first user to log on uses 
     *         session 0 (zero), the next user to log on uses session 1 (one), and so on. Kernel object names must follow the 
     *         guidelines so that applications can support multiple users.
     * @param {Integer} nndPreferred The NUMA node where the physical memory should reside.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NUMA_NO_PREFERRED_NODE"></a><a id="numa_no_preferred_node"></a><dl>
     * <dt><b>NUMA_NO_PREFERRED_NODE</b></dt>
     * <dt>0xffffffff</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No NUMA node is preferred. This is the same as calling the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfilemappinga">CreateFileMapping</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the file mapping object.
     * 
     * If the object exists 
     *        before the function call, the function returns a handle to the existing object (with its current size, not the 
     *        specified size) and the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>function returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-createfilemappingnumaw
     * @since windows6.0.6000
     */
    static CreateFileMappingNumaW(hFile, lpFileMappingAttributes, flProtect, dwMaximumSizeHigh, dwMaximumSizeLow, lpName, nndPreferred) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateFileMappingNumaW", "ptr", hFile, "ptr", lpFileMappingAttributes, "uint", flProtect, "uint", dwMaximumSizeHigh, "uint", dwMaximumSizeLow, "ptr", lpName, "uint", nndPreferred, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Provides an efficient mechanism to bring into memory potentially discontiguous virtual address ranges in a process address space.
     * @param {HANDLE} hProcess Handle to the process whose virtual address ranges are to be prefetched. Use the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a> function to use the current 
     *       process.
     * @param {Pointer} NumberOfEntries Number of entries in the array pointed to by the <i>VirtualAddresses</i> 
     *       parameter.
     * @param {Pointer<WIN32_MEMORY_RANGE_ENTRY>} VirtualAddresses Pointer to an array of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/ns-memoryapi-win32_memory_range_entry">WIN32_MEMORY_RANGE_ENTRY</a> structures which 
     *       each specify a virtual address range to be prefetched. The virtual address ranges may cover any part of the 
     *       process address space accessible by the target process.
     * @param {Integer} Flags Reserved. Must be 0.
     * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-prefetchvirtualmemory
     * @since windows8.0
     */
    static PrefetchVirtualMemory(hProcess, NumberOfEntries, VirtualAddresses, Flags) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\PrefetchVirtualMemory", "ptr", hProcess, "ptr", NumberOfEntries, "ptr", VirtualAddresses, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates or opens a named or unnamed file mapping object for a specified file from a Windows Store app.
     * @param {HANDLE} hFile A handle to the file from which to create a file mapping object.
     * 
     * The file must be opened with access rights that are compatible with the protection flags that the 
     *        <i>flProtect</i> parameter specifies. It is not required, but it is recommended that files 
     *        you intend to map be opened for exclusive access. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-security-and-access-rights">File Security and Access Rights</a>.
     * 
     * If <i>hFile</i> is <b>INVALID_HANDLE_VALUE</b>, the calling process 
     *        must also specify a size for the file mapping object in the <i>dwMaximumSizeHigh</i> and 
     *        <i>dwMaximumSizeLow</i> parameters. In this scenario, 
     *        <b>CreateFileMappingFromApp</b> creates a file 
     *        mapping object of a specified size  that is backed by the system paging file instead of by a file in the file 
     *        system.
     * @param {Pointer<SECURITY_ATTRIBUTES>} SecurityAttributes A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> 
     *        structure that determines whether a returned handle can be inherited by child processes. The 
     *        <b>lpSecurityDescriptor</b> member of the 
     *        <b>SECURITY_ATTRIBUTES</b> structure specifies a 
     *        security descriptor for a new file mapping object.
     * 
     * If <i>SecurityAttributes</i> is <b>NULL</b>, the handle cannot be 
     *        inherited and the file mapping object gets a default security descriptor. The access control lists (ACL) in the 
     *        default security descriptor for a file mapping object come from the primary or impersonation token of the 
     *        creator. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Memory/file-mapping-security-and-access-rights">File Mapping Security and Access Rights</a>.
     * @param {Integer} PageProtection Specifies the page protection of the file mapping object. All mapped views of the object must be compatible 
     *        with this protection.
     * @param {Integer} MaximumSize The maximum size of the file mapping object.
     * 
     * An attempt to map a file with a length of 0 (zero) fails with an error code of 
     *        <b>ERROR_FILE_INVALID</b>. Applications should test for files with a length of 0 (zero) and 
     *        reject those files.
     * @param {PWSTR} Name The name of the file mapping object.
     * 
     * If this parameter matches the name of an existing mapping object, the function requests access to the 
     *        object with the protection that <i>flProtect</i> specifies.
     * 
     * If this parameter is <b>NULL</b>, the file mapping object is created without a name.
     * 
     * If <i>lpName</i> matches the name of an existing event, semaphore, mutex, waitable timer, 
     *        or job object, the function fails, and the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns 
     *        <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session 
     *        namespace. The remainder of the name can contain any character except the backslash character (\\). Creating a 
     *        file mapping object in the global namespace from a session other than session zero requires the 
     *        <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">SeCreateGlobalPrivilege</a> 
     *        privilege. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>.
     * 
     * Fast user switching is implemented by using Terminal Services sessions. The first user to log on uses session 
     *        0 (zero), the next user to log on uses session 1 (one), and so on. Kernel object names must follow the 
     *        guidelines that are outlined for Terminal Services so that applications can support multiple users.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the newly created file mapping object.
     * 
     * If the object exists before the function call, the function returns a handle to the existing object (with its 
     *        current size, not the specified size), and <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> 
     *        returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-createfilemappingfromapp
     * @since windows8.0
     */
    static CreateFileMappingFromApp(hFile, SecurityAttributes, PageProtection, MaximumSize, Name) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile
        Name := Name is String ? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateFileMappingFromApp", "ptr", hFile, "ptr", SecurityAttributes, "uint", PageProtection, "uint", MaximumSize, "ptr", Name, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Maps a view of a file mapping into the address space of a calling Windows Store app.
     * @param {HANDLE} hFileMappingObject A handle to a file mapping object. The 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-createfilemappingfromapp">CreateFileMappingFromApp</a>  function returns 
     *        this handle.
     * @param {Integer} DesiredAccess The type of access to a file mapping object, which determines the page protection of the pages. This
     * @param {Integer} FileOffset The file offset where the view is to begin. The offset must specify an offset within the file mapping. They 
     *        must also match the  memory allocation granularity of the system. That is, the offset must be a multiple of the 
     *        allocation granularity. To obtain the memory allocation granularity of the system, use the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function, which fills in the members of 
     *        a <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/ns-sysinfoapi-system_info">SYSTEM_INFO</a> structure.
     * @param {Pointer} NumberOfBytesToMap The number of bytes of a file mapping to map to the view. All bytes must be within the maximum size specified 
     *        by <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-createfilemappingfromapp">CreateFileMappingFromApp</a>. If this 
     *        parameter is 0 (zero), the mapping extends from the specified offset to the end of the file mapping.
     * @returns {MEMORY_MAPPED_VIEW_ADDRESS} If the function succeeds, the return value is the starting address of the mapped view.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-mapviewoffilefromapp
     * @since windows8.0
     */
    static MapViewOfFileFromApp(hFileMappingObject, DesiredAccess, FileOffset, NumberOfBytesToMap) {
        hFileMappingObject := hFileMappingObject is Win32Handle ? NumGet(hFileMappingObject, "ptr") : hFileMappingObject

        A_LastError := 0

        result := DllCall("KERNEL32.dll\MapViewOfFileFromApp", "ptr", hFileMappingObject, "uint", DesiredAccess, "uint", FileOffset, "ptr", NumberOfBytesToMap, "ptr")
        if(A_LastError)
            throw OSError()

        return MEMORY_MAPPED_VIEW_ADDRESS({Value: result}, True)
    }

    /**
     * This is an extended version of UnmapViewOfFile that takes an additional flags parameter.
     * @param {MEMORY_MAPPED_VIEW_ADDRESS} BaseAddress A pointer to the base address of the mapped view of a file that is to be unmapped. This value must be identical to the value returned by a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffileex">MapViewOfFileEx</a> function.
     * @param {Integer} UnmapFlags 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-unmapviewoffileex
     * @since windows8.0
     */
    static UnmapViewOfFileEx(BaseAddress, UnmapFlags) {
        BaseAddress := BaseAddress is Win32Handle ? NumGet(BaseAddress, "ptr") : BaseAddress

        A_LastError := 0

        result := DllCall("KERNEL32.dll\UnmapViewOfFileEx", "ptr", BaseAddress, "uint", UnmapFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates physical memory pages to be mapped and unmapped within any Address Windowing Extensions (AWE) region of a specified process.
     * @param {HANDLE} hProcess A handle to a process.
     * 
     * The function allocates memory that can later be mapped within the virtual address space of this process. The handle must have the <b>PROCESS_VM_OPERATION</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Pointer>} NumberOfPages The size of the physical memory to allocate, in pages.
     * 
     * To determine the page size of the computer, use the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function. On output, this parameter 
     *       receives the number of pages that are actually allocated, which might be less than the number requested.
     * @param {Pointer<Pointer>} PageArray A pointer to an array to store the page frame numbers of the allocated memory.
     * 
     * The size of the array 
     *       that is allocated should be at least the <i>NumberOfPages</i> times the size of the 
     *       <b>ULONG_PTR</b> data type.
     *       
     * 
     * Do not attempt to modify this buffer. It contains operating system data, and corruption could be 
     *        catastrophic. The information in the buffer is not useful to an application.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * Fewer pages than requested can be allocated. 
     *       The caller must check the value of the <i>NumberOfPages</i> parameter on return to see how 
     *       many pages are allocated. All allocated page frame numbers are sequentially placed in the memory pointed to by 
     *       the <i>UserPfnArray</i> parameter.
     *       
     * 
     * If the function fails, the return value is <b>FALSE</b>, and no frames are allocated. To get extended error 
     *        information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-allocateuserphysicalpages
     * @since windows5.1.2600
     */
    static AllocateUserPhysicalPages(hProcess, NumberOfPages, PageArray) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\AllocateUserPhysicalPages", "ptr", hProcess, "ptr*", NumberOfPages, "ptr*", PageArray, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Frees physical memory pages that are allocated previously by using AllocateUserPhysicalPages or AllocateUserPhysicalPagesNuma.
     * @param {HANDLE} hProcess The handle to a process. 
     * 
     * The function frees memory within the virtual address space of this process.
     * @param {Pointer<Pointer>} NumberOfPages The size of the physical memory to free, in pages. 
     * 
     * On return, if the function fails, this parameter indicates 
     *       the number of pages that are freed.
     * @param {Pointer<Pointer>} PageArray A pointer to an array of page frame numbers of the allocated memory to be freed.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. In this case, the <i>NumberOfPages</i> 
     *        parameter reflect how many pages have actually been released. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-freeuserphysicalpages
     * @since windows5.1.2600
     */
    static FreeUserPhysicalPages(hProcess, NumberOfPages, PageArray) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\FreeUserPhysicalPages", "ptr", hProcess, "ptr*", NumberOfPages, "ptr*", PageArray, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Maps previously allocated physical memory pages at a specified address in an Address Windowing Extensions (AWE) region.
     * @param {Pointer<Void>} VirtualAddress A pointer to the starting address of the region of memory to remap. 
     * 
     * The value of 
     *       <i>lpAddress</i> must be within the address range that the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> function returns when the <a href="https://docs.microsoft.com/windows/desktop/Memory/address-windowing-extensions">Address Windowing Extensions</a> (AWE) region is 
     *       allocated.
     * @param {Pointer} NumberOfPages The size of the physical memory and virtual address space for which to establish translations, in pages. 
     * 
     * The 
     *       virtual address range is contiguous starting at <i>lpAddress</i>. The physical frames are 
     *       specified by the <i>UserPfnArray</i>.
     * 
     * The total number of pages cannot extend from the 
     *       starting address beyond the end of the range that is specified in 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-allocateuserphysicalpages">AllocateUserPhysicalPages</a>.
     * @param {Pointer<Pointer>} PageArray A pointer to an array of physical page frame numbers. 
     * 
     * These frames are mapped by the argument 
     *       <i>lpAddress</i> on return from this function. The size of the memory that is allocated should be 
     *       at least the <i>NumberOfPages</i> times the size of the data type 
     *       <b>ULONG_PTR</b>. 
     *       
     * 
     * Do not attempt to modify this buffer. It contains operating system data, and corruption could be 
     *        catastrophic. The information in the buffer is not useful to an application.
     * 
     * If this parameter is <b>NULL</b>, the specified address range is unmapped.  Also, the specified physical pages are not 
     *        freed, and you must call <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-freeuserphysicalpages">FreeUserPhysicalPages</a> to 
     *        free them.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b> and no mapping is done—partial or otherwise. 
     *        To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-mapuserphysicalpages
     * @since windows5.1.2600
     */
    static MapUserPhysicalPages(VirtualAddress, NumberOfPages, PageArray) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\MapUserPhysicalPages", "ptr", VirtualAddress, "ptr", NumberOfPages, "ptr*", PageArray, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates physical memory pages to be mapped and unmapped within any Address Windowing Extensions (AWE) region of a specified process and specifies the NUMA node for the physical memory.
     * @param {HANDLE} hProcess A handle to a process. 
     * 
     * The function allocates memory that can later be mapped within the virtual address 
     *       space of this process. The handle must have the <b>PROCESS_VM_OPERATION</b> access right. For 
     *       more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Pointer>} NumberOfPages The size of the physical memory to allocate, in pages.
     * 
     * To determine the page size of the computer, use the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function. On output, this parameter 
     *        receives the number of pages that are actually allocated, which might be less than the number requested.
     * @param {Pointer<Pointer>} PageArray A pointer to an array to store the page frame numbers of the allocated memory.
     * 
     * The size of the array that is allocated should be at least the <i>NumberOfPages</i> times 
     *        the size of the <b>ULONG_PTR</b> data type.
     * 
     * <div class="alert"><b>Caution</b>  Do not attempt to modify this buffer. It contains operating system data, and corruption 
     *        could be catastrophic. The information in the buffer is not useful to an application.</div>
     * <div> </div>
     * @param {Integer} nndPreferred The NUMA node where the physical memory should reside.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * Fewer pages than requested can be allocated. The caller must check the value of the 
     *        <i>NumberOfPages</i> parameter on return to see how many pages are allocated. All allocated 
     *        page frame numbers are sequentially placed in the memory pointed to by the <i>PageArray</i> 
     *        parameter.
     * 
     * If the function fails, the return value is <b>FALSE</b> and no frames are allocated. To get 
     *        extended error information, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> 
     *        function.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-allocateuserphysicalpagesnuma
     * @since windows6.0.6000
     */
    static AllocateUserPhysicalPagesNuma(hProcess, NumberOfPages, PageArray, nndPreferred) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\AllocateUserPhysicalPagesNuma", "ptr", hProcess, "ptr*", NumberOfPages, "ptr*", PageArray, "uint", nndPreferred, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reserves, commits, or changes the state of a region of memory within the virtual address space of the specified process, and specifies the NUMA node for the physical memory.
     * @param {HANDLE} hProcess The handle to a process. The function allocates memory within the virtual address space of this process.
     * 
     * The handle must have the <b>PROCESS_VM_OPERATION</b> access right. For more information, 
     *        see 
     *        <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Void>} lpAddress The pointer that specifies a desired starting address for the region of pages that you want to allocate.
     * 
     * If you are reserving memory, the function rounds this address down to the nearest multiple of the allocation 
     *        granularity.
     * 
     * If you are committing memory that is already reserved, the function rounds this address down to the nearest 
     *        page boundary. To determine the size of a page and the allocation granularity on the host computer, use the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function.
     * 
     * If <i>lpAddress</i> is <b>NULL</b>, the function determines where to 
     *        allocate the region.
     * @param {Pointer} dwSize The size of the region of memory to be allocated, in bytes.
     * 
     * If <i>lpAddress</i> is <b>NULL</b>, the function rounds 
     *        <i>dwSize</i> up to the next page boundary.
     * 
     * If <i>lpAddress</i> is not <b>NULL</b>, the function allocates all 
     *        pages that contain one or more bytes in the range from <i>lpAddress</i> to 
     *        <c>(lpAddress+dwSize)</c>. This means, for example, that a 2-byte 
     *        range that straddles a page boundary causes the function to allocate both pages.
     * @param {Integer} flAllocationType 
     * @param {Integer} flProtect The memory protection for the region of pages to be allocated. If the pages are being committed, you can 
     *        specify any one of the 
     *        <a href="https://docs.microsoft.com/windows/desktop/Memory/memory-protection-constants">memory protection constants</a>.
     * 
     * Protection attributes specified when protecting a page cannot conflict with those specified when allocating 
     *        a page.
     * @param {Integer} nndPreferred The NUMA node where the physical memory should reside.
     * 
     * Used only when allocating a new VA region (either committed or reserved). Otherwise this parameter is ignored 
     *        when the API is used to commit pages in a region that already exists
     * @returns {Pointer<Void>} If the function succeeds, the return value is the base address of the allocated region of pages.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-virtualallocexnuma
     * @since windows6.0.6000
     */
    static VirtualAllocExNuma(hProcess, lpAddress, dwSize, flAllocationType, flProtect, nndPreferred) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\VirtualAllocExNuma", "ptr", hProcess, "ptr", lpAddress, "ptr", dwSize, "uint", flAllocationType, "uint", flProtect, "uint", nndPreferred, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the memory error handling capabilities of the system.
     * @param {Pointer<Integer>} Capabilities A <b>PULONG</b> that receives one or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MEHC_PATROL_SCRUBBER_PRESENT"></a><a id="mehc_patrol_scrubber_present"></a><dl>
     * <dt><b>MEHC_PATROL_SCRUBBER_PRESENT</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The hardware can detect and report failed memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-getmemoryerrorhandlingcapabilities
     * @since windows8.0
     */
    static GetMemoryErrorHandlingCapabilities(Capabilities) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetMemoryErrorHandlingCapabilities", "uint*", Capabilities, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers a bad memory notification that is called when one or more bad memory pages are detected.
     * @param {Pointer<PBAD_MEMORY_CALLBACK_ROUTINE>} Callback A pointer to the application-defined 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh691011(v=vs.85)">BadMemoryCallbackRoutine</a> function to 
     *       register.
     * @returns {Pointer<Void>} Registration handle that represents the callback notification. Can be passed to the 
     *       <a href="/windows/desktop/api/memoryapi/nf-memoryapi-unregisterbadmemorynotification">UnregisterBadMemoryNotification</a> 
     *       function when no longer needed.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-registerbadmemorynotification
     * @since windows8.0
     */
    static RegisterBadMemoryNotification(Callback) {
        result := DllCall("KERNEL32.dll\RegisterBadMemoryNotification", "ptr", Callback, "ptr")
        return result
    }

    /**
     * Closes the specified bad memory notification handle.
     * @param {Pointer<Void>} RegistrationHandle Registration handle returned from the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-registerbadmemorynotification">RegisterBadMemoryNotification</a> 
     *       function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-unregisterbadmemorynotification
     * @since windows8.0
     */
    static UnregisterBadMemoryNotification(RegistrationHandle) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\UnregisterBadMemoryNotification", "ptr", RegistrationHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Indicates that the data contained in a range of memory pages is no longer needed by the application and can be discarded by the system if necessary.
     * @param {Pointer<Void>} VirtualAddress Page-aligned starting address of the memory to offer.
     * @param {Pointer} Size Size, in bytes, of the memory region to offer.  <i>Size</i> must be an integer multiple of the system page size.
     * @param {Integer} Priority <i>Priority</i> indicates how important the offered memory is to the application.
     *        A higher priority increases the probability that the offered memory can be reclaimed intact when calling <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-reclaimvirtualmemory">ReclaimVirtualMemory</a>.
     *        The system typically discards lower priority memory before discarding higher priority memory.
     * @returns {Integer} ERROR_SUCCESS if successful; a <a href="/windows/desktop/Debug/system-error-codes">System Error Code</a> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-offervirtualmemory
     * @since windows8.1
     */
    static OfferVirtualMemory(VirtualAddress, Size, Priority) {
        result := DllCall("KERNEL32.dll\OfferVirtualMemory", "ptr", VirtualAddress, "ptr", Size, "int", Priority, "uint")
        return result
    }

    /**
     * Reclaims a range of memory pages that were offered to the system with OfferVirtualMemory.
     * @param {Pointer<Void>} VirtualAddress Page-aligned starting address of the memory to reclaim.
     * @param {Pointer} Size Size, in bytes, of the memory region to reclaim.  <i>Size</i> must be an integer multiple of the system page size.
     * @returns {Integer} Returns ERROR_SUCCESS if successful and the memory was reclaimed intact.
     * 
     * Returns ERROR_BUSY if successful but the memory was discarded and must be rewritten by the application.  In this case, the contents of the memory region is undefined.
     * 
     * Returns a <a href="/windows/desktop/Debug/system-error-codes">System Error Code</a> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-reclaimvirtualmemory
     * @since windows8.1
     */
    static ReclaimVirtualMemory(VirtualAddress, Size) {
        result := DllCall("KERNEL32.dll\ReclaimVirtualMemory", "ptr", VirtualAddress, "ptr", Size, "uint")
        return result
    }

    /**
     * Discards the memory contents of a range of memory pages, without decommitting the memory. The contents of discarded memory is undefined and must be rewritten by the application.
     * @param {Pointer<Void>} VirtualAddress Page-aligned starting address of the memory to discard.
     * @param {Pointer} Size Size, in bytes, of the memory region to discard.  <i>Size</i> must be an integer multiple of the system page size.
     * @returns {Integer} ERROR_SUCCESS if successful; a <a href="/windows/desktop/Debug/system-error-codes">System Error Code</a> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-discardvirtualmemory
     * @since windows8.1
     */
    static DiscardVirtualMemory(VirtualAddress, Size) {
        result := DllCall("KERNEL32.dll\DiscardVirtualMemory", "ptr", VirtualAddress, "ptr", Size, "uint")
        return result
    }

    /**
     * Provides Control Flow Guard (CFG) with a list of valid indirect call targets and specifies whether they should be marked valid or not.
     * @param {HANDLE} hProcess The handle to the target process.
     * @param {Pointer<Void>} VirtualAddress The start of the virtual memory region whose call targets are being marked valid. The memory region must be allocated using one of the executable [memory protection constants](/windows/desktop/Memory/memory-protection-constants).
     * @param {Pointer} RegionSize The size of the virtual memory region.
     * @param {Integer} NumberOfOffsets The number of offsets relative to the virtual memory ranges.
     * @param {Pointer<CFG_CALL_TARGET_INFO>} OffsetInformation A list of offsets and flags relative to the virtual memory ranges.
     * @returns {BOOL} <b>TRUE</b> if the operation was successful; otherwise, <b>FALSE</b>. To retrieve error values for this function, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-setprocessvalidcalltargets
     * @since windows10.0.10240
     */
    static SetProcessValidCallTargets(hProcess, VirtualAddress, RegionSize, NumberOfOffsets, OffsetInformation) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-3.dll\SetProcessValidCallTargets", "ptr", hProcess, "ptr", VirtualAddress, "ptr", RegionSize, "uint", NumberOfOffsets, "ptr", OffsetInformation, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} Process 
     * @param {Pointer<Void>} VirtualAddress 
     * @param {Pointer} RegionSize 
     * @param {Integer} NumberOfOffsets 
     * @param {Pointer<CFG_CALL_TARGET_INFO>} OffsetInformation 
     * @param {HANDLE} Section 
     * @param {Integer} ExpectedFileOffset 
     * @returns {BOOL} 
     */
    static SetProcessValidCallTargetsForMappedView(Process, VirtualAddress, RegionSize, NumberOfOffsets, OffsetInformation, Section, ExpectedFileOffset) {
        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process
        Section := Section is Win32Handle ? NumGet(Section, "ptr") : Section

        result := DllCall("api-ms-win-core-memory-l1-1-7.dll\SetProcessValidCallTargetsForMappedView", "ptr", Process, "ptr", VirtualAddress, "ptr", RegionSize, "uint", NumberOfOffsets, "ptr", OffsetInformation, "ptr", Section, "uint", ExpectedFileOffset, "int")
        return result
    }

    /**
     * Reserves, commits, or changes the state of a region of pages in the virtual address space of the calling process.
     * @param {Pointer<Void>} BaseAddress The starting address of the region to allocate. If the memory is being reserved, the specified address is 
     *       rounded down to the nearest multiple of the allocation granularity. If the memory is already reserved and is 
     *       being committed, the address is rounded down to the next page boundary. To determine the size of a page and the 
     *       allocation granularity on the host computer, use the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function. If this parameter is 
     *       <b>NULL</b>, the system determines where to allocate the region.
     * @param {Pointer} Size The size of the region, in bytes. If the <i>BaseAddress</i> parameter is 
     *       <b>NULL</b>, this value is rounded up to the next page boundary. Otherwise, the allocated 
     *       pages include all pages containing one or more bytes in the range from <i>BaseAddress</i> to 
     *       <i>BaseAddress</i>+<i>Size</i>. This means that a 2-byte range straddling 
     *       a page boundary causes both pages to be included in the allocated region.
     * @param {Integer} AllocationType 
     * @param {Integer} Protection The memory protection for the region of pages to be allocated. If the pages are being committed, you can 
     *       specify one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/Memory/memory-protection-constants">memory protection constants</a>. The following constants generate an error:
     * 
     * <ul>
     * <li><b>PAGE_EXECUTE</b></li>
     * <li><b>PAGE_EXECUTE_READ</b></li>
     * <li><b>PAGE_EXECUTE_READWRITE</b></li>
     * <li><b>PAGE_EXECUTE_WRITECOPY</b></li>
     * </ul>
     * @returns {Pointer<Void>} If the function succeeds, the return value is the base address of the allocated region of pages.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-virtualallocfromapp
     * @since windows10.0.10240
     */
    static VirtualAllocFromApp(BaseAddress, Size, AllocationType, Protection) {
        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-3.dll\VirtualAllocFromApp", "ptr", BaseAddress, "ptr", Size, "uint", AllocationType, "uint", Protection, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Changes the protection on a region of committed pages in the virtual address space of the calling process.
     * @param {Pointer<Void>} Address A pointer an address that describes the starting page of the region of pages whose access protection 
     *        attributes are to be changed.
     * 
     * All pages in the specified region must be within the same reserved region allocated when calling the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a>, <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualallocfromapp">VirtualAllocFromApp</a>, or 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualallocex">VirtualAllocEx</a> function using 
     *        <b>MEM_RESERVE</b>. The pages cannot span adjacent reserved regions that were allocated by 
     *        separate calls to <b>VirtualAlloc</b>, <b>VirtualAllocFromApp</b>,  or 
     *        <b>VirtualAllocEx</b> using 
     *        <b>MEM_RESERVE</b>.
     * @param {Pointer} Size The size of the region whose access protection attributes are to be changed, in bytes. The region of 
     *       affected pages includes all pages containing one or more bytes in the range from the 
     *       <i>Address</i> parameter to 
     *       <c>(Address+Size)</c>. This means that a 2-byte range 
     *       straddling a page boundary causes the protection attributes of both pages to be changed.
     * @param {Integer} NewProtection The memory protection option. This parameter can be one of the 
     *        <a href="https://docs.microsoft.com/windows/desktop/Memory/memory-protection-constants">memory protection constants</a>.
     * 
     * For mapped views, this value must be compatible with the access protection specified when the view was 
     *        mapped (see <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a>, 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffileex">MapViewOfFileEx</a>, and 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-mapviewoffileexnuma">MapViewOfFileExNuma</a>).
     * 
     * The following constants generate an error:
     * 
     * <ul>
     * <li><b>PAGE_EXECUTE_READWRITE</b></li>
     * <li><b>PAGE_EXECUTE_WRITECOPY</b></li>
     * </ul>
     * The following constants are allowed only for apps that have the <b>codeGeneration</b> capability:
     * 
     * <ul>
     * <li><b>PAGE_EXECUTE</b></li>
     * <li><b>PAGE_EXECUTE_READ</b></li>
     * </ul>
     * @param {Pointer<Integer>} OldProtection A pointer to a variable that receives the previous access protection value of the first page in the 
     *       specified region of pages. If this parameter is <b>NULL</b> or does not point to a valid 
     *       variable, the function fails.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-virtualprotectfromapp
     * @since windows10.0.10240
     */
    static VirtualProtectFromApp(Address, Size, NewProtection, OldProtection) {
        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-3.dll\VirtualProtectFromApp", "ptr", Address, "ptr", Size, "uint", NewProtection, "uint*", OldProtection, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens a named file mapping object.
     * @param {Integer} DesiredAccess The access to the file mapping object. This access is checked against any security descriptor on the target 
     *       file mapping object. For a list of values, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/Memory/file-mapping-security-and-access-rights">File Mapping Security and Access Rights</a>. You can only open the file mapping object for <b>FILE_MAP_EXECUTE</b> access if your app has the <b>codeGeneration</b> capability.
     * @param {BOOL} InheritHandle If this parameter is <b>TRUE</b>, a process created by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function can inherit the handle; 
     *       otherwise, the handle cannot be inherited.
     * @param {PWSTR} Name The name of the file mapping object to be opened. If there is an open handle to a file mapping object by 
     *       this name and the security descriptor on the mapping object does not conflict with the 
     *       <i>DesiredAccess</i> parameter, the open operation succeeds. The name can have a 
     *       "Global\" or "Local\" prefix to explicitly open an object in the global or 
     *       session namespace. The remainder of the name can contain any character except the backslash character (\\). For 
     *       more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user 
     *       switching is implemented using Terminal Services sessions. The first user to log on uses session 0, the next 
     *       user to log on uses session 1, and so on. Kernel object names must follow the guidelines outlined for Terminal 
     *       Services so that applications can support multiple users.
     * @returns {HANDLE} If the function succeeds, the return value is an open handle to the specified file mapping object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-openfilemappingfromapp
     * @since windows10.0.10240
     */
    static OpenFileMappingFromApp(DesiredAccess, InheritHandle, Name) {
        Name := Name is String ? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-3.dll\OpenFileMappingFromApp", "uint", DesiredAccess, "int", InheritHandle, "ptr", Name, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * The QueryVirtualMemoryInformation function returns information about a page or a set of pages within the virtual address space of the specified process.
     * @param {HANDLE} Process A handle for the process in whose context the pages to be queried reside.
     * @param {Pointer<Void>} VirtualAddress The address of the region of pages to be queried. This value is rounded down to the next host-page-address boundary.
     * @param {Integer} MemoryInformationClass The memory information class about which to retrieve information. The only supported value is <b>MemoryRegionInfo</b>.
     * @param {Pointer} MemoryInformation A pointer to a buffer that receives the specified information.
     * 
     * If the <i>MemoryInformationClass</i> parameter has a value of  <b>MemoryRegionInfo</b>, this parameter must point to a <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/ns-memoryapi-win32_memory_region_information">WIN32_MEMORY_REGION_INFORMATION</a> structure.
     * @param {Pointer} MemoryInformationSize Specifies the length in bytes of the memory information buffer.
     * @param {Pointer<Pointer>} ReturnSize An optional pointer which, if specified, receives the number of bytes placed in the memory information buffer.
     * @returns {BOOL} Returns <b>TRUE</b> on success. Returns <b>FALSE</b> for failure. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-queryvirtualmemoryinformation
     * @since windows10.0.14393
     */
    static QueryVirtualMemoryInformation(Process, VirtualAddress, MemoryInformationClass, MemoryInformation, MemoryInformationSize, ReturnSize) {
        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process

        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-4.dll\QueryVirtualMemoryInformation", "ptr", Process, "ptr", VirtualAddress, "int", MemoryInformationClass, "ptr", MemoryInformation, "ptr", MemoryInformationSize, "ptr*", ReturnSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Maps a view of a file or a pagefile-backed section into the address space of the specified process.
     * @param {HANDLE} FileMappingHandle A <b>HANDLE</b> to a section that is to be mapped
     *                         into the address space of the specified process.
     * @param {HANDLE} ProcessHandle A <b>HANDLE</b> to a process into which the section
     *                     will be mapped.
     * @param {Integer} Offset The offset from the beginning of the section.
     *              This must be 64k aligned.
     * @param {Pointer<Void>} BaseAddress The desired base address of the view.
     *                   The address is rounded down to the nearest 64k boundary.
     *                   If this parameter is <b>NULL</b>, the system picks the base
     *                   address.
     * @param {Pointer} ViewSize The number of bytes to map. A value of zero
     *                (0) specifies that the entire section is to be mapped.
     * @param {Integer} AllocationType The type of allocation. This parameter can be zero (0) or one of the following constant values:
     * 
     * <ul>
     * <li><b>MEM_RESERVE</b> - Maps a reserved view</li>
     * <li><b>MEM_LARGE_PAGES</b> - Maps a large page view</li>
     * </ul>
     * @param {Integer} PageProtection The desired page protection.
     * 
     * For file-mapping objects created with the <b>SEC_IMAGE</b> attribute, the 
     *        <i>PageProtection</i> parameter has no effect, and should be set to any valid value such as 
     *        <b>PAGE_READONLY</b>.
     * @param {Integer} PreferredNode The preferred NUMA node for this memory.
     * @returns {MEMORY_MAPPED_VIEW_ADDRESS} Returns the base address of the mapped view, if successful. Otherwise, returns <b>NULL</b> and extended error status is available
     *            using <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-mapviewoffilenuma2
     * @since windows10.0.15063
     */
    static MapViewOfFileNuma2(FileMappingHandle, ProcessHandle, Offset, BaseAddress, ViewSize, AllocationType, PageProtection, PreferredNode) {
        FileMappingHandle := FileMappingHandle is Win32Handle ? NumGet(FileMappingHandle, "ptr") : FileMappingHandle
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-5.dll\MapViewOfFileNuma2", "ptr", FileMappingHandle, "ptr", ProcessHandle, "uint", Offset, "ptr", BaseAddress, "ptr", ViewSize, "uint", AllocationType, "uint", PageProtection, "uint", PreferredNode, "ptr")
        if(A_LastError)
            throw OSError()

        return MEMORY_MAPPED_VIEW_ADDRESS({Value: result}, True)
    }

    /**
     * Unmaps a previously mapped view of a file or a pagefile-backed section.
     * @param {HANDLE} Process A <b>HANDLE</b> to the process from which the section
     *                     will be unmapped.
     * @param {MEMORY_MAPPED_VIEW_ADDRESS} BaseAddress The base address of a previously mapped
     *                   view that is to be unmapped.  This value must be
     *                   identical to the value returned by a previous call
     *                   to <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile2">MapViewOfFile2</a>.
     * @param {Integer} UnmapFlags 
     * @returns {BOOL} Returns <b>TRUE</b> if sucessful. Otherwise, returns <b>FALSE</b> and extended error status is available
     *             using <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-unmapviewoffile2
     * @since windows10.0.15063
     */
    static UnmapViewOfFile2(Process, BaseAddress, UnmapFlags) {
        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process
        BaseAddress := BaseAddress is Win32Handle ? NumGet(BaseAddress, "ptr") : BaseAddress

        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-5.dll\UnmapViewOfFile2", "ptr", Process, "ptr", BaseAddress, "uint", UnmapFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} Process 
     * @param {Pointer<Void>} Address 
     * @param {Pointer} Size 
     * @returns {BOOL} 
     */
    static VirtualUnlockEx(Process, Address, Size) {
        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process

        result := DllCall("api-ms-win-core-memory-l1-1-5.dll\VirtualUnlockEx", "ptr", Process, "ptr", Address, "ptr", Size, "int")
        return result
    }

    /**
     * Reserves, commits, or changes the state of a region of memory within the virtual address space of a specified process. The function initializes the memory it allocates to zero.
     * @param {HANDLE} Process The handle to a process. The function allocates memory within the virtual address space of this process.
     * 
     * The handle must have the <b>PROCESS_VM_OPERATION</b> access right. For more information, 
     *        see 
     *        <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Void>} BaseAddress The pointer that specifies a desired starting address for the region of pages that you want to allocate.
     * 
     *  If an explicit base address is specified, then it must be a multiple of the system allocation granularity. To determine the size of a page and the allocation granularity on the host computer, use the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function.
     * 
     * If <i>BaseAddress</i> is <b>NULL</b>, the function determines where to 
     *        allocate the region.
     * 
     * If this address is within an enclave that you have not initialized by calling <a href="https://docs.microsoft.com/windows/desktop/api/enclaveapi/nf-enclaveapi-initializeenclave">InitializeEnclave</a>, <b>VirtualAlloc2</b> allocates a page of zeros for the enclave at that address. The page must be previously uncommitted, and will not be measured with the EEXTEND instruction of the Intel Software Guard Extensions programming model. 
     * 
     * If the address in within an enclave that you initialized, then the allocation operation fails with the <b>ERROR_INVALID_ADDRESS</b> error.
     * @param {Pointer} Size The size of the region of memory to allocate, in bytes.
     * 
     * The size must always be a multiple of the page size.
     * 
     * If <i>BaseAddress</i> is not <b>NULL</b>, the function allocates all 
     *        pages that contain one or more bytes in the range from <i>BaseAddress</i> to 
     *        <i>BaseAddress</i>+<i>Size</i>. This means, for example, that a 2-byte 
     *        range that straddles a page boundary causes the function to allocate both pages.
     * @param {Integer} AllocationType 
     * @param {Integer} PageProtection The memory protection for the region of pages to be allocated. If the pages are being committed, you can 
     *       specify any one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/Memory/memory-protection-constants">memory protection constants</a>.
     * @param {Pointer<MEM_EXTENDED_PARAMETER>} ExtendedParameters An optional pointer to one or more extended parameters of type <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-mem_extended_parameter">MEM_EXTENDED_PARAMETER</a>. Each of those extended parameter values can itself have a <i>Type</i> field of either <b>MemExtendedParameterAddressRequirements</b> or <b>MemExtendedParameterNumaNode</b>. If no <b>MemExtendedParameterNumaNode</b> extended parameter is provided, then the behavior is the same as for the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a>/<a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> functions (that is, the preferred NUMA node for the physical pages is determined based on the ideal processor of the thread that first accesses the memory).
     * @param {Integer} ParameterCount The number of extended parameters pointed to by <i>ExtendedParameters</i>.
     * @returns {Pointer<Void>} If the function succeeds, the return value is the base address of the allocated region of pages.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-virtualalloc2
     * @since windows10.0.10240
     */
    static VirtualAlloc2(Process, BaseAddress, Size, AllocationType, PageProtection, ExtendedParameters, ParameterCount) {
        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process

        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-6.dll\VirtualAlloc2", "ptr", Process, "ptr", BaseAddress, "ptr", Size, "uint", AllocationType, "uint", PageProtection, "ptr", ExtendedParameters, "uint", ParameterCount, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Maps a view of a file or a pagefile-backed section into the address space of the specified process.
     * @param {HANDLE} FileMapping A <b>HANDLE</b> to a section that is to be mapped
     *                         into the address space of the specified process.
     * @param {HANDLE} Process A <b>HANDLE</b> to a process into which the section
     *                     will be mapped.
     * @param {Pointer<Void>} BaseAddress The desired base address of the view.
     *                   The address is rounded down to the nearest 64k boundary.
     *                   If this parameter is <b>NULL</b>, the system picks the base
     *                   address.
     * @param {Integer} Offset The offset from the beginning of the section.
     *              This must be 64k aligned.
     * @param {Pointer} ViewSize The number of bytes to map. A value of zero (0)
     *                specifies that the entire section is to be mapped.
     * 
     * The size must always be a multiple of the page size.
     * @param {Integer} AllocationType 
     * @param {Integer} PageProtection The desired page protection.
     * 
     * For file-mapping objects created with the <b>SEC_IMAGE</b> attribute, the 
     *        <i>PageProtection</i> parameter has no effect, and should be set to any valid value such as 
     *        <b>PAGE_READONLY</b>.
     * @param {Pointer<MEM_EXTENDED_PARAMETER>} ExtendedParameters An optional pointer to one or more extended parameters of type <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-mem_extended_parameter">MEM_EXTENDED_PARAMETER</a>. Each of those extended parameter values can itself have a <i>Type</i> field of either <b>MemExtendedParameterAddressRequirements</b> or <b>MemExtendedParameterNumaNode</b>. If no <b>MemExtendedParameterNumaNode</b> extended parameter is provided, then the behavior is the same as for the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a>/<a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> functions (that is, the preferred NUMA node for the physical pages is determined based on the ideal processor of the thread that first accesses the memory).
     * @param {Integer} ParameterCount The number of extended parameters pointed to by <i>ExtendedParameters</i>.
     * @returns {MEMORY_MAPPED_VIEW_ADDRESS} Returns the base address of the mapped view, if successful. Otherwise, returns <b>NULL</b> and extended error status is available
     *            using <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-mapviewoffile3
     * @since windows10.0.17134
     */
    static MapViewOfFile3(FileMapping, Process, BaseAddress, Offset, ViewSize, AllocationType, PageProtection, ExtendedParameters, ParameterCount) {
        FileMapping := FileMapping is Win32Handle ? NumGet(FileMapping, "ptr") : FileMapping
        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process

        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-6.dll\MapViewOfFile3", "ptr", FileMapping, "ptr", Process, "ptr", BaseAddress, "uint", Offset, "ptr", ViewSize, "uint", AllocationType, "uint", PageProtection, "ptr", ExtendedParameters, "uint", ParameterCount, "ptr")
        if(A_LastError)
            throw OSError()

        return MEMORY_MAPPED_VIEW_ADDRESS({Value: result}, True)
    }

    /**
     * Reserves, commits, or changes the state of a region of pages in the virtual address space of the calling process.
     * @param {HANDLE} Process The handle to a process. The function allocates memory within the virtual address space of this process.
     * 
     * The handle must have the <b>PROCESS_VM_OPERATION</b> access right. For more information, 
     *        see 
     *        <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Void>} BaseAddress The pointer that specifies a desired starting address for the region of pages that you want to allocate.
     * 
     *  If an explicit base address is specified, then it must be a multiple of the system allocation granularity. To determine the size of a page and the allocation granularity on the host computer, use the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function.
     * 
     * If <i>BaseAddress</i> is <b>NULL</b>, the function determines where to 
     *        allocate the region.
     * @param {Pointer} Size The size of the region of memory to allocate, in bytes.
     * 
     * The size must always be a multiple of the page size.
     * 
     * If <i>BaseAddress</i> is not <b>NULL</b>, the function allocates all 
     *        pages that contain one or more bytes in the range from <i>BaseAddress</i> to 
     *        <i>BaseAddress</i>+<i>Size</i>. This means, for example, that a 2-byte 
     *        range that straddles a page boundary causes the function to allocate both pages.
     * @param {Integer} AllocationType 
     * @param {Integer} PageProtection The memory protection for the region of pages to be allocated. If the pages are being committed, you can 
     *       specify one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/Memory/memory-protection-constants">memory protection constants</a>. The following constants generate an error:
     * 
     * <ul>
     * <li><b>PAGE_EXECUTE</b></li>
     * <li><b>PAGE_EXECUTE_READ</b></li>
     * <li><b>PAGE_EXECUTE_READWRITE</b></li>
     * <li><b>PAGE_EXECUTE_WRITECOPY</b></li>
     * </ul>
     * @param {Pointer<MEM_EXTENDED_PARAMETER>} ExtendedParameters An optional pointer to one or more extended parameters of type <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-mem_extended_parameter">MEM_EXTENDED_PARAMETER</a>. Each of those extended parameter values can itself have a <i>Type</i> field of either <b>MemExtendedParameterAddressRequirements</b> or <b>MemExtendedParameterNumaNode</b>. If no <b>MemExtendedParameterNumaNode</b> extended parameter is provided, then the behavior is the same as for the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a>/<a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> functions (that is, the preferred NUMA node for the physical pages is determined based on the ideal processor of the thread that first accesses the memory).
     * @param {Integer} ParameterCount The number of extended parameters pointed to by <i>ExtendedParameters</i>.
     * @returns {Pointer<Void>} If the function succeeds, the return value is the base address of the allocated region of pages.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-virtualalloc2fromapp
     * @since windows10.0.10240
     */
    static VirtualAlloc2FromApp(Process, BaseAddress, Size, AllocationType, PageProtection, ExtendedParameters, ParameterCount) {
        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process

        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-6.dll\VirtualAlloc2FromApp", "ptr", Process, "ptr", BaseAddress, "ptr", Size, "uint", AllocationType, "uint", PageProtection, "ptr", ExtendedParameters, "uint", ParameterCount, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Maps a view of a file mapping into the address space of a calling Windows Store app.
     * @param {HANDLE} FileMapping A <b>HANDLE</b> to a section that is to be mapped
     *                         into the address space of the specified process.
     * @param {HANDLE} Process A <b>HANDLE</b> to a process into which the section
     *                     will be mapped.
     * @param {Pointer<Void>} BaseAddress The desired base address of the view.
     *                   The address is rounded down to the nearest 64k boundary.
     *                   If this parameter is <b>NULL</b>, the system picks the base
     *                   address.
     * @param {Integer} Offset The offset from the beginning of the section.
     *              This must be 64k aligned.
     * @param {Pointer} ViewSize The number of bytes to map. A value of zero (0)
     *                specifies that the entire section is to be mapped.
     * 
     * The size must always be a multiple of the page size.
     * @param {Integer} AllocationType 
     * @param {Integer} PageProtection The desired page protection.
     * 
     * For file-mapping objects created with the <b>SEC_IMAGE</b> attribute, the 
     *        <i>PageProtection</i> parameter has no effect, and should be set to any valid value such as 
     *        <b>PAGE_READONLY</b>.
     * @param {Pointer<MEM_EXTENDED_PARAMETER>} ExtendedParameters An optional pointer to one or more extended parameters of type <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-mem_extended_parameter">MEM_EXTENDED_PARAMETER</a>. Each of those extended parameter values can itself have a <i>Type</i> field of either <b>MemExtendedParameterAddressRequirements</b> or <b>MemExtendedParameterNumaNode</b>. If no <b>MemExtendedParameterNumaNode</b> extended parameter is provided, then the behavior is the same as for the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a>/<a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> functions (that is, the preferred NUMA node for the physical pages is determined based on the ideal processor of the thread that first accesses the memory).
     * @param {Integer} ParameterCount The number of extended parameters pointed to by <i>ExtendedParameters</i>.
     * @returns {MEMORY_MAPPED_VIEW_ADDRESS} Returns the base address of the mapped view, if successful. Otherwise, returns <b>NULL</b> and extended error status is available
     *            using <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-mapviewoffile3fromapp
     * @since windows10.0.10240
     */
    static MapViewOfFile3FromApp(FileMapping, Process, BaseAddress, Offset, ViewSize, AllocationType, PageProtection, ExtendedParameters, ParameterCount) {
        FileMapping := FileMapping is Win32Handle ? NumGet(FileMapping, "ptr") : FileMapping
        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process

        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-6.dll\MapViewOfFile3FromApp", "ptr", FileMapping, "ptr", Process, "ptr", BaseAddress, "uint", Offset, "ptr", ViewSize, "uint", AllocationType, "uint", PageProtection, "ptr", ExtendedParameters, "uint", ParameterCount, "ptr")
        if(A_LastError)
            throw OSError()

        return MEMORY_MAPPED_VIEW_ADDRESS({Value: result}, True)
    }

    /**
     * Creates or opens a named or unnamed file mapping object for a specified file. You can specify a preferred NUMA node for the physical memory as an extended parameter; see the *ExtendedParameters* parameter.
     * @param {HANDLE} File Type: \_In\_ **[HANDLE](/windows/win32/winprog/windows-data-types)**
     * 
     * A handle to the file from which to create a file mapping object.
     * 
     * The file must be opened with access rights that are compatible with the protection flags that the <i>flProtect</i> parameter specifies. It is not required, but it is recommended that files you intend to map be opened for exclusive access. For more information, see <a href="https://docs.microsoft.com/windows/win32/FileIO/file-security-and-access-rights">File security and access rights</a>.
     * 
     * If <i>hFile</i> is <b>INVALID_HANDLE_VALUE</b>, the calling process must also specify a size for the file mapping object in the <i>dwMaximumSizeHigh</i> and <i>dwMaximumSizeLow</i> parameters. In this scenario, <b>CreateFileMapping</b> creates a file mapping object of a specified size  that is backed by the system paging file instead of by a file in the file system.
     * @param {Pointer<SECURITY_ATTRIBUTES>} SecurityAttributes Type: \_In_opt\_ **[SECURITY_ATTRIBUTES](/previous-versions/windows/desktop/legacy/aa379560(v=vs.85))\***
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that determines whether a returned handle can be inherited by child processes. The <b>lpSecurityDescriptor</b> member of the <b>SECURITY_ATTRIBUTES</b> structure specifies a security descriptor for a new file mapping object.
     * 
     * If <i>lpAttributes</i> is <b>NULL</b>, the handle cannot be inherited and the file mapping object gets a default security descriptor. The access control lists (ACL) in the default security descriptor for a file mapping object come from the primary or impersonation token of the creator. For more information, see <a href="https://docs.microsoft.com/windows/win32/Memory/file-mapping-security-and-access-rights">File Mapping Security and Access Rights</a>.
     * @param {Integer} DesiredAccess Type: \_In\_ **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * The desired access mask for the returned file mapping handle. For a list of access rights, see [File-mapping security and access rights](/windows/win32/memory/file-mapping-security-and-access-rights).
     * @param {Integer} PageProtection Type: \_In\_ **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * Specifies the page protection of the file mapping object. All mapped views of the object must be compatible with this protection.
     * @param {Integer} AllocationAttributes Type: \_In\_ **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * You can specify one or more of the following attributes for the file mapping object. Also see the *PageProtection* parameter.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_COMMIT"></a><a id="sec_commit"></a><dl>
     * <dt><b>SEC_COMMIT</b></dt>
     * <dt>0x8000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the file mapping object is backed by the operating system paging file (the 
     *          <i>hfile</i> parameter is <b>INVALID_HANDLE_VALUE</b>), specifies that 
     *          when  a view of the file is mapped into a process address space, the entire range of pages is committed 
     *          rather than reserved. The system must have enough committable pages to hold the entire mapping. Otherwise, 
     *          <b>CreateFileMapping</b> fails.
     * 
     * This attribute has no effect for file mapping objects that are backed by executable image files or data 
     *          files (the <i>hfile</i> parameter is a handle to a file).
     * 
     * <b>SEC_COMMIT</b> cannot be combined with <b>SEC_RESERVE</b>.
     * 
     * If no attribute is specified, <b>SEC_COMMIT</b> is assumed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_IMAGE"></a><a id="sec_image"></a><dl>
     * <dt><b>SEC_IMAGE</b></dt>
     * <dt>0x1000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the file that the  <i>hFile</i> parameter specifies is an executable 
     *          image file.
     * 
     * The <b>SEC_IMAGE</b> attribute must be combined with a page protection value such as 
     *          <b>PAGE_READONLY</b>. However, this page protection value has no effect on views of the 
     *          executable image file. Page protection for views of an executable image file is determined by the executable 
     *          file itself.
     * 
     * No other attributes are valid with <b>SEC_IMAGE</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_IMAGE_NO_EXECUTE"></a><a id="sec_image_no_execute"></a><dl>
     * <dt><b>SEC_IMAGE_NO_EXECUTE</b></dt>
     * <dt>0x11000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the file that the  <i>hFile</i> parameter specifies is an executable 
     *          image file that will not be executed and the loaded image file will have no forced integrity checks run. 
     *          Additionally, mapping a view of a file mapping object created with the 
     *          <b>SEC_IMAGE_NO_EXECUTE</b> attribute will not invoke driver callbacks registered using 
     *          the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntddk/nf-ntddk-pssetloadimagenotifyroutine">PsSetLoadImageNotifyRoutine</a> 
     *          kernel API.
     * 
     * The <b>SEC_IMAGE_NO_EXECUTE</b> attribute must be combined with the 
     *          <b>PAGE_READONLY</b> page protection value. No other attributes are valid with 
     *          <b>SEC_IMAGE_NO_EXECUTE</b>.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported before Windows Server 2012 and Windows 8.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_LARGE_PAGES"></a><a id="sec_large_pages"></a><dl>
     * <dt><b>SEC_LARGE_PAGES</b></dt>
     * <dt>0x80000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables large pages to be used for file mapping objects that are backed by the operating system paging file 
     *          (the <i>hfile</i> parameter is <b>INVALID_HANDLE_VALUE</b>). This 
     *          attribute is not supported for file mapping objects that are backed by executable image files or data files 
     *          (the <i>hFile</i> parameter is a handle to an executable image or data file).
     * 
     * The maximum size of the file mapping object must be a multiple of the minimum size of a large page returned 
     *          by the <a href="https://docs.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-getlargepageminimum">GetLargePageMinimum</a> function. If it is 
     *          not, <b>CreateFileMapping</b> fails. When mapping a 
     *          view of a file mapping object created with <b>SEC_LARGE_PAGES</b>, the base address and 
     *          view size must also be multiples of the minimum large page size.
     * 
     * <b>SEC_LARGE_PAGES</b> requires the 
     *          <a href="https://docs.microsoft.com/windows/win32/SecAuthZ/authorization-constants">SeLockMemoryPrivilege</a> 
     *          privilege to be enabled in the caller's token.
     * 
     * If <b>SEC_LARGE_PAGES</b> is specified, <b>SEC_COMMIT</b> must also 
     *          be specified.
     * 
     * <b>Windows Server 2003:  </b>This value is not supported until Windows Server 2003 with SP1.
     * 
     * <b>Windows XP:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_NOCACHE"></a><a id="sec_nocache"></a><dl>
     * <dt><b>SEC_NOCACHE</b></dt>
     * <dt>0x10000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets all pages to be non-cachable.
     * 
     * Applications should not use this attribute except when 
     *          explicitly required for a device. Using the interlocked functions with memory that is mapped with 
     *          <b>SEC_NOCACHE</b> can result in an 
     *          <b>EXCEPTION_ILLEGAL_INSTRUCTION</b> exception.
     * 
     * <b>SEC_NOCACHE</b> requires either the <b>SEC_RESERVE</b> or 
     *          <b>SEC_COMMIT</b> attribute to be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_RESERVE"></a><a id="sec_reserve"></a><dl>
     * <dt><b>SEC_RESERVE</b></dt>
     * <dt>0x4000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the file mapping object is backed by the operating system paging file (the 
     *          <i>hfile</i> parameter is <b>INVALID_HANDLE_VALUE</b>), specifies that 
     *          when a view of the file is mapped into a process address space, the entire range of pages is reserved for 
     *          later use by the process rather than committed.
     * 
     * Reserved pages can be committed in subsequent calls to the 
     *          <a href="https://docs.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> function. After the pages are 
     *          committed, they cannot be freed or decommitted with the 
     *          <a href="https://docs.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualfree">VirtualFree</a> function.
     * 
     * This attribute has no effect for file mapping objects that are backed by executable image files or data 
     *          files (the <i>hfile</i> parameter is a handle to a file).
     * 
     * <b>SEC_RESERVE</b> cannot be combined with <b>SEC_COMMIT</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_WRITECOMBINE"></a><a id="sec_writecombine"></a><dl>
     * <dt><b>SEC_WRITECOMBINE</b></dt>
     * <dt>0x40000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets all pages to  be write-combined.
     * 
     * Applications should not use this attribute except when 
     *          explicitly required for a device. Using the interlocked functions with memory that is mapped with 
     *          <b>SEC_WRITECOMBINE</b> can result in an 
     *          <b>EXCEPTION_ILLEGAL_INSTRUCTION</b> exception.
     * 
     * <b>SEC_WRITECOMBINE</b> requires either the <b>SEC_RESERVE</b> or 
     *          <b>SEC_COMMIT</b> attribute to be set.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This flag is not supported until Windows Vista.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} MaximumSize Type: \_In\_ **[ULONG64](/windows/win32/winprog/windows-data-types)**
     * 
     * The maximum size of the file mapping object.
     * 
     * If this parameter is 0 (zero), then the maximum size of the file mapping object is equal to the current size of the file that <i>hFile</i> identifies.
     * 
     * An attempt to map a file with a length of 0 (zero) fails with an error code of <b>ERROR_FILE_INVALID</b>. You should test for files with a length of 0 (zero), and reject those files.
     * @param {PWSTR} Name Type: \_In_opt\_ **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * The name of the file mapping object.
     * 
     * If this parameter matches the name of an existing mapping object, then the function requests access to the object with the protection that <i>flProtect</i> specifies.
     * 
     * If this parameter is <b>NULL</b>, then the file mapping object is created without a name.
     * 
     * If <i>lpName</i> matches the name of an existing event, semaphore, mutex, waitable timer, or job object, the function fails, and the <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). Creating a file mapping object in the global namespace from a session other than session zero requires the <a href="https://docs.microsoft.com/windows/win32/SecAuthZ/authorization-constants">SeCreateGlobalPrivilege</a> privilege. For more information, see <a href="https://docs.microsoft.com/windows/win32/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>.
     * 
     * Fast user switching is implemented by using Terminal Services sessions. The first user to log on uses session 0 (zero), the next user to log on uses session 1 (one), and so on. Kernel object names must follow the guidelines that are outlined for Terminal Services so that applications can support multiple users.
     * @param {Pointer<MEM_EXTENDED_PARAMETER>} ExtendedParameters Type: \_Inout\_updates\_opt\_(ParameterCount) **[MEM_EXTENDED_PARAMETER](/windows/win32/api/winnt/ns-winnt-mem_extended_parameter)\***
     * 
     * An optional pointer to one or more extended parameters of type <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-mem_extended_parameter">MEM_EXTENDED_PARAMETER</a>. Each of those extended parameter values can itself have a <i>Type</i> field of either <b>MemExtendedParameterAddressRequirements</b> or <b>MemExtendedParameterNumaNode</b>. If no <b>MemExtendedParameterNumaNode</b> extended parameter is provided, then the behavior is the same as for the <a href="https://docs.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a>/<a href="https://docs.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> functions (that is, the preferred NUMA node for the physical pages is determined based on the ideal processor of the thread that first accesses the memory).
     * @param {Integer} ParameterCount _In_ ULONG ParameterCount
     * 
     * The number of extended parameters pointed to by *ExtendedParameters*.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the newly created file mapping object.
     * 
     * If the object exists before the function call, the function returns a handle to the existing object (with its current size, not the specified size), and <a href="/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-createfilemapping2
     */
    static CreateFileMapping2(File, SecurityAttributes, DesiredAccess, PageProtection, AllocationAttributes, MaximumSize, Name, ExtendedParameters, ParameterCount) {
        File := File is Win32Handle ? NumGet(File, "ptr") : File
        Name := Name is String ? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-7.dll\CreateFileMapping2", "ptr", File, "ptr", SecurityAttributes, "uint", DesiredAccess, "uint", PageProtection, "uint", AllocationAttributes, "uint", MaximumSize, "ptr", Name, "ptr", ExtendedParameters, "uint", ParameterCount, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {HANDLE} ObjectHandle 
     * @param {Pointer<Pointer>} NumberOfPages 
     * @param {Pointer<Pointer>} PageArray 
     * @param {Pointer<MEM_EXTENDED_PARAMETER>} ExtendedParameters 
     * @param {Integer} ExtendedParameterCount 
     * @returns {BOOL} 
     */
    static AllocateUserPhysicalPages2(ObjectHandle, NumberOfPages, PageArray, ExtendedParameters, ExtendedParameterCount) {
        ObjectHandle := ObjectHandle is Win32Handle ? NumGet(ObjectHandle, "ptr") : ObjectHandle

        result := DllCall("api-ms-win-core-memory-l1-1-8.dll\AllocateUserPhysicalPages2", "ptr", ObjectHandle, "ptr*", NumberOfPages, "ptr*", PageArray, "ptr", ExtendedParameters, "uint", ExtendedParameterCount, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} Partition 
     * @param {Integer} DedicatedMemoryTypeId 
     * @param {Integer} DesiredAccess 
     * @param {BOOL} InheritHandle 
     * @returns {HANDLE} 
     */
    static OpenDedicatedMemoryPartition(Partition, DedicatedMemoryTypeId, DesiredAccess, InheritHandle) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("api-ms-win-core-memory-l1-1-8.dll\OpenDedicatedMemoryPartition", "ptr", Partition, "uint", DedicatedMemoryTypeId, "uint", DesiredAccess, "int", InheritHandle, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {HANDLE} Partition 
     * @param {Integer} PartitionInformationClass 
     * @param {Pointer} PartitionInformation 
     * @param {Integer} PartitionInformationLength 
     * @returns {BOOL} 
     */
    static QueryPartitionInformation(Partition, PartitionInformationClass, PartitionInformation, PartitionInformationLength) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("api-ms-win-core-memory-l1-1-8.dll\QueryPartitionInformation", "ptr", Partition, "int", PartitionInformationClass, "ptr", PartitionInformation, "uint", PartitionInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} TargetNodeNumber 
     * @param {Pointer<Integer>} InitiatorNodeNumber 
     * @returns {BOOL} 
     */
    static GetMemoryNumaClosestInitiatorNode(TargetNodeNumber, InitiatorNodeNumber) {
        result := DllCall("api-ms-win-core-memory-l1-1-9.dll\GetMemoryNumaClosestInitiatorNode", "uint", TargetNodeNumber, "uint*", InitiatorNodeNumber, "int")
        return result
    }

    /**
     * 
     * @param {Integer} NodeNumber 
     * @param {Integer} DataType 
     * @param {Pointer<Pointer<WIN32_MEMORY_NUMA_PERFORMANCE_INFORMATION_OUTPUT>>} PerfInfo 
     * @returns {BOOL} 
     */
    static GetMemoryNumaPerformanceInformation(NodeNumber, DataType, PerfInfo) {
        result := DllCall("api-ms-win-core-memory-l1-1-9.dll\GetMemoryNumaPerformanceInformation", "uint", NodeNumber, "char", DataType, "ptr*", PerfInfo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Source1 
     * @param {Pointer<Void>} Source2 
     * @param {Pointer} Length 
     * @returns {Pointer} 
     */
    static RtlCompareMemory(Source1, Source2, Length) {
        result := DllCall("KERNEL32.dll\RtlCompareMemory", "ptr", Source1, "ptr", Source2, "ptr", Length, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer} Buffer 
     * @param {Pointer} Size 
     * @param {Integer} InitialCrc 
     * @returns {Integer} 
     */
    static RtlCrc32(Buffer, Size, InitialCrc) {
        result := DllCall("ntdll.dll\RtlCrc32", "ptr", Buffer, "ptr", Size, "uint", InitialCrc, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer} Buffer 
     * @param {Pointer} Size 
     * @param {Integer} InitialCrc 
     * @returns {Integer} 
     */
    static RtlCrc64(Buffer, Size, InitialCrc) {
        result := DllCall("ntdll.dll\RtlCrc64", "ptr", Buffer, "ptr", Size, "uint", InitialCrc, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Buffer 
     * @param {Pointer} Length 
     * @returns {BOOLEAN} 
     */
    static RtlIsZeroMemory(Buffer, Length) {
        result := DllCall("ntdll.dll\RtlIsZeroMemory", "ptr", Buffer, "ptr", Length, "char")
        return result
    }

    /**
     * Allocates the specified number of bytes from the heap.
     * @param {Integer} uFlags 
     * @param {Pointer} dwBytes The number of bytes to allocate. If this parameter is zero and the <i>uFlags</i> parameter specifies <b>GMEM_MOVEABLE</b>, the function returns a handle to a memory object that is marked as discarded.
     * @returns {HGLOBAL} If the function succeeds, the return value is a handle to the newly allocated memory object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-globalalloc
     * @since windows5.1.2600
     */
    static GlobalAlloc(uFlags, dwBytes) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalAlloc", "uint", uFlags, "ptr", dwBytes, "ptr")
        if(A_LastError)
            throw OSError()

        return HGLOBAL({Value: result}, True)
    }

    /**
     * Changes the size or attributes of a specified global memory object. The size can increase or decrease.
     * @param {HGLOBAL} hMem A handle to the global memory object to be reallocated. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or 
     * <b>GlobalReAlloc</b> function.
     * @param {Pointer} dwBytes The new size of the memory block, in bytes. If <i>uFlags</i> specifies <b>GMEM_MODIFY</b>, this parameter is ignored.
     * @param {Integer} uFlags The reallocation options. If <b>GMEM_MODIFY</b> is specified, the function modifies the attributes of the memory object only (the <i>dwBytes</i> parameter is ignored.) Otherwise, the function reallocates the memory object.
     * 
     * You can optionally combine <b>GMEM_MODIFY</b> with the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GMEM_MOVEABLE"></a><a id="gmem_moveable"></a><dl>
     * <dt><b>GMEM_MOVEABLE</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allocates movable memory.
     * 
     * If the memory is a locked <b>GMEM_MOVEABLE</b> memory block or a <b>GMEM_FIXED</b> memory block and this flag is not specified, the memory can only be reallocated in place.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If this parameter does not specify <b>GMEM_MODIFY</b>, you can use the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GMEM_ZEROINIT"></a><a id="gmem_zeroinit"></a><dl>
     * <dt><b>GMEM_ZEROINIT</b></dt>
     * <dt>0x0040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes the additional memory contents to be initialized to zero if the memory object is growing in size.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HGLOBAL} If the function succeeds, the return value is a handle to the reallocated memory object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-globalrealloc
     * @since windows5.1.2600
     */
    static GlobalReAlloc(hMem, dwBytes, uFlags) {
        hMem := hMem is Win32Handle ? NumGet(hMem, "ptr") : hMem

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalReAlloc", "ptr", hMem, "ptr", dwBytes, "uint", uFlags, "ptr")
        if(A_LastError)
            throw OSError()

        return HGLOBAL({Value: result}, True)
    }

    /**
     * Retrieves the current size of the specified global memory object, in bytes.
     * @param {HGLOBAL} hMem A handle to the global memory object. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> function.
     * @returns {Pointer} If the function succeeds, the return value is the size of the specified global memory object, in bytes.
     * 
     * If the specified handle is not valid or if the object has been discarded, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-globalsize
     * @since windows5.1.2600
     */
    static GlobalSize(hMem) {
        hMem := hMem is Win32Handle ? NumGet(hMem, "ptr") : hMem

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalSize", "ptr", hMem, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Decrements the lock count associated with a memory object that was allocated with GMEM_MOVEABLE.
     * @param {HGLOBAL} hMem A handle to the global memory object. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> function.
     * @returns {BOOL} If the memory object is still locked after decrementing the lock count, the return value is a nonzero value. If the memory object is unlocked after decrementing the lock count, the function returns zero and <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is zero and 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns a value other than <b>NO_ERROR</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-globalunlock
     * @since windows5.1.2600
     */
    static GlobalUnlock(hMem) {
        hMem := hMem is Win32Handle ? NumGet(hMem, "ptr") : hMem

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalUnlock", "ptr", hMem, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locks a global memory object and returns a pointer to the first byte of the object's memory block.
     * @param {HGLOBAL} hMem A handle to the global memory object. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> function.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a pointer to the first byte of the memory block.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-globallock
     * @since windows5.1.2600
     */
    static GlobalLock(hMem) {
        hMem := hMem is Win32Handle ? NumGet(hMem, "ptr") : hMem

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalLock", "ptr", hMem, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the specified global memory object.
     * @param {HGLOBAL} hMem A handle to the global memory object. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> function.
     * @returns {Integer} If the function succeeds, the return value specifies the allocation values and the lock count for the memory object.
     * 
     * If the function fails, the return value is <b>GMEM_INVALID_HANDLE</b>, indicating that the global handle is not valid. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-globalflags
     * @since windows5.1.2600
     */
    static GlobalFlags(hMem) {
        hMem := hMem is Win32Handle ? NumGet(hMem, "ptr") : hMem

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalFlags", "ptr", hMem, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the handle associated with the specified pointer to a global memory block.
     * @param {Pointer<Void>} pMem A pointer to the first byte of the global memory block. This pointer is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globallock">GlobalLock</a> function.
     * @returns {HGLOBAL} If the function succeeds, the return value is a handle to the specified global memory object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-globalhandle
     * @since windows5.1.2600
     */
    static GlobalHandle(pMem) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalHandle", "ptr", pMem, "ptr")
        if(A_LastError)
            throw OSError()

        return HGLOBAL({Value: result}, True)
    }

    /**
     * Allocates the specified number of bytes from the heap.
     * @param {Integer} uFlags 
     * @param {Pointer} uBytes The number of bytes to allocate. If this parameter is zero and the <i>uFlags</i> parameter specifies <b>LMEM_MOVEABLE</b>, the function returns a handle to a memory object that is marked as discarded.
     * @returns {HLOCAL} If the function succeeds, the return value is a handle to the newly allocated memory object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-localalloc
     * @since windows5.1.2600
     */
    static LocalAlloc(uFlags, uBytes) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\LocalAlloc", "uint", uFlags, "ptr", uBytes, "ptr")
        if(A_LastError)
            throw OSError()

        return HLOCAL({Value: result}, True)
    }

    /**
     * Changes the size or the attributes of a specified local memory object. The size can increase or decrease.
     * @param {HLOCAL} hMem A handle to the local memory object to be reallocated. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or 
     * <b>LocalReAlloc</b> function.
     * @param {Pointer} uBytes The new size of the memory block, in bytes. If <i>uFlags</i> specifies <b>LMEM_MODIFY</b>, this parameter is ignored.
     * @param {Integer} uFlags The reallocation options. If <b>LMEM_MODIFY</b> is specified, the function modifies the attributes of the memory object only (the <i>uBytes</i> parameter is ignored.) Otherwise, the function reallocates the memory object.
     * 
     * You can optionally combine <b>LMEM_MODIFY</b> with the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LMEM_MOVEABLE"></a><a id="lmem_moveable"></a><dl>
     * <dt><b>LMEM_MOVEABLE</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allocates fixed or movable memory. 
     * 
     * 
     * 
     * 
     * If the memory is a locked <b>LMEM_MOVEABLE</b> memory block or a <b>LMEM_FIXED</b> memory block and this flag is not specified, the memory can only be reallocated in place.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If this parameter does not specify <b>LMEM_MODIFY</b>, you can use the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LMEM_ZEROINIT"></a><a id="lmem_zeroinit"></a><dl>
     * <dt><b>LMEM_ZEROINIT</b></dt>
     * <dt>0x0040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes the additional memory contents to be initialized to zero if the memory object is growing in size.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HLOCAL} If the function succeeds, the return value is a handle to the reallocated memory object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-localrealloc
     * @since windows5.1.2600
     */
    static LocalReAlloc(hMem, uBytes, uFlags) {
        hMem := hMem is Win32Handle ? NumGet(hMem, "ptr") : hMem

        A_LastError := 0

        result := DllCall("KERNEL32.dll\LocalReAlloc", "ptr", hMem, "ptr", uBytes, "uint", uFlags, "ptr")
        if(A_LastError)
            throw OSError()

        return HLOCAL({Value: result}, True)
    }

    /**
     * Locks a local memory object and returns a pointer to the first byte of the object's memory block.
     * @param {HLOCAL} hMem A handle to the local memory object. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localrealloc">LocalReAlloc</a> function.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a pointer to the first byte of the memory block.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-locallock
     * @since windows5.1.2600
     */
    static LocalLock(hMem) {
        hMem := hMem is Win32Handle ? NumGet(hMem, "ptr") : hMem

        A_LastError := 0

        result := DllCall("KERNEL32.dll\LocalLock", "ptr", hMem, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the handle associated with the specified pointer to a local memory object.
     * @param {Pointer<Void>} pMem A pointer to the first byte of the local memory object. This pointer is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-locallock">LocalLock</a> function.
     * @returns {HLOCAL} If the function succeeds, the return value is a handle to the specified local memory object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-localhandle
     * @since windows5.1.2600
     */
    static LocalHandle(pMem) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\LocalHandle", "ptr", pMem, "ptr")
        if(A_LastError)
            throw OSError()

        return HLOCAL({Value: result}, True)
    }

    /**
     * Decrements the lock count associated with a memory object that was allocated with LMEM_MOVEABLE.
     * @param {HLOCAL} hMem A handle to the local memory object. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localrealloc">LocalReAlloc</a> function.
     * @returns {BOOL} If the memory object is still locked after decrementing the lock count, the return value is nonzero. If the memory object is unlocked after decrementing the lock count, the function returns zero and <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is zero and 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns a value other than <b>NO_ERROR</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-localunlock
     * @since windows5.1.2600
     */
    static LocalUnlock(hMem) {
        hMem := hMem is Win32Handle ? NumGet(hMem, "ptr") : hMem

        A_LastError := 0

        result := DllCall("KERNEL32.dll\LocalUnlock", "ptr", hMem, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the current size of the specified local memory object, in bytes.
     * @param {HLOCAL} hMem A handle to the local memory object. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localrealloc">LocalReAlloc</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localhandle">LocalHandle</a> function.
     * @returns {Pointer} If the function succeeds, the return value is the size of the specified local memory object, in bytes. If the specified handle is not valid or if the object has been discarded, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-localsize
     * @since windows5.1.2600
     */
    static LocalSize(hMem) {
        hMem := hMem is Win32Handle ? NumGet(hMem, "ptr") : hMem

        A_LastError := 0

        result := DllCall("KERNEL32.dll\LocalSize", "ptr", hMem, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the specified local memory object.
     * @param {HLOCAL} hMem A handle to the local memory object. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localrealloc">LocalReAlloc</a> function.
     * @returns {Integer} If the function succeeds, the return value specifies the allocation values and the lock count for the memory object.
     * 
     * If the function fails, the return value is <b>LMEM_INVALID_HANDLE</b>, indicating that the local handle is not valid. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-localflags
     * @since windows5.1.2600
     */
    static LocalFlags(hMem) {
        hMem := hMem is Win32Handle ? NumGet(hMem, "ptr") : hMem

        A_LastError := 0

        result := DllCall("KERNEL32.dll\LocalFlags", "ptr", hMem, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates or opens a named or unnamed file mapping object for a specified file.
     * @param {HANDLE} hFile A handle to the file from which to create a file mapping object.
     * 
     * The file must be opened with access rights that are compatible with the protection flags that the 
     *        <i>flProtect</i> parameter specifies. It is not required, but it is recommended that files 
     *        you intend to map be opened for exclusive access. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-security-and-access-rights">File Security and Access Rights</a>.
     * 
     * If <i>hFile</i> is <b>INVALID_HANDLE_VALUE</b>, the calling process 
     *        must also specify a size for the file mapping object in the <i>dwMaximumSizeHigh</i> and 
     *        <i>dwMaximumSizeLow</i> parameters. In this scenario, 
     *        <b>CreateFileMapping</b> creates a file mapping object 
     *        of a specified size  that is backed by the system paging file instead of by a file in the file system.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpFileMappingAttributes A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> 
     *        structure that determines whether a returned handle can be inherited by child processes. The 
     *       <b>lpSecurityDescriptor</b> member of the 
     *       <b>SECURITY_ATTRIBUTES</b> structure specifies a 
     *       security descriptor for a new file mapping object.
     * 
     * If <i>lpFileMappingAttributes</i> is <b>NULL</b>, the handle cannot be inherited 
     *       and the file mapping object gets a default security descriptor. The access control lists (ACL) in the default 
     *       security descriptor for a file mapping object come from the primary or impersonation token of the creator. For 
     *       more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/Memory/file-mapping-security-and-access-rights">File Mapping Security and Access Rights</a>.
     * @param {Integer} flProtect Specifies the page protection of the file mapping object. All mapped views of the object must be compatible 
     *        with this protection.
     * @param {Integer} dwMaximumSizeHigh The high-order <b>DWORD</b> of the maximum size of the file mapping object.
     * @param {Integer} dwMaximumSizeLow The low-order <b>DWORD</b> of the maximum size of the file mapping object.
     * 
     * If this parameter and <i>dwMaximumSizeHigh</i> are 0 (zero), the maximum size of the file 
     *        mapping object is equal to the current size of the file that  <i>hFile</i> identifies.
     * 
     * An attempt to map a file with a length of 0 (zero) fails with an error code of 
     *        <b>ERROR_FILE_INVALID</b>. Applications should test for files with a length of 0 (zero) and 
     *        reject those files.
     * @param {PSTR} lpName The name of the file mapping object.
     * 
     * If this parameter matches the name of an existing mapping object, the function requests access to the 
     *        object with the protection that <i>flProtect</i> specifies.
     * 
     * If this parameter is <b>NULL</b>, the file mapping object is created without a name.
     * 
     * If <i>lpName</i> matches the name of an existing event, semaphore, mutex, waitable timer, or 
     *        job object, the function fails, and the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> 
     *        function returns <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the 
     *        same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the 
     *        object in the global or session namespace. The remainder of the name can contain any character except the 
     *        backslash character (\\). Creating a file mapping object in the global namespace from a session other than 
     *        session zero requires the 
     *        <a href="https://docs.microsoft.com/windows/win32/secauthz/privilege-constants">SeCreateGlobalPrivilege</a> 
     *        privilege. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>.
     * 
     * Fast user switching is implemented by using Terminal Services sessions. The first user to log on uses session 
     *        0 (zero), the next user to log on uses session 1 (one), and so on. Kernel object names must follow the 
     *        guidelines that are outlined for Terminal Services so that applications can support multiple users.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the newly created file mapping object.
     * 
     * If the object exists before the function call, the function returns a handle to the existing object (with its 
     *        current size, not the specified size), and <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-createfilemappinga
     * @since windows5.1.2600
     */
    static CreateFileMappingA(hFile, lpFileMappingAttributes, flProtect, dwMaximumSizeHigh, dwMaximumSizeLow, lpName) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateFileMappingA", "ptr", hFile, "ptr", lpFileMappingAttributes, "uint", flProtect, "uint", dwMaximumSizeHigh, "uint", dwMaximumSizeLow, "ptr", lpName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Creates or opens a named or unnamed file mapping object for a specified file and specifies the NUMA node for the physical memory.
     * @param {HANDLE} hFile A handle to the file from which to create a file mapping object. 
     * 
     * The file must be opened with access 
     *        rights that are compatible with the protection flags that the <i>flProtect</i> parameter 
     *        specifies. It is not required, but it is recommended that files you intend to map be opened for exclusive 
     *        access. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-security-and-access-rights">File Security and Access Rights</a>.
     * 
     * If <i>hFile</i> is <b>INVALID_HANDLE_VALUE</b>, the calling process 
     *        must also specify a size for the file mapping object in the <i>dwMaximumSizeHigh</i> and 
     *        <i>dwMaximumSizeLow</i> parameters. In this scenario, 
     *        <b>CreateFileMappingNuma</b> creates a file mapping 
     *        object of a specified size  that is backed by the system paging file instead of by a file in the file 
     *        system.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpFileMappingAttributes A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> 
     *        structure that determines whether a returned handle can be inherited by child processes. The 
     *        <b>lpSecurityDescriptor</b> member of the  
     *        <b>SECURITY_ATTRIBUTES</b> structure specifies a 
     *        security descriptor for a new file mapping object.
     * 
     * If <i>lpFileMappingAttributes</i> is <b>NULL</b>, the handle cannot be 
     *        inherited and the file mapping object gets a default security descriptor. The access control lists (ACL) in the 
     *        default security descriptor for a file mapping object come from the primary or impersonation token of the 
     *        creator. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Memory/file-mapping-security-and-access-rights">File Mapping Security and Access Rights</a>.
     * @param {Integer} flProtect Specifies the page protection of the file mapping object. All mapped views of the object must be compatible 
     *        with this protection.
     * @param {Integer} dwMaximumSizeHigh The high-order <b>DWORD</b> of the maximum size of the file mapping object.
     * @param {Integer} dwMaximumSizeLow The low-order <b>DWORD</b> of the maximum size of the file mapping object.
     * 
     * If this parameter and the <i>dwMaximumSizeHigh</i> parameter are 0 (zero), the maximum 
     *         size of the file mapping object is equal to the current size of the file that the 
     *         <i>hFile</i> parameter identifies.
     * 
     * An attempt to map a file with a length of 0 (zero) fails with an error code of 
     *         <b>ERROR_FILE_INVALID</b>. Applications should test for files with a length of 0 (zero) and 
     *         reject those files.
     * @param {PSTR} lpName The name of the file mapping object.
     * 
     * If this parameter matches the name of an existing file mapping object, the function requests access to the 
     *         object with the protection that the <i>flProtect</i> parameter specifies.
     * 
     * If this parameter is <b>NULL</b>, the file mapping object is created without a name.
     * 
     * If the <i>lpName</i> parameter matches the name of an existing event, semaphore, mutex, 
     *         waitable timer, or job object, the function fails and the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns 
     *         <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the 
     *         object in the global or session namespace. The remainder of the name can contain any character except the 
     *         backslash character (\\). Creating a file mapping object in the global namespace requires the 
     *         <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">SeCreateGlobalPrivilege</a> 
     *         privilege. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>.
     * 
     * Fast user switching is implemented by using Terminal Services sessions. The first user to log on uses 
     *         session 0 (zero), the next user to log on uses session 1 (one), and so on. Kernel object names must follow the 
     *         guidelines so that applications can support multiple users.
     * @param {Integer} nndPreferred The NUMA node where the physical memory should reside.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NUMA_NO_PREFERRED_NODE"></a><a id="numa_no_preferred_node"></a><dl>
     * <dt><b>NUMA_NO_PREFERRED_NODE</b></dt>
     * <dt>0xffffffff</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No NUMA node is preferred. This is the same as calling the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfilemappinga">CreateFileMapping</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the file mapping object.
     * 
     * If the object exists 
     *        before the function call, the function returns a handle to the existing object (with its current size, not the 
     *        specified size) and the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>function returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-createfilemappingnumaa
     * @since windows6.0.6000
     */
    static CreateFileMappingNumaA(hFile, lpFileMappingAttributes, flProtect, dwMaximumSizeHigh, dwMaximumSizeLow, lpName, nndPreferred) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateFileMappingNumaA", "ptr", hFile, "ptr", lpFileMappingAttributes, "uint", flProtect, "uint", dwMaximumSizeHigh, "uint", dwMaximumSizeLow, "ptr", lpName, "uint", nndPreferred, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Opens a named file mapping object.
     * @param {Integer} dwDesiredAccess The access to the file mapping object. This access is checked against any security descriptor on the target 
     *       file mapping object. For a list of values, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/Memory/file-mapping-security-and-access-rights">File Mapping Security and Access Rights</a>.
     * @param {BOOL} bInheritHandle If this parameter is <b>TRUE</b>, a process created by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function can inherit the handle; 
     *       otherwise, the handle cannot be inherited.
     * @param {PSTR} lpName The name of the file mapping object to be opened. If there is an open handle to a file mapping object by 
     *       this name and the security descriptor on the mapping object does not conflict with the 
     *       <i>dwDesiredAccess</i> parameter, the open operation succeeds. The name can have a 
     *       "Global\\" or "Local\\" prefix to explicitly open an object in the global or 
     *       session namespace. The remainder of the name can contain any character except the backslash character (\\). For 
     *       more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user 
     *       switching is implemented using Terminal Services sessions. The first user to log on uses session 0, the next 
     *       user to log on uses session 1, and so on. Kernel object names must follow the guidelines outlined for Terminal 
     *       Services so that applications can support multiple users.
     * @returns {HANDLE} If the function succeeds, the return value is an open handle to the specified file mapping object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-openfilemappinga
     * @since windows5.1.2600
     */
    static OpenFileMappingA(dwDesiredAccess, bInheritHandle, lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\OpenFileMappingA", "uint", dwDesiredAccess, "int", bInheritHandle, "ptr", lpName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Maps a view of a file mapping into the address space of a calling process and specifies the NUMA node for the physical memory.
     * @param {HANDLE} hFileMappingObject A handle to a file mapping object. The 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfilemappingnumaa">CreateFileMappingNuma</a> and 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openfilemappinga">OpenFileMapping</a> functions return this handle.
     * @param {Integer} dwDesiredAccess The type of access to a file mapping object, which determines the page protection of the pages. This
     * @param {Integer} dwFileOffsetHigh The high-order <b>DWORD</b> of the file offset where the view is to begin.
     * @param {Integer} dwFileOffsetLow The low-order <b>DWORD</b> of the file offset where the view is to begin. The 
     *       combination of the high and low offsets must specify an offset within the file mapping. They must also match the 
     *       memory allocation granularity of the system. That is, the offset must be a multiple of the allocation 
     *       granularity. To obtain the memory allocation granularity of the system, use the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function, which fills in the members of 
     *       a <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/ns-sysinfoapi-system_info">SYSTEM_INFO</a> structure.
     * @param {Pointer} dwNumberOfBytesToMap The number of bytes of a file mapping to map to a view. All bytes must be within the maximum size specified 
     *       by <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfilemappinga">CreateFileMapping</a>. If this parameter is 0 
     *       (zero), the mapping extends from the specified offset to the end of the file mapping.
     * @param {Pointer<Void>} lpBaseAddress A pointer to the memory address in the calling process address space where mapping begins. This must be a 
     *        multiple of the system's memory allocation granularity, or the function fails. To determine the memory 
     *        allocation granularity of the system, use the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function. If there is not enough 
     *        address space at the specified address, the function fails.
     * 
     * If the <i>lpBaseAddress</i> parameter is <b>NULL</b>, the operating 
     *        system chooses the mapping address.
     * 
     * While it is possible to specify an address that is safe now (not used by the operating system), there is no 
     *        guarantee that the address will remain safe over time. Therefore, it is better to let the operating system 
     *        choose the address. In this case, you would not store pointers in the memory mapped file; you would store 
     *        offsets from the base of the file mapping so that the mapping can be used at any address.
     * @param {Integer} nndPreferred The NUMA node where the physical memory should reside.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NUMA_NO_PREFERRED_NODE"></a><a id="numa_no_preferred_node"></a><dl>
     * <dt><b>NUMA_NO_PREFERRED_NODE</b></dt>
     * <dt>0xffffffff</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No NUMA node is preferred. This is the same as calling the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffileex">MapViewOfFileEx</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {MEMORY_MAPPED_VIEW_ADDRESS} If the function succeeds, the return value is the starting address of the mapped view.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-mapviewoffileexnuma
     * @since windows6.0.6000
     */
    static MapViewOfFileExNuma(hFileMappingObject, dwDesiredAccess, dwFileOffsetHigh, dwFileOffsetLow, dwNumberOfBytesToMap, lpBaseAddress, nndPreferred) {
        hFileMappingObject := hFileMappingObject is Win32Handle ? NumGet(hFileMappingObject, "ptr") : hFileMappingObject

        A_LastError := 0

        result := DllCall("KERNEL32.dll\MapViewOfFileExNuma", "ptr", hFileMappingObject, "uint", dwDesiredAccess, "uint", dwFileOffsetHigh, "uint", dwFileOffsetLow, "ptr", dwNumberOfBytesToMap, "ptr", lpBaseAddress, "uint", nndPreferred, "ptr")
        if(A_LastError)
            throw OSError()

        return MEMORY_MAPPED_VIEW_ADDRESS({Value: result}, True)
    }

    /**
     * Verifies that the calling process has read access to the specified range of memory.
     * @param {Pointer<Void>} lp A pointer to the first byte of the memory block.
     * @param {Pointer} ucb The size of the memory block, in bytes. If this parameter is zero, the return value is zero.
     * @returns {BOOL} If the calling process has read access to all bytes in the specified memory range, the return value is zero.
     * 
     * If the calling process does not have read access to all bytes in the specified memory range, the return value is nonzero.
     * 
     * If the application is compiled as a debugging version, and the process does not have read access to all bytes in the specified memory range, the function causes an assertion and breaks into the debugger. Leaving the debugger, the function continues as usual, and returns a nonzero value. This behavior is by design, as a debugging aid.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-isbadreadptr
     * @since windows5.1.2600
     */
    static IsBadReadPtr(lp, ucb) {
        result := DllCall("KERNEL32.dll\IsBadReadPtr", "ptr", lp, "ptr", ucb, "int")
        return result
    }

    /**
     * Verifies that the calling process has write access to the specified range of memory.
     * @param {Pointer<Void>} lp A pointer to the first byte of the memory block.
     * @param {Pointer} ucb The size of the memory block, in bytes. If this parameter is zero, the return value is zero.
     * @returns {BOOL} If the calling process has write access to all bytes in the specified memory range, the return value is zero.
     * 
     * If the calling process does not have write access to all bytes in the specified memory range, the return value is nonzero.
     * 
     * If the application is run under a debugger and the process does not have write access to all bytes in the specified memory range, the function causes a first chance STATUS_ACCESS_VIOLATION exception. The debugger can be configured to break for this condition. After resuming process execution in the debugger, the function continues as usual and returns a nonzero value This behavior is by design and serves as a debugging aid.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-isbadwriteptr
     * @since windows5.1.2600
     */
    static IsBadWritePtr(lp, ucb) {
        result := DllCall("KERNEL32.dll\IsBadWritePtr", "ptr", lp, "ptr", ucb, "int")
        return result
    }

    /**
     * Determines whether the calling process has read access to the memory at the specified address.
     * @param {Pointer<FARPROC>} lpfn A pointer to a memory address.
     * @returns {BOOL} If the calling process has read access to the specified memory, the return value is zero.
     * 
     * If the calling process does not have read access to the specified memory, the return value is nonzero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the application is compiled as a debugging version, and the process does not have read access to  the specified memory location, the function causes an assertion and breaks into the debugger. Leaving the debugger, the function continues as usual, and returns a nonzero value. This behavior is by design, as a debugging aid.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-isbadcodeptr
     * @since windows5.1.2600
     */
    static IsBadCodePtr(lpfn) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\IsBadCodePtr", "ptr", lpfn, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Verifies that the calling process has read access to the specified range of memory.
     * @param {PSTR} lpsz A pointer to a null-terminated string, either Unicode or ASCII.
     * @param {Pointer} ucchMax The maximum size of the string, in <b>TCHARs</b>. The function checks for read access in all characters up to the string's terminating null character or up to the number of characters specified by this parameter, whichever is smaller. If this parameter is zero, the return value is zero.
     * @returns {BOOL} If the calling process has read access to all characters up to the string's terminating null character or up to the number of characters specified by <i>ucchMax</i>, the return value is zero.
     * 
     * If the calling process does not have read access to all characters up to the string's terminating null character or up to the number of characters specified by <i>ucchMax</i>, the return value is nonzero.
     * 
     * If the application is compiled as a debugging version, and the process does not have read access to the entire memory range specified, the function causes an assertion and breaks into the debugger. Leaving the debugger, the function continues as usual, and returns a nonzero value This behavior is by design, as a debugging aid.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-isbadstringptra
     * @since windows5.1.2600
     */
    static IsBadStringPtrA(lpsz, ucchMax) {
        lpsz := lpsz is String ? StrPtr(lpsz) : lpsz

        result := DllCall("KERNEL32.dll\IsBadStringPtrA", "ptr", lpsz, "ptr", ucchMax, "int")
        return result
    }

    /**
     * Verifies that the calling process has read access to the specified range of memory.
     * @param {PWSTR} lpsz A pointer to a null-terminated string, either Unicode or ASCII.
     * @param {Pointer} ucchMax The maximum size of the string, in <b>TCHARs</b>. The function checks for read access in all characters up to the string's terminating null character or up to the number of characters specified by this parameter, whichever is smaller. If this parameter is zero, the return value is zero.
     * @returns {BOOL} If the calling process has read access to all characters up to the string's terminating null character or up to the number of characters specified by <i>ucchMax</i>, the return value is zero.
     * 
     * If the calling process does not have read access to all characters up to the string's terminating null character or up to the number of characters specified by <i>ucchMax</i>, the return value is nonzero.
     * 
     * If the application is compiled as a debugging version, and the process does not have read access to the entire memory range specified, the function causes an assertion and breaks into the debugger. Leaving the debugger, the function continues as usual, and returns a nonzero value This behavior is by design, as a debugging aid.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-isbadstringptrw
     * @since windows5.1.2600
     */
    static IsBadStringPtrW(lpsz, ucchMax) {
        lpsz := lpsz is String ? StrPtr(lpsz) : lpsz

        result := DllCall("KERNEL32.dll\IsBadStringPtrW", "ptr", lpsz, "ptr", ucchMax, "int")
        return result
    }

    /**
     * Maps previously allocated physical memory pages at a specified address in an Address Windowing Extensions (AWE) region.
     * @param {Pointer<Pointer<Void>>} VirtualAddresses A pointer to an array of starting addresses of the regions of memory to remap. 
     * 
     * Each entry in 
     *       <i>VirtualAddresses</i> must be within the address range that the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> function returns when the <a href="https://docs.microsoft.com/windows/desktop/Memory/address-windowing-extensions">Address Windowing Extensions</a> (AWE) region is 
     *       allocated. The value in <i>NumberOfPages</i> indicates the size of the array. Entries can be from multiple Address Windowing Extensions (AWE) regions.
     * @param {Pointer} NumberOfPages The size of the physical memory and virtual address space for which to establish translations, in pages. 
     * 
     * The 
     *       array at <i>VirtualAddresses</i> specifies the virtual address range.
     * @param {Pointer<Pointer>} PageArray A pointer to an array of values that indicates how each corresponding page in 
     *       <i>VirtualAddresses</i> should be treated. 
     * 
     * A 0 (zero) indicates that the corresponding entry in 
     *       <i>VirtualAddresses</i> should be unmapped, and any nonzero value that it has should be mapped.
     *       
     * 
     * If this parameter is <b>NULL</b>, then every address in the <i>VirtualAddresses</i> array is 
     *        unmapped.
     * 
     * The value in <i>NumberOfPages</i> indicates the size of the array.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>, and the function does not map or unmap—partial or 
     *        otherwise. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-mapuserphysicalpagesscatter
     * @since windows5.1.2600
     */
    static MapUserPhysicalPagesScatter(VirtualAddresses, NumberOfPages, PageArray) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\MapUserPhysicalPagesScatter", "ptr*", VirtualAddresses, "ptr", NumberOfPages, "ptr*", PageArray, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers a callback function to be called when a secured memory range is freed or its protections are changed.
     * @param {Pointer<PSECURE_MEMORY_CACHE_CALLBACK>} pfnCallBack A pointer to the application-defined 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nc-winnt-psecure_memory_cache_callback">SecureMemoryCacheCallback</a> function to 
     *       register.
     * @returns {BOOL} If the function succeeds, it registers the callback function and returns 
     *       <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     *       the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-addsecurememorycachecallback
     * @since windows6.0.6000
     */
    static AddSecureMemoryCacheCallback(pfnCallBack) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\AddSecureMemoryCacheCallback", "ptr", pfnCallBack, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Unregisters a callback function that was previously registered with the AddSecureMemoryCacheCallback function.
     * @param {Pointer<PSECURE_MEMORY_CACHE_CALLBACK>} pfnCallBack A pointer to the application-defined <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nc-winnt-psecure_memory_cache_callback">SecureMemoryCacheCallback</a> function to remove.
     * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-removesecurememorycachecallback
     * @since windows6.0.6000
     */
    static RemoveSecureMemoryCacheCallback(pfnCallBack) {
        result := DllCall("KERNEL32.dll\RemoveSecureMemoryCacheCallback", "ptr", pfnCallBack, "int")
        return result
    }

;@endregion Methods
}

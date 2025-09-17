#Requires AutoHotkey v2.0.0 64-bit

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
;@endregion Constants

;@region Methods
    /**
     * Creates a private heap object that can be used by the calling process. The function reserves space in the virtual address space of the process and allocates physical storage for a specified initial portion of this block.
     * @remarks
     * The 
     * <b>HeapCreate</b> function creates a private heap object from which the calling process can allocate memory blocks by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> function. The initial size determines the number of committed pages that are allocated initially for the heap. The maximum size determines the total number of reserved pages. These pages create a block in the process's virtual address space into which the heap can grow. If requests by 
     * <b>HeapAlloc</b> exceed the current size of committed pages, additional pages are automatically committed from this reserved space, if the physical storage is available.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>By default, the newly created private heap is a standard heap. To enable the low-fragmentation heap, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapsetinformation">HeapSetInformation</a> function with a handle to the private heap.
     * 
     * The memory of a private heap object is accessible only to the process that created it. If a dynamic-link library (DLL) creates a private heap, the heap is created in the address space of the process that calls the DLL, and it is accessible only to that process.
     * 
     * The system uses memory from the private heap to store heap support structures, so not all of the specified heap size is available to the process. For example, if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> function requests 64 kilobytes (K) from a heap with a maximum size of 64K, the request may fail because of system overhead.
     * 
     * If <b>HEAP_NO_SERIALIZE</b> is not specified (the simple default), the heap serializes access within the calling process. Serialization ensures mutual exclusion when two or more threads attempt simultaneously to allocate or free blocks from the same heap. There is a small performance cost to serialization, but it must be used whenever multiple threads allocate and free memory from the same heap. The <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heaplock">HeapLock</a> and <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapunlock">HeapUnlock</a> functions can be used to block and permit access to a serialized heap.
     * 
     * Setting <b>HEAP_NO_SERIALIZE</b> eliminates mutual exclusion on the heap. Without serialization, two or more threads that use the same heap handle might attempt to allocate or free memory simultaneously, which may cause corruption in the heap. Therefore, <b>HEAP_NO_SERIALIZE</b> can safely be used only in the following situations:
     * 
     * <ul>
     * <li>The process has only one thread.</li>
     * <li>The process has multiple threads, but only one thread calls the heap functions for a specific heap.</li>
     * <li>The process has multiple threads, and the application provides its own mechanism for mutual exclusion to a specific heap.</li>
     * </ul>
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heaplock">HeapLock</a> and <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapunlock">HeapUnlock</a> functions are called on a heap created with the <b>HEAP_NO_SERIALIZE</b> flag, the results are undefined.
     * 
     * To obtain a handle to the default heap for a process, use the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function. To obtain handles to the default heap and private heaps that are active for the calling process, use the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheaps">GetProcessHeaps</a> function.
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
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the newly created heap.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapcreate
     * @since windows5.1.2600
     */
    static HeapCreate(flOptions, dwInitialSize, dwMaximumSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\HeapCreate", "uint", flOptions, "ptr", dwInitialSize, "ptr", dwMaximumSize)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Destroys the specified heap object. It decommits and releases all the pages of a private heap object, and it invalidates the handle to the heap.
     * @remarks
     * Processes can call 
     * <b>HeapDestroy</b> without first calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapfree">HeapFree</a> function to free memory allocated from the heap.
     * @param {Pointer<Void>} hHeap A handle to the heap to be destroyed. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> function. Do not use the handle to the process heap returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapdestroy
     * @since windows5.1.2600
     */
    static HeapDestroy(hHeap) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\HeapDestroy", "ptr", hHeap, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates a block of memory from a heap. The allocated memory is not movable.
     * @remarks
     * If 
     * the <b>HeapAlloc</b> function succeeds, it allocates at least the amount of memory requested. 
     * 
     * To allocate memory from the process's default heap, use  <b>HeapAlloc</b> with the handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function.
     * 
     * To free a block of memory allocated by 
     * <b>HeapAlloc</b>, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapfree">HeapFree</a> function.
     * 
     * Memory allocated by 
     * <b>HeapAlloc</b> is not movable. The address returned by 
     * <b>HeapAlloc</b> is valid until the memory block is freed or reallocated; the memory block does not need to be locked. Because the system cannot compact a private heap, it can become fragmented.
     * 
     * The alignment of memory returned by <b>HeapAlloc</b> is <b>MEMORY_ALLOCATION_ALIGNMENT</b> in WinNT.h:
     * 
     * ```
     * @param {Pointer<Void>} hHeap A handle to the heap from which the memory will be allocated. This handle is returned by the 
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
     * If the function fails and you have specified <b>HEAP_GENERATE_EXCEPTIONS</b>, the function may generate either of the exceptions listed in the following table. The particular exception depends upon the nature of the heap corruption. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Debug/getexceptioncode">GetExceptionCode</a>.
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
     * If the function fails, it does not call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a>. An application cannot call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information.
     * @see https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapalloc
     * @since windows5.1.2600
     */
    static HeapAlloc(hHeap, dwFlags, dwBytes) {
        result := DllCall("KERNEL32.dll\HeapAlloc", "ptr", hHeap, "uint", dwFlags, "ptr", dwBytes)
        return result
    }

    /**
     * Reallocates a block of memory from a heap. This function enables you to resize a memory block and change other memory block properties.
     * @remarks
     * If 
     * <b>HeapReAlloc</b> succeeds, it allocates at least the amount of memory requested. 
     * 
     * If 
     * <b>HeapReAlloc</b> fails, the original memory is not freed, and the original handle and pointer are still valid.
     * 
     * <b>HeapReAlloc</b> is guaranteed to preserve the content of the memory being reallocated, even if the new memory is allocated at a different location. The process of preserving the memory content involves a memory copy operation that is potentially very time-consuming. 
     * 
     * To free a block of memory allocated by 
     * <b>HeapReAlloc</b>, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapfree">HeapFree</a> function.
     * 
     * Serialization ensures mutual exclusion when two or more threads attempt to simultaneously allocate or free blocks from the same heap. There is a small performance cost to serialization, but it must be used whenever multiple threads allocate and free memory from the same heap. Setting the <b>HEAP_NO_SERIALIZE</b> value eliminates mutual exclusion on the heap. Without serialization, two or more threads that use the same heap handle might attempt to allocate or free memory simultaneously, likely causing corruption in the heap. The <b>HEAP_NO_SERIALIZE</b> value can, therefore, be safely used only in the following situations:
     * 
     * <ul>
     * <li>The process has only one thread.</li>
     * <li>The process has multiple threads, but only one thread calls the heap functions for a specific heap.</li>
     * <li>The process has multiple threads, and the application provides its own mechanism for mutual exclusion to a specific heap.</li>
     * </ul>
     * @param {Pointer<Void>} hHeap A handle to the heap from which the memory is to be reallocated. This handle is a returned by either the 
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
     * If the function fails and you have specified <b>HEAP_GENERATE_EXCEPTIONS</b>, the function may generate either of the exceptions listed in the following table. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Debug/getexceptioncode">GetExceptionCode</a>.
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
     *  The alignment of memory returned by <b>HeapReAlloc</b> is <b>MEMORY_ALLOCATION_ALIGNMENT</b> in WinNT.h:
     * 
     * ```
     * @see https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heaprealloc
     * @since windows5.1.2600
     */
    static HeapReAlloc(hHeap, dwFlags, lpMem, dwBytes) {
        result := DllCall("KERNEL32.dll\HeapReAlloc", "ptr", hHeap, "uint", dwFlags, "ptr", lpMem, "ptr", dwBytes)
        return result
    }

    /**
     * Frees a memory block allocated from a heap by the HeapAlloc or HeapReAlloc function.
     * @remarks
     * You should not refer in any way to memory that has been freed by 
     * <b>HeapFree</b>. After that memory is freed, any information that may have been in it is gone forever. If you require information, do not free memory containing the information. Function calls that return information about memory (such as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapsize">HeapSize</a>) may not be used with freed memory, as they may return bogus data. Calling <b>HeapFree</b> twice with the same pointer can cause heap corruption, resulting in subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> returning the same pointer twice.
     * 
     * Serialization ensures mutual exclusion when two or more threads attempt to simultaneously allocate or free blocks from the same heap. There is a small performance cost to serialization, but it must be used whenever multiple threads allocate and free memory from the same heap. Setting the <b>HEAP_NO_SERIALIZE</b> value eliminates mutual exclusion on the heap. Without serialization, two or more threads that use the same heap handle might attempt to allocate or free memory simultaneously, likely causing corruption in the heap. The <b>HEAP_NO_SERIALIZE</b> value can, therefore, be safely used only in the following situations:
     * 
     * <ul>
     * <li>The process has only one thread.</li>
     * <li>The process has multiple threads, but only one thread calls the heap functions for a specific heap.</li>
     * <li>The process has multiple threads, and the application provides its own mechanism for mutual exclusion to a specific heap.</li>
     * </ul>
     * @param {Pointer<Void>} hHeap A handle to the heap whose memory block is to be freed. This handle is returned by either the 
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
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. An application can call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information.
     * @see https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapfree
     * @since windows5.1.2600
     */
    static HeapFree(hHeap, dwFlags, lpMem) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\HeapFree", "ptr", hHeap, "uint", dwFlags, "ptr", lpMem, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the size of a memory block allocated from a heap by the HeapAlloc or HeapReAlloc function.
     * @remarks
     * Serialization ensures mutual exclusion when two or more threads attempt to simultaneously allocate or free 
     *     blocks from the same heap. There is a small performance cost to serialization, but it must be used whenever 
     *     multiple threads allocate and free memory from the same heap. Setting the 
     *     <b>HEAP_NO_SERIALIZE</b> value eliminates mutual exclusion on the heap. Without serialization, 
     *     two or more threads that use the same heap handle might attempt to allocate or free memory simultaneously, likely 
     *     causing corruption in the heap. The <b>HEAP_NO_SERIALIZE</b> value can, therefore, be safely 
     *     used only in the following situations:
     * 
     * <ul>
     * <li>The process has only one thread.</li>
     * <li>The process has multiple threads, but only one thread calls the heap functions for a specific heap.</li>
     * <li>The process has multiple threads, and the application provides its own mechanism for mutual exclusion to a 
     *       specific heap.</li>
     * </ul>
     * @param {Pointer<Void>} hHeap A handle to the heap in which the memory block resides. This handle is returned by either the 
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
     * If the function fails, the return value is <c>(SIZE_T)-1</c>. 
     *        The function does not call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a>. An 
     *        application cannot call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended 
     *        error information.
     * 
     * If the <i>lpMem</i> parameter refers to a heap allocation that is not in the heap 
     *        specified by the <i>hHeap</i> parameter, the behavior of the 
     *        <b>HeapSize</b> function is undefined.
     * @see https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapsize
     * @since windows5.1.2600
     */
    static HeapSize(hHeap, dwFlags, lpMem) {
        result := DllCall("KERNEL32.dll\HeapSize", "ptr", hHeap, "uint", dwFlags, "ptr", lpMem, "ptr")
        return result
    }

    /**
     * Retrieves a handle to the default heap of the calling process.
     * @remarks
     * The 
     * <b>GetProcessHeap</b> function obtains a handle to the default heap for the calling process. A process can use this handle to allocate memory from the process heap without having to first create a private heap using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> function.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>To enable the low-fragmentation heap for the default heap of the process, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapsetinformation">HeapSetInformation</a> function with the handle returned by <b>GetProcessHeap</b>.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the calling process's heap.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-getprocessheap
     * @since windows5.1.2600
     */
    static GetProcessHeap() {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetProcessHeap")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the size of the largest committed free block in the specified heap. If the Disable heap coalesce on free global flag is set, this function also coalesces adjacent free blocks of memory in the heap.
     * @remarks
     * The <b>HeapCompact</b> function is primarily useful for debugging. Ordinarily, the system compacts the heap whenever the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapfree">HeapFree</a> function is called, and the <b>HeapCompact</b> function returns the size of the largest free block in the heap but does not compact the heap any further. If the <a href="https://msdn.microsoft.com/library/cc265897.aspx">Disable heap coalesce on free</a> global flag is set during debugging, the system does not compact the heap and calling the <b>HeapCompact</b> function does compact the heap.  For more information about global flags, see the <a href="https://msdn.microsoft.com/library/cc265942.aspx">GFlags</a> documentation.
     * 
     * There is no guarantee that an application can successfully allocate a memory block of the size returned by 
     * <b>HeapCompact</b>. Other threads or the commit threshold might prevent such an allocation.
     * 
     * Serialization ensures mutual exclusion when two or more threads attempt to simultaneously allocate or free blocks from the same heap. There is a small performance cost to serialization, but it must be used whenever multiple threads allocate and free memory from the same heap. Setting the <b>HEAP_NO_SERIALIZE</b> value eliminates mutual exclusion on the heap. Without serialization, two or more threads that use the same heap handle might attempt to allocate or free memory simultaneously, likely causing corruption in the heap. The <b>HEAP_NO_SERIALIZE</b> value can, therefore, be safely used only in the following situations:
     * 
     * <ul>
     * <li>The process has only one thread.</li>
     * <li>The process has multiple threads, but only one thread calls the heap functions for a specific heap.</li>
     * <li>The process has multiple threads, and the application provides its own mechanism for mutual exclusion to a specific heap.</li>
     * </ul>
     * @param {Pointer<Void>} hHeap A handle to the heap. This handle is returned by either the 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * In the unlikely case that there is absolutely no space available in the heap, the function return value is zero, and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns the value NO_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapcompact
     * @since windows5.1.2600
     */
    static HeapCompact(hHeap, dwFlags) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\HeapCompact", "ptr", hHeap, "uint", dwFlags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enables features for a specified heap.
     * @remarks
     * To retrieve the current settings for the heap, use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapqueryinformation">HeapQueryInformation</a> function.
     * 
     * Setting the <b>HeapEnableTerminateOnCorruption</b> option is strongly recommended because 
     *     it reduces an application's exposure to security exploits that take advantage of a corrupted heap.
     * @param {Pointer<Void>} HeapHandle A handle to the heap where information is to be set. This handle is returned by either the 
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
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapsetinformation
     * @since windows5.1.2600
     */
    static HeapSetInformation(HeapHandle, HeapInformationClass, HeapInformation, HeapInformationLength) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\HeapSetInformation", "ptr", HeapHandle, "int", HeapInformationClass, "ptr", HeapInformation, "ptr", HeapInformationLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Validates the specified heap. The function scans all the memory blocks in the heap and verifies that the heap control structures maintained by the heap manager are in a consistent state.
     * @remarks
     * The <b>HeapValidate</b> function is primarily useful for debugging because validation is potentially time-consuming. Validating a heap can block other threads from accessing the heap and can degrade performance, especially on symmetric multiprocessing (SMP) computers. These side effects can last until <b>HeapValidate</b> returns. 
     * 
     * There are heap control structures for each memory block in a heap, and for the heap as a whole. When you use the 
     * <b>HeapValidate</b> function to validate a complete heap, it checks all of these control structures for consistency.
     * 
     * When you use 
     * <b>HeapValidate</b> to validate a single memory block within a heap, it checks only the control structures pertaining to that element. 
     * <b>HeapValidate</b> can only validate allocated memory blocks. Calling 
     * <b>HeapValidate</b> on a freed memory block will return <b>FALSE</b> because there are no control structures to validate.
     * 
     * If you want to validate the heap elements enumerated by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapwalk">HeapWalk</a> function, you should only call 
     * <b>HeapValidate</b> on the elements that have <b>PROCESS_HEAP_ENTRY_BUSY</b> in the <b>wFlags</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-process_heap_entry">PROCESS_HEAP_ENTRY</a> structure. 
     * <b>HeapValidate</b> returns <b>FALSE</b> for all heap elements that do not have this bit set.
     * 
     * Serialization ensures mutual exclusion when two or more threads attempt to simultaneously allocate or free blocks from the same heap. There is a small performance cost to serialization, but it must be used whenever multiple threads allocate and free memory from the same heap. Setting the <b>HEAP_NO_SERIALIZE</b> value eliminates mutual exclusion on the heap. Without serialization, two or more threads that use the same heap handle might attempt to allocate or free memory simultaneously, likely causing corruption in the heap. The <b>HEAP_NO_SERIALIZE</b> value can, therefore, be safely used only in the following situations:
     * 
     * <ul>
     * <li>The process has only one thread.</li>
     * <li>The process has multiple threads, but only one thread calls the heap functions for a specific heap.</li>
     * <li>The process has multiple threads, and the application provides its own mechanism for mutual exclusion to a specific heap.</li>
     * </ul>
     * @param {Pointer<Void>} hHeap A handle to the heap to be validated. This handle is returned by either the 
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
     * @returns {Integer} If the specified heap or memory block is valid, the return value is nonzero.
     * 
     * If the specified heap or memory block is invalid, the return value is zero. On a system set up for debugging, the 
     * <b>HeapValidate</b> function then displays debugging messages that describe the part of the heap or memory block that is invalid, and stops at a hard-coded breakpoint so that you can examine the system to determine the source of the invalidity. The 
     * <b>HeapValidate</b> function does not set the thread's last error value. There is no extended error information for this function; do not call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapvalidate
     * @since windows5.1.2600
     */
    static HeapValidate(hHeap, dwFlags, lpMem) {
        result := DllCall("KERNEL32.dll\HeapValidate", "ptr", hHeap, "uint", dwFlags, "ptr", lpMem, "int")
        return result
    }

    /**
     * The HeapSummary function (heapapi.h) summarizes the specified heap.
     * @param {Pointer<Void>} hHeap A handle to the heap to be summarized. This handle is returned by either the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> or 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function.
     * @param {Integer} dwFlags The heap summary options.
     * @param {Pointer<HEAP_SUMMARY>} lpSummary Receives a pointer to a [Heap_Summary](ns-heapapi-heap_summary.md) structure representing the heap summary.
     * @returns {Integer} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapsummary
     */
    static HeapSummary(hHeap, dwFlags, lpSummary) {
        result := DllCall("KERNEL32.dll\HeapSummary", "ptr", hHeap, "uint", dwFlags, "ptr", lpSummary, "int")
        return result
    }

    /**
     * Returns the number of active heaps and retrieves handles to all of the active heaps for the calling process.
     * @remarks
     * The 
     * <b>GetProcessHeaps</b> function obtains a handle to the default heap of the calling process, plus handles to any additional private heaps  created by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> function on any thread in the process. 
     * 
     * The <b>GetProcessHeaps</b> function is primarily useful for debugging, because some of the private heaps retrieved by the function may have been created by other code running in the process and may be destroyed after <b>GetProcessHeaps</b> returns. Destroying a heap invalidates the handle to the heap, and continued use of such handles can cause undefined behavior in the application. Heap functions should be called only on the default heap of the calling process and on private heaps that the process creates and manages. 
     * 
     * To obtain a handle to the process heap of the calling process, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function.
     * @param {Integer} NumberOfHeaps The maximum number of heap handles that can be stored into the buffer pointed to by <i>ProcessHeaps</i>.
     * @param {Pointer<Void>} ProcessHeaps A pointer to a buffer that receives an array of heap handles.
     * @returns {Integer} The return value is the number of handles to heaps that are active for the calling process.
     * 
     * If the return value is less than or equal to <i>NumberOfHeaps</i>, the function has stored that number of heap handles in the buffer pointed to by <i>ProcessHeaps</i>.
     * 
     * If the return value is greater than <i>NumberOfHeaps</i>, the buffer pointed to by <i>ProcessHeaps</i> is too small to hold all the heap handles for the calling process, and the function stores <i>NumberOfHeaps</i> handles in the buffer. Use the return value to allocate a buffer that is large enough to receive all of the handles, and call the function again.
     * 
     * If the return value is zero, the function has failed because every process has at least one active heap, the default heap for the  process. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-getprocessheaps
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
     * @remarks
     * If the function succeeds, the calling thread owns the heap lock. Only the calling thread will be able to allocate or release memory from the heap. The execution of any other thread of the calling process will be blocked if that thread attempts to allocate or release memory from the heap. Such threads will remain blocked until the thread that owns the heap lock calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapunlock">HeapUnlock</a> function.
     * 
     * The 
     * <b>HeapLock</b> function is primarily useful for preventing the allocation and release of heap memory by other threads while the calling thread uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapwalk">HeapWalk</a> function.
     * 
     * If the <b>HeapLock</b> function is called on a heap created with the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HEAP_NO_SERIALIZE</a> flag, the results are undefined.
     * 
     * Each successful call to 
     * <b>HeapLock</b> must be matched by a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapunlock">HeapUnlock</a>. Failure to call 
     * <b>HeapUnlock</b> will block the execution of any other threads of the calling process that attempt to access the heap.
     * @param {Pointer<Void>} hHeap A handle to the heap to be locked. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heaplock
     * @since windows5.1.2600
     */
    static HeapLock(hHeap) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\HeapLock", "ptr", hHeap, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Releases ownership of the critical section object, or lock, that is associated with a specified heap.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heaplock">HeapLock</a> function is primarily useful for preventing the allocation and release of heap memory by other threads while the calling thread uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapwalk">HeapWalk</a> function. The 
     * <b>HeapUnlock</b> function is the inverse of 
     * <b>HeapLock</b>.
     * 
     * Each call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heaplock">HeapLock</a> must be matched by a corresponding call to the 
     * <b>HeapUnlock</b> function. Failure to call 
     * <b>HeapUnlock</b> will block the execution of any other threads of the calling process that attempt to access the heap.
     * 
     * If the <b>HeapUnlock</b> function is called on a heap created with the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HEAP_NO_SERIALIZATION</a> flag, the results are undefined.
     * @param {Pointer<Void>} hHeap A handle to the heap to be unlocked. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapunlock
     * @since windows5.1.2600
     */
    static HeapUnlock(hHeap) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\HeapUnlock", "ptr", hHeap, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates the memory blocks in the specified heap.
     * @remarks
     * The <b>HeapWalk</b> function is primarily useful for debugging 
     *     because enumerating a heap is a potentially time-consuming operation. Locking the heap during enumeration blocks 
     *     other threads from accessing the heap and can degrade performance, especially on symmetric multiprocessing (SMP) 
     *     computers. The side effects can last until the heap is unlocked. Use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heaplock">HeapLock</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapunlock">HeapUnlock</a> functions to control heap locking during heap 
     *     enumeration.
     * 
     * To initiate a heap enumeration, call <b>HeapWalk</b> with the 
     *     <b>lpData</b> field of the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-process_heap_entry">PROCESS_HEAP_ENTRY</a> structure pointed to by 
     *     <i>lpEntry</i> set to <b>NULL</b>.
     * 
     * To continue a heap enumeration, call <b>HeapWalk</b> with the same 
     *     <i>hHeap</i> and <i>lpEntry</i> values, and with the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-process_heap_entry">PROCESS_HEAP_ENTRY</a> structure unchanged from the 
     *     preceding call to <b>HeapWalk</b>. Repeat this process until you 
     *     have no need for further enumeration, or until the function returns <b>FALSE</b> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
     *     <b>ERROR_NO_MORE_ITEMS</b>, indicating that all of the heap's memory blocks have been 
     *     enumerated.
     * 
     * No special call of <b>HeapWalk</b> is needed to terminate the 
     *     heap enumeration, since no enumeration state data is maintained outside the contents of the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-process_heap_entry">PROCESS_HEAP_ENTRY</a> structure.
     * 
     * <b>HeapWalk</b> can fail in a multithreaded application if the 
     *     heap is not locked during the heap enumeration.
     * @param {Pointer<Void>} hHeap A handle to the heap. This handle is returned by either the 
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
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the heap enumeration terminates successfully by reaching the end of the heap, the function returns 
     *        <b>FALSE</b>, and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> 
     *        returns the error code <b>ERROR_NO_MORE_ITEMS</b>.
     * @see https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapwalk
     * @since windows5.1.2600
     */
    static HeapWalk(hHeap, lpEntry) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\HeapWalk", "ptr", hHeap, "ptr", lpEntry, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the specified heap.
     * @remarks
     * To enable the 
     * LFH or the terminate-on-corruption feature, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapsetinformation">HeapSetInformation</a> function.
     * 
     * <b>Windows XP and Windows Server 2003:  </b> A look-aside list is a fast memory allocation mechanism that contains only fixed-sized blocks. Look-aside lists are enabled by default for heaps that support them. Starting with Windows Vista, look-aside lists are not used and the LFH is enabled by default.
     * 
     * Look-aside lists are faster than general pool allocations that vary in size, because the system does not search for free memory that fits the allocation. In addition, access to look-aside lists is generally synchronized using fast atomic processor exchange instructions instead of mutexes or spinlocks. Look-aside lists can be created by the system or drivers. They can be allocated from paged or nonpaged pool.
     * @param {Pointer<Void>} HeapHandle A handle to the heap whose information is to be retrieved. This handle is returned by either the 
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
     * @param {Pointer<UIntPtr>} ReturnLength A pointer to a variable that receives the length of data written to the <i>HeapInformation</i> buffer. If the buffer is too small, the function fails and <i>ReturnLength</i> specifies the minimum size required for the buffer. 
     * 
     * 
     * 
     * 
     * If you do not want to receive this information, specify <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapqueryinformation
     * @since windows5.1.2600
     */
    static HeapQueryInformation(HeapHandle, HeapInformationClass, HeapInformation, HeapInformationLength, ReturnLength) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\HeapQueryInformation", "ptr", HeapHandle, "int", HeapInformationClass, "ptr", HeapInformation, "ptr", HeapInformationLength, "ptr*", ReturnLength, "int")
        if(A_LastError)
            throw OSError()

        return result
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
     * @param {Pointer<Void>} lpAddress The starting address of the region to allocate. If the memory is being reserved, the specified address is rounded down to the nearest multiple of the allocation granularity. If the memory is already reserved and is being committed, the address is rounded down to the next page boundary. To determine the size of a page and the allocation granularity on the host computer, use the [GetSystemInfo](/windows/win32/api/sysinfoapi/nf-sysinfoapi-getsysteminfo) function. If this parameter is **NULL**, the system determines where to allocate the region.
     * 
     * If this address is within an enclave that you have not initialized by calling [InitializeEnclave](/windows/win32/api/enclaveapi/nf-enclaveapi-initializeenclave), **VirtualAlloc** allocates a page of zeros for the enclave at that address. The page must be previously uncommitted, and will not be measured with the EEXTEND instruction of the Intel Software Guard Extensions programming model.
     * 
     * If the address is within an enclave that you initialized, then the allocation operation fails with the **ERROR_INVALID_ADDRESS** error. That is true for enclaves that do not support dynamic memory management (i.e. SGX1). SGX2 enclaves will permit allocation, and the page must be accepted by the enclave after it has been allocated.
     * @param {Pointer} dwSize The size of the region, in bytes. If the _lpAddress_ parameter is **NULL**, this value is rounded up to the next page boundary. Otherwise, the allocated pages include all pages containing one or more bytes in the range from _lpAddress_ to _lpAddress_+_dwSize_. This means that a 2-byte range straddling a page boundary causes both pages to be included in the allocated region.
     * @param {Integer} flAllocationType 
     * @param {Integer} flProtect The memory protection for the region of pages to be allocated. If the pages are being committed, you can specify any one of the [memory protection constants](/windows/win32/Memory/memory-protection-constants).
     * @returns {Pointer<Void>} If the function succeeds, the return value is the base address of the allocated region of pages.
     * 
     * If the function fails, the return value is **NULL**. To get extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualalloc
     * @since windows5.1.2600
     */
    static VirtualAlloc(lpAddress, dwSize, flAllocationType, flProtect) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\VirtualAlloc", "ptr", lpAddress, "ptr", dwSize, "uint", flAllocationType, "uint", flProtect)
        if(A_LastError)
            throw OSError()

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
     * @param {Pointer<UInt32>} lpflOldProtect A pointer to a variable that receives the previous access protection value of the first page in the specified region of pages. If this parameter is **NULL** or does not point to a valid variable, the function fails.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualprotect
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
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualfree
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
     * @param {Pointer} lpBuffer A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a> structure in which information about the specified page range is returned.
     * @param {Pointer} dwLength The size of the buffer pointed to by the <i>lpBuffer</i> parameter, in bytes.
     * @returns {Pointer} The return value is the actual number of bytes returned in the information buffer.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include <b>ERROR_INVALID_PARAMETER</b>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualquery
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
     * Reserves, commits, or changes the state of a region of memory within the virtual address space of a specified process. The function initializes the memory it allocates to zero. (VirtualAllocEx)
     * @remarks
     * Each page has an associated <a href="https://docs.microsoft.com/windows/desktop/Memory/page-state">page state</a>. The 
     *      <b>VirtualAllocEx</b> function can perform the following 
     *      operations:
     * 
     * <ul>
     * <li>Commit a region of reserved pages</li>
     * <li>Reserve a region of free pages</li>
     * <li>Simultaneously reserve and commit a region of free pages</li>
     * </ul>
     * <b>VirtualAllocEx</b> cannot reserve a reserved page. It 
     *     can commit a page that is already committed. This means you can commit a range of pages, regardless of whether 
     *     they have already been committed, and the function will not fail.
     * 
     * You can use <b>VirtualAllocEx</b> to reserve a block of 
     *     pages and then make additional calls to <b>VirtualAllocEx</b> 
     *     to commit individual pages from the reserved block. This enables a process to reserve a range of its virtual 
     *     address space without consuming physical storage until it is needed.
     * 
     * If the <i>lpAddress</i> parameter is not <b>NULL</b>, the function uses 
     *     the <i>lpAddress</i> and <i>dwSize</i> parameters to compute the region of 
     *     pages to be allocated. The current state of the entire range of pages must be compatible with the type of 
     *     allocation specified by the <i>flAllocationType</i> parameter. Otherwise, the function fails 
     *     and none of the pages is allocated. This compatibility requirement does not preclude committing an already 
     *     committed page; see the preceding list.
     * 
     * To execute dynamically generated code, use 
     *     <b>VirtualAllocEx</b> to allocate memory and the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualprotectex">VirtualProtectEx</a> function to grant 
     *     <b>PAGE_EXECUTE</b> access.
     * 
     * The <b>VirtualAllocEx</b> function can be used to reserve 
     *     an <a href="https://docs.microsoft.com/windows/desktop/Memory/address-windowing-extensions">Address Windowing Extensions</a> 
     *     (AWE) region of memory within the virtual address space of a specified process. This region of memory can then be 
     *     used to map physical pages into and out of virtual memory as required by the application. The 
     *     <b>MEM_PHYSICAL</b> and <b>MEM_RESERVE</b> values must be set in the 
     *     <i>AllocationType</i> parameter. The <b>MEM_COMMIT</b> value must not be 
     *     set. The page protection must be set to <b>PAGE_READWRITE</b>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualfreeex">VirtualFreeEx</a> function can decommit a committed 
     *     page, releasing the page's storage, or it can simultaneously decommit and release a committed page. It can also 
     *     release a reserved page, making it a free page.
     * 
     * When creating a region that will be executable, the calling program bears responsibility for ensuring cache 
     *     coherency via an appropriate call to 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-flushinstructioncache">FlushInstructionCache</a> once the code has been set 
     *     in place. Otherwise attempts to execute code out of the newly executable region may produce unpredictable 
     *     results.
     * @param {Pointer<Void>} hProcess The handle to a process. The function allocates memory within the virtual address space of this process.
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
     * If the address in within an enclave that you initialized, then the allocation operation fails with the <b>ERROR_INVALID_ADDRESS</b> error. That is true for enclaves that do not support dynamic memory management (i.e. SGX1).  SGX2 enclaves will permit allocation, and the page must be accepted by the enclave after it has been allocated.
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
     * @param {Integer} flProtect The memory protection for the region of pages to be allocated. If the pages are being committed, you can specify any one of the [memory protection constants](/windows/win32/Memory/memory-protection-constants).
     * @returns {Pointer<Void>} If the function succeeds, the return value is the base address of the allocated region of pages.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualallocex
     * @since windows5.1.2600
     */
    static VirtualAllocEx(hProcess, lpAddress, dwSize, flAllocationType, flProtect) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\VirtualAllocEx", "ptr", hProcess, "ptr", lpAddress, "ptr", dwSize, "uint", flAllocationType, "uint", flProtect)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Changes the protection on a region of committed pages in the virtual address space of a specified process.
     * @remarks
     * The access protection value can be set only on committed pages. If the state of any page in the specified region is not committed, the function fails and returns without modifying the access protection of any pages in the specified region.
     * 
     * The **PAGE_GUARD** protection modifier establishes guard pages. Guard pages act as one-shot access alarms. For more information, see [Creating Guard Pages](/windows/win32/Memory/creating-guard-pages).
     * 
     * It is best to avoid using **VirtualProtectEx** to change page protections on memory blocks allocated by [GlobalAlloc](/windows/win32/api/winbase/nf-winbase-globalalloc), [HeapAlloc](/windows/win32/api/heapapi/nf-heapapi-heapalloc), or [LocalAlloc](/windows/win32/api/winbase/nf-winbase-localalloc), because multiple memory blocks can exist on a single page. The heap manager assumes that all pages in the heap grant at least read and write access.
     * 
     * When protecting a region that will be executable, the calling program bears responsibility for ensuring cache coherency via an appropriate call to [FlushInstructionCache](/windows/win32/api/processthreadsapi/nf-processthreadsapi-flushinstructioncache) once the code has been set in place. Otherwise attempts to execute code out of the newly executable region may produce unpredictable results.
     * @param {Pointer<Void>} hProcess A handle to the process whose memory protection is to be changed. The handle must have the **PROCESS_VM_OPERATION** access right. For more information, see [Process Security and Access Rights](/windows/win32/ProcThread/process-security-and-access-rights).
     * @param {Pointer<Void>} lpAddress A pointer to the base address of the region of pages whose access protection attributes are to be changed.
     * 
     * All pages in the specified region must be within the same reserved region allocated when calling the [VirtualAlloc](/windows/win32/api/memoryapi/nf-memoryapi-virtualalloc) or [VirtualAllocEx](/windows/win32/api/memoryapi/nf-memoryapi-virtualallocex) function using **MEM_RESERVE**. The pages cannot span adjacent reserved regions that were allocated by separate calls to **VirtualAlloc** or **VirtualAllocEx** using **MEM_RESERVE**.
     * @param {Pointer} dwSize The size of the region whose access protection attributes are changed, in bytes. The region of affected pages includes all pages containing one or more bytes in the range from the _lpAddress_ parameter to `(lpAddress+dwSize)`. This means that a 2-byte range straddling a page boundary causes the protection attributes of both pages to be changed.
     * @param {Integer} flNewProtect The memory protection option. This parameter can be one of the [memory protection constants](/windows/win32/Memory/memory-protection-constants).
     * 
     * For mapped views, this value must be compatible with the access protection specified when the view was mapped (see [MapViewOfFile](/windows/win32/api/memoryapi/nf-memoryapi-mapviewoffile), [MapViewOfFileEx](/windows/win32/api/memoryapi/nf-memoryapi-mapviewoffileex), and [MapViewOfFileExNuma](/windows/win32/api/winbase/nf-winbase-mapviewoffileexnuma)).
     * @param {Pointer<UInt32>} lpflOldProtect A pointer to a variable that receives the previous access protection of the first page in the specified region of pages. If this parameter is **NULL** or does not point to a valid variable, the function fails.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualprotectex
     * @since windows5.1.2600
     */
    static VirtualProtectEx(hProcess, lpAddress, dwSize, flNewProtect, lpflOldProtect) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\VirtualProtectEx", "ptr", hProcess, "ptr", lpAddress, "ptr", dwSize, "uint", flNewProtect, "uint*", lpflOldProtect, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about a range of pages within the virtual address space of a specified process.
     * @remarks
     * <b>VirtualQueryEx</b> provides information about a region of consecutive pages beginning at a specified address that share the following attributes:
     * 
     * <ul>
     * <li>The state of all pages is the same (<b>MEM_COMMIT</b>, <b>MEM_RESERVE</b>, <b>MEM_FREE</b>, <b>MEM_PRIVATE</b>, <b>MEM_MAPPED</b>, or <b>MEM_IMAGE</b>).</li>
     * <li>If the initial page is not free, all pages in the region are part of the same initial allocation of pages created by a single call to <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a>, <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a>, or one of the following extended versions of these functions: <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualallocex">VirtualAllocEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualallocexnuma">VirtualAllocExNuma</a>, <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffileex">MapViewOfFileEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-mapviewoffileexnuma">MapViewOfFileExNuma</a>.</li>
     * <li>The access granted to all pages is the same (<b>PAGE_READONLY</b>, <b>PAGE_READWRITE</b>, <b>PAGE_NOACCESS</b>, <b>PAGE_WRITECOPY</b>, <b>PAGE_EXECUTE</b>, <b>PAGE_EXECUTE_READ</b>, <b>PAGE_EXECUTE_READWRITE</b>, <b>PAGE_EXECUTE_WRITECOPY</b>, <b>PAGE_GUARD</b>, or <b>PAGE_NOCACHE</b>).</li>
     * </ul>
     * The 
     * <b>VirtualQueryEx</b> function determines the attributes of the first page in the region and then scans subsequent pages until it scans the entire range of pages, or until it encounters a page with a nonmatching set of attributes. The function returns the attributes and the size of the region of pages with matching attributes, in bytes. For example, if there is a 40 megabyte (MB) region of free memory, and 
     * <b>VirtualQueryEx</b> is called on a page that is 10 MB into the region, the function will obtain a state of <b>MEM_FREE</b> and a size of 30 MB.
     * 
     * If a shared copy-on-write page is modified, it becomes private to the process that modified the page. However, the <b>VirtualQueryEx</b> function will continue to report such pages as <b>MEM_MAPPED</b> (for data views) or <b>MEM_IMAGE</b> (for executable image views) rather than <b>MEM_PRIVATE</b>. To detect whether copy-on-write has occurred for a specific page, either access the page or lock it using the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtuallock">VirtualLock</a> function to make sure the page is resident in memory, then use the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-queryworkingset">QueryWorkingSet</a> or <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-queryworkingsetex">QueryWorkingSetEx</a> function to check the <b>Shared</b> bit in the extended working set information for the page. If the <b>Shared</b> bit is clear, the page is private.
     * @param {Pointer<Void>} hProcess A handle to the process whose memory information is queried. The handle must have been opened with the <b>PROCESS_QUERY_INFORMATION</b> access right, which enables using the handle to read information from the process object. For more information, see 
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
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include <b>ERROR_INVALID_PARAMETER</b>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualqueryex
     * @since windows5.1.2600
     */
    static VirtualQueryEx(hProcess, lpAddress, lpBuffer, dwLength) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\VirtualQueryEx", "ptr", hProcess, "ptr", lpAddress, "ptr", lpBuffer, "ptr", dwLength, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates or opens a named or unnamed file mapping object for a specified file. (CreateFileMappingW)
     * @remarks
     * After a file mapping object is created, the size of the file must not exceed the size of the file mapping 
     *     object; if it does, not all of the file contents are available for sharing.
     * 
     * If an application specifies a size for the file mapping object that is larger than the size of the actual named 
     *     file on disk and if the page protection allows write access (that is, the <i>flProtect</i> 
     *     parameter specifies  <b>PAGE_READWRITE</b> or 
     *     <b>PAGE_EXECUTE_READWRITE</b>), then the file on disk is increased to match the specified size 
     *     of the file mapping object. If the file is extended, the contents of the file between the old end of the file and 
     *     the new end of the file are not guaranteed to be zero; the behavior is defined by the file system. If the file 
     *     on disk cannot be increased, <b>CreateFileMapping</b> fails 
     *     and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>  returns 
     *     <b>ERROR_DISK_FULL</b>.
     * 
     * The initial contents of the pages in a file mapping object backed by the operating system paging file are 0 
     *     (zero).
     * 
     * The handle that <b>CreateFileMapping</b> returns has 
     *     full access to a new file mapping object, and can be used with any function that requires a handle to a file 
     *     mapping object.
     * 
     * Multiple processes can share a view of the same file   by either using a single shared file mapping object or 
     *     creating separate file mapping objects backed by the same file. A single file mapping object can be shared by 
     *     multiple processes through inheriting the handle at process creation, duplicating the handle, or opening the file 
     *     mapping object by name. For more information, see the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>, 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-duplicatehandle">DuplicateHandle</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openfilemappinga">OpenFileMapping</a> functions.
     * 
     * Creating a file mapping object does not actually map the view into a process address space. The 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffileex">MapViewOfFileEx</a> functions map a view of a file into a 
     *     process address space.
     * 
     * With one important exception, file views derived from any file mapping object that is backed by the same file 
     *     are coherent or identical at a specific time. Coherency is guaranteed for views within a process and for views 
     *     that are mapped by different processes.
     * 
     * The exception is related to remote files. Although 
     *     <b>CreateFileMapping</b> works with remote files, it does 
     *     not keep them coherent. For example, if two computers both map a file as writable, and both change the same page, 
     *     each computer only sees its own writes to the page. When the data gets updated on the disk, it is not merged.
     * 
     * A mapped file and a file that is accessed by using the input and output (I/O) functions 
     *     (<a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefile">WriteFile</a>) are not necessarily coherent.
     * 
     * Mapped views of a file mapping object maintain internal references to the object, and a file mapping object 
     *     does not close until all references to it are released. Therefore, to fully close a file mapping object, an 
     *     application must unmap all mapped views of the file mapping object by calling 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-unmapviewoffile">UnmapViewOfFile</a> and  close the file mapping object 
     *     handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a>. These functions can be 
     *     called in any order.
     * 
     * When modifying a file through a mapped view, the last modification timestamp may not be updated automatically. 
     *     If required, the caller should use <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfiletime">SetFileTime</a> to set the 
     *     timestamp.
     * 
     * Creating a file mapping object in the global namespace from a session other than session zero requires the 
     *      <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">SeCreateGlobalPrivilege</a> privilege. 
     *      Note that this privilege check is limited to the creation of file mapping objects and does not apply to opening 
     *      existing ones. For example, if a service or the system creates a file mapping object in the global namespace, any 
     *      process running in any session can access that file mapping object provided that the caller has the required 
     *      access rights.
     * 
     * <b>Windows XP:  </b>The requirement described in the previous paragraph was introduced with Windows Server 2003 
     *       and Windows XP with SP2
     * 
     * Use structured exception handling to protect any code that writes to or reads from a file view. For more 
     *      information, see 
     *      <a href="https://docs.microsoft.com/windows/desktop/Memory/reading-and-writing-from-a-file-view">Reading and Writing From a File View</a>.
     * 
     * To have a mapping with executable permissions, an application must call
     *      <b>CreateFileMapping</b> with either 
     *      <b>PAGE_EXECUTE_READWRITE</b> or <b>PAGE_EXECUTE_READ</b>, and then 
     *      call <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> with 
     *      <c>FILE_MAP_EXECUTE | FILE_MAP_WRITE</c> or 
     *      <c>FILE_MAP_EXECUTE | FILE_MAP_READ</c>.
     * 
     * In Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} hFile A handle to the file from which to create a file mapping object.
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
     * @param {Pointer<Char>} lpName The name of the file mapping object.
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
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the newly created file mapping object.
     * 
     * If the object exists before the function call, the function returns a handle to the existing object (with its 
     *        current size, not the specified size), and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-createfilemappingw
     * @since windows5.1.2600
     */
    static CreateFileMappingW(hFile, lpFileMappingAttributes, flProtect, dwMaximumSizeHigh, dwMaximumSizeLow, lpName) {
        lpName := lpName is String? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateFileMappingW", "ptr", hFile, "ptr", lpFileMappingAttributes, "uint", flProtect, "uint", dwMaximumSizeHigh, "uint", dwMaximumSizeLow, "ptr", lpName)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens a named file mapping object. (OpenFileMappingW)
     * @remarks
     * The handle that <b>OpenFileMapping</b> returns can be used 
     *      with any function that requires a handle to a file mapping object.
     * 
     * When modifying a file through a mapped view, the last modification timestamp may not be updated automatically. 
     *      If required, the caller should use <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfiletime">SetFileTime</a> to set the 
     *      timestamp.
     * 
     * When it is no longer needed, the caller should call release the handle returned by 
     *      <b>OpenFileMapping</b> with a call to 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a>.
     * 
     * In Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwDesiredAccess The access to the file mapping object. This access is checked against any security descriptor on the target 
     *       file mapping object. For a list of values, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/Memory/file-mapping-security-and-access-rights">File Mapping Security and Access Rights</a>.
     * @param {Integer} bInheritHandle If this parameter is <b>TRUE</b>, a process created by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function can inherit the handle; 
     *       otherwise, the handle cannot be inherited.
     * @param {Pointer<Char>} lpName The name of the file mapping object to be opened. If there is an open handle to a file mapping object by 
     *       this name and the security descriptor on the mapping object does not conflict with the 
     *       <i>dwDesiredAccess</i> parameter, the open operation succeeds. The name can have a 
     *       "Global\" or "Local\" prefix to explicitly open an object in the global or 
     *       session namespace. The remainder of the name can contain any character except the backslash character (\\). For 
     *       more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user 
     *       switching is implemented using Terminal Services sessions. The first user to log on uses session 0, the next 
     *       user to log on uses session 1, and so on. Kernel object names must follow the guidelines outlined for Terminal 
     *       Services so that applications can support multiple users.
     * @returns {Pointer<Void>} If the function succeeds, the return value is an open handle to the specified file mapping object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-openfilemappingw
     * @since windows5.1.2600
     */
    static OpenFileMappingW(dwDesiredAccess, bInheritHandle, lpName) {
        lpName := lpName is String? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\OpenFileMappingW", "uint", dwDesiredAccess, "int", bInheritHandle, "ptr", lpName)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Maps a view of a file mapping into the address space of a calling process.
     * @remarks
     * Mapping a file makes the specified portion of a file visible in the address space of the calling process.
     * 
     * For files that are larger than the address space, you can only map a small portion of the file data at one 
     *     time. When the first view is complete, you can unmap it and map a new view.
     * 
     * To obtain the size of a view, use the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualquery">VirtualQuery</a> 
     *     function.
     * 
     * Multiple views of a file (or a file mapping object and its mapped file) are <i>coherent</i> 
     *     if they contain identical data at a specified time. This occurs if the file views are derived from any file 
     *     mapping object that is backed by the same file. A process can duplicate a file mapping object handle into another 
     *     process by using the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-duplicatehandle">DuplicateHandle</a> function, or 
     *     another process can open a file mapping object by name by using the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openfilemappinga">OpenFileMapping</a> function.
     * 
     * With one important exception, file views derived from any file mapping object that is backed by the same file 
     *     are coherent or identical at a specific time. Coherency is guaranteed for views within a process and for views 
     *     that are mapped by different processes.
     * 
     * The exception is related to remote files. Although 
     *     <b>MapViewOfFile</b> works with remote files, it does not keep 
     *     them coherent. For example, if two computers both map a file as writable, and both change the same page, each 
     *     computer only sees its own writes to the page. When the data gets updated on the disk, it is not merged.
     * 
     * A mapped view of a file is not guaranteed to be coherent with a file that is being accessed by the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a> or 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefile">WriteFile</a> function.
     * 
     * Do not store pointers in the memory mapped file; store offsets from the base of the file mapping so that the 
     *     mapping can be used at any address.
     * 
     * To guard against <b>EXCEPTION_IN_PAGE_ERROR</b> 
     *     exceptions, use structured exception handling to protect any code that writes to or reads from a memory mapped 
     *     view of a file other than the page file. For more information, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/Memory/reading-and-writing-from-a-file-view">Reading and Writing From a File View</a>.
     * 
     * When modifying a file through a mapped view, the last modification timestamp may not be updated automatically. 
     *      If required, the caller should use <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfiletime">SetFileTime</a> to set the 
     *      timestamp.
     * 
     * If a file mapping object is backed by the paging file 
     *      (<a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfilemappinga">CreateFileMapping</a> is called with the 
     *      <i>hFile</i> parameter set to <b>INVALID_HANDLE_VALUE</b>), the paging file 
     *      must be large enough to hold the entire mapping. If it is not, 
     *      <b>MapViewOfFile</b> fails. The initial contents of the pages 
     *      in a file mapping object backed by the paging file are 0 (zero).
     * 
     * When a file mapping object that is backed by the paging file is created, the caller can  specify whether 
     *      <b>MapViewOfFile</b> should reserve and commit pages at the 
     *      same time (<b>SEC_COMMIT</b>) or  simply reserve pages 
     *      (<b>SEC_RESERVE</b>). Mapping the file makes the entire mapped virtual address range 
     *      unavailable to other allocations in the process. After a page from the reserved range is committed, it cannot be 
     *      freed or decommitted by calling <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualfree">VirtualFree</a>. Reserved and 
     *      committed pages are released when the view is unmapped and the file mapping object is closed. For details, see 
     *      the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-unmapviewoffile">UnmapViewOfFile</a> and 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> functions.
     * 
     * To have a file with executable permissions, an application must call 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfilemappinga">CreateFileMapping</a> with either 
     *      <b>PAGE_EXECUTE_READWRITE</b> or <b>PAGE_EXECUTE_READ</b>, 
     *      and then call <b>MapViewOfFile</b> with 
     *      <b>FILE_MAP_EXECUTE</b> | <b>FILE_MAP_WRITE</b> or 
     *      <b>FILE_MAP_EXECUTE</b> | <b>FILE_MAP_READ</b>.
     * 
     * In Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * When CsvFs is paused this call might fail with an error indicating that there is a lock conflict.
     * @param {Pointer<Void>} hFileMappingObject A handle to a file mapping object. The 
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
     * @returns {Pointer<Void>} If the function succeeds, the return value is the starting address of the mapped view.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-mapviewoffile
     * @since windows5.1.2600
     */
    static MapViewOfFile(hFileMappingObject, dwDesiredAccess, dwFileOffsetHigh, dwFileOffsetLow, dwNumberOfBytesToMap) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\MapViewOfFile", "ptr", hFileMappingObject, "uint", dwDesiredAccess, "uint", dwFileOffsetHigh, "uint", dwFileOffsetLow, "ptr", dwNumberOfBytesToMap)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Maps a view of a file mapping into the address space of a calling process. A caller can optionally specify a suggested base memory address for the view.
     * @remarks
     * Mapping a file makes the specified portion of the file visible in the address space of the calling 
     *     process.
     * 
     * For files that are larger than the address space, you can only map a small portion of the file data at one 
     *     time. When the first view is complete, then you unmap it and map a new view.
     * 
     * To obtain the size of a view, use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualqueryex">VirtualQueryEx</a> function.
     * 
     * The initial contents of the pages in a file mapping object backed by the page file are 0 (zero).
     * 
     * Typically, the suggested address is used to specify that a file should be mapped at the same address in 
     *     multiple processes. This requires the region of address space to be available in all involved processes. No other 
     *     memory allocation can take place in the region that is used for mapping, including the use of the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> or 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualallocex">VirtualAllocEx</a> function to reserve memory.
     * 
     * If the <i>lpBaseAddress</i> parameter specifies a base offset, the function succeeds if the 
     *      specified memory region is not already in use by the calling process. The system does not ensure that the same 
     *      memory region is available for the memory mapped file in other 32-bit processes.
     * 
     * Multiple views of a file (or a file mapping object and its mapped file) are <i>coherent</i> 
     *     if they contain identical data at a specified time. This occurs if the file views are derived from the same file 
     *     mapping object. A process can duplicate a file mapping object handle into another process by using the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-duplicatehandle">DuplicateHandle</a> function, or another process can open 
     *     a file mapping object by name by using the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openfilemappinga">OpenFileMapping</a> function.
     * 
     * With one important exception, file views derived from any file mapping object that is backed by the same file 
     *     are coherent or identical at a specific time. Coherency is guaranteed for views within a process and for views 
     *     that are mapped by different processes.
     * 
     * The exception is related to remote files. Although 
     *     <b>MapViewOfFileEx</b> works with remote files, it does not 
     *     keep them coherent. For example, if two computers both map a file as writable, and both change the same page, each 
     *     computer only sees its own writes to the page. When the data gets updated on the disk, it is not merged.
     * 
     * A mapped view of a file is not guaranteed to be coherent with a file being accessed by the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a> or 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefile">WriteFile</a> function.
     * 
     * To guard against <b>EXCEPTION_IN_PAGE_ERROR</b> exceptions, use structured exception 
     *     handling to protect any code that writes to or reads from a memory mapped view of a file other than the page file. 
     *     For more information, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/Memory/reading-and-writing-from-a-file-view">Reading and Writing From a File View</a>.
     * 
     * When modifying a file through a mapped view, the last modification timestamp may not be updated automatically. 
     *      If required, the caller should use <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfiletime">SetFileTime</a> to set the 
     *      timestamp.
     * 
     * To have a file with executable permissions, an application must call
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfilemappinga">CreateFileMapping</a> with either 
     *     <b>PAGE_EXECUTE_READWRITE</b> or <b>PAGE_EXECUTE_READ</b>, and then call 
     *     <b>MapViewOfFileEx</b> with 
     *     <b>FILE_MAP_EXECUTE</b> | <b>FILE_MAP_WRITE</b> or 
     *     <b>FILE_MAP_EXECUTE</b> | <b>FILE_MAP_READ</b>.
     * 
     * In Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} hFileMappingObject A handle to a file mapping object. The 
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
     * @returns {Pointer<Void>} If the function succeeds, the return value is the starting address of the mapped view.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-mapviewoffileex
     * @since windows5.1.2600
     */
    static MapViewOfFileEx(hFileMappingObject, dwDesiredAccess, dwFileOffsetHigh, dwFileOffsetLow, dwNumberOfBytesToMap, lpBaseAddress) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\MapViewOfFileEx", "ptr", hFileMappingObject, "uint", dwDesiredAccess, "uint", dwFileOffsetHigh, "uint", dwFileOffsetLow, "ptr", dwNumberOfBytesToMap, "ptr", lpBaseAddress)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Releases, decommits, or releases and decommits a region of memory within the virtual address space of a specified process.
     * @remarks
     * Each page of memory in a process virtual address space has a 
     * <a href="https://docs.microsoft.com/windows/desktop/Memory/page-state">Page State</a>.  The 
     * <b>VirtualFreeEx</b> function can decommit a range of pages that are in different states, some committed and some uncommitted. This means that you can decommit a range of pages without first determining the current commitment state of each page. Decommitting a page releases its physical storage, either in memory or in the paging file on disk.
     * 
     * If a page is decommitted but not released, its state changes to reserved. Subsequently, you can  call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualallocex">VirtualAllocEx</a> to commit it, or 
     * <b>VirtualFreeEx</b> to release it. Attempting to read from or write to a reserved page results in an access violation exception.
     * 
     * The **VirtualFreeEx** function can release a range of pages that are in different states, some reserved and some committed. This means that you can release a range of pages without first determining the current commitment state of each page. The entire range of pages originally reserved by [VirtualAllocEx](nf-memoryapi-virtualallocex.md) must be released at the same time.
     * 
     * If a page is released, its state changes to free, and it is available for subsequent allocation operations. After memory is released or decommitted, you can never refer to the memory again. Any information that may have been in that memory is gone forever. Attempts to read from or write to a free page results in an access violation exception. If you need to keep information, do not decommit or free memory that  contains the information.
     * 
     * The **VirtualFreeEx** function can be used on an AWE region of memory and it invalidates any physical page mappings in the region when freeing the address space. However, the physical pages are not deleted, and the application can use them. The application must explicitly call [FreeUserPhysicalPages](nf-memoryapi-freeuserphysicalpages.md) to free the physical pages. When the  process is terminated, all resources are automatically cleaned up.
     * 
     * **Windows 10, version 1709 and later and Windows 11:** To delete the enclave when you finish using it, call [DeleteEnclave](../enclaveapi/nf-enclaveapi-deleteenclave.md). You cannot delete a VBS enclave by calling the [VirtualFree](nf-memoryapi-virtualfree.md) or **VirtualFreeEx** function. You can still delete an SGX enclave by calling **VirtualFree** or **VirtualFreeEx**.
     * 
     * **Windows 10, version 1507, Windows 10, version 1511, Windows 10, version 1607 and Windows 10, version 1703:** To delete the enclave when you finish using it, call the [VirtualFree](nf-memoryapi-virtualfree.md) or **VirtualFreeEx** function and specify the following values:
     * 
     * - The base address of the enclave for the _lpAddress_ parameter.
     * - 0 for the _dwSize_ parameter.
     * - **MEM_RELEASE** for the _dwFreeType_ parameter.
     * @param {Pointer<Void>} hProcess A handle to a process. The function frees memory within the virtual address space of the process.
     * 
     * The handle must have the <b>PROCESS_VM_OPERATION</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Void>} lpAddress A pointer to the starting address of the region of memory to be freed. 
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
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualfreeex
     * @since windows5.1.2600
     */
    static VirtualFreeEx(hProcess, lpAddress, dwSize, dwFreeType) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\VirtualFreeEx", "ptr", hProcess, "ptr", lpAddress, "ptr", dwSize, "uint", dwFreeType, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Writes to the disk a byte range within a mapped view of a file.
     * @remarks
     * Flushing a range of a mapped view initiates writing of dirty pages within that range to the disk. Dirty pages are those whose contents have changed since the file view was mapped. The <b>FlushViewOfFile</b> function does not flush the file metadata, and it does not wait to  return until  the changes are flushed from the underlying hardware disk cache and physically written to disk. To flush all the dirty pages plus the metadata for the file and ensure that they are physically written to disk, call <b>FlushViewOfFile</b> and then call the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-flushfilebuffers">FlushFileBuffers</a> function.
     * 
     * When flushing a memory-mapped file over a network, 
     * <b>FlushViewOfFile</b> guarantees that the data has been written from the local computer, but not that the data resides on the remote computer. The server can cache the data on the remote side. Therefore, 
     * <b>FlushViewOfFile</b> can return before the data has been physically written to disk.
     * 
     * When modifying a file through a mapped view, the last modification timestamp may not be updated automatically.  If required, the caller should use <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfiletime">SetFileTime</a> to set the timestamp.
     * 
     * In Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * When CsvFs is paused this call might fail with an error indicating that there is a lock conflict.
     * @param {Pointer<Void>} lpBaseAddress A pointer to the base address of the byte range to be flushed to the disk representation of the mapped file.
     * @param {Pointer} dwNumberOfBytesToFlush The number of bytes to be flushed. If <i>dwNumberOfBytesToFlush</i> is zero, the file is flushed from the base address to the end of the mapping.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-flushviewoffile
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
     * @remarks
     * Unmapping a mapped view of a file invalidates the range occupied by the view in the address space of the process and makes the range available for other allocations. It removes the working set entry for each unmapped virtual page that was part of the working set of the process and reduces the working set size of the process. It also decrements the share count of the corresponding physical page.
     * 
     * Modified pages in the unmapped view are not written to disk until their share count reaches zero, or in other words, until they are unmapped or trimmed from the working sets of all processes that share the pages. Even then, the modified pages are written "lazily" to disk; that is, modifications may be cached in memory and written to disk at a later time. To minimize the risk of data loss in the event of a power failure or a system crash, applications should explicitly flush modified pages using the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-flushviewoffile">FlushViewOfFile</a> function.
     * 
     * Although an application may close the file handle used to create a file mapping object, the system holds the corresponding file open until the last view of the file is unmapped.  Files for which the last view has not yet been unmapped are held open with no sharing restrictions.
     * 
     * In Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} lpBaseAddress A pointer to the base address of the mapped view of a file that is to be unmapped. This value must be identical to the value returned by a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffileex">MapViewOfFileEx</a> function.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-unmapviewoffile
     * @since windows5.1.2600
     */
    static UnmapViewOfFile(lpBaseAddress) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\UnmapViewOfFile", "ptr", lpBaseAddress, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the minimum size of a large page.
     * @remarks
     * The minimum large page size varies, but it is typically 2 MB or greater.
     * @returns {Pointer} If the processor supports large pages, the return value is the minimum size of a large page.
     * 
     * If the processor does not support large pages, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-getlargepageminimum
     * @since windows6.0.6000
     */
    static GetLargePageMinimum() {
        result := DllCall("KERNEL32.dll\GetLargePageMinimum", "ptr")
        return result
    }

    /**
     * Retrieves the minimum and maximum working set sizes of the specified process. (GetProcessWorkingSetSizeEx)
     * @remarks
     * The "working set" of a process is the set of memory pages currently visible to the process in physical RAM memory. These pages are resident and available for an application to use without triggering a page fault. The minimum and maximum working set sizes affect the virtual memory paging behavior of a process.
     * @param {Pointer<Void>} hProcess A handle to the process whose working set sizes will be obtained. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003:  </b>The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right.
     * @param {Pointer<UIntPtr>} lpMinimumWorkingSetSize A pointer to a variable that receives the minimum working set size of the specified process, in bytes. The virtual memory manager attempts to keep at least this much memory resident in the process whenever the process is active.
     * @param {Pointer<UIntPtr>} lpMaximumWorkingSetSize A pointer to a variable that receives the maximum working set size of the specified process, in bytes. The virtual memory manager attempts to keep no more than this much memory resident in the process whenever the process is active when memory is in short supply.
     * @param {Pointer<UInt32>} Flags The flags that control the enforcement of the minimum and maximum working set sizes.
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-getprocessworkingsetsizeex
     * @since windows6.0.6000
     */
    static GetProcessWorkingSetSizeEx(hProcess, lpMinimumWorkingSetSize, lpMaximumWorkingSetSize, Flags) {
        result := DllCall("KERNEL32.dll\GetProcessWorkingSetSizeEx", "ptr", hProcess, "ptr*", lpMinimumWorkingSetSize, "ptr*", lpMaximumWorkingSetSize, "uint*", Flags, "int")
        return result
    }

    /**
     * Sets the minimum and maximum working set sizes for the specified process. (SetProcessWorkingSetSizeEx)
     * @remarks
     * The working set of a process is the set of memory pages in the virtual address space of the process that are currently resident in physical memory. These pages are available for an application to use without triggering a page fault. For more information about page faults, see <a href="https://docs.microsoft.com/windows/desktop/Memory/working-set">Working Set</a>. The minimum and maximum working set sizes affect the virtual memory paging behavior of a process.
     * 
     * The working set of the specified process can be emptied by specifying the value (<b>SIZE_T</b>)–1 for both the minimum and maximum working set sizes. This removes as many pages as possible from the working set. The <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-emptyworkingset">EmptyWorkingSet</a> function can also be used for this purpose.
     * 
     * If the values of either <i>dwMinimumWorkingSetSize</i> or <i>dwMaximumWorkingSetSize</i> are greater than the process' current working set sizes, the specified process must have the <b>SE_INC_WORKING_SET_NAME</b> privilege. All users generally have this privilege. For more information about security privileges, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privileges">Privileges</a>.
     * 
     * <b>Windows Server 2003:  </b>The specified process must have the <b>SE_INC_BASE_PRIORITY_NAME</b> privilege. Users in the Administrators and Power Users groups generally have this privilege.
     * 
     * The operating system allocates working set sizes on a first-come, first-served basis. For example, if an application successfully sets 40 megabytes as its minimum working set size on a 64-megabyte system, and a second application requests a 40-megabyte working set size, the operating system denies the second application's request.
     * 
     * By default, using the 
     * <a href="https://docs.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-setprocessworkingsetsize">SetProcessWorkingSetSize</a> function to set an application's minimum and maximum working set sizes does not guarantee that the requested memory will be reserved, or that it will remain resident at all times. When an application is idle, or a low-memory situation causes a demand for memory, the operating system can reduce the application's working set below its minimum working set limit. If memory is abundant, the system might allow an application to exceed its maximum working set limit. The <b>QUOTA_LIMITS_HARDWS_MIN_ENABLE</b> and <b>QUOTA_LIMITS_HARDWS_MAX_ENABLE</b> flags enable you to ensure that limits are enforced.
     * 
     * When you increase the working set size of an application, you are taking away physical memory from the rest of the system. This can degrade the performance of other applications and the system as a whole. It can also lead to failures of operations that require physical memory to be present (for example, creating processes, threads, and kernel pool). Thus, you must use the 
     * <a href="https://docs.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-setprocessworkingsetsize">SetProcessWorkingSetSize</a> function carefully. You must always consider the performance of the whole system when you are designing an application.
     * 
     * An application can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtuallock">VirtualLock</a> function to lock ranges of the application's virtual address space in memory; however, that can potentially degrade the performance of the system.
     * @param {Pointer<Void>} hProcess A handle to the process whose working set sizes is to be set.
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
     * @returns {Integer} If the function is succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the function fails, the return value is zero. To get extended error information, call 
     * <b>GetLastError</b>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-setprocessworkingsetsizeex
     * @since windows6.0.6000
     */
    static SetProcessWorkingSetSizeEx(hProcess, dwMinimumWorkingSetSize, dwMaximumWorkingSetSize, Flags) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetProcessWorkingSetSizeEx", "ptr", hProcess, "ptr", dwMinimumWorkingSetSize, "ptr", dwMaximumWorkingSetSize, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locks the specified region of the process's virtual address space into physical memory, ensuring that subsequent access to the region will not incur a page fault.
     * @remarks
     * All pages in the specified region must be committed. Memory protected with <b>PAGE_NOACCESS</b> cannot be locked.
     * 
     * Locking pages into memory may degrade the performance of the system by reducing the available RAM and forcing the system to swap out other critical pages to the paging file. Each version of Windows has a limit on the maximum number of pages a process can lock. This limit is intentionally small to avoid severe performance degradation. Applications that need to lock larger numbers of pages must first call the 
     * <a href="https://docs.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-setprocessworkingsetsize">SetProcessWorkingSetSize</a> function to increase their minimum and maximum working set sizes. The maximum number of pages that a process can lock is equal to the number of pages in its minimum working set minus a small overhead.
     * 
     * Pages that a process has locked remain in physical memory until the process unlocks them or terminates. These pages are guaranteed not to be written to the pagefile while they are locked.
     * 
     * To unlock a region of locked pages, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualunlock">VirtualUnlock</a> function. Locked pages are automatically unlocked when the process terminates.
     * 
     * This function is not like the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globallock">GlobalLock</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-locallock">LocalLock</a> function in that it does not increment a lock count and translate a handle into a pointer. There is no lock count for virtual pages, so multiple calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualunlock">VirtualUnlock</a> function are never required to unlock a region of pages.
     * @param {Pointer<Void>} lpAddress A pointer to the base address of the region of pages to be locked.
     * @param {Pointer} dwSize The size of the region to be locked, in bytes. The region of affected pages includes all pages that contain one or more bytes in the range from the <i>lpAddress</i> parameter to <c>(lpAddress+dwSize)</c>. This means that a 2-byte range straddling a page boundary causes both pages to be locked.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtuallock
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
     * @remarks
     * For the function to succeed, the range specified need not match a range passed to a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtuallock">VirtualLock</a> function, but all pages in the range must be locked. If any of the pages in the specified range are not locked, <b>VirtualUnlock</b> removes such pages from the working set, sets last error to <b>ERROR_NOT_LOCKED</b>, and returns <b>FALSE</b>.
     * 
     * Calling 
     * <b>VirtualUnlock</b> on a range of memory that is not locked releases the pages from the process's working set.
     * @param {Pointer<Void>} lpAddress A pointer to the base address of the region of pages to be unlocked.
     * @param {Pointer} dwSize The size of the region being unlocked, in bytes. The region of affected pages includes all pages containing one or more bytes in the range from the <i>lpAddress</i> parameter to <c>(lpAddress+dwSize)</c>. This means that a 2-byte range straddling a page boundary causes both pages to be unlocked.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualunlock
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
     * @remarks
     * When you call the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> function 
     *     to reserve or commit memory, you can specify <b>MEM_WRITE_WATCH</b>. This value causes the system to keep track of the 
     *     pages that are written to in the committed memory region. You can call the 
     *     <b>GetWriteWatch</b> function to retrieve the addresses of the 
     *     pages that have been written to since the region has been allocated or the write-tracking state has been reset.
     * 
     * To reset the write-tracking state, set the <b>WRITE_WATCH_FLAG_RESET</b> value in the 
     *     <i>dwFlags</i> parameter. Alternatively, you can call the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-resetwritewatch">ResetWriteWatch</a> function to reset the write-tracking 
     *     state. However, if you use <b>ResetWriteWatch</b>,  you must 
     *     ensure that no threads write to the region during the interval between the 
     *     <b>GetWriteWatch</b> and 
     *     <b>ResetWriteWatch</b> calls. Otherwise, there may be written 
     *     pages that you do not detect.
     * 
     * The <b>GetWriteWatch</b> function can be useful to 
     *     profilers, debugging tools, or garbage collectors.
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
     * @param {Pointer<Void>} lpAddresses A pointer to a buffer that receives an array of page addresses in the memory region. 
     * 
     * The addresses indicate 
     *       the pages that have been written to since the region has been allocated or the write-tracking state has been reset.
     * @param {Pointer<UIntPtr>} lpdwCount On input, this variable indicates the size of the <i>lpAddresses</i> array, in array 
     *      elements. 
     * 
     * On output, the variable receives the number of page addresses that are returned in the array.
     * @param {Pointer<UInt32>} lpdwGranularity A pointer to a variable that receives the page size, in bytes.
     * @returns {Pointer} If the function succeeds, the return value is 0 (zero).
     * 
     * If the function fails, the return value is a nonzero value.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-getwritewatch
     * @since windows5.1.2600
     */
    static GetWriteWatch(dwFlags, lpBaseAddress, dwRegionSize, lpAddresses, lpdwCount, lpdwGranularity) {
        result := DllCall("KERNEL32.dll\GetWriteWatch", "uint", dwFlags, "ptr", lpBaseAddress, "ptr", dwRegionSize, "ptr", lpAddresses, "ptr*", lpdwCount, "uint*", lpdwGranularity)
        return result
    }

    /**
     * Resets the write-tracking state for a region of virtual memory. Subsequent calls to the GetWriteWatch function only report pages that are written to since the reset operation.
     * @remarks
     * The <b>ResetWriteWatch</b> function can be useful to an 
     *     application such as a garbage collector. The application calls the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-getwritewatch">GetWriteWatch</a> function to retrieve the list of written 
     *     pages, and then writes to those pages as part of its cleanup operation. Then the garbage collector calls 
     *     <b>ResetWriteWatch</b> to remove the write-tracking records 
     *     caused by the cleanup.
     * 
     * You can also reset the write-tracking state of a memory region by specifying <b>WRITE_WATCH_FLAG_RESET</b> when you 
     *     call <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-getwritewatch">GetWriteWatch</a>.
     * 
     * If you use <b>ResetWriteWatch</b>, you must ensure that 
     *     no threads write to the region during the interval between the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-getwritewatch">GetWriteWatch</a> and 
     *     <b>ResetWriteWatch</b> calls. Otherwise, there may be written 
     *     pages that you not detect.
     * @param {Pointer<Void>} lpBaseAddress A pointer to the base address of the memory region for which to reset the write-tracking state. 
     * 
     * This address 
     *       must be in a memory region that is allocated by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> function with <b>MEM_WRITE_WATCH</b>.
     * @param {Pointer} dwRegionSize The size of the memory region for which to reset the write-tracking information, in bytes.
     * @returns {Pointer} If the function succeeds, the return value is 0 (zero).
     * 
     * If the function fails, the return value is a nonzero value.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-resetwritewatch
     * @since windows5.1.2600
     */
    static ResetWriteWatch(lpBaseAddress, dwRegionSize) {
        result := DllCall("KERNEL32.dll\ResetWriteWatch", "ptr", lpBaseAddress, "ptr", dwRegionSize)
        return result
    }

    /**
     * Creates a memory resource notification object.
     * @remarks
     * Applications can use memory resource notification events to scale the memory usage as appropriate. If 
     *     available memory is low, the application can reduce its working set. If available memory is high, the application 
     *     can allocate more memory.
     * 
     * Any thread of the calling process can specify the memory resource notification handle in a call to the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-querymemoryresourcenotification">QueryMemoryResourceNotification</a> 
     *     function or one of the <a href="https://docs.microsoft.com/windows/desktop/Sync/wait-functions">wait functions</a>. The state of the 
     *     object is signaled when the specified memory condition exists. This is a system-wide event, so all applications 
     *     receive notification when the object is signaled. Note that there is a range of memory availability where neither 
     *     the <b>LowMemoryResourceNotification</b> or 
     *     <b>HighMemoryResourceNotification</b> object is signaled. In this case, applications should 
     *     attempt to keep the memory use constant.
     * 
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function to close the handle. The 
     *     system closes the handle automatically when the process terminates. The memory resource notification object is 
     *     destroyed when its last handle has been closed.
     * 
     * To compile an application that uses this function, define the <b>_WIN32_WINNT</b> macro 
     *     as 0x0501 or later. For more information, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
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
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to a memory resource notification object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended  information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-creatememoryresourcenotification
     * @since windows5.1.2600
     */
    static CreateMemoryResourceNotification(NotificationType) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateMemoryResourceNotification", "int", NotificationType)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the state of the specified memory resource object.
     * @remarks
     * Unlike the 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/wait-functions">wait functions</a>, 
     * <b>QueryMemoryResourceNotification</b> does not block the calling thread. Therefore, it is an efficient way to check the state of physical memory before proceeding with an operation.
     * 
     * To compile an application that uses this function, define the _WIN32_WINNT macro as 0x0501 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Pointer<Void>} ResourceNotificationHandle A handle to a memory resource notification object. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-creatememoryresourcenotification">CreateMemoryResourceNotification</a> function returns this handle.
     * @param {Pointer<Int32>} ResourceState The memory pointed to by this parameter receives the state of the memory resource notification object. The value of this parameter is set to <b>TRUE</b> if the specified memory condition exists, and  <b>FALSE</b> if the specified memory condition does not exist.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. For more error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-querymemoryresourcenotification
     * @since windows5.1.2600
     */
    static QueryMemoryResourceNotification(ResourceNotificationHandle, ResourceState) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\QueryMemoryResourceNotification", "ptr", ResourceNotificationHandle, "int*", ResourceState, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the current size limits for the working set of the system cache.
     * @remarks
     * To compile an application that uses this function, define <b>_WIN32_WINNT</b> as 0x0502 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * 
     * The <b>FILE_CACHE</b> constants will be defined in the Windows header files starting with the Windows SDK for Windows Server 2008. If you are using header files from an earlier version of the SDK, add the definitions shown in <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-setsystemfilecachesize">SetSystemFileCacheSize</a> to your code.
     * @param {Pointer<UIntPtr>} lpMinimumFileCacheSize A pointer to a variable that receives the minimum size of the file cache, in bytes. The virtual memory manager attempts to keep at least this much memory resident in the system file cache, if there is a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-setsystemfilecachesize">SetSystemFileCacheSize</a> function with the <b>FILE_CACHE_MIN_HARD_ENABLE</b> flag.
     * @param {Pointer<UIntPtr>} lpMaximumFileCacheSize A pointer to a variable that receives the maximum size of the file cache, in bytes. The virtual memory manager enforces this limit only if there is a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-setsystemfilecachesize">SetSystemFileCacheSize</a> with the <b>FILE_CACHE_MAX_HARD_ENABLE</b> flag.
     * @param {Pointer<UInt32>} lpFlags The flags that indicate which of the file cache limits are enabled.
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
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-getsystemfilecachesize
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
     * @remarks
     * The calling process must enable the <b>SE_INCREASE_QUOTA_NAME</b> privilege.
     * 
     * Setting the <i>MaximumFileCacheSize</i> parameter to a very low value can adversely affect system performance.
     * 
     * To compile an application that uses this function, define <b>_WIN32_WINNT</b> as 0x0502 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * 
     * The <b>FILE_CACHE_*</b> constants will be defined in the Windows header files starting with the Windows SDK for Windows Server 2008. If you are using header files from an earlier version of the SDK, add the following definitions to your code.
     * 
     * 
     * ```cpp
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
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-setsystemfilecachesize
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
     * Creates or opens a named or unnamed file mapping object for a specified file and specifies the NUMA node for the physical memory. (CreateFileMappingNumaW)
     * @remarks
     * After a file mapping object is created, the size of the file must not exceed the size of the file mapping 
     *     object; if it does, not all of the file contents are available for sharing.
     * 
     * The file mapping object can be shared by duplication, inheritance, or by name. The initial contents of the 
     *     pages in a file mapping object backed by the page file are 0 (zero).
     * 
     * If an application specifies a size for the file mapping object that is larger than the size of the actual 
     *      named file on disk and if the page protection allows write access (that is, the 
     *      <i>flProtect</i> parameter specifies  <b>PAGE_READWRITE</b> or 
     *      <b>PAGE_EXECUTE_READWRITE</b>), then the file on disk is increased to match the specified size 
     *      of the file mapping object. If the file is extended, the contents of the file between the old end of the file and 
     *      the new end of the file are not guaranteed to be zero; the behavior is defined by the file system.
     * 
     * If the file cannot be increased, the result is a failure to create the file mapping object and the 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns 
     *      <b>ERROR_DISK_FULL</b>.
     * 
     * The handle that the <b>CreateFileMappingNuma</b> 
     *     function returns has full access to a new file mapping object and can be used with any function that requires a 
     *     handle to a file mapping object. A file mapping object can be shared through process creation, handle duplication, 
     *     or by name. For more information, see the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-duplicatehandle">DuplicateHandle</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openfilemappinga">OpenFileMapping</a> functions.
     * 
     * Creating a file mapping object creates the potential for mapping a view of the file but does not map the view. 
     *     The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-mapviewoffileexnuma">MapViewOfFileExNuma</a> function maps a view of a 
     *     file into a process address space.
     * 
     * With one important exception, file views derived from a single file mapping object are coherent or identical 
     *     at a specific time. If multiple processes have handles of the same file mapping object, they see a coherent view 
     *     of the data when they map a view of the file.
     * 
     * The exception is related to remote files. Although the 
     *     <b>CreateFileMappingNuma</b> function works with remote 
     *     files, it does not keep them coherent. For example, if two computers both map a file as writable and both change 
     *     the same page, each computer sees only its own writes to the page. When the data gets updated on the disk, the 
     *     page is not merged.
     * 
     * A mapped file and a file that is accessed by using the input and output (I/O) functions 
     *     (<a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefile">WriteFile</a>) are not necessarily coherent.
     * 
     * To fully close a file mapping object, an application must unmap all mapped views of the file mapping object by 
     *      calling the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-unmapviewoffile">UnmapViewOfFile</a> function and then close 
     *      the file mapping object handle by calling the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> 
     *      function.
     * 
     * These functions can be called in any order. The call to the 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-unmapviewoffile">UnmapViewOfFile</a> function is necessary, because mapped 
     *      views of a file mapping object maintain internal open handles to the object, and a file mapping object does not 
     *      close until all open handles to it are closed.
     * 
     * When modifying a file through a mapped view, the last modification timestamp may not be updated automatically. 
     *      If required, the caller should use <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfiletime">SetFileTime</a> to set the 
     *      timestamp.
     * 
     * Creating a file-mapping object from a session other than session zero requires the 
     *      <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">SeCreateGlobalPrivilege</a> privilege. 
     *      Note that this privilege check is limited to the creation of file mapping objects and does not apply to opening 
     *      existing ones. For example, if a service or the system creates a file mapping object, any process running in any 
     *      session can access that file mapping object provided that the caller has the required access rights.
     * 
     * Use structured exception handling to protect any code that writes to or reads from a memory mapped view. For 
     *      more information, see 
     *      <a href="https://docs.microsoft.com/windows/desktop/Memory/reading-and-writing-from-a-file-view">Reading and Writing From a File View</a>.
     * 
     * To have a mapping with executable permissions, an application must call the 
     *      <b>CreateFileMappingNuma</b> function with either 
     *      <b>PAGE_EXECUTE_READWRITE</b> or <b>PAGE_EXECUTE_READ</b> and then call the 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-mapviewoffileexnuma">MapViewOfFileExNuma</a> function with 
     *      <c>FILE_MAP_EXECUTE | FILE_MAP_WRITE</c> or 
     *      <c>FILE_MAP_EXECUTE | FILE_MAP_READ</c>.
     * 
     * In Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} hFile A handle to the file from which to create a file mapping object. 
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
     * @param {Pointer<Char>} lpName The name of the file mapping object.
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
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the file mapping object.
     * 
     * If the object exists 
     *        before the function call, the function returns a handle to the existing object (with its current size, not the 
     *        specified size) and the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-createfilemappingnumaw
     * @since windows6.0.6000
     */
    static CreateFileMappingNumaW(hFile, lpFileMappingAttributes, flProtect, dwMaximumSizeHigh, dwMaximumSizeLow, lpName, nndPreferred) {
        lpName := lpName is String? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateFileMappingNumaW", "ptr", hFile, "ptr", lpFileMappingAttributes, "uint", flProtect, "uint", dwMaximumSizeHigh, "uint", dwMaximumSizeLow, "ptr", lpName, "uint", nndPreferred)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Provides an efficient mechanism to bring into memory potentially discontiguous virtual address ranges in a process address space.
     * @remarks
     * The <b>PrefetchVirtualMemory</b> function is 
     *      targeted at applications that know with reasonable confidence the set of addresses they will be accessing. If 
     *      it's likely that these addresses are no longer resident in memory (i.e. they have been paged out to disk), 
     *      calling the <b>PrefetchVirtualMemory</b> function on 
     *      those address ranges before access will reduce the overall latency because the API will efficiently bring in 
     *      those address ranges from disk using large, concurrent I/O requests where possible.
     * 
     * The <b>PrefetchVirtualMemory</b> function allows 
     *      applications to make efficient use of disk hardware by issuing large, concurrent I/Os where possible when the 
     *      application provides a list of process address ranges that are going to be accessed. Even for a single address 
     *      range (e.g. a file mapping), the 
     *      <b>PrefetchVirtualMemory</b> function can provide 
     *      performance improvements by issuing a single large I/O rather than the many smaller I/Os that would be issued via 
     *      page faulting.
     * 
     * The <b>PrefetchVirtualMemory</b> function is purely 
     *      a performance optimization: prefetching is not necessary for accessing the target address ranges. The prefetched 
     *      memory is not added to the target process' working set; it is cached in physical memory. When the prefetched 
     *      address ranges are accessed by the target process, they will be added to the working set.
     * 
     * Since the <b>PrefetchVirtualMemory</b> function can 
     *      never be necessary for correct operation of applications, it is treated as a strong hint by the system and is 
     *      subject to usual physical memory constraints where it can completely or partially fail under low-memory 
     *      conditions. It can also create memory pressure if called with large address ranges, so applications should only 
     *      prefetch address ranges they will actually use.
     * 
     * To compile an application that calls this function, define <b>_WIN32_WINNT</b> as 
     *     <b>_WIN32_WINNT_WIN8</b> or higher. For more information, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Pointer<Void>} hProcess Handle to the process whose virtual address ranges are to be prefetched. Use the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a> function to use the current 
     *       process.
     * @param {Pointer} NumberOfEntries Number of entries in the array pointed to by the <i>VirtualAddresses</i> 
     *       parameter.
     * @param {Pointer<WIN32_MEMORY_RANGE_ENTRY>} VirtualAddresses Pointer to an array of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/ns-memoryapi-win32_memory_range_entry">WIN32_MEMORY_RANGE_ENTRY</a> structures which 
     *       each specify a virtual address range to be prefetched. The virtual address ranges may cover any part of the 
     *       process address space accessible by the target process.
     * @param {Integer} Flags Reserved. Must be 0.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-prefetchvirtualmemory
     * @since windows8.0
     */
    static PrefetchVirtualMemory(hProcess, NumberOfEntries, VirtualAddresses, Flags) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\PrefetchVirtualMemory", "ptr", hProcess, "ptr", NumberOfEntries, "ptr", VirtualAddresses, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates or opens a named or unnamed file mapping object for a specified file from a Windows Store app.
     * @remarks
     * After a file mapping object is created, the size of the file must not exceed the size of the file mapping 
     *     object; if it does, not all of the file contents are available for sharing.
     * 
     * If an application specifies a size for the file mapping object that is larger than the size of the actual 
     *     named file on disk and if the page protection allows write access (that is, the 
     *     <i>flProtect</i> parameter specifies  <b>PAGE_READWRITE</b>), then the file 
     *     on disk is increased to match the specified size of the file mapping object. If the file is extended, the contents 
     *     of the file between the old end of the file and the new end of the file are not guaranteed to be zero; the 
     *     behavior is defined by the file system. If the file on disk cannot be increased, 
     *     <b>CreateFileMappingFromApp</b> fails and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>  returns 
     *     <b>ERROR_DISK_FULL</b>.
     * 
     * The initial contents of the pages in a file mapping object backed by the operating system paging file are 0 
     *     (zero).
     * 
     * The handle that <b>CreateFileMappingFromApp</b> 
     *     returns has full access to a new file mapping object, and can be used with any function that requires a handle to 
     *     a file mapping object.
     * 
     * Multiple processes can share a view of the same file   by either using a single shared file mapping object or 
     *     creating separate file mapping objects backed by the same file. A single file mapping object can be shared by 
     *     multiple processes through inheriting the handle at process creation, duplicating the handle, or opening the file 
     *     mapping object by name. For more information, see the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>, 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-duplicatehandle">DuplicateHandle</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openfilemappinga">OpenFileMapping</a> functions.
     * 
     * Creating a file mapping object does not actually map the view into a process address space. The 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffileex">MapViewOfFileEx</a> function map a view of a file into a 
     *     process address space.
     * 
     * With one important exception, file views derived from any file mapping object that is backed by the same file 
     *     are coherent or identical at a specific time. Coherency is guaranteed for views within a process and for views 
     *     that are mapped by different processes.
     * 
     * The exception is related to remote files. Although 
     *     <b>CreateFileMappingFromApp</b> works with remote 
     *     files, it does not keep them coherent. For example, if two computers both map a file as writable, and both change 
     *     the same page, each computer only sees its own writes to the page. When the data gets updated on the disk, it is 
     *     not merged.
     * 
     * A mapped file and a file that is accessed by using the input and output (I/O) functions 
     *     (<a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefile">WriteFile</a>) are not necessarily coherent.
     * 
     * Mapped views of a file mapping object maintain internal references to the object, and a file mapping object 
     *     does not close until all references to it are released. Therefore, to fully close a file mapping object, an 
     *     application must unmap all mapped views of the file mapping object by calling 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-unmapviewoffile">UnmapViewOfFile</a> and  close the file mapping object 
     *     handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a>. These functions can be 
     *     called in any order.
     * 
     * When modifying a file through a mapped view, the last modification timestamp may not be updated automatically. 
     *     If required, the caller should use <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfiletime">SetFileTime</a> to set the 
     *     timestamp.
     * 
     * Use structured exception handling to protect any code that writes to or reads from a file view. For more 
     *     information, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/Memory/reading-and-writing-from-a-file-view">Reading and Writing From a File View</a>.
     * 
     *  You can only successfully request executable protection if your app has the <b>codeGeneration</b> capability.
     * @param {Pointer<Void>} hFile A handle to the file from which to create a file mapping object.
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
     * @param {Pointer<Char>} Name The name of the file mapping object.
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
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the newly created file mapping object.
     * 
     * If the object exists before the function call, the function returns a handle to the existing object (with its 
     *        current size, not the specified size), and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> 
     *        returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-createfilemappingfromapp
     * @since windows8.0
     */
    static CreateFileMappingFromApp(hFile, SecurityAttributes, PageProtection, MaximumSize, Name) {
        Name := Name is String? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateFileMappingFromApp", "ptr", hFile, "ptr", SecurityAttributes, "uint", PageProtection, "uint", MaximumSize, "ptr", Name)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Maps a view of a file mapping into the address space of a calling Windows Store app. (MapViewOfFileFromApp)
     * @remarks
     * With one important exception, file views derived from any file mapping object that is backed by the same file 
     *     are coherent or identical at a specific time. Coherency is guaranteed for views within a process and for views 
     *     that are mapped by different processes.
     * 
     * The exception is related to remote files. Although 
     *     <b>MapViewOfFileFromApp</b> works with remote files, it 
     *     does not keep them coherent. For example, if two computers both map a file as writable, and both change the same 
     *     page, each computer only sees its own writes to the page. When the data gets updated on the disk, it is not 
     *     merged.
     * 
     *  You can only successfully request executable protection if your app has the <b>codeGeneration</b> capability.
     * @param {Pointer<Void>} hFileMappingObject A handle to a file mapping object. The 
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
     * @returns {Pointer<Void>} If the function succeeds, the return value is the starting address of the mapped view.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-mapviewoffilefromapp
     * @since windows8.0
     */
    static MapViewOfFileFromApp(hFileMappingObject, DesiredAccess, FileOffset, NumberOfBytesToMap) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\MapViewOfFileFromApp", "ptr", hFileMappingObject, "uint", DesiredAccess, "uint", FileOffset, "ptr", NumberOfBytesToMap)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * This is an extended version of UnmapViewOfFile that takes an additional flags parameter.
     * @remarks
     * For more information about the behavior of this function, see the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-unmapviewoffile">UnmapViewOfFile</a> function.
     * @param {Pointer<Void>} BaseAddress A pointer to the base address of the mapped view of a file that is to be unmapped. This value must be identical to the value returned by a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffileex">MapViewOfFileEx</a> function.
     * @param {Integer} UnmapFlags 
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-unmapviewoffileex
     * @since windows8.0
     */
    static UnmapViewOfFileEx(BaseAddress, UnmapFlags) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\UnmapViewOfFileEx", "ptr", BaseAddress, "uint", UnmapFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates physical memory pages to be mapped and unmapped within any Address Windowing Extensions (AWE) region of a specified process.
     * @remarks
     * The <b>AllocateUserPhysicalPages</b> function 
     *     is used to allocate physical memory that can later be mapped within the virtual address space of the process. The <b>SeLockMemoryPrivilege</b> privilege  must be enabled in the caller's token or the function will fail with <b>ERROR_PRIVILEGE_NOT_HELD</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privilege-constants">Privilege Constants</a>.
     * 
     * Memory allocated by this function must be physically present in the system. 
     *     After the memory is allocated, it is locked down and unavailable to the rest of the virtual memory 
     *     management system.
     * 
     * Physical pages cannot be simultaneously mapped at more than one virtual address.
     * 
     * Physical pages can reside at any physical address. You should make no assumptions about the contiguity of the 
     *     physical pages.
     * 
     * To compile an application that uses this function, define the _WIN32_WINNT macro as 0x0500 or later. For more 
     *     information, see <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Pointer<Void>} hProcess A handle to a process.
     * 
     * The function allocates memory that can later be mapped within the virtual address space of this process. The handle must have the <b>PROCESS_VM_OPERATION</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<UIntPtr>} NumberOfPages The size of the physical memory to allocate, in pages.
     * 
     * To determine the page size of the computer, use the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function. On output, this parameter 
     *       receives the number of pages that are actually allocated, which might be less than the number requested.
     * @param {Pointer<UIntPtr>} PageArray A pointer to an array to store the page frame numbers of the allocated memory.
     * 
     * The size of the array 
     *       that is allocated should be at least the <i>NumberOfPages</i> times the size of the 
     *       <b>ULONG_PTR</b> data type.
     *       
     * 
     * Do not attempt to modify this buffer. It contains operating system data, and corruption could be 
     *        catastrophic. The information in the buffer is not useful to an application.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * Fewer pages than requested can be allocated. 
     *       The caller must check the value of the <i>NumberOfPages</i> parameter on return to see how 
     *       many pages are allocated. All allocated page frame numbers are sequentially placed in the memory pointed to by 
     *       the <i>UserPfnArray</i> parameter.
     *       
     * 
     * If the function fails, the return value is <b>FALSE</b>, and no frames are allocated. To get extended error 
     *        information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-allocateuserphysicalpages
     * @since windows5.1.2600
     */
    static AllocateUserPhysicalPages(hProcess, NumberOfPages, PageArray) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\AllocateUserPhysicalPages", "ptr", hProcess, "ptr*", NumberOfPages, "ptr*", PageArray, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Frees physical memory pages that are allocated previously by using AllocateUserPhysicalPages or AllocateUserPhysicalPagesNuma.
     * @remarks
     * In a multiprocessor environment, this function maintains coherence of the hardware translation buffer. When this function returns, all threads on all processors are guaranteed to see the correct mapping.
     * 
     * To compile an application that uses this function, define the _WIN32_WINNT macro as 0x0500 or later. For more 
     *     information, see <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows 
     *     Headers</a>.
     * @param {Pointer<Void>} hProcess The handle to a process. 
     * 
     * The function frees memory within the virtual address space of this process.
     * @param {Pointer<UIntPtr>} NumberOfPages The size of the physical memory to free, in pages. 
     * 
     * On return, if the function fails, this parameter indicates 
     *       the number of pages that are freed.
     * @param {Pointer<UIntPtr>} PageArray A pointer to an array of page frame numbers of the allocated memory to be freed.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. In this case, the <i>NumberOfPages</i> 
     *        parameter reflect how many pages have actually been released. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-freeuserphysicalpages
     * @since windows5.1.2600
     */
    static FreeUserPhysicalPages(hProcess, NumberOfPages, PageArray) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\FreeUserPhysicalPages", "ptr", hProcess, "ptr*", NumberOfPages, "ptr*", PageArray, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Maps previously allocated physical memory pages at a specified address in an Address Windowing Extensions (AWE) region. (MapUserPhysicalPages)
     * @remarks
     * The physical pages are unmapped but they are not freed. You must call 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-freeuserphysicalpages">FreeUserPhysicalPages</a> to free the 
     *     physical pages.
     * 
     * Any number of physical memory pages can be specified, but the memory must  not extend outside the virtual 
     *     address space that <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> allocates. Any 
     *     existing address maps are automatically overwritten with the new translations, and the old translations are 
     *     unmapped.
     * 
     * You cannot map physical memory pages outside the range that is specified in 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-allocateuserphysicalpages">AllocateUserPhysicalPages</a>. You 
     *     can map multiple regions simultaneously, but they cannot overlap.
     * 
     * Physical pages can be located at any physical address, but do not make assumptions about the contiguity of the 
     *     physical pages.
     * 
     * To unmap the current address range, specify <b>NULL</b> as the physical memory page array parameter. Any 
     *     currently mapped pages are unmapped, but are not freed. You must call 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-freeuserphysicalpages">FreeUserPhysicalPages</a> to free the 
     *     physical pages.
     * 
     * In a multiprocessor environment, this function maintains hardware translation buffer coherence. On return 
     *     from this function, all threads on all processors are guaranteed to see the correct mapping.
     * 
     * To compile an application that uses this function, define the _WIN32_WINNT macro as 0x0500 or later. For more 
     *     information, see <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows 
     *     Headers</a>.
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
     * @param {Pointer<UIntPtr>} PageArray A pointer to an array of physical page frame numbers. 
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
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b> and no mapping is done—partial or otherwise. 
     *        To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-mapuserphysicalpages
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
     * @remarks
     * The <b>AllocateUserPhysicalPagesNuma</b> 
     *     function is used to allocate physical memory within a NUMA node that can later be mapped within the virtual 
     *     address space of the process. The <b>SeLockMemoryPrivilege</b> privilege must be enabled in the 
     *     caller's token or the function will fail with <b>ERROR_PRIVILEGE_NOT_HELD</b>. For more 
     *     information, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privilege-constants">Privilege Constants</a>.
     * 
     * Memory allocated by this function must be physically present in the system. After the memory is allocated, it 
     *     is locked down and unavailable to the rest of the virtual memory management system.
     * 
     * Physical pages cannot be simultaneously mapped at more than one virtual address.
     * 
     * Physical pages can reside at any physical address. You should make no assumptions about the contiguity of the 
     *     physical pages.
     * 
     * To compile an application that uses this function, define <b>_WIN32_WINNT</b> as 0x0600 
     *     or later.
     * @param {Pointer<Void>} hProcess A handle to a process. 
     * 
     * The function allocates memory that can later be mapped within the virtual address 
     *       space of this process. The handle must have the <b>PROCESS_VM_OPERATION</b> access right. For 
     *       more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<UIntPtr>} NumberOfPages The size of the physical memory to allocate, in pages.
     * 
     * To determine the page size of the computer, use the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function. On output, this parameter 
     *        receives the number of pages that are actually allocated, which might be less than the number requested.
     * @param {Pointer<UIntPtr>} PageArray A pointer to an array to store the page frame numbers of the allocated memory.
     * 
     * The size of the array that is allocated should be at least the <i>NumberOfPages</i> times 
     *        the size of the <b>ULONG_PTR</b> data type.
     * 
     * <div class="alert"><b>Caution</b>  Do not attempt to modify this buffer. It contains operating system data, and corruption 
     *        could be catastrophic. The information in the buffer is not useful to an application.</div>
     * <div> </div>
     * @param {Integer} nndPreferred The NUMA node where the physical memory should reside.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * Fewer pages than requested can be allocated. The caller must check the value of the 
     *        <i>NumberOfPages</i> parameter on return to see how many pages are allocated. All allocated 
     *        page frame numbers are sequentially placed in the memory pointed to by the <i>PageArray</i> 
     *        parameter.
     * 
     * If the function fails, the return value is <b>FALSE</b> and no frames are allocated. To get 
     *        extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> 
     *        function.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-allocateuserphysicalpagesnuma
     * @since windows6.0.6000
     */
    static AllocateUserPhysicalPagesNuma(hProcess, NumberOfPages, PageArray, nndPreferred) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\AllocateUserPhysicalPagesNuma", "ptr", hProcess, "ptr*", NumberOfPages, "ptr*", PageArray, "uint", nndPreferred, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reserves, commits, or changes the state of a region of memory within the virtual address space of the specified process, and specifies the NUMA node for the physical memory.
     * @remarks
     * Each page has an associated <a href="https://docs.microsoft.com/windows/desktop/Memory/page-state">page state</a>. The 
     *      <b>VirtualAllocExNuma</b> function can perform the 
     *      following operations:
     * 
     * 
     * <ul>
     * <li>Commit a region of reserved pages</li>
     * <li>Reserve a region of free pages</li>
     * <li>Simultaneously reserve and commit a region of free pages</li>
     * </ul>
     * 
     * 
     * <b>VirtualAllocExNuma</b> cannot reserve a reserved 
     *      page. It can commit a page that is already committed. This means you can commit a range of pages, regardless of 
     *      whether they have already been committed, and the function will not fail.
     * 
     * You can use <b>VirtualAllocExNuma</b> to reserve a 
     *      block of pages and then make additional calls to 
     *      <b>VirtualAllocExNuma</b> to commit individual pages from 
     *      the reserved block. This enables a process to reserve a range of its virtual address space without consuming 
     *      physical storage until it is needed.
     * 
     * If the <i>lpAddress</i> parameter is not <b>NULL</b>, the function uses 
     *      the <i>lpAddress</i> and <i>dwSize</i> parameters to compute the region of 
     *      pages to be allocated. The current state of the entire range of pages must be compatible with the type of 
     *      allocation specified by the <i>flAllocationType</i> parameter. Otherwise, the function fails 
     *      and none of the pages is allocated. This compatibility requirement does not preclude committing an already 
     *      committed page; see the preceding list.
     * 
     * Because <b>VirtualAllocExNuma</b> does not allocate any 
     *      physical pages, it will succeed whether or not the pages are available on that node or elsewhere in the system. 
     *      The physical pages are allocated on demand. If the preferred node runs out of pages, the memory manager will use 
     *      pages from other nodes. If the memory is paged out, the same process is used when it is brought back in.
     * 
     * To execute dynamically generated code, use 
     *      <b>VirtualAllocExNuma</b> to allocate memory and the 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualprotectex">VirtualProtectEx</a> function to grant 
     *      <b>PAGE_EXECUTE</b> access.
     * 
     * The <b>VirtualAllocExNuma</b> function can be used to 
     *      reserve an 
     *      <a href="https://docs.microsoft.com/windows/desktop/Memory/address-windowing-extensions">Address Windowing Extensions</a> 
     *      (AWE) region of memory within the virtual address space of a specified process. This region of memory can then be 
     *      used to map physical pages into and out of virtual memory as required by the application. The 
     *      <b>MEM_PHYSICAL</b> and <b>MEM_RESERVE</b> values must be set in the 
     *      <i>AllocationType</i> parameter. The <b>MEM_COMMIT</b> value must not be 
     *      set. The page protection must be set to <b>PAGE_READWRITE</b>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualfreeex">VirtualFreeEx</a> function can decommit a committed 
     *      page, releasing the page's storage, or it can simultaneously decommit and release a committed page. It can also 
     *      release a reserved page, making it a free page.
     * 
     * To compile an application that uses this function, define <b>_WIN32_WINNT</b> as 0x0600 
     *      or later.
     * @param {Pointer<Void>} hProcess The handle to a process. The function allocates memory within the virtual address space of this process.
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
     *        call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualallocexnuma
     * @since windows6.0.6000
     */
    static VirtualAllocExNuma(hProcess, lpAddress, dwSize, flAllocationType, flProtect, nndPreferred) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\VirtualAllocExNuma", "ptr", hProcess, "ptr", lpAddress, "ptr", dwSize, "uint", flAllocationType, "uint", flProtect, "uint", nndPreferred)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the memory error handling capabilities of the system.
     * @remarks
     * To compile an application that calls this function, define <b>_WIN32_WINNT</b> as 
     *     <b>_WIN32_WINNT_WIN8</b> or higher. For more information, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Pointer<UInt32>} Capabilities A <b>PULONG</b> that receives one or more of the following flags.
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
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-getmemoryerrorhandlingcapabilities
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
     * @remarks
     * To compile an application that calls this function, define <b>_WIN32_WINNT</b> as 
     *     <b>_WIN32_WINNT_WIN8</b> or higher. For more information, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Pointer<PBAD_MEMORY_CALLBACK_ROUTINE>} Callback A pointer to the application-defined 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh691011(v=vs.85)">BadMemoryCallbackRoutine</a> function to 
     *       register.
     * @returns {Pointer<Void>} Registration handle that represents the callback notification. Can be passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-unregisterbadmemorynotification">UnregisterBadMemoryNotification</a> 
     *       function when no longer needed.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-registerbadmemorynotification
     * @since windows8.0
     */
    static RegisterBadMemoryNotification(Callback) {
        result := DllCall("KERNEL32.dll\RegisterBadMemoryNotification", "ptr", Callback)
        return result
    }

    /**
     * Closes the specified bad memory notification handle.
     * @remarks
     * To compile an application that calls this function, define <b>_WIN32_WINNT</b> as 
     *     <b>_WIN32_WINNT_WIN8</b> or higher. For more information, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Pointer<Void>} RegistrationHandle Registration handle returned from the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-registerbadmemorynotification">RegisterBadMemoryNotification</a> 
     *       function.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-unregisterbadmemorynotification
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
     * @remarks
     * To reclaim offered pages, call <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-reclaimvirtualmemory">ReclaimVirtualMemory</a>.
     *       The data in reclaimed pages may have been discarded, in which case the contents of the memory region is undefined and must be rewritten by the application.
     * 
     * Do not call <b>OfferVirtualMemory</b> to offer virtual memory that is locked.
     *       Doing so will unlock the specified range of pages.
     * 
     * Note that offering and reclaiming virtual memory is similar to using the MEM_RESET and MEM_RESET_UNDO memory allocation flags,
     *       except that <b>OfferVirtualMemory</b> removes the memory from the process working set and restricts access to the offered pages until they are reclaimed.
     * @param {Pointer<Void>} VirtualAddress Page-aligned starting address of the memory to offer.
     * @param {Pointer} Size Size, in bytes, of the memory region to offer.  <i>Size</i> must be an integer multiple of the system page size.
     * @param {Integer} Priority <i>Priority</i> indicates how important the offered memory is to the application.
     *        A higher priority increases the probability that the offered memory can be reclaimed intact when calling <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-reclaimvirtualmemory">ReclaimVirtualMemory</a>.
     *        The system typically discards lower priority memory before discarding higher priority memory.
     * @returns {Integer} ERROR_SUCCESS if successful; a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Code</a> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-offervirtualmemory
     * @since windows8.1
     */
    static OfferVirtualMemory(VirtualAddress, Size, Priority) {
        result := DllCall("KERNEL32.dll\OfferVirtualMemory", "ptr", VirtualAddress, "ptr", Size, "int", Priority, "uint")
        return result
    }

    /**
     * Reclaims a range of memory pages that were offered to the system with OfferVirtualMemory.
     * @remarks
     * Reclaimed memory pages can be used by the application, and will be written to the system paging file if paging occurs.
     * 
     * If the function returns ERROR_SUCCESS, the data in the reclaimed pages is valid.
     *       If the function returns ERROR_BUSY, the data in the reclaimed pages was discarded by the system and is no longer valid.
     *       For this reason, memory should only be offered to the system if the application does not need or can regenerate the data.
     * @param {Pointer<Void>} VirtualAddress Page-aligned starting address of the memory to reclaim.
     * @param {Pointer} Size Size, in bytes, of the memory region to reclaim.  <i>Size</i> must be an integer multiple of the system page size.
     * @returns {Integer} Returns ERROR_SUCCESS if successful and the memory was reclaimed intact.
     * 
     * Returns ERROR_BUSY if successful but the memory was discarded and must be rewritten by the application.  In this case, the contents of the memory region is undefined.
     * 
     * Returns a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Code</a> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-reclaimvirtualmemory
     * @since windows8.1
     */
    static ReclaimVirtualMemory(VirtualAddress, Size) {
        result := DllCall("KERNEL32.dll\ReclaimVirtualMemory", "ptr", VirtualAddress, "ptr", Size, "uint")
        return result
    }

    /**
     * Discards the memory contents of a range of memory pages, without decommitting the memory. The contents of discarded memory is undefined and must be rewritten by the application.
     * @remarks
     * If <b>DiscardVirtualMemory</b> fails, the contents of the region is not altered.
     * 
     * Use this function to discard memory contents that are no longer needed, while keeping the memory region itself committed.
     *       Discarding memory may give physical RAM back to the system.
     *       When the region of memory is again accessed by the application, the backing RAM is restored, and the contents of the memory is undefined.
     * 
     * <div class="alert"><b>Important</b>  Calls to <b>DiscardVirtualMemory</b> will fail if the memory protection is not <b>PAGE_READWRITE</b>.</div>
     * <div> </div>
     * @param {Pointer<Void>} VirtualAddress Page-aligned starting address of the memory to discard.
     * @param {Pointer} Size Size, in bytes, of the memory region to discard.  <i>Size</i> must be an integer multiple of the system page size.
     * @returns {Integer} ERROR_SUCCESS if successful; a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Code</a> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-discardvirtualmemory
     * @since windows8.1
     */
    static DiscardVirtualMemory(VirtualAddress, Size) {
        result := DllCall("KERNEL32.dll\DiscardVirtualMemory", "ptr", VirtualAddress, "ptr", Size, "uint")
        return result
    }

    /**
     * Provides Control Flow Guard (CFG) with a list of valid indirect call targets and specifies whether they should be marked valid or not.
     * @remarks
     * This function does not succeed if Control Flow Guard is not enabled for the target process. This can be checked using [GetProcessMitigationPolicy](../processthreadsapi/nf-processthreadsapi-getprocessmitigationpolicy.md).
     * @param {Pointer<Void>} hProcess The handle to the target process.
     * @param {Pointer<Void>} VirtualAddress The start of the virtual memory region whose call targets are being marked valid. The memory region must be allocated using one of the executable [memory protection constants](/windows/desktop/Memory/memory-protection-constants).
     * @param {Pointer} RegionSize The size of the virtual memory region.
     * @param {Integer} NumberOfOffsets The number of offsets relative to the virtual memory ranges.
     * @param {Pointer<CFG_CALL_TARGET_INFO>} OffsetInformation A list of offsets and flags relative to the virtual memory ranges.
     * @returns {Integer} <b>TRUE</b> if the operation was successful; otherwise, <b>FALSE</b>. To retrieve error values for this function, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-setprocessvalidcalltargets
     * @since windows10.0.10240
     */
    static SetProcessValidCallTargets(hProcess, VirtualAddress, RegionSize, NumberOfOffsets, OffsetInformation) {
        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-3.dll\SetProcessValidCallTargets", "ptr", hProcess, "ptr", VirtualAddress, "ptr", RegionSize, "uint", NumberOfOffsets, "ptr", OffsetInformation, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Process 
     * @param {Pointer<Void>} VirtualAddress 
     * @param {Pointer} RegionSize 
     * @param {Integer} NumberOfOffsets 
     * @param {Pointer<CFG_CALL_TARGET_INFO>} OffsetInformation 
     * @param {Pointer<Void>} Section 
     * @param {Integer} ExpectedFileOffset 
     * @returns {Integer} 
     */
    static SetProcessValidCallTargetsForMappedView(Process, VirtualAddress, RegionSize, NumberOfOffsets, OffsetInformation, Section, ExpectedFileOffset) {
        result := DllCall("api-ms-win-core-memory-l1-1-7.dll\SetProcessValidCallTargetsForMappedView", "ptr", Process, "ptr", VirtualAddress, "ptr", RegionSize, "uint", NumberOfOffsets, "ptr", OffsetInformation, "ptr", Section, "uint", ExpectedFileOffset, "int")
        return result
    }

    /**
     * Reserves, commits, or changes the state of a region of pages in the virtual address space of the calling process. (VirtualAllocFromApp)
     * @remarks
     * You can call <b>VirtualAllocFromApp</b> from Windows Store apps with just-in-time (JIT) capabilities to use JIT functionality. The app must include the <b>codeGeneration</b> capability in the app manifest file to use JIT capabilities.
     * 
     * Each page has an associated <a href="https://docs.microsoft.com/windows/desktop/Memory/page-state">page state</a>. The 
     *     <b>VirtualAllocFromApp</b> function can perform the following 
     *     operations:
     * 
     * <ul>
     * <li>Commit a region of reserved pages</li>
     * <li>Reserve a region of free pages</li>
     * <li>Simultaneously reserve and commit a region of free pages</li>
     * </ul>
     * <b>VirtualAllocFromApp</b> cannot reserve a reserved page. It can 
     *     commit a page that is already committed. This means you can commit a range of pages, regardless of whether they 
     *     have already been committed, and the function will not fail.
     * 
     * You can use <b>VirtualAllocFromApp</b> to reserve a block of pages 
     *     and then make additional calls to <b>VirtualAllocFromApp</b> to commit 
     *     individual pages from the reserved block. This enables a process to reserve a range of its virtual address space 
     *     without consuming physical storage until it is needed.
     * 
     * If the <i>BaseAddress</i> parameter is not <b>NULL</b>, the function uses 
     *     the <i>BaseAddress</i> and <i>Size</i> parameters to compute the region of 
     *     pages to be allocated. The current state of the entire range of pages must be compatible with the type of 
     *     allocation specified by the <i>AllocationType</i> parameter. Otherwise, the function fails 
     *     and none of the pages are allocated. This compatibility requirement does not preclude committing an already 
     *     committed page, as mentioned previously.
     * 
     * <b>VirtualAllocFromApp</b> does not allow the creation of executable pages.
     * 
     * The <b>VirtualAllocFromApp</b> function can be used to reserve an 
     *     <a href="https://docs.microsoft.com/windows/desktop/Memory/address-windowing-extensions">Address Windowing Extensions</a> (AWE) 
     *     region of memory within the virtual address space of a specified process. This region of memory can then be used 
     *     to map physical pages into and out of virtual memory as required by the application. The 
     *     <b>MEM_PHYSICAL</b> and <b>MEM_RESERVE</b> values must be set in the 
     *     <i>AllocationType</i> parameter. The <b>MEM_COMMIT</b> value must not be 
     *     set. The page protection must be set to <b>PAGE_READWRITE</b>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualfree">VirtualFree</a> function can decommit a committed 
     *     page, releasing the page's storage, or it can simultaneously decommit and release a committed page. It can also 
     *     release a reserved page, making it a free page.
     * 
     * When creating a region that will be executable, the calling program bears responsibility for ensuring cache 
     *     coherency via an appropriate call to 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-flushinstructioncache">FlushInstructionCache</a> once the code has been set 
     *     in place. Otherwise attempts to execute code out of the newly executable region may produce unpredictable 
     *     results.
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
     *        call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualallocfromapp
     * @since windows10.0.10240
     */
    static VirtualAllocFromApp(BaseAddress, Size, AllocationType, Protection) {
        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-3.dll\VirtualAllocFromApp", "ptr", BaseAddress, "ptr", Size, "uint", AllocationType, "uint", Protection)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Changes the protection on a region of committed pages in the virtual address space of the calling process. (VirtualProtectFromApp)
     * @remarks
     * You can call <b>VirtualProtectFromApp</b> from Windows Store apps with just-in-time (JIT) capabilities to use JIT functionality. The app must include the <b>codeGeneration</b> capability in the app manifest file to use JIT capabilities.
     * 
     * You can set the access protection value on committed pages only. If the state of any page in the specified 
     *    region is not committed, the function fails and returns without modifying the access protection of any pages in the 
     *    specified region.
     * 
     * The <b>PAGE_GUARD</b> protection modifier establishes guard pages. Guard pages act as 
     *    one-shot access alarms. For more information, see 
     *    <a href="https://docs.microsoft.com/windows/desktop/Memory/creating-guard-pages">Creating Guard Pages</a>.
     * 
     * It is best to avoid using <b>VirtualProtectFromApp</b> to change 
     *    page protections on memory blocks allocated by <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a>, 
     *    <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a>, or 
     *    <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a>, because multiple memory blocks can exist on a 
     *    single page. The heap manager assumes that all pages in the heap grant at least read and write access.
     * 
     * <b>VirtualProtectFromApp</b> allows you to mark pages as executable, but does not allow you to set both write and execute permissions at the same time.
     * 
     * When protecting a region that will be executable, the calling program bears responsibility for ensuring cache 
     *    coherency via an appropriate call to 
     *    <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-flushinstructioncache">FlushInstructionCache</a> once the code has been set 
     *    in place.  Otherwise attempts to execute code out of the newly executable region may produce unpredictable 
     *    results.
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
     * @param {Pointer<UInt32>} OldProtection A pointer to a variable that receives the previous access protection value of the first page in the 
     *       specified region of pages. If this parameter is <b>NULL</b> or does not point to a valid 
     *       variable, the function fails.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualprotectfromapp
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
     * Opens a named file mapping object. (OpenFileMappingFromApp)
     * @remarks
     * You can call <b>OpenFileMappingFromApp</b> from Windows Store apps with just-in-time (JIT) capabilities to use JIT functionality. The app must include the <b>codeGeneration</b> capability in the app manifest file to use JIT capabilities. <b>OpenFileMappingFromApp</b> lets Windows Store apps use the <a href="https://docs.microsoft.com/dotnet/api/system.io.memorymappedfiles.memorymappedfile">MemoryMappedFile</a> class in the .NET Framework.
     * 
     * The handle that <b>OpenFileMappingFromApp</b> returns can be used 
     *      with any function that requires a handle to a file mapping object.
     * 
     * When modifying a file through a mapped view, the last modification timestamp may not be updated automatically. 
     *      If required, the caller should use <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfiletime">SetFileTime</a> to set the 
     *      timestamp.
     * 
     * When it is no longer needed, the caller should call release the handle returned by 
     *      <b>OpenFileMappingFromApp</b> with a call to 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a>.
     * @param {Integer} DesiredAccess The access to the file mapping object. This access is checked against any security descriptor on the target 
     *       file mapping object. For a list of values, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/Memory/file-mapping-security-and-access-rights">File Mapping Security and Access Rights</a>. You can only open the file mapping object for <b>FILE_MAP_EXECUTE</b> access if your app has the <b>codeGeneration</b> capability.
     * @param {Integer} InheritHandle If this parameter is <b>TRUE</b>, a process created by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function can inherit the handle; 
     *       otherwise, the handle cannot be inherited.
     * @param {Pointer<Char>} Name The name of the file mapping object to be opened. If there is an open handle to a file mapping object by 
     *       this name and the security descriptor on the mapping object does not conflict with the 
     *       <i>DesiredAccess</i> parameter, the open operation succeeds. The name can have a 
     *       "Global\" or "Local\" prefix to explicitly open an object in the global or 
     *       session namespace. The remainder of the name can contain any character except the backslash character (\\). For 
     *       more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user 
     *       switching is implemented using Terminal Services sessions. The first user to log on uses session 0, the next 
     *       user to log on uses session 1, and so on. Kernel object names must follow the guidelines outlined for Terminal 
     *       Services so that applications can support multiple users.
     * @returns {Pointer<Void>} If the function succeeds, the return value is an open handle to the specified file mapping object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-openfilemappingfromapp
     * @since windows10.0.10240
     */
    static OpenFileMappingFromApp(DesiredAccess, InheritHandle, Name) {
        Name := Name is String? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-3.dll\OpenFileMappingFromApp", "uint", DesiredAccess, "int", InheritHandle, "ptr", Name)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The QueryVirtualMemoryInformation function returns information about a page or a set of pages within the virtual address space of the specified process.
     * @remarks
     * If the <i>MemoryInformationClass</i> parameter has a value of <b>MemoryRegionInfo</b>, the <i>MemoryInformation</i> parameter must point to a <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/ns-memoryapi-win32_memory_region_information">WIN32_MEMORY_REGION_INFORMATION</a> structure. The <i>VirtualAddress</i> parameter must point to an address within a valid memory allocation. If the <i>VirtualAddress</i> parameter points to an unallocated memory region, the function fails.
     * @param {Pointer<Void>} Process A handle for the process in whose context the pages to be queried reside.
     * @param {Pointer<Void>} VirtualAddress The address of the region of pages to be queried. This value is rounded down to the next host-page-address boundary.
     * @param {Integer} MemoryInformationClass The memory information class about which to retrieve information. The only supported value is <b>MemoryRegionInfo</b>.
     * @param {Pointer} MemoryInformation A pointer to a buffer that receives the specified information.
     * 
     * If the <i>MemoryInformationClass</i> parameter has a value of  <b>MemoryRegionInfo</b>, this parameter must point to a <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/ns-memoryapi-win32_memory_region_information">WIN32_MEMORY_REGION_INFORMATION</a> structure.
     * @param {Pointer} MemoryInformationSize Specifies the length in bytes of the memory information buffer.
     * @param {Pointer<UIntPtr>} ReturnSize An optional pointer which, if specified, receives the number of bytes placed in the memory information buffer.
     * @returns {Integer} Returns <b>TRUE</b> on success. Returns <b>FALSE</b> for failure. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-queryvirtualmemoryinformation
     * @since windows10.0.14393
     */
    static QueryVirtualMemoryInformation(Process, VirtualAddress, MemoryInformationClass, MemoryInformation, MemoryInformationSize, ReturnSize) {
        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-4.dll\QueryVirtualMemoryInformation", "ptr", Process, "ptr", VirtualAddress, "int", MemoryInformationClass, "ptr", MemoryInformation, "ptr", MemoryInformationSize, "ptr*", ReturnSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Maps a view of a file or a pagefile-backed section into the address space of the specified process. (MapViewOfFileNuma2)
     * @param {Pointer<Void>} FileMappingHandle A <b>HANDLE</b> to a section that is to be mapped
     *                         into the address space of the specified process.
     * @param {Pointer<Void>} ProcessHandle A <b>HANDLE</b> to a process into which the section
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
     * @returns {Pointer<Void>} Returns the base address of the mapped view, if successful. Otherwise, returns <b>NULL</b> and extended error status is available
     *            using <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-mapviewoffilenuma2
     * @since windows10.0.15063
     */
    static MapViewOfFileNuma2(FileMappingHandle, ProcessHandle, Offset, BaseAddress, ViewSize, AllocationType, PageProtection, PreferredNode) {
        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-5.dll\MapViewOfFileNuma2", "ptr", FileMappingHandle, "ptr", ProcessHandle, "uint", Offset, "ptr", BaseAddress, "ptr", ViewSize, "uint", AllocationType, "uint", PageProtection, "uint", PreferredNode)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Unmaps a previously mapped view of a file or a pagefile-backed section.
     * @param {Pointer<Void>} Process A <b>HANDLE</b> to the process from which the section
     *                     will be unmapped.
     * @param {Pointer<Void>} BaseAddress The base address of a previously mapped
     *                   view that is to be unmapped.  This value must be
     *                   identical to the value returned by a previous call
     *                   to <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile2">MapViewOfFile2</a>.
     * @param {Integer} UnmapFlags 
     * @returns {Integer} Returns <b>TRUE</b> if successful. Otherwise, returns <b>FALSE</b> and extended error status is available
     *             using <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-unmapviewoffile2
     * @since windows10.0.15063
     */
    static UnmapViewOfFile2(Process, BaseAddress, UnmapFlags) {
        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-5.dll\UnmapViewOfFile2", "ptr", Process, "ptr", BaseAddress, "uint", UnmapFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Process 
     * @param {Pointer<Void>} Address 
     * @param {Pointer} Size 
     * @returns {Integer} 
     */
    static VirtualUnlockEx(Process, Address, Size) {
        result := DllCall("api-ms-win-core-memory-l1-1-5.dll\VirtualUnlockEx", "ptr", Process, "ptr", Address, "ptr", Size, "int")
        return result
    }

    /**
     * Reserves, commits, or changes the state of a region of memory within the virtual address space of a specified process. The function initializes the memory it allocates to zero. (VirtualAlloc2)
     * @remarks
     * This function lets you specify:
     * 
     * - a range of virtual address space and a power-of-2 alignment restriction for new allocations
     * - an arbitrary number of extended parameters
     * - a preferred NUMA node for the physical memory as an extended parameter (see the <i>ExtendedParameters</i> parameter)
     * - a placeholder operation (specifically, replacement).
     * 
     * This API provides specialized techniques for managing virtual memory in support of high-performance games and server applications. For example, placeholders allow a reserved memory range to be explicitly partitioned, overlaid, and re-mapped; this can be used to implement arbitrarily extendable regions or virtual memory ring buffers. <b>VirtualAlloc2</b> also allows for allocating memory with a specific memory-alignment.
     * 
     * 
     * Each page has an associated <a href="https://docs.microsoft.com/windows/desktop/Memory/page-state">page state</a>. The 
     *      <b>VirtualAlloc2</b> function can perform the following 
     *      operations:
     * 
     * <ul>
     * <li>Commit a region of reserved pages</li>
     * <li>Reserve a region of free pages</li>
     * <li>Simultaneously reserve and commit a region of free pages</li>
     * </ul>
     * 
     * <b>VirtualAlloc2</b> can commit pages that are already committed, but cannot reserve pages that are already reserved.
     *     This means you can commit a range of pages, regardless of whether they have already been committed, and the function will not 
     *     fail. In general however, only a minimal range of mostly uncommitted pages should be specified, because committing 
     *     a large number of pages that are already committed can cause the <b>VirtualAlloc2</b> call to take much longer.
     * 
     * You can use <b>VirtualAlloc2</b> to reserve a block of pages and then make additional calls to <b>VirtualAlloc2</b> to 
     *     commit individual pages from the reserved block. This enables a process to reserve a range of its virtual address 
     *     space without consuming physical storage until it is needed.
     * 
     * If the <i>lpAddress</i> parameter is not <b>NULL</b>, the function uses 
     *     the <i>lpAddress</i> and <i>dwSize</i> parameters to compute the region of 
     *     pages to be allocated. The current state of the entire range of pages must be compatible with the type of 
     *     allocation specified by the <i>flAllocationType</i> parameter. Otherwise, the function fails 
     *     and none of the pages is allocated. This compatibility requirement does not preclude committing an already 
     *     committed page; see the preceding list.
     * 
     * To execute dynamically generated code, use 
     *     <b>VirtualAlloc2</b> to allocate memory, and the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualprotectex">VirtualProtectEx</a> function to grant 
     *     <b>PAGE_EXECUTE</b> access.
     * 
     * The <b>VirtualAlloc2</b> function can be used to reserve 
     *     an <a href="https://docs.microsoft.com/windows/desktop/Memory/address-windowing-extensions">Address Windowing Extensions</a> 
     *     (AWE) region of memory within the virtual address space of a specified process. This region of memory can then be 
     *     used to map physical pages into and out of virtual memory as required by the application. The 
     *     <b>MEM_PHYSICAL</b> and <b>MEM_RESERVE</b> values must be set in the 
     *     <i>AllocationType</i> parameter. The <b>MEM_COMMIT</b> value must not be 
     *     set. The page protection must be set to <b>PAGE_READWRITE</b>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualfreeex">VirtualFreeEx</a> function can decommit a committed 
     *     page, releasing the page's storage, or it can simultaneously decommit and release a committed page. It can also 
     *     release a reserved page, making it a free page.
     * 
     * When creating a region that will be executable, the calling program bears responsibility for ensuring cache 
     *     coherency via an appropriate call to 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-flushinstructioncache">FlushInstructionCache</a> once the code has been set 
     *     in place. Otherwise attempts to execute code out of the newly executable region may produce unpredictable 
     *     results.
     * @param {Pointer<Void>} Process The handle to a process. The function allocates memory within the virtual address space of this process.
     * 
     * The handle must have the <b>PROCESS_VM_OPERATION</b> access right. For more information, 
     *        see 
     *        <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * If <i>Process</i> is <b>NULL</b>, the function allocates memory for the calling process.
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
     * If the address in within an enclave that you initialized, then the allocation operation fails with the **ERROR_INVALID_ADDRESS** error. That is true for enclaves that do not support dynamic memory management (i.e. SGX1). SGX2 enclaves will permit allocation, and the page must be accepted by the enclave after it has been allocated.
     * @param {Pointer} Size The size of the region of memory to allocate, in bytes.
     * 
     * The size must always be a multiple of the page size.
     * 
     * If <i>BaseAddress</i> is not <b>NULL</b>, the function allocates all 
     *        pages that contain one or more bytes in the range from <i>BaseAddress</i> to 
     *        <i>BaseAddress</i>+<i>Size</i>. This means, for example, that a 2-byte 
     *        range that straddles a page boundary causes the function to allocate both pages.
     * @param {Integer} AllocationType 
     * @param {Integer} PageProtection The memory protection for the region of pages to be allocated. If the pages are being committed, you can specify any one of the [memory protection constants](/windows/win32/Memory/memory-protection-constants).
     * @param {Pointer<MEM_EXTENDED_PARAMETER>} ExtendedParameters An optional pointer to one or more extended parameters of type <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-mem_extended_parameter">MEM_EXTENDED_PARAMETER</a>. Each of those extended parameter values can itself have a <i>Type</i> field of either <b>MemExtendedParameterAddressRequirements</b> or <b>MemExtendedParameterNumaNode</b>. If no <b>MemExtendedParameterNumaNode</b> extended parameter is provided, then the behavior is the same as for the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a>/<a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> functions (that is, the preferred NUMA node for the physical pages is determined based on the ideal processor of the thread that first accesses the memory).
     * @param {Integer} ParameterCount The number of extended parameters pointed to by <i>ExtendedParameters</i>.
     * @returns {Pointer<Void>} If the function succeeds, the return value is the base address of the allocated region of pages.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualalloc2
     * @since windows10.0.10240
     */
    static VirtualAlloc2(Process, BaseAddress, Size, AllocationType, PageProtection, ExtendedParameters, ParameterCount) {
        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-6.dll\VirtualAlloc2", "ptr", Process, "ptr", BaseAddress, "ptr", Size, "uint", AllocationType, "uint", PageProtection, "ptr", ExtendedParameters, "uint", ParameterCount)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Maps a view of a file or a pagefile-backed section into the address space of the specified process. (MapViewOfFile3)
     * @remarks
     * This API helps support high-performance games, and server applications, which have particular requirements around managing their virtual address space. For example, mapping memory on top of a previously reserved region; this is useful for implementing an automatically wrapping ring buffer. And allocating memory with specific alignment; for example, to enable your application to commit large/huge page-mapped regions on demand.
     * @param {Pointer<Void>} FileMapping A <b>HANDLE</b> to a section that is to be mapped
     *                         into the address space of the specified process.
     * @param {Pointer<Void>} Process A <b>HANDLE</b> to a process into which the section
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
     * @returns {Pointer<Void>} Returns the base address of the mapped view, if successful. Otherwise, returns <b>NULL</b> and extended error status is available
     *            using <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-mapviewoffile3
     * @since windows10.0.17134
     */
    static MapViewOfFile3(FileMapping, Process, BaseAddress, Offset, ViewSize, AllocationType, PageProtection, ExtendedParameters, ParameterCount) {
        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-6.dll\MapViewOfFile3", "ptr", FileMapping, "ptr", Process, "ptr", BaseAddress, "uint", Offset, "ptr", ViewSize, "uint", AllocationType, "uint", PageProtection, "ptr", ExtendedParameters, "uint", ParameterCount)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reserves, commits, or changes the state of a region of pages in the virtual address space of the calling process. (VirtualAlloc2FromApp)
     * @remarks
     * This API helps support high-performance games, and server applications, which have particular requirements around managing their virtual address space. For example, mapping memory on top of a previously reserved region; this is useful for implementing an automatically wrapping ring buffer. And allocating memory with specific alignment; for example, to enable your application to commit large/huge page-mapped regions on demand.
     * 
     * 
     * You can call <b>Virtual2AllocFromApp</b> from Windows Store apps with just-in-time (JIT) capabilities to use JIT functionality. The app must include the <b>codeGeneration</b> capability in the app manifest file to use JIT capabilities.
     * 
     * Each page has an associated <a href="https://docs.microsoft.com/windows/desktop/Memory/page-state">page state</a>. The 
     *     <b>Virtual2AllocFromApp</b> function can perform the following 
     *     operations:
     * 
     * <ul>
     * <li>Commit a region of reserved pages</li>
     * <li>Reserve a region of free pages</li>
     * <li>Simultaneously reserve and commit a region of free pages</li>
     * </ul>
     * <b>Virtual2AllocFromApp</b> cannot reserve a reserved page. It can 
     *     commit a page that is already committed. This means you can commit a range of pages, regardless of whether they 
     *     have already been committed, and the function will not fail.
     * 
     * You can use <b>Virtual2AllocFromApp</b> to reserve a block of pages 
     *     and then make additional calls to <b>Virtual2AllocFromApp</b> to commit 
     *     individual pages from the reserved block. This enables a process to reserve a range of its virtual address space 
     *     without consuming physical storage until it is needed.
     * 
     * If the <i>BaseAddress</i> parameter is not <b>NULL</b>, the function uses 
     *     the <i>BaseAddress</i> and <i>Size</i> parameters to compute the region of 
     *     pages to be allocated. The current state of the entire range of pages must be compatible with the type of 
     *     allocation specified by the <i>AllocationType</i> parameter. Otherwise, the function fails 
     *     and none of the pages are allocated. This compatibility requirement does not preclude committing an already 
     *     committed page, as mentioned previously.
     * 
     * <b>Virtual2AllocFromApp</b> does not allow the creation of executable pages.
     * 
     * The <b>Virtual2AllocFromApp</b> function can be used to reserve an 
     *     <a href="https://docs.microsoft.com/windows/desktop/Memory/address-windowing-extensions">Address Windowing Extensions</a> (AWE) 
     *     region of memory within the virtual address space of a specified process. This region of memory can then be used 
     *     to map physical pages into and out of virtual memory as required by the application. The 
     *     <b>MEM_PHYSICAL</b> and <b>MEM_RESERVE</b> values must be set in the 
     *     <i>AllocationType</i> parameter. The <b>MEM_COMMIT</b> value must not be 
     *     set. The page protection must be set to <b>PAGE_READWRITE</b>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualfree">VirtualFree</a> function can decommit a committed 
     *     page, releasing the page's storage, or it can simultaneously decommit and release a committed page. It can also 
     *     release a reserved page, making it a free page.
     * 
     * When creating a region that will be executable, the calling program bears responsibility for ensuring cache 
     *     coherency via an appropriate call to 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-flushinstructioncache">FlushInstructionCache</a> once the code has been set 
     *     in place. Otherwise attempts to execute code out of the newly executable region may produce unpredictable 
     *     results.
     * @param {Pointer<Void>} Process The handle to a process. The function allocates memory within the virtual address space of this process.
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
     *        call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualalloc2fromapp
     * @since windows10.0.10240
     */
    static VirtualAlloc2FromApp(Process, BaseAddress, Size, AllocationType, PageProtection, ExtendedParameters, ParameterCount) {
        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-6.dll\VirtualAlloc2FromApp", "ptr", Process, "ptr", BaseAddress, "ptr", Size, "uint", AllocationType, "uint", PageProtection, "ptr", ExtendedParameters, "uint", ParameterCount)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Maps a view of a file mapping into the address space of a calling Windows Store app. (MapViewOfFile3FromApp)
     * @remarks
     * This API helps support high-performance games, and server applications, which have particular requirements around managing their virtual address space. For example, mapping memory on top of a previously reserved region; this is useful for implementing an automatically wrapping ring buffer. And allocating memory with specific alignment; for example, to enable your application to commit large/huge page-mapped regions on demand.
     * 
     * 
     * With one important exception, file views derived from any file mapping object that is backed by the same file 
     *     are coherent or identical at a specific time. Coherency is guaranteed for views within a process and for views 
     *     that are mapped by different processes.
     * 
     * The exception is related to remote files. Although 
     *     <b>MapViewOfFile3FromApp</b> works with remote files, it 
     *     does not keep them coherent. For example, if two computers both map a file as writable, and both change the same 
     *     page, each computer only sees its own writes to the page. When the data gets updated on the disk, it is not 
     *     merged.
     * 
     *  You can only successfully request executable protection if your app has the <b>codeGeneration</b> capability.
     * @param {Pointer<Void>} FileMapping A <b>HANDLE</b> to a section that is to be mapped
     *                         into the address space of the specified process.
     * @param {Pointer<Void>} Process A <b>HANDLE</b> to a process into which the section
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
     * @returns {Pointer<Void>} Returns the base address of the mapped view, if successful. Otherwise, returns <b>NULL</b> and extended error status is available
     *            using <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-mapviewoffile3fromapp
     * @since windows10.0.10240
     */
    static MapViewOfFile3FromApp(FileMapping, Process, BaseAddress, Offset, ViewSize, AllocationType, PageProtection, ExtendedParameters, ParameterCount) {
        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-6.dll\MapViewOfFile3FromApp", "ptr", FileMapping, "ptr", Process, "ptr", BaseAddress, "uint", Offset, "ptr", ViewSize, "uint", AllocationType, "uint", PageProtection, "ptr", ExtendedParameters, "uint", ParameterCount)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates or opens a named or unnamed file mapping object for a specified file. You can specify a preferred NUMA node for the physical memory as an extended parameter; see the *ExtendedParameters* parameter.
     * @remarks
     * See the **Remarks** for [CreateFileMapping](/windows/win32/api/memoryapi/nf-memoryapi-createfilemappingw#remarks).
     * @param {Pointer<Void>} File Type: \_In\_ **[HANDLE](/windows/win32/winprog/windows-data-types)**
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
     * Sets all pages to be non-cacheable.
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
     * @param {Pointer<Char>} Name Type: \_In_opt\_ **[PCWSTR](/windows/win32/winprog/windows-data-types)**
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
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the newly created file mapping object.
     * 
     * If the object exists before the function call, the function returns a handle to the existing object (with its current size, not the specified size), and <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-createfilemapping2
     */
    static CreateFileMapping2(File, SecurityAttributes, DesiredAccess, PageProtection, AllocationAttributes, MaximumSize, Name, ExtendedParameters, ParameterCount) {
        Name := Name is String? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("api-ms-win-core-memory-l1-1-7.dll\CreateFileMapping2", "ptr", File, "ptr", SecurityAttributes, "uint", DesiredAccess, "uint", PageProtection, "uint", AllocationAttributes, "uint", MaximumSize, "ptr", Name, "ptr", ExtendedParameters, "uint", ParameterCount)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ObjectHandle 
     * @param {Pointer<UIntPtr>} NumberOfPages 
     * @param {Pointer<UIntPtr>} PageArray 
     * @param {Pointer<MEM_EXTENDED_PARAMETER>} ExtendedParameters 
     * @param {Integer} ExtendedParameterCount 
     * @returns {Integer} 
     */
    static AllocateUserPhysicalPages2(ObjectHandle, NumberOfPages, PageArray, ExtendedParameters, ExtendedParameterCount) {
        result := DllCall("api-ms-win-core-memory-l1-1-8.dll\AllocateUserPhysicalPages2", "ptr", ObjectHandle, "ptr*", NumberOfPages, "ptr*", PageArray, "ptr", ExtendedParameters, "uint", ExtendedParameterCount, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Partition 
     * @param {Integer} DedicatedMemoryTypeId 
     * @param {Integer} DesiredAccess 
     * @param {Integer} InheritHandle 
     * @returns {Pointer<Void>} 
     */
    static OpenDedicatedMemoryPartition(Partition, DedicatedMemoryTypeId, DesiredAccess, InheritHandle) {
        result := DllCall("api-ms-win-core-memory-l1-1-8.dll\OpenDedicatedMemoryPartition", "ptr", Partition, "uint", DedicatedMemoryTypeId, "uint", DesiredAccess, "int", InheritHandle)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Partition 
     * @param {Integer} PartitionInformationClass 
     * @param {Pointer} PartitionInformation 
     * @param {Integer} PartitionInformationLength 
     * @returns {Integer} 
     */
    static QueryPartitionInformation(Partition, PartitionInformationClass, PartitionInformation, PartitionInformationLength) {
        result := DllCall("api-ms-win-core-memory-l1-1-8.dll\QueryPartitionInformation", "ptr", Partition, "int", PartitionInformationClass, "ptr", PartitionInformation, "uint", PartitionInformationLength, "int")
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
     * @returns {Integer} 
     */
    static RtlIsZeroMemory(Buffer, Length) {
        result := DllCall("ntdll.dll\RtlIsZeroMemory", "ptr", Buffer, "ptr", Length, "char")
        return result
    }

    /**
     * Allocates the specified number of bytes from the heap. (GlobalAlloc)
     * @remarks
     * Windows memory management does not provide a separate local heap and global heap. Therefore, the <b>GlobalAlloc</b> and <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> functions are essentially the same. 
     * 
     * The movable-memory flags <b>GHND</b> and <b>GMEM_MOVABLE</b> add unnecessary overhead and require locking to be used safely. They should be avoided unless documentation specifically states that they should be used.
     * 
     * New applications should use the 
     * <a href="https://docs.microsoft.com/windows/desktop/Memory/heap-functions">heap functions</a> to allocate and manage memory unless the documentation specifically states that a global function should be used. For example, the global functions are still used with Dynamic Data Exchange (DDE), the clipboard functions, and OLE data objects. 
     * 
     * If the <b>GlobalAlloc</b> function succeeds, it allocates at least the amount of memory requested. If the actual amount allocated is greater than the amount requested, the process can use the entire amount. To determine the actual number of bytes allocated, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalsize">GlobalSize</a> function.
     * 
     * If the heap does not contain sufficient free space to satisfy the request, 
     * <b>GlobalAlloc</b> returns <b>NULL</b>. Because <b>NULL</b> is used to indicate an error, virtual address zero is never allocated. It is, therefore, easy to detect the use of a <b>NULL</b> pointer.
     * 
     * Memory allocated with this function is guaranteed to be aligned on an 8-byte boundary. To execute dynamically generated code, use the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> function to allocate memory and the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualprotect">VirtualProtect</a> function to grant  <b>PAGE_EXECUTE</b> access.
     * 
     * To free the memory, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalfree">GlobalFree</a> function. It is not safe to free memory allocated with <b>GlobalAlloc</b> using <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a>.
     * @param {Integer} uFlags 
     * @param {Pointer} dwBytes The number of bytes to allocate. If this parameter is zero and the <i>uFlags</i> parameter specifies <b>GMEM_MOVEABLE</b>, the function returns a handle to a memory object that is marked as discarded.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the newly allocated memory object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globalalloc
     * @since windows5.1.2600
     */
    static GlobalAlloc(uFlags, dwBytes) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalAlloc", "uint", uFlags, "ptr", dwBytes)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Changes the size or attributes of a specified global memory object. The size can increase or decrease.
     * @remarks
     * If 
     * <b>GlobalReAlloc</b> reallocates a movable object, the return value is a handle to the memory object. To convert the handle to a pointer, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globallock">GlobalLock</a> function.
     * 
     * If 
     * <b>GlobalReAlloc</b> reallocates a fixed object, the value of the handle returned is the address of the first byte of the memory block. To access the memory, a process can simply cast the return value to a pointer.
     * 
     * If 
     * <b>GlobalReAlloc</b> fails, the original memory is not freed, and the original handle and pointer are still valid.
     * @param {Pointer<Void>} hMem A handle to the global memory object to be reallocated. This handle is returned by either the 
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
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the reallocated memory object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globalrealloc
     * @since windows5.1.2600
     */
    static GlobalReAlloc(hMem, dwBytes, uFlags) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalReAlloc", "ptr", hMem, "ptr", dwBytes, "uint", uFlags)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the current size of the specified global memory object, in bytes.
     * @remarks
     * The size of a memory block may be larger than the size requested when the memory was allocated.
     * 
     * To verify that the specified object's memory block has not been discarded, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalflags">GlobalFlags</a> function before calling 
     * <b>GlobalSize</b>.
     * @param {Pointer<Void>} hMem A handle to the global memory object. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> function.
     * @returns {Pointer} If the function succeeds, the return value is the size of the specified global memory object, in bytes.
     * 
     * If the specified handle is not valid or if the object has been discarded, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globalsize
     * @since windows5.1.2600
     */
    static GlobalSize(hMem) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalSize", "ptr", hMem, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Decrements the lock count associated with a memory object that was allocated with GMEM_MOVEABLE.
     * @remarks
     * The internal data structures for each memory object include a lock count that is initially zero. For movable memory objects, the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globallock">GlobalLock</a> function increments the count by one, and 
     * <b>GlobalUnlock</b> decrements the count by one. For each call that a process makes to 
     * <b>GlobalLock</b> for an object, it must eventually call 
     * <b>GlobalUnlock</b>. Locked memory will not be moved or discarded, unless the memory object is reallocated by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> function. The memory block of a locked memory object remains locked until its lock count is decremented to zero, at which time it can be moved or discarded.
     * 
     * Memory objects allocated with <b>GMEM_FIXED</b> always have a lock count of zero. If the specified memory block is fixed memory, this function returns <b>TRUE</b>.
     * 
     * If the memory object is already unlocked, 
     * <b>GlobalUnlock</b> returns <b>FALSE</b> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> reports <b>ERROR_NOT_LOCKED</b>.
     * 
     * A process should not rely on the return value to determine the number of times it must subsequently call 
     * <b>GlobalUnlock</b> for a memory object.
     * @param {Pointer<Void>} hMem A handle to the global memory object. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> function.
     * @returns {Integer} If the memory object is still locked after decrementing the lock count, the return value is a nonzero value. If the memory object is unlocked after decrementing the lock count, the function returns zero and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is zero and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns a value other than <b>NO_ERROR</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globalunlock
     * @since windows5.1.2600
     */
    static GlobalUnlock(hMem) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalUnlock", "ptr", hMem, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locks a global memory object and returns a pointer to the first byte of the object's memory block.
     * @remarks
     * The internal data structures for each memory object include a lock count that is initially zero. For movable memory objects, 
     * <b>GlobalLock</b> increments the count by one, and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalunlock">GlobalUnlock</a> function decrements the count by one. Each successful call that a process makes to 
     * <b>GlobalLock</b> for an object must be matched by a corresponding call 
     * to <b>GlobalUnlock</b>. Locked memory will not be moved or discarded, unless the memory object is reallocated by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> function. The memory block of a locked memory object remains locked until its lock count is decremented to zero, at which time it can be moved or discarded.
     * 
     * Memory objects allocated with <b>GMEM_FIXED</b> always have a lock count of zero. For these objects, the value of the returned pointer is equal to the value of the specified handle.
     * 
     * If the specified memory block has been discarded or if the memory block has a zero-byte size, this function returns <b>NULL</b>.
     * 
     * Discarded objects always have a lock count of zero.
     * @param {Pointer<Void>} hMem A handle to the global memory object. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> function.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a pointer to the first byte of the memory block.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globallock
     * @since windows5.1.2600
     */
    static GlobalLock(hMem) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalLock", "ptr", hMem)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the specified global memory object.
     * @remarks
     * The low-order byte of the low-order word of the return value contains the lock count of the object. To retrieve the lock count from the return value, use the <b>GMEM_LOCKCOUNT</b> mask with the bitwise AND (&amp;) operator. The lock count of memory objects allocated with <b>GMEM_FIXED</b> is always zero.
     * 
     * The high-order byte of the low-order word of the return value indicates the allocation values of the memory object. It can be zero or <b>GMEM_DISCARDED</b>.
     * 
     * The global functions have greater overhead and provide fewer features than other memory management functions. New applications should use the <a href="https://docs.microsoft.com/windows/desktop/Memory/heap-functions">heap functions</a> unless documentation states that a global function should be used. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Memory/global-and-local-functions">Global and Local Functions</a>.
     * @param {Pointer<Void>} hMem A handle to the global memory object. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> function.
     * @returns {Pointer} If the function succeeds, the return value specifies the allocation values and the lock count for the memory object.
     * 
     * If the function fails, the return value is <b>GMEM_INVALID_HANDLE</b>, indicating that the global handle is not valid. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globalflags
     * @since windows5.1.2600
     */
    static GlobalFlags(hMem) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalFlags", "ptr", hMem)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the handle associated with the specified pointer to a global memory block.
     * @remarks
     * When the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> function allocates a memory object with <b>GMEM_MOVEABLE</b>, it returns a handle to the object. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globallock">GlobalLock</a> function converts this handle into a pointer to the memory block, and 
     * <b>GlobalHandle</b> converts the pointer back into a handle.
     * @param {Pointer<Void>} pMem A pointer to the first byte of the global memory block. This pointer is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globallock">GlobalLock</a> function.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the specified global memory object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globalhandle
     * @since windows5.1.2600
     */
    static GlobalHandle(pMem) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalHandle", "ptr", pMem)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates the specified number of bytes from the heap. (LocalAlloc)
     * @remarks
     * Windows memory management does not provide a separate local heap and global heap. Therefore, the <b>LocalAlloc</b> and <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> functions are essentially the same. 
     * 
     * The movable-memory flags <b>LHND</b>, <b>LMEM_MOVABLE</b>, and <b>NONZEROLHND</b> add unnecessary overhead and require locking to be used safely. They should be avoided unless documentation specifically states that they should be used.
     * 
     * New applications should use the 
     * <a href="https://docs.microsoft.com/windows/desktop/Memory/heap-functions">heap functions</a> unless the documentation specifically states that a local function should be used. For example, some Windows functions allocate memory that must be freed with <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a>.
     * 
     * If the heap does not contain sufficient free space to satisfy the request, 
     * <b>LocalAlloc</b> returns <b>NULL</b>. Because <b>NULL</b> is used to indicate an error, virtual address zero is never allocated. It is, therefore, easy to detect the use of a <b>NULL</b> pointer.
     * 
     * If the <b>LocalAlloc</b> function succeeds, it allocates at least the amount requested. If the amount allocated is greater than the amount requested, the process can use the entire amount. To determine the actual number of bytes allocated, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localsize">LocalSize</a> function.
     * 
     * To free the memory, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function. It is not safe to free memory allocated with <b>LocalAlloc</b> using <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalfree">GlobalFree</a>.
     * @param {Integer} uFlags 
     * @param {Pointer} uBytes The number of bytes to allocate. If this parameter is zero and the <i>uFlags</i> parameter specifies <b>LMEM_MOVEABLE</b>, the function returns a handle to a memory object that is marked as discarded.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the newly allocated memory object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-localalloc
     * @since windows5.1.2600
     */
    static LocalAlloc(uFlags, uBytes) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\LocalAlloc", "uint", uFlags, "ptr", uBytes)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Changes the size or the attributes of a specified local memory object. The size can increase or decrease.
     * @remarks
     * If 
     * <b>LocalReAlloc</b> fails, the original memory is not freed, and the original handle and pointer are still valid.
     * 
     * If 
     * <b>LocalReAlloc</b> reallocates a fixed object, the value of the handle returned is the address of the first byte of the memory block. To access the memory, a process can simply cast the return value to a pointer.
     * @param {Pointer<Void>} hMem A handle to the local memory object to be reallocated. This handle is returned by either the 
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
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the reallocated memory object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-localrealloc
     * @since windows5.1.2600
     */
    static LocalReAlloc(hMem, uBytes, uFlags) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\LocalReAlloc", "ptr", hMem, "ptr", uBytes, "uint", uFlags)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locks a local memory object and returns a pointer to the first byte of the object's memory block.
     * @remarks
     * The internal data structures for each memory object include a lock count that is initially zero. For movable memory objects, 
     * <b>LocalLock</b> increments the count by one, and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localunlock">LocalUnlock</a> function decrements the count by one. Each successful call that a process makes to 
     * <b>LocalLock</b> for an object must be matched by a corresponding call to 
     * <b>LocalUnlock</b>. Locked memory will not be moved or discarded unless the memory object is reallocated by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localrealloc">LocalReAlloc</a> function. The memory block of a locked memory object remains locked in memory until its lock count is decremented to zero, at which time it can be moved or discarded.
     * 
     * Memory objects allocated with <b>LMEM_FIXED</b> always have a lock count of zero. For these objects, the value of the returned pointer is equal to the value of the specified handle.
     * 
     * If the specified memory block has been discarded or if the memory block has a zero-byte size, this function returns <b>NULL</b>.
     * 
     * Discarded objects always have a lock count of zero.
     * @param {Pointer<Void>} hMem A handle to the local memory object. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localrealloc">LocalReAlloc</a> function.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a pointer to the first byte of the memory block.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-locallock
     * @since windows5.1.2600
     */
    static LocalLock(hMem) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\LocalLock", "ptr", hMem)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the handle associated with the specified pointer to a local memory object.
     * @remarks
     * When the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> function allocates a local memory object with <b>LMEM_MOVEABLE</b>, it returns a handle to the object. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-locallock">LocalLock</a> function converts this handle into a pointer to the object's memory block, and 
     * <b>LocalHandle</b> converts the pointer back into a handle.
     * @param {Pointer<Void>} pMem A pointer to the first byte of the local memory object. This pointer is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-locallock">LocalLock</a> function.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the specified local memory object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-localhandle
     * @since windows5.1.2600
     */
    static LocalHandle(pMem) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\LocalHandle", "ptr", pMem)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Decrements the lock count associated with a memory object that was allocated with LMEM_MOVEABLE.
     * @remarks
     * The internal data structures for each memory object include a lock count that is initially zero. For movable memory objects, the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-locallock">LocalLock</a> function increments the count by one, and 
     * <b>LocalUnlock</b> decrements the count by one. For each call that a process makes to 
     * <b>LocalLock</b> for an object, it must eventually call 
     * <b>LocalUnlock</b>. Locked memory will not be moved or discarded unless the memory object is reallocated by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localrealloc">LocalReAlloc</a> function. The memory block of a locked memory object remains locked until its lock count is decremented to zero, at which time it can be moved or discarded.
     * 
     * If the memory object is already unlocked, 
     * <b>LocalUnlock</b> returns <b>FALSE</b> and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> reports <b>ERROR_NOT_LOCKED</b>. Memory objects allocated with <b>LMEM_FIXED</b> always have a lock count of zero and cause the <b>ERROR_NOT_LOCKED</b> error.
     * 
     * A process should not rely on the return value to determine the number of times it must subsequently call 
     * <b>LocalUnlock</b> for the memory block.
     * @param {Pointer<Void>} hMem A handle to the local memory object. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localrealloc">LocalReAlloc</a> function.
     * @returns {Integer} If the memory object is still locked after decrementing the lock count, the return value is nonzero. If the memory object is unlocked after decrementing the lock count, the function returns zero and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is zero and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns a value other than <b>NO_ERROR</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-localunlock
     * @since windows5.1.2600
     */
    static LocalUnlock(hMem) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\LocalUnlock", "ptr", hMem, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the current size of the specified local memory object, in bytes.
     * @remarks
     * The size of a memory block may be larger than the size requested when the memory was allocated.
     * 
     * To verify that the specified object's memory block has not been discarded, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localflags">LocalFlags</a> function before calling 
     * <b>LocalSize</b>.
     * @param {Pointer<Void>} hMem A handle to the local memory object. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localrealloc">LocalReAlloc</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localhandle">LocalHandle</a> function.
     * @returns {Pointer} If the function succeeds, the return value is the size of the specified local memory object, in bytes. If the specified handle is not valid or if the object has been discarded, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-localsize
     * @since windows5.1.2600
     */
    static LocalSize(hMem) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\LocalSize", "ptr", hMem, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the specified local memory object.
     * @remarks
     * The low-order byte of the low-order word of the return value contains the lock count of the object. To retrieve the lock count from the return value, use the <b>LMEM_LOCKCOUNT</b> mask with the bitwise AND (&amp;) operator. The lock count of memory objects allocated with <b>LMEM_FIXED</b> is always zero.
     * 
     * The high-order byte of the low-order word of the return value indicates the allocation values of the memory object. It can be zero or <b>LMEM_DISCARDABLE</b>.
     * 
     * The local functions have greater overhead and provide fewer features than other memory management functions. New applications should use the <a href="https://docs.microsoft.com/windows/desktop/Memory/heap-functions">heap functions</a> unless documentation states that a local function should be used. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Memory/global-and-local-functions">Global and Local Functions</a>.
     * @param {Pointer<Void>} hMem A handle to the local memory object. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localrealloc">LocalReAlloc</a> function.
     * @returns {Pointer} If the function succeeds, the return value specifies the allocation values and the lock count for the memory object.
     * 
     * If the function fails, the return value is <b>LMEM_INVALID_HANDLE</b>, indicating that the local handle is not valid. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-localflags
     * @since windows5.1.2600
     */
    static LocalFlags(hMem) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\LocalFlags", "ptr", hMem)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates or opens a named or unnamed file mapping object for a specified file. (CreateFileMappingA)
     * @remarks
     * After a file mapping object is created, the size of the file must not exceed the size of the file mapping 
     *     object; if it does, not all of the file contents are available for sharing.
     * 
     * If an application specifies a size for the file mapping object that is larger than the size of the actual named 
     *     file on disk and if the page protection allows write access (that is, the <i>flProtect</i> 
     *     parameter specifies  <b>PAGE_READWRITE</b> or 
     *     <b>PAGE_EXECUTE_READWRITE</b>), then the file on disk is increased to match the specified size 
     *     of the file mapping object. If the file is extended, the contents of the file between the old end of the file and 
     *     the new end of the file are not guaranteed to be zero; the behavior is defined by the file system. If the file 
     *     on disk cannot be increased, <b>CreateFileMapping</b> fails 
     *     and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>  returns 
     *     <b>ERROR_DISK_FULL</b>.
     * 
     * The initial contents of the pages in a file mapping object backed by the operating system paging file are 0 
     *     (zero).
     * 
     * The handle that <b>CreateFileMapping</b> returns has 
     *     full access to a new file mapping object, and can be used with any function that requires a handle to a file 
     *     mapping object.
     * 
     * Multiple processes can share a view of the same file   by either using a single shared file mapping object or 
     *     creating separate file mapping objects backed by the same file. A single file mapping object can be shared by 
     *     multiple processes through inheriting the handle at process creation, duplicating the handle, or opening the file 
     *     mapping object by name. For more information, see the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>, 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-duplicatehandle">DuplicateHandle</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openfilemappinga">OpenFileMapping</a> functions.
     * 
     * Creating a file mapping object does not actually map the view into a process address space. The 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffileex">MapViewOfFileEx</a> functions map a view of a file into a 
     *     process address space.
     * 
     * With one important exception, file views derived from any file mapping object that is backed by the same file 
     *     are coherent or identical at a specific time. Coherency is guaranteed for views within a process and for views 
     *     that are mapped by different processes.
     * 
     * The exception is related to remote files. Although 
     *     <b>CreateFileMapping</b> works with remote files, it does 
     *     not keep them coherent. For example, if two computers both map a file as writable, and both change the same page, 
     *     each computer only sees its own writes to the page. When the data gets updated on the disk, it is not merged.
     * 
     * A mapped file and a file that is accessed by using the input and output (I/O) functions 
     *     (<a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefile">WriteFile</a>) are not necessarily coherent.
     * 
     * Mapped views of a file mapping object maintain internal references to the object, and a file mapping object 
     *     does not close until all references to it are released. Therefore, to fully close a file mapping object, an 
     *     application must unmap all mapped views of the file mapping object by calling 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-unmapviewoffile">UnmapViewOfFile</a> and  close the file mapping object 
     *     handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a>. These functions can be 
     *     called in any order.
     * 
     * When modifying a file through a mapped view, the last modification timestamp may not be updated automatically. 
     *     If required, the caller should use <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfiletime">SetFileTime</a> to set the 
     *     timestamp.
     * 
     * Creating a file mapping object in the global namespace from a session other than session zero requires the 
     *      <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">SeCreateGlobalPrivilege</a> privilege. 
     *      Note that this privilege check is limited to the creation of file mapping objects and does not apply to opening 
     *      existing ones. For example, if a service or the system creates a file mapping object in the global namespace, any 
     *      process running in any session can access that file mapping object provided that the caller has the required 
     *      access rights.
     * 
     * <b>Windows XP:  </b>The requirement described in the previous paragraph was introduced with Windows Server 2003 
     *       and Windows XP with SP2
     * 
     * Use structured exception handling to protect any code that writes to or reads from a file view. For more 
     *      information, see 
     *      <a href="https://docs.microsoft.com/windows/desktop/Memory/reading-and-writing-from-a-file-view">Reading and Writing From a File View</a>.
     * 
     * To have a mapping with executable permissions, an application must call
     *      <b>CreateFileMapping</b> with either 
     *      <b>PAGE_EXECUTE_READWRITE</b> or <b>PAGE_EXECUTE_READ</b>, and then 
     *      call <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> with 
     *      <c>FILE_MAP_EXECUTE | FILE_MAP_WRITE</c> or 
     *      <c>FILE_MAP_EXECUTE | FILE_MAP_READ</c>.
     * 
     * In Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} hFile A handle to the file from which to create a file mapping object.
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
     * @param {Pointer<Byte>} lpName The name of the file mapping object.
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
     *        <a href="https://docs.microsoft.com/windows/win32/secauthz/privilege-constants#constants">SeCreateGlobalPrivilege</a> 
     *        privilege. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>.
     * 
     * Fast user switching is implemented by using Terminal Services sessions. The first user to log on uses session 
     *        0 (zero), the next user to log on uses session 1 (one), and so on. Kernel object names must follow the 
     *        guidelines that are outlined for Terminal Services so that applications can support multiple users.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the newly created file mapping object.
     * 
     * If the object exists before the function call, the function returns a handle to the existing object (with its 
     *        current size, not the specified size), and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createfilemappinga
     * @since windows5.1.2600
     */
    static CreateFileMappingA(hFile, lpFileMappingAttributes, flProtect, dwMaximumSizeHigh, dwMaximumSizeLow, lpName) {
        lpName := lpName is String? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateFileMappingA", "ptr", hFile, "ptr", lpFileMappingAttributes, "uint", flProtect, "uint", dwMaximumSizeHigh, "uint", dwMaximumSizeLow, "ptr", lpName)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates or opens a named or unnamed file mapping object for a specified file and specifies the NUMA node for the physical memory. (CreateFileMappingNumaA)
     * @remarks
     * After a file mapping object is created, the size of the file must not exceed the size of the file mapping 
     *     object; if it does, not all of the file contents are available for sharing.
     * 
     * The file mapping object can be shared by duplication, inheritance, or by name. The initial contents of the 
     *     pages in a file mapping object backed by the page file are 0 (zero).
     * 
     * If an application specifies a size for the file mapping object that is larger than the size of the actual 
     *      named file on disk and if the page protection allows write access (that is, the 
     *      <i>flProtect</i> parameter specifies  <b>PAGE_READWRITE</b> or 
     *      <b>PAGE_EXECUTE_READWRITE</b>), then the file on disk is increased to match the specified size 
     *      of the file mapping object. If the file is extended, the contents of the file between the old end of the file and 
     *      the new end of the file are not guaranteed to be zero; the behavior is defined by the file system.
     * 
     * If the file cannot be increased, the result is a failure to create the file mapping object and the 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns 
     *      <b>ERROR_DISK_FULL</b>.
     * 
     * The handle that the <b>CreateFileMappingNuma</b> 
     *     function returns has full access to a new file mapping object and can be used with any function that requires a 
     *     handle to a file mapping object. A file mapping object can be shared through process creation, handle duplication, 
     *     or by name. For more information, see the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-duplicatehandle">DuplicateHandle</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openfilemappinga">OpenFileMapping</a> functions.
     * 
     * Creating a file mapping object creates the potential for mapping a view of the file but does not map the view. 
     *     The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-mapviewoffileexnuma">MapViewOfFileExNuma</a> function maps a view of a 
     *     file into a process address space.
     * 
     * With one important exception, file views derived from a single file mapping object are coherent or identical 
     *     at a specific time. If multiple processes have handles of the same file mapping object, they see a coherent view 
     *     of the data when they map a view of the file.
     * 
     * The exception is related to remote files. Although the 
     *     <b>CreateFileMappingNuma</b> function works with remote 
     *     files, it does not keep them coherent. For example, if two computers both map a file as writable and both change 
     *     the same page, each computer sees only its own writes to the page. When the data gets updated on the disk, the 
     *     page is not merged.
     * 
     * A mapped file and a file that is accessed by using the input and output (I/O) functions 
     *     (<a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefile">WriteFile</a>) are not necessarily coherent.
     * 
     * To fully close a file mapping object, an application must unmap all mapped views of the file mapping object by 
     *      calling the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-unmapviewoffile">UnmapViewOfFile</a> function and then close 
     *      the file mapping object handle by calling the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> 
     *      function.
     * 
     * These functions can be called in any order. The call to the 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-unmapviewoffile">UnmapViewOfFile</a> function is necessary, because mapped 
     *      views of a file mapping object maintain internal open handles to the object, and a file mapping object does not 
     *      close until all open handles to it are closed.
     * 
     * When modifying a file through a mapped view, the last modification timestamp may not be updated automatically. 
     *      If required, the caller should use <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfiletime">SetFileTime</a> to set the 
     *      timestamp.
     * 
     * Creating a file-mapping object from a session other than session zero requires the 
     *      <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">SeCreateGlobalPrivilege</a> privilege. 
     *      Note that this privilege check is limited to the creation of file mapping objects and does not apply to opening 
     *      existing ones. For example, if a service or the system creates a file mapping object, any process running in any 
     *      session can access that file mapping object provided that the caller has the required access rights.
     * 
     * Use structured exception handling to protect any code that writes to or reads from a memory mapped view. For 
     *      more information, see 
     *      <a href="https://docs.microsoft.com/windows/desktop/Memory/reading-and-writing-from-a-file-view">Reading and Writing From a File View</a>.
     * 
     * To have a mapping with executable permissions, an application must call the 
     *      <b>CreateFileMappingNuma</b> function with either 
     *      <b>PAGE_EXECUTE_READWRITE</b> or <b>PAGE_EXECUTE_READ</b> and then call the 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-mapviewoffileexnuma">MapViewOfFileExNuma</a> function with 
     *      <c>FILE_MAP_EXECUTE | FILE_MAP_WRITE</c> or 
     *      <c>FILE_MAP_EXECUTE | FILE_MAP_READ</c>.
     * 
     * In Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} hFile A handle to the file from which to create a file mapping object. 
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
     * @param {Pointer<Byte>} lpName The name of the file mapping object.
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
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the file mapping object.
     * 
     * If the object exists 
     *        before the function call, the function returns a handle to the existing object (with its current size, not the 
     *        specified size) and the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createfilemappingnumaa
     * @since windows6.0.6000
     */
    static CreateFileMappingNumaA(hFile, lpFileMappingAttributes, flProtect, dwMaximumSizeHigh, dwMaximumSizeLow, lpName, nndPreferred) {
        lpName := lpName is String? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateFileMappingNumaA", "ptr", hFile, "ptr", lpFileMappingAttributes, "uint", flProtect, "uint", dwMaximumSizeHigh, "uint", dwMaximumSizeLow, "ptr", lpName, "uint", nndPreferred)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens a named file mapping object. (OpenFileMappingA)
     * @remarks
     * The handle that <b>OpenFileMapping</b> returns can be used 
     *      with any function that requires a handle to a file mapping object.
     * 
     * When modifying a file through a mapped view, the last modification timestamp may not be updated automatically. 
     *      If required, the caller should use <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfiletime">SetFileTime</a> to set the 
     *      timestamp.
     * 
     * When it is no longer needed, the caller should call release the handle returned by 
     *      <b>OpenFileMapping</b> with a call to 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a>.
     * 
     * In Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwDesiredAccess The access to the file mapping object. This access is checked against any security descriptor on the target 
     *       file mapping object. For a list of values, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/Memory/file-mapping-security-and-access-rights">File Mapping Security and Access Rights</a>.
     * @param {Integer} bInheritHandle If this parameter is <b>TRUE</b>, a process created by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function can inherit the handle; 
     *       otherwise, the handle cannot be inherited.
     * @param {Pointer<Byte>} lpName The name of the file mapping object to be opened. If there is an open handle to a file mapping object by 
     *       this name and the security descriptor on the mapping object does not conflict with the 
     *       <i>dwDesiredAccess</i> parameter, the open operation succeeds. The name can have a 
     *       "Global\\" or "Local\\" prefix to explicitly open an object in the global or 
     *       session namespace. The remainder of the name can contain any character except the backslash character (\\). For 
     *       more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user 
     *       switching is implemented using Terminal Services sessions. The first user to log on uses session 0, the next 
     *       user to log on uses session 1, and so on. Kernel object names must follow the guidelines outlined for Terminal 
     *       Services so that applications can support multiple users.
     * @returns {Pointer<Void>} If the function succeeds, the return value is an open handle to the specified file mapping object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-openfilemappinga
     * @since windows5.1.2600
     */
    static OpenFileMappingA(dwDesiredAccess, bInheritHandle, lpName) {
        lpName := lpName is String? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\OpenFileMappingA", "uint", dwDesiredAccess, "int", bInheritHandle, "ptr", lpName)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Maps a view of a file mapping into the address space of a calling process and specifies the NUMA node for the physical memory.
     * @remarks
     * Mapping a file makes the specified portion of the file visible in the address space of the calling 
     *     process.
     * 
     * For files that are larger than the address space, you can map only a small portion of the file data at one 
     *     time. When the first view is complete, then you unmap it and map a new view.
     * 
     * To obtain the size of a view, use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualqueryex">VirtualQueryEx</a> function.
     * 
     * The initial contents of the pages in a file mapping object backed by the page file are 0 (zero).
     * 
     * If a suggested mapping address is supplied, the file is mapped at the specified address (rounded down to the 
     *     nearest 64-KB boundary) if there is enough address space at the specified address. If there is not enough address 
     *     space, the function fails.
     * 
     * Typically, the suggested address is used to specify that a file should be mapped at the same address in 
     *     multiple processes. This requires the region of address space to be available in all involved processes. No other 
     *     memory allocation can take place in the region that is used for mapping, including the use of the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualallocexnuma">VirtualAllocExNuma</a> function to reserve memory.
     * 
     * If the <i>lpBaseAddress</i> parameter specifies a base offset, the function succeeds if the 
     *      specified memory region is not already in use by the calling process. The system does not ensure that the same 
     *      memory region is available for the memory mapped file in other 32-bit processes.
     * 
     * Multiple views of a file (or a file mapping object and its mapped file) are <i>coherent</i> 
     *     if they contain identical data at a specified time. This occurs if the file views are derived from the same file 
     *     mapping object. A process can duplicate a file mapping object handle into another process by using the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-duplicatehandle">DuplicateHandle</a> function, or another process can open 
     *     a file mapping object by name by using the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openfilemappinga">OpenFileMapping</a> function.
     * 
     * With one important exception, file views derived from any file mapping object that is backed by the same file 
     *     are coherent or identical at a specific time. Coherency is guaranteed for views within a process and for views 
     *     that are mapped by different processes.
     * 
     * The exception is related to remote files. Although 
     *     <b>MapViewOfFileExNuma</b> works with remote files, it 
     *     does not keep them coherent. For example, if two computers both map a file as writable, and both change the same 
     *     page, each computer only sees its own writes to the page. When the data gets updated on the disk, it is not 
     *     merged.
     * 
     * A mapped view of a file is not guaranteed to be coherent with a file being accessed by the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a> or 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefile">WriteFile</a> function.
     * 
     * To guard against <b>EXCEPTION_IN_PAGE_ERROR</b> exceptions, use structured exception 
     *     handling to protect any code that writes to or reads from a memory mapped view of a file other than the page file. 
     *     For more information, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/Memory/reading-and-writing-from-a-file-view">Reading and Writing From a File View</a>.
     * 
     * When modifying a file through a mapped view, the last modification timestamp may not be updated automatically. 
     *      If required, the caller should use <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfiletime">SetFileTime</a> to set the 
     *      timestamp.
     * 
     * To have a file with executable permissions, an application must call
     *     the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfilemappingnumaa">CreateFileMappingNuma</a> function with either 
     *     <b>PAGE_EXECUTE_READWRITE</b> or <b>PAGE_EXECUTE_READ</b> 
     *     and then call the <b>MapViewOfFileExNuma</b> function 
     *     with <b>FILE_MAP_EXECUTE</b> | <b>FILE_MAP_WRITE</b> or 
     *     <b>FILE_MAP_EXECUTE</b> | <b>FILE_MAP_READ</b>.
     * 
     * In Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} hFileMappingObject A handle to a file mapping object. The 
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
     * @returns {Pointer<Void>} If the function succeeds, the return value is the starting address of the mapped view.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-mapviewoffileexnuma
     * @since windows6.0.6000
     */
    static MapViewOfFileExNuma(hFileMappingObject, dwDesiredAccess, dwFileOffsetHigh, dwFileOffsetLow, dwNumberOfBytesToMap, lpBaseAddress, nndPreferred) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\MapViewOfFileExNuma", "ptr", hFileMappingObject, "uint", dwDesiredAccess, "uint", dwFileOffsetHigh, "uint", dwFileOffsetLow, "ptr", dwNumberOfBytesToMap, "ptr", lpBaseAddress, "uint", nndPreferred)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Verifies that the calling process has read access to the specified range of memory. (IsBadReadPtr)
     * @remarks
     * This function is typically used when working with pointers returned from third-party libraries, where you cannot determine the memory management behavior in the third-party DLL.
     * 
     * Threads in a process are expected to cooperate in such a way that one will not free memory that the other needs. Use of this function does not negate the need to do this. If this is not done, the application may fail in an unpredictable manner.
     * 
     * Dereferencing potentially invalid pointers can disable stack expansion in other threads. A thread exhausting its stack, when stack expansion has been disabled, results in the immediate termination of the parent process, with no pop-up error window or diagnostic information.
     * 
     * If the calling process has read access to some, but not all, of the bytes in the specified memory range, the return value is nonzero.
     * 
     * In a preemptive multitasking environment, it is possible for some other thread to change the process's access to the memory being tested. Even when the function indicates that the process has read access to the specified memory, you should use structured exception handling when attempting to access the memory. Use of structured exception handling enables the system to notify the process if an access violation exception occurs, giving the process an opportunity to handle the exception.
     * @param {Pointer<Void>} lp A pointer to the first byte of the memory block.
     * @param {Pointer} ucb The size of the memory block, in bytes. If this parameter is zero, the return value is zero.
     * @returns {Integer} If the calling process has read access to all bytes in the specified memory range, the return value is zero.
     * 
     * If the calling process does not have read access to all bytes in the specified memory range, the return value is nonzero.
     * 
     * If the application is compiled as a debugging version, and the process does not have read access to all bytes in the specified memory range, the function causes an assertion and breaks into the debugger. Leaving the debugger, the function continues as usual, and returns a nonzero value. This behavior is by design, as a debugging aid.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-isbadreadptr
     * @since windows5.1.2600
     */
    static IsBadReadPtr(lp, ucb) {
        result := DllCall("KERNEL32.dll\IsBadReadPtr", "ptr", lp, "ptr", ucb, "int")
        return result
    }

    /**
     * Verifies that the calling process has write access to the specified range of memory.
     * @remarks
     * This function is typically used when working with pointers returned from third-party libraries, where you cannot determine the memory management behavior in the third-party DLL.
     * 
     * Threads in a process are expected to cooperate in such a way that one will not free memory that the other needs. Use of this function does not negate the need to do this. If this is not done, the application may fail in an unpredictable manner.
     * 
     * Dereferencing potentially invalid pointers can disable stack expansion in other threads. A thread exhausting its stack, when stack expansion has been disabled, results in the immediate termination of the parent process, with no pop-up error window or diagnostic information.
     * 
     * If the calling process has write access to some, but not all, of the bytes in the specified memory range, the return value is nonzero.
     * 
     * In a preemptive multitasking environment, it is possible for some other thread to change the process's access to the memory being tested. Even when the function indicates that the process has write access to the specified memory, you should use structured exception handling when attempting to access the memory. Use of structured exception handling enables the system to notify the process if an access violation exception occurs, giving the process an opportunity to handle the exception.
     * 
     * <b>IsBadWritePtr</b> is not multithread safe. To use it properly on a pointer shared by multiple threads, call it inside a critical region of code that allows only one thread to access the memory being checked. Use operating system–level objects such as critical sections or mutexes or the interlocked functions to create the critical region of code.
     * @param {Pointer<Void>} lp A pointer to the first byte of the memory block.
     * @param {Pointer} ucb The size of the memory block, in bytes. If this parameter is zero, the return value is zero.
     * @returns {Integer} If the calling process has write access to all bytes in the specified memory range, the return value is zero.
     * 
     * If the calling process does not have write access to all bytes in the specified memory range, the return value is nonzero.
     * 
     * If the application is run under a debugger and the process does not have write access to all bytes in the specified memory range, the function causes a first chance STATUS_ACCESS_VIOLATION exception. The debugger can be configured to break for this condition. After resuming process execution in the debugger, the function continues as usual and returns a nonzero value This behavior is by design and serves as a debugging aid.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-isbadwriteptr
     * @since windows5.1.2600
     */
    static IsBadWritePtr(lp, ucb) {
        result := DllCall("KERNEL32.dll\IsBadWritePtr", "ptr", lp, "ptr", ucb, "int")
        return result
    }

    /**
     * Determines whether the calling process has read access to the memory at the specified address.
     * @remarks
     * In a preemptive multitasking environment, it is possible for some other thread to change the process's access to the memory being tested. Even when the function indicates that the process has read access to the specified memory, you should use structured exception handling when attempting to access the memory. Use of structured exception handling enables the system to notify the process if an access violation exception occurs, giving the process an opportunity to handle the exception.
     * @param {Pointer<FARPROC>} lpfn A pointer to a memory address.
     * @returns {Integer} If the calling process has read access to the specified memory, the return value is zero.
     * 
     * If the calling process does not have read access to the specified memory, the return value is nonzero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the application is compiled as a debugging version, and the process does not have read access to  the specified memory location, the function causes an assertion and breaks into the debugger. Leaving the debugger, the function continues as usual, and returns a nonzero value. This behavior is by design, as a debugging aid.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-isbadcodeptr
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
     * Verifies that the calling process has read access to the specified range of memory. (IsBadStringPtrA)
     * @remarks
     * This function is typically used when working with pointers returned from third-party libraries, where you cannot determine the memory management behavior in the third-party DLL.
     * 
     * Threads in a process are expected to cooperate in such a way that one will not free memory that the other needs. Use of this function does not negate the need to do this. If this is not done, the application may fail in an unpredictable manner.
     * 
     * Dereferencing potentially invalid pointers can disable stack expansion in other threads. A thread exhausting its stack, when stack expansion has been disabled, results in the immediate termination of the parent process, with no pop-up error window or diagnostic information.
     * 
     * If the calling process has read access to some, but not all, of the specified memory range, the return value is nonzero.
     * 
     * In a preemptive multitasking environment, it is possible for some other thread to change the process's access to the memory being tested. Even when the function indicates that the process has read access to the specified memory, you should use 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/structured-exception-handling">structured exception handling</a> when attempting to access the memory. Use of structured exception handling enables the system to notify the process if an access violation exception occurs, giving the process an opportunity to handle the exception.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines IsBadStringPtr as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} lpsz A pointer to a null-terminated string, either Unicode or ASCII.
     * @param {Pointer} ucchMax The maximum size of the string, in <b>TCHARs</b>. The function checks for read access in all characters up to the string's terminating null character or up to the number of characters specified by this parameter, whichever is smaller. If this parameter is zero, the return value is zero.
     * @returns {Integer} If the calling process has read access to all characters up to the string's terminating null character or up to the number of characters specified by <i>ucchMax</i>, the return value is zero.
     * 
     * If the calling process does not have read access to all characters up to the string's terminating null character or up to the number of characters specified by <i>ucchMax</i>, the return value is nonzero.
     * 
     * If the application is compiled as a debugging version, and the process does not have read access to the entire memory range specified, the function causes an assertion and breaks into the debugger. Leaving the debugger, the function continues as usual, and returns a nonzero value This behavior is by design, as a debugging aid.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-isbadstringptra
     * @since windows5.1.2600
     */
    static IsBadStringPtrA(lpsz, ucchMax) {
        lpsz := lpsz is String? StrPtr(lpsz) : lpsz

        result := DllCall("KERNEL32.dll\IsBadStringPtrA", "ptr", lpsz, "ptr", ucchMax, "int")
        return result
    }

    /**
     * Verifies that the calling process has read access to the specified range of memory. (IsBadStringPtrW)
     * @remarks
     * This function is typically used when working with pointers returned from third-party libraries, where you cannot determine the memory management behavior in the third-party DLL.
     * 
     * Threads in a process are expected to cooperate in such a way that one will not free memory that the other needs. Use of this function does not negate the need to do this. If this is not done, the application may fail in an unpredictable manner.
     * 
     * Dereferencing potentially invalid pointers can disable stack expansion in other threads. A thread exhausting its stack, when stack expansion has been disabled, results in the immediate termination of the parent process, with no pop-up error window or diagnostic information.
     * 
     * If the calling process has read access to some, but not all, of the specified memory range, the return value is nonzero.
     * 
     * In a preemptive multitasking environment, it is possible for some other thread to change the process's access to the memory being tested. Even when the function indicates that the process has read access to the specified memory, you should use 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/structured-exception-handling">structured exception handling</a> when attempting to access the memory. Use of structured exception handling enables the system to notify the process if an access violation exception occurs, giving the process an opportunity to handle the exception.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines IsBadStringPtr as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} lpsz A pointer to a null-terminated string, either Unicode or ASCII.
     * @param {Pointer} ucchMax The maximum size of the string, in <b>TCHARs</b>. The function checks for read access in all characters up to the string's terminating null character or up to the number of characters specified by this parameter, whichever is smaller. If this parameter is zero, the return value is zero.
     * @returns {Integer} If the calling process has read access to all characters up to the string's terminating null character or up to the number of characters specified by <i>ucchMax</i>, the return value is zero.
     * 
     * If the calling process does not have read access to all characters up to the string's terminating null character or up to the number of characters specified by <i>ucchMax</i>, the return value is nonzero.
     * 
     * If the application is compiled as a debugging version, and the process does not have read access to the entire memory range specified, the function causes an assertion and breaks into the debugger. Leaving the debugger, the function continues as usual, and returns a nonzero value This behavior is by design, as a debugging aid.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-isbadstringptrw
     * @since windows5.1.2600
     */
    static IsBadStringPtrW(lpsz, ucchMax) {
        lpsz := lpsz is String? StrPtr(lpsz) : lpsz

        result := DllCall("KERNEL32.dll\IsBadStringPtrW", "ptr", lpsz, "ptr", ucchMax, "int")
        return result
    }

    /**
     * Maps previously allocated physical memory pages at a specified address in an Address Windowing Extensions (AWE) region. (MapUserPhysicalPagesScatter)
     * @remarks
     * The physical pages may be unmapped, but they are not freed. You must call 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-freeuserphysicalpages">FreeUserPhysicalPages</a> to free the physical 
     *     pages.
     * 
     * You can specify any number of physical memory pages, but the memory cannot extend outside the virtual 
     *     address space that is allocated by <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a>. Any 
     *     existing address maps are automatically overwritten with the new translations, and the old translations are 
     *     unmapped.
     * 
     * You cannot map physical memory pages outside the range that is specified in 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-allocateuserphysicalpages">AllocateUserPhysicalPages</a>. You can map 
     *     multiple regions simultaneously, but they cannot overlap.
     * 
     * Physical pages can be located at any physical address, but do not make assumptions about the contiguity of the 
     *     physical pages.
     * 
     * In a multiprocessor environment, this function maintains hardware translation buffer coherence. On return 
     *     from this function, all threads on all processors are guaranteed to see the correct mapping.
     * 
     * To compile an application that uses this function, define the _WIN32_WINNT macro as 0x0500 or later. For more 
     *     information, see <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows 
     *     Headers</a>.
     * @param {Pointer<Void>} VirtualAddresses A pointer to an array of starting addresses of the regions of memory to remap. 
     * 
     * Each entry in 
     *       <i>VirtualAddresses</i> must be within the address range that the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> function returns when the <a href="https://docs.microsoft.com/windows/desktop/Memory/address-windowing-extensions">Address Windowing Extensions</a> (AWE) region is 
     *       allocated. The value in <i>NumberOfPages</i> indicates the size of the array. Entries can be from multiple Address Windowing Extensions (AWE) regions.
     * @param {Pointer} NumberOfPages The size of the physical memory and virtual address space for which to establish translations, in pages. 
     * 
     * The 
     *       array at <i>VirtualAddresses</i> specifies the virtual address range.
     * @param {Pointer<UIntPtr>} PageArray A pointer to an array of values that indicates how each corresponding page in 
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
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>, and the function does not map or unmap—partial or 
     *        otherwise. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-mapuserphysicalpagesscatter
     * @since windows5.1.2600
     */
    static MapUserPhysicalPagesScatter(VirtualAddresses, NumberOfPages, PageArray) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\MapUserPhysicalPagesScatter", "ptr", VirtualAddresses, "ptr", NumberOfPages, "ptr*", PageArray, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers a callback function to be called when a secured memory range is freed or its protections are changed.
     * @remarks
     * An application that performs I/O directly to a high-performance device typically caches a virtual-to-physical 
     *     memory mapping for the buffer it uses for the I/O. The device's driver typically secures this memory address range 
     *     by calling the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntddk/nf-ntddk-mmsecurevirtualmemory">MmSecureVirtualMemory</a> routine, 
     *     which prevents the memory range from being freed or its protections  changed until the driver unsecures the 
     *     memory.
     * 
     * An application can use 
     *     <b>AddSecureMemoryCacheCallback</b> to register 
     *     a callback function that will be called when the memory is freed or its protections are changed, so the 
     *     application can invalidate its cached memory mapping. For more information, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nc-winnt-psecure_memory_cache_callback">SecureMemoryCacheCallback</a>.
     * 
     * To compile an application that uses this function, define <b>_WIN32_WINNT</b> as 0x0600 
     *     or later. For more information, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Pointer<PSECURE_MEMORY_CACHE_CALLBACK>} pfnCallBack A pointer to the application-defined 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nc-winnt-psecure_memory_cache_callback">SecureMemoryCacheCallback</a> function to 
     *       register.
     * @returns {Integer} If the function succeeds, it registers the callback function and returns 
     *       <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-addsecurememorycachecallback
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
     * @remarks
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or later. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Pointer<PSECURE_MEMORY_CACHE_CALLBACK>} pfnCallBack A pointer to the application-defined <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nc-winnt-psecure_memory_cache_callback">SecureMemoryCacheCallback</a> function to remove.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-removesecurememorycachecallback
     * @since windows6.0.6000
     */
    static RemoveSecureMemoryCacheCallback(pfnCallBack) {
        result := DllCall("KERNEL32.dll\RemoveSecureMemoryCacheCallback", "ptr", pfnCallBack, "int")
        return result
    }

;@endregion Methods
}

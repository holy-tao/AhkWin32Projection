#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ToolHelp
 * @version v4.0.30319
 */
class ToolHelp {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_MODULE_NAME32 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static HF32_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HF32_SHARED => 2
;@endregion Constants

;@region Methods
    /**
     * Takes a snapshot of the specified processes, as well as the heaps, modules, and threads used by these processes.
     * @remarks
     * The snapshot taken by this function is examined by the other tool help functions to provide their results. Access to the snapshot is read only. The snapshot handle acts as an object handle and is subject to the same rules regarding which processes and threads it is valid in.
     * 
     * To enumerate the heap or module states for all processes, specify <b>TH32CS_SNAPALL</b> and set <i>th32ProcessID</i> to zero. Then, for each additional process in the snapshot, call 
     * <b>CreateToolhelp32Snapshot</b> again, specifying its process identifier and the <b>TH32CS_SNAPHEAPLIST</b> or <b>TH32_SNAPMODULE</b> value.
     * 
     * When taking snapshots that include heaps and modules for a process other than the current process, the <b>CreateToolhelp32Snapshot</b> function can fail or return incorrect information for a variety of reasons. For example, if the loader data table in the target process is corrupted or not initialized, or if the module list changes during the function call as a result of DLLs being loaded or unloaded, the function might fail with <b>ERROR_BAD_LENGTH</b> or other error code. Ensure that the target process was not started in a suspended state,  and try calling the function again.  If the function fails with <b>ERROR_BAD_LENGTH</b> when called with <b>TH32CS_SNAPMODULE</b> or <b>TH32CS_SNAPMODULE32</b>,   call the function again until it succeeds. 
     * 
     * The <b>TH32CS_SNAPMODULE</b> and <b>TH32CS_SNAPMODULE32</b> flags do not retrieve handles for modules that were loaded with the <b>LOAD_LIBRARY_AS_DATAFILE</b> or similar flags. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * 
     * To destroy the snapshot, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
     * 
     * Note that you can use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryfullprocessimagenamea">QueryFullProcessImageName</a> function to retrieve the full name of an executable image for both 32- and 64-bit processes from a 32-bit process.
     * @param {Integer} dwFlags 
     * @param {Integer} th32ProcessID The process identifier of the process to be included in the snapshot. This parameter can be zero to indicate the current process. This parameter is used when the <b>TH32CS_SNAPHEAPLIST</b>, <b>TH32CS_SNAPMODULE</b>, <b>TH32CS_SNAPMODULE32</b>, or <b>TH32CS_SNAPALL</b> value is specified. Otherwise, it is ignored and all processes are included in the snapshot.
     * 
     * If the specified process is the Idle process or one of the CSRSS processes, this function fails and the last error code is <b>ERROR_ACCESS_DENIED</b> because their access restrictions prevent user-level code from opening them.
     * 
     * If the specified process is a 64-bit process and the caller is a 32-bit process, this function fails and the last error code is <b>ERROR_PARTIAL_COPY</b> (299).
     * @returns {Pointer<HANDLE>} If the function succeeds, it returns an open handle to the specified snapshot.
     * 
     * If the function fails, it returns <b>INVALID_HANDLE_VALUE</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error codes include <b>ERROR_BAD_LENGTH</b>.
     * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot
     * @since windows5.1.2600
     */
    static CreateToolhelp32Snapshot(dwFlags, th32ProcessID) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateToolhelp32Snapshot", "uint", dwFlags, "uint", th32ProcessID, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the first heap that has been allocated by a specified process.
     * @remarks
     * The calling application must set the <b>dwSize</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-heapentry32">HEAPLIST32</a> to the size, in bytes, of the structure. 
     * <b>Heap32ListFirst</b> changes <b>dwSize</b> to the number of bytes written to the structure. This will never be greater than the initial value of <b>dwSize</b>, but it may be smaller. If the value is smaller, do not rely on the values of any members whose offsets are greater than this value.
     * 
     * To retrieve information about other heaps in the heap list, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-heap32listnext">Heap32ListNext</a> function.
     * @param {Pointer<HANDLE>} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<HEAPLIST32>} lphl A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-heaplist32">HEAPLIST32</a> structure.
     * @returns {Integer} Returns <b>TRUE</b> if the first entry of the heap list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function when no heap list exists or the snapshot does not contain heap list information.
     * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/nf-tlhelp32-heap32listfirst
     * @since windows5.1.2600
     */
    static Heap32ListFirst(hSnapshot, lphl) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\Heap32ListFirst", "ptr", hSnapshot, "ptr", lphl, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the next heap that has been allocated by a process.
     * @remarks
     * To retrieve information about the first heap in a heap list, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-heap32listfirst">Heap32ListFirst</a> function.
     * @param {Pointer<HANDLE>} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<HEAPLIST32>} lphl A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-heaplist32">HEAPLIST32</a> structure.
     * @returns {Integer} Returns <b>TRUE</b> if the next entry of the heap list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function when no more entries in the heap list exist.
     * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/nf-tlhelp32-heap32listnext
     * @since windows5.1.2600
     */
    static Heap32ListNext(hSnapshot, lphl) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\Heap32ListNext", "ptr", hSnapshot, "ptr", lphl, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the first block of a heap that has been allocated by a process.
     * @remarks
     * The calling application must set the <b>dwSize</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-heapentry32">HEAPENTRY32</a> to the size, in bytes, of the structure. 
     * <b>Heap32First</b> changes <b>dwSize</b> to the number of bytes written to the structure. This will never be greater than the initial value of <b>dwSize</b>, but it may be smaller. If the value is smaller, do not rely on the values of any members whose offsets are greater than this value.
     * 
     * To access subsequent blocks of the same heap, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-heap32next">Heap32Next</a> function.
     * 
     * Walking the heap with <b>Heap32First</b> and <b>Heap32Next</b> is inefficient, particularly for large heaps.
     * Use
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapwalk">HeapWalk</a> instead.
     * @param {Pointer<HEAPENTRY32>} lphe A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-heapentry32">HEAPENTRY32</a> structure.
     * @param {Integer} th32ProcessID The identifier of the process context that owns the heap.
     * @param {Pointer} th32HeapID The identifier of the heap to be enumerated.
     * @returns {Integer} Returns <b>TRUE</b> if information for the first heap block has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if the heap is invalid or empty.
     * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/nf-tlhelp32-heap32first
     * @since windows5.1.2600
     */
    static Heap32First(lphe, th32ProcessID, th32HeapID) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\Heap32First", "ptr", lphe, "uint", th32ProcessID, "ptr", th32HeapID, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the next block of a heap that has been allocated by a process.
     * @remarks
     * To retrieve information for the first block of a heap, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-heap32first">Heap32First</a> function.
     * 
     * The <b>Heap32Next</b> function does not maintain a reference to the target process. If the target process dies, the system may create a new process using the same process identifier. Therefore, the caller should maintain a reference to the target process as long as it is using <b>Heap32Next</b>.
     * 
     * Walking the heap with <b>Heap32First</b> and <b>Heap32Next</b> is inefficient, particularly for large heaps.
     * Use
     * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapwalk">HeapWalk</a> instead.
     * @param {Pointer<HEAPENTRY32>} lphe A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-heapentry32">HEAPENTRY32</a> structure.
     * @returns {Integer} Returns <b>TRUE</b> if information about the next block in the heap has been copied to the buffer or <b>FALSE</b> otherwise. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_NO_MORE_FILES</b> when no more objects in the heap exist and <b>ERROR_INVALID_DATA</b> if the heap appears to be corrupt or is modified during the walk in such a way that 
     * <b>Heap32Next</b> cannot continue.
     * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/nf-tlhelp32-heap32next
     * @since windows5.1.2600
     */
    static Heap32Next(lphe) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\Heap32Next", "ptr", lphe, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Copies memory allocated to another process into an application-supplied buffer.
     * @remarks
     * This function opens a handle to the target process and closes it once the read operation has completed. If you're planning to perform several reads, use [ReadProcessMemory](../memoryapi/nf-memoryapi-readprocessmemory.md) instead.
     * @param {Integer} th32ProcessID The identifier of the process whose memory is being copied. This parameter can be zero to copy the memory of the current process.
     * @param {Pointer<Void>} lpBaseAddress The base address in the specified process to read. Before transferring any data, the system verifies that all data in the base address and memory of the specified size is accessible for read access. If this is the case, the function proceeds. Otherwise, the function fails.
     * @param {Pointer<Void>} lpBuffer A pointer to a buffer that receives the contents of the address space of the specified process.
     * @param {Pointer} cbRead The number of bytes to read from the specified process.
     * @param {Pointer<UIntPtr>} lpNumberOfBytesRead The number of bytes copied to the specified buffer. If this parameter is <b>NULL</b>, it is ignored.
     * @returns {Integer} Returns <b>TRUE</b> if successful.
     * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/nf-tlhelp32-toolhelp32readprocessmemory
     * @since windows5.1.2600
     */
    static Toolhelp32ReadProcessMemory(th32ProcessID, lpBaseAddress, lpBuffer, cbRead, lpNumberOfBytesRead) {
        result := DllCall("KERNEL32.dll\Toolhelp32ReadProcessMemory", "uint", th32ProcessID, "ptr", lpBaseAddress, "ptr", lpBuffer, "ptr", cbRead, "ptr", lpNumberOfBytesRead, "int")
        return result
    }

    /**
     * The Process32FirstW (Unicode) function (tlhelp32.h) retrieves information about the first process encountered in a system snapshot.
     * @remarks
     * The calling application must set the <b>dwSize</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-processentry32w">PROCESSENTRY32W</a> to the size, in bytes, of the structure. 
     * 
     * 
     * To retrieve information about other processes recorded in the same snapshot, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-process32next">Process32Next</a> function.
     * @param {Pointer<HANDLE>} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<PROCESSENTRY32W>} lppe A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-processentry32w">PROCESSENTRY32W</a> structure. It contains process information such as the name of the executable file, the process identifier, and the process identifier of the parent process.
     * @returns {Integer} Returns <b>TRUE</b> if the first entry of the process list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if no processes exist or the snapshot does not contain process information.
     * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/nf-tlhelp32-process32firstw
     * @since windows5.1.2600
     */
    static Process32FirstW(hSnapshot, lppe) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\Process32FirstW", "ptr", hSnapshot, "ptr", lppe, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The Process32NextW (Unicode) function (tlhelp32.h) retrieves information about the next process recorded in a system snapshot.
     * @remarks
     * To retrieve information about the first process recorded in a snapshot, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-process32firstw">Process32FirstW</a> function.
     * @param {Pointer<HANDLE>} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<PROCESSENTRY32W>} lppe A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-processentry32w">PROCESSENTRY32W</a> structure.
     * @returns {Integer} Returns <b>TRUE</b> if the next entry of the process list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if no processes exist or the snapshot does not contain process information.
     * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/nf-tlhelp32-process32nextw
     * @since windows5.1.2600
     */
    static Process32NextW(hSnapshot, lppe) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\Process32NextW", "ptr", hSnapshot, "ptr", lppe, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The Process32First function (tlhelp32.h) retrieves information about the first process encountered in a system snapshot.
     * @remarks
     * The calling application must set the <b>dwSize</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-processentry32">PROCESSENTRY32</a> to the size, in bytes, of the structure. 
     * 
     * 
     * To retrieve information about other processes recorded in the same snapshot, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-process32next">Process32Next</a> function.
     * @param {Pointer<HANDLE>} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<PROCESSENTRY32>} lppe A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-processentry32">PROCESSENTRY32</a> structure. It contains process information such as the name of the executable file, the process identifier, and the process identifier of the parent process.
     * @returns {Integer} Returns <b>TRUE</b> if the first entry of the process list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if no processes exist or the snapshot does not contain process information.
     * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/nf-tlhelp32-process32first
     * @since windows5.1.2600
     */
    static Process32First(hSnapshot, lppe) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\Process32First", "ptr", hSnapshot, "ptr", lppe, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The Process32Next function (tlhelp32.h) retrieves information about the next process recorded in a system snapshot.
     * @remarks
     * To retrieve information about the first process recorded in a snapshot, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-process32first">Process32First</a> function.
     * @param {Pointer<HANDLE>} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<PROCESSENTRY32>} lppe A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-processentry32">PROCESSENTRY32</a> structure.
     * @returns {Integer} Returns <b>TRUE</b> if the next entry of the process list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if no processes exist or the snapshot does not contain process information.
     * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/nf-tlhelp32-process32next
     * @since windows5.1.2600
     */
    static Process32Next(hSnapshot, lppe) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\Process32Next", "ptr", hSnapshot, "ptr", lppe, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the first thread of any process encountered in a system snapshot.
     * @remarks
     * The calling application must set the <b>dwSize</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-threadentry32">THREADENTRY32</a> to the size, in bytes, of the structure. 
     * <b>Thread32First</b> changes <b>dwSize</b> to the number of bytes written to the structure. This will never be greater than the initial value of <b>dwSize</b>, but it may be smaller. If the value is smaller, do not rely on the values of any members whose offsets are greater than this value.
     * 
     * To retrieve information about other threads recorded in the same snapshot, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-thread32next">Thread32Next</a> function.
     * @param {Pointer<HANDLE>} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<THREADENTRY32>} lpte A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-threadentry32">THREADENTRY32</a> structure.
     * @returns {Integer} Returns <b>TRUE</b> if the first entry of the thread list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if no threads exist or the snapshot does not contain thread information.
     * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/nf-tlhelp32-thread32first
     * @since windows5.1.2600
     */
    static Thread32First(hSnapshot, lpte) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\Thread32First", "ptr", hSnapshot, "ptr", lpte, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the next thread of any process encountered in the system memory snapshot.
     * @remarks
     * To retrieve information about the first thread recorded in a snapshot, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-thread32first">Thread32First</a> function.
     * @param {Pointer<HANDLE>} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<THREADENTRY32>} lpte A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-threadentry32">THREADENTRY32</a> structure.
     * @returns {Integer} Returns <b>TRUE</b> if the next entry of the thread list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if no threads exist or the snapshot does not contain thread information.
     * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/nf-tlhelp32-thread32next
     * @since windows5.1.2600
     */
    static Thread32Next(hSnapshot, lpte) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\Thread32Next", "ptr", hSnapshot, "ptr", lpte, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The Module32FirstW (Unicode) function (tlhelp32.h) retrieves information about the first module associated with a process.
     * @remarks
     * The calling application must set the <b>dwSize</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-moduleentry32w">MODULEENTRY32W</a> to the size, in bytes, of the structure.
     * 
     * To retrieve information about other modules associated with the specified process, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-module32nextw">Module32NextW</a> function.
     * @param {Pointer<HANDLE>} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<MODULEENTRY32W>} lpme A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-moduleentry32w">MODULEENTRY32W</a> structure.
     * @returns {Integer} Returns <b>TRUE</b> if the first entry of the module list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if no modules exist or the snapshot does not contain module information.
     * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/nf-tlhelp32-module32firstw
     * @since windows5.1.2600
     */
    static Module32FirstW(hSnapshot, lpme) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\Module32FirstW", "ptr", hSnapshot, "ptr", lpme, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The Module32NextW (Unicode) function (tlhelp32.h) retrieves information about the next module associated with a process or thread.
     * @remarks
     * To retrieve information about first module associated with a process, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-module32firstw">Module32FirstW</a> function.
     * @param {Pointer<HANDLE>} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<MODULEENTRY32W>} lpme A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-moduleentry32w">MODULEENTRY32W</a> structure.
     * @returns {Integer} Returns <b>TRUE</b> if the next entry of the module list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if no more modules exist.
     * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/nf-tlhelp32-module32nextw
     * @since windows5.1.2600
     */
    static Module32NextW(hSnapshot, lpme) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\Module32NextW", "ptr", hSnapshot, "ptr", lpme, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The Module32First function (tlhelp32.h) retrieves information about the first module associated with a process.
     * @remarks
     * The calling application must set the <b>dwSize</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-moduleentry32">MODULEENTRY32</a> to the size, in bytes, of the structure.
     * 
     * To retrieve information about other modules associated with the specified process, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-module32next">Module32Next</a> function.
     * @param {Pointer<HANDLE>} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<MODULEENTRY32>} lpme A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-moduleentry32">MODULEENTRY32</a> structure.
     * @returns {Integer} Returns <b>TRUE</b> if the first entry of the module list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if no modules exist or the snapshot does not contain module information.
     * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/nf-tlhelp32-module32first
     * @since windows5.1.2600
     */
    static Module32First(hSnapshot, lpme) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\Module32First", "ptr", hSnapshot, "ptr", lpme, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The Module32Next function (tlhelp32.h) retrieves information about the next module associated with a process or thread.
     * @remarks
     * To retrieve information about first module associated with a process, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-module32first">Module32First</a> function.
     * @param {Pointer<HANDLE>} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<MODULEENTRY32>} lpme A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-moduleentry32">MODULEENTRY32</a> structure.
     * @returns {Integer} Returns <b>TRUE</b> if the next entry of the module list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if no more modules exist.
     * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/nf-tlhelp32-module32next
     * @since windows5.1.2600
     */
    static Module32Next(hSnapshot, lpme) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\Module32Next", "ptr", hSnapshot, "ptr", lpme, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}

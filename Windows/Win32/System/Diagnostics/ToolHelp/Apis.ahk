#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
#Include ..\..\..\Foundation\HANDLE.ahk

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
     * @param {Integer} dwFlags 
     * @param {Integer} th32ProcessID The process identifier of the process to be included in the snapshot. This parameter can be zero to indicate the current process. This parameter is used when the <b>TH32CS_SNAPHEAPLIST</b>, <b>TH32CS_SNAPMODULE</b>, <b>TH32CS_SNAPMODULE32</b>, or <b>TH32CS_SNAPALL</b> value is specified. Otherwise, it is ignored and all processes are included in the snapshot.
     * 
     * If the specified process is the Idle process or one of the CSRSS processes, this function fails and the last error code is <b>ERROR_ACCESS_DENIED</b> because their access restrictions prevent user-level code from opening them.
     * 
     * If the specified process is a 64-bit process and the caller is a 32-bit process, this function fails and the last error code is <b>ERROR_PARTIAL_COPY</b> (299).
     * @returns {HANDLE} If the function succeeds, it returns an open handle to the specified snapshot.
     * 
     * If the function fails, it returns <b>INVALID_HANDLE_VALUE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error codes include <b>ERROR_BAD_LENGTH</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tlhelp32/nf-tlhelp32-createtoolhelp32snapshot
     * @since windows5.1.2600
     */
    static CreateToolhelp32Snapshot(dwFlags, th32ProcessID) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateToolhelp32Snapshot", "uint", dwFlags, "uint", th32ProcessID, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Retrieves information about the first heap that has been allocated by a specified process.
     * @param {HANDLE} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<HEAPLIST32>} lphl A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-heaplist32">HEAPLIST32</a> structure.
     * @returns {BOOL} Returns <b>TRUE</b> if the first entry of the heap list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function when no heap list exists or the snapshot does not contain heap list information.
     * @see https://docs.microsoft.com/windows/win32/api//tlhelp32/nf-tlhelp32-heap32listfirst
     * @since windows5.1.2600
     */
    static Heap32ListFirst(hSnapshot, lphl) {
        hSnapshot := hSnapshot is Win32Handle ? NumGet(hSnapshot, "ptr") : hSnapshot

        A_LastError := 0

        result := DllCall("KERNEL32.dll\Heap32ListFirst", "ptr", hSnapshot, "ptr", lphl, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the next heap that has been allocated by a process.
     * @param {HANDLE} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<HEAPLIST32>} lphl A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-heaplist32">HEAPLIST32</a> structure.
     * @returns {BOOL} Returns <b>TRUE</b> if the next entry of the heap list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function when no more entries in the heap list exist.
     * @see https://docs.microsoft.com/windows/win32/api//tlhelp32/nf-tlhelp32-heap32listnext
     * @since windows5.1.2600
     */
    static Heap32ListNext(hSnapshot, lphl) {
        hSnapshot := hSnapshot is Win32Handle ? NumGet(hSnapshot, "ptr") : hSnapshot

        A_LastError := 0

        result := DllCall("KERNEL32.dll\Heap32ListNext", "ptr", hSnapshot, "ptr", lphl, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the first block of a heap that has been allocated by a process.
     * @param {Pointer<HEAPENTRY32>} lphe A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-heapentry32">HEAPENTRY32</a> structure.
     * @param {Integer} th32ProcessID The identifier of the process context that owns the heap.
     * @param {Pointer} th32HeapID The identifier of the heap to be enumerated.
     * @returns {BOOL} Returns <b>TRUE</b> if information for the first heap block has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if the heap is invalid or empty.
     * @see https://docs.microsoft.com/windows/win32/api//tlhelp32/nf-tlhelp32-heap32first
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
     * @param {Pointer<HEAPENTRY32>} lphe A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-heapentry32">HEAPENTRY32</a> structure.
     * @returns {BOOL} Returns <b>TRUE</b> if information about the next block in the heap has been copied to the buffer or <b>FALSE</b> otherwise. The 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_NO_MORE_FILES</b> when no more objects in the heap exist and <b>ERROR_INVALID_DATA</b> if the heap appears to be corrupt or is modified during the walk in such a way that 
     * <b>Heap32Next</b> cannot continue.
     * @see https://docs.microsoft.com/windows/win32/api//tlhelp32/nf-tlhelp32-heap32next
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
     * @param {Integer} th32ProcessID The identifier of the process whose memory is being copied. This parameter can be zero to copy the memory of the current process.
     * @param {Pointer<Void>} lpBaseAddress The base address in the specified process to read. Before transferring any data, the system verifies that all data in the base address and memory of the specified size is accessible for read access. If this is the case, the function proceeds. Otherwise, the function fails.
     * @param {Pointer<Void>} lpBuffer A pointer to a buffer that receives the contents of the address space of the specified process.
     * @param {Pointer} cbRead The number of bytes to read from the specified process.
     * @param {Pointer<Pointer>} lpNumberOfBytesRead The number of bytes copied to the specified buffer. If this parameter is <b>NULL</b>, it is ignored.
     * @returns {BOOL} Returns <b>TRUE</b> if successful.
     * @see https://docs.microsoft.com/windows/win32/api//tlhelp32/nf-tlhelp32-toolhelp32readprocessmemory
     * @since windows5.1.2600
     */
    static Toolhelp32ReadProcessMemory(th32ProcessID, lpBaseAddress, lpBuffer, cbRead, lpNumberOfBytesRead) {
        result := DllCall("KERNEL32.dll\Toolhelp32ReadProcessMemory", "uint", th32ProcessID, "ptr", lpBaseAddress, "ptr", lpBuffer, "ptr", cbRead, "ptr*", lpNumberOfBytesRead, "int")
        return result
    }

    /**
     * Retrieves information about the first process encountered in a system snapshot.
     * @param {HANDLE} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<PROCESSENTRY32W>} lppe A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-processentry32w">PROCESSENTRY32W</a> structure. It contains process information such as the name of the executable file, the process identifier, and the process identifier of the parent process.
     * @returns {BOOL} Returns <b>TRUE</b> if the first entry of the process list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if no processes exist or the snapshot does not contain process information.
     * @see https://docs.microsoft.com/windows/win32/api//tlhelp32/nf-tlhelp32-process32firstw
     * @since windows5.1.2600
     */
    static Process32FirstW(hSnapshot, lppe) {
        hSnapshot := hSnapshot is Win32Handle ? NumGet(hSnapshot, "ptr") : hSnapshot

        A_LastError := 0

        result := DllCall("KERNEL32.dll\Process32FirstW", "ptr", hSnapshot, "ptr", lppe, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the next process recorded in a system snapshot.
     * @param {HANDLE} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<PROCESSENTRY32W>} lppe A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-processentry32w">PROCESSENTRY32W</a> structure.
     * @returns {BOOL} Returns <b>TRUE</b> if the next entry of the process list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if no processes exist or the snapshot does not contain process information.
     * @see https://docs.microsoft.com/windows/win32/api//tlhelp32/nf-tlhelp32-process32nextw
     * @since windows5.1.2600
     */
    static Process32NextW(hSnapshot, lppe) {
        hSnapshot := hSnapshot is Win32Handle ? NumGet(hSnapshot, "ptr") : hSnapshot

        A_LastError := 0

        result := DllCall("KERNEL32.dll\Process32NextW", "ptr", hSnapshot, "ptr", lppe, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the first process encountered in a system snapshot.
     * @param {HANDLE} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<PROCESSENTRY32>} lppe A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-processentry32">PROCESSENTRY32</a> structure. It contains process information such as the name of the executable file, the process identifier, and the process identifier of the parent process.
     * @returns {BOOL} Returns <b>TRUE</b> if the first entry of the process list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if no processes exist or the snapshot does not contain process information.
     * @see https://docs.microsoft.com/windows/win32/api//tlhelp32/nf-tlhelp32-process32first
     * @since windows5.1.2600
     */
    static Process32First(hSnapshot, lppe) {
        hSnapshot := hSnapshot is Win32Handle ? NumGet(hSnapshot, "ptr") : hSnapshot

        A_LastError := 0

        result := DllCall("KERNEL32.dll\Process32First", "ptr", hSnapshot, "ptr", lppe, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the next process recorded in a system snapshot.
     * @param {HANDLE} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<PROCESSENTRY32>} lppe A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-processentry32">PROCESSENTRY32</a> structure.
     * @returns {BOOL} Returns <b>TRUE</b> if the next entry of the process list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if no processes exist or the snapshot does not contain process information.
     * @see https://docs.microsoft.com/windows/win32/api//tlhelp32/nf-tlhelp32-process32next
     * @since windows5.1.2600
     */
    static Process32Next(hSnapshot, lppe) {
        hSnapshot := hSnapshot is Win32Handle ? NumGet(hSnapshot, "ptr") : hSnapshot

        A_LastError := 0

        result := DllCall("KERNEL32.dll\Process32Next", "ptr", hSnapshot, "ptr", lppe, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the first thread of any process encountered in a system snapshot.
     * @param {HANDLE} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<THREADENTRY32>} lpte A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-threadentry32">THREADENTRY32</a> structure.
     * @returns {BOOL} Returns <b>TRUE</b> if the first entry of the thread list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if no threads exist or the snapshot does not contain thread information.
     * @see https://docs.microsoft.com/windows/win32/api//tlhelp32/nf-tlhelp32-thread32first
     * @since windows5.1.2600
     */
    static Thread32First(hSnapshot, lpte) {
        hSnapshot := hSnapshot is Win32Handle ? NumGet(hSnapshot, "ptr") : hSnapshot

        A_LastError := 0

        result := DllCall("KERNEL32.dll\Thread32First", "ptr", hSnapshot, "ptr", lpte, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the next thread of any process encountered in the system memory snapshot.
     * @param {HANDLE} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<THREADENTRY32>} lpte A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-threadentry32">THREADENTRY32</a> structure.
     * @returns {BOOL} Returns <b>TRUE</b> if the next entry of the thread list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if no threads exist or the snapshot does not contain thread information.
     * @see https://docs.microsoft.com/windows/win32/api//tlhelp32/nf-tlhelp32-thread32next
     * @since windows5.1.2600
     */
    static Thread32Next(hSnapshot, lpte) {
        hSnapshot := hSnapshot is Win32Handle ? NumGet(hSnapshot, "ptr") : hSnapshot

        A_LastError := 0

        result := DllCall("KERNEL32.dll\Thread32Next", "ptr", hSnapshot, "ptr", lpte, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the first module associated with a process.
     * @param {HANDLE} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<MODULEENTRY32W>} lpme A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-moduleentry32w">MODULEENTRY32W</a> structure.
     * @returns {BOOL} Returns <b>TRUE</b> if the first entry of the module list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if no modules exist or the snapshot does not contain module information.
     * @see https://docs.microsoft.com/windows/win32/api//tlhelp32/nf-tlhelp32-module32firstw
     * @since windows5.1.2600
     */
    static Module32FirstW(hSnapshot, lpme) {
        hSnapshot := hSnapshot is Win32Handle ? NumGet(hSnapshot, "ptr") : hSnapshot

        A_LastError := 0

        result := DllCall("KERNEL32.dll\Module32FirstW", "ptr", hSnapshot, "ptr", lpme, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the next module associated with a process or thread.
     * @param {HANDLE} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<MODULEENTRY32W>} lpme A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-moduleentry32w">MODULEENTRY32W</a> structure.
     * @returns {BOOL} Returns <b>TRUE</b> if the next entry of the module list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if no more modules exist.
     * @see https://docs.microsoft.com/windows/win32/api//tlhelp32/nf-tlhelp32-module32nextw
     * @since windows5.1.2600
     */
    static Module32NextW(hSnapshot, lpme) {
        hSnapshot := hSnapshot is Win32Handle ? NumGet(hSnapshot, "ptr") : hSnapshot

        A_LastError := 0

        result := DllCall("KERNEL32.dll\Module32NextW", "ptr", hSnapshot, "ptr", lpme, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the first module associated with a process.
     * @param {HANDLE} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<MODULEENTRY32>} lpme A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-moduleentry32">MODULEENTRY32</a> structure.
     * @returns {BOOL} Returns <b>TRUE</b> if the first entry of the module list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if no modules exist or the snapshot does not contain module information.
     * @see https://docs.microsoft.com/windows/win32/api//tlhelp32/nf-tlhelp32-module32first
     * @since windows5.1.2600
     */
    static Module32First(hSnapshot, lpme) {
        hSnapshot := hSnapshot is Win32Handle ? NumGet(hSnapshot, "ptr") : hSnapshot

        A_LastError := 0

        result := DllCall("KERNEL32.dll\Module32First", "ptr", hSnapshot, "ptr", lpme, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the next module associated with a process or thread.
     * @param {HANDLE} hSnapshot A handle to the snapshot returned from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * @param {Pointer<MODULEENTRY32>} lpme A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-moduleentry32">MODULEENTRY32</a> structure.
     * @returns {BOOL} Returns <b>TRUE</b> if the next entry of the module list has been copied to the buffer or <b>FALSE</b> otherwise. The <b>ERROR_NO_MORE_FILES</b> error value is returned by the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function if no more modules exist.
     * @see https://docs.microsoft.com/windows/win32/api//tlhelp32/nf-tlhelp32-module32next
     * @since windows5.1.2600
     */
    static Module32Next(hSnapshot, lpme) {
        hSnapshot := hSnapshot is Win32Handle ? NumGet(hSnapshot, "ptr") : hSnapshot

        A_LastError := 0

        result := DllCall("KERNEL32.dll\Module32Next", "ptr", hSnapshot, "ptr", lpme, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}

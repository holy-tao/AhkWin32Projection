#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * PREAD_PROCESS_MEMORY_ROUTINE64 (dbghelp.h) is an application-defined callback function used with the StackWalk64 function.
 * @remarks
 * In many cases, this function can best service the callback with a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-readprocessmemory">ReadProcessMemory</a>.
 * 
 * This function should read as much of the requested memory as possible. The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-stackwalk">StackWalk64</a> function handles the case where only part of the requested memory is read.
 * 
 * This callback function supersedes the <i>PREAD_PROCESS_MEMORY_ROUTINE</i> callback function.  <i>PREAD_PROCESS_MEMORY_ROUTINE</i> is defined as follows in Dbghelp.h. 
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nc-dbghelp-pread_process_memory_routine64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PREAD_PROCESS_MEMORY_ROUTINE64 {
    value : IntPtr

    __value {
        set {
            if (value is PREAD_PROCESS_MEMORY_ROUTINE64) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hProcess A handle to the process for which the stack trace is generated.
     * @param {Integer} qwBaseAddress The base address of the memory to be read.
     * @param {Integer} lpBuffer A pointer to a buffer that receives the memory to be read.
     * @param {Integer} nSize The size of the memory to be read, in bytes.
     * @param {Pointer<Integer>} lpNumberOfBytesRead A pointer to a variable that receives the number of bytes actually read.
     * @returns {BOOL} If the function succeeds, the return value should be <b>TRUE</b>. If the function fails, the return value should be <b>FALSE</b>.
     */
    Call(hProcess, qwBaseAddress, lpBuffer, nSize, lpNumberOfBytesRead) {
        lpNumberOfBytesReadMarshal := lpNumberOfBytesRead is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, hProcess, Int64, qwBaseAddress, IntPtr, lpBuffer, UInt32, nSize, lpNumberOfBytesReadMarshal, lpNumberOfBytesRead, BOOL)
        return result
    }

    /**
     * A PREAD_PROCESS_MEMORY_ROUTINE64 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PREAD_PROCESS_MEMORY_ROUTINE64 {
        /**
         * Creates a PREAD_PROCESS_MEMORY_ROUTINE64 pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, Int64, IntPtr, UInt32, "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, Int64, IntPtr, UInt32, "uint*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}

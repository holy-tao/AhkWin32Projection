#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OVERLAPPED.ahk" { OVERLAPPED }

/**
 * An application-defined callback function used with the ReadFileEx and WriteFileEx functions. It is called when the asynchronous input and output (I/O) operation is completed or canceled and the calling thread is in an alertable state.
 * @remarks
 * The return value for an asynchronous operation is 0 (<b>ERROR_SUCCESS</b>) if the operation 
 *     completed successfully or if the operation completed with a warning. To determine whether an I/O operation was 
 *     completed successfully, check that <i>dwErrorCode</i> is 0, call 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a>, then call 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. For example, if the buffer was not large 
 *     enough to receive all of the data from a call to <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfileex">ReadFileEx</a>, 
 *     <i>dwErrorCode</i> is set to 0, 
 *     <b>GetOverlappedResult</b> fails, and 
 *     <b>GetLastError</b> returns 
 *     <b>ERROR_MORE_DATA</b>.
 * 
 * Returning from this function allows another pending I/O completion routine to be called. All waiting 
 *     completion routines are called before the alertable thread's wait is completed with a return code of 
 *     <b>WAIT_IO_COMPLETION</b>. The system may call the waiting completion routines in any order. 
 *     They may or may not be called in the order the I/O functions are completed.
 * 
 * Each time the system calls a completion routine, it uses some of the application's stack. If the completion 
 *     routine does additional asynchronous I/O and alertable waits, the stack may grow.
 * 
 * For more information, see 
 *     <a href="https://docs.microsoft.com/windows/desktop/Sync/asynchronous-procedure-calls">Asynchronous Procedure Calls</a>.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/nc-minwinbase-lpoverlapped_completion_routine
 * @namespace Windows.Win32.System.IO
 */
export default struct LPOVERLAPPED_COMPLETION_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is LPOVERLAPPED_COMPLETION_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwErrorCode The I/O completion status. This parameter can be one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * @param {Integer} dwNumberOfBytesTransfered The number of bytes transferred. If an error occurs, this parameter is zero.
     * @param {Pointer<OVERLAPPED>} lpOverlapped A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure specified by 
     *        the asynchronous I/O function.
     * 
     * The system does not use the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure 
     *        after the completion routine is called, so the completion routine can deallocate the memory used by the 
     *        overlapped structure.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(dwErrorCode, dwNumberOfBytesTransfered, lpOverlapped) {
        DllCall(this.value, UInt32, dwErrorCode, UInt32, dwNumberOfBytesTransfered, OVERLAPPED.Ptr, lpOverlapped)
    }

    /**
     * A LPOVERLAPPED_COMPLETION_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPOVERLAPPED_COMPLETION_ROUTINE {
        /**
         * Creates a LPOVERLAPPED_COMPLETION_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, OVERLAPPED) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, OVERLAPPED.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

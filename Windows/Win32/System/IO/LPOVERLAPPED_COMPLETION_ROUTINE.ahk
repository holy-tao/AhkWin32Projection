#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/minwinbase/nc-minwinbase-lpoverlapped_completion_routine
 * @namespace Windows.Win32.System.IO
 * @version v4.0.30319
 */
class LPOVERLAPPED_COMPLETION_ROUTINE extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} dwErrorCode 
     * @param {Integer} dwNumberOfBytesTransfered 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwErrorCode, dwNumberOfBytesTransfered, lpOverlapped) {
        ComCall(3, this, "uint", dwErrorCode, "uint", dwNumberOfBytesTransfered, "ptr", lpOverlapped)
    }
}

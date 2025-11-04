#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.IO
 * @version v4.0.30319
 */
class IO {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Creates an input/output (I/O) completion port and associates it with a specified file handle, or creates an I/O completion port that is not yet associated with a file handle, allowing association at a later time.
     * @param {HANDLE} FileHandle An open file handle or <b>INVALID_HANDLE_VALUE</b>.
     * 
     * The handle must be to an object that supports overlapped I/O.
     * 
     * If a handle is provided, it has to have been opened for overlapped I/O completion. For example, you must specify the <b>FILE_FLAG_OVERLAPPED</b> flag when using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function to obtain the handle.
     * 
     * If <b>INVALID_HANDLE_VALUE</b> is specified, the function creates an I/O completion port without associating it with a file handle. In this case, the <i>ExistingCompletionPort</i> parameter must be <b>NULL</b> and the <i>CompletionKey</i> parameter is ignored.
     * @param {HANDLE} ExistingCompletionPort A handle to an existing I/O completion port or <b>NULL</b>.
     * 
     * If this parameter specifies an existing I/O completion port, the function associates it with the handle specified by the <i>FileHandle</i> parameter. The function returns the handle of the existing I/O completion port if successful; it does not create a new I/O completion port.
     * 
     * If this parameter is <b>NULL</b>, the function creates a new I/O completion port and, if the <i>FileHandle</i> parameter is valid, associates it with the new I/O completion port. Otherwise no file handle association occurs. The function returns the handle to the new I/O completion port if successful.
     * @param {Pointer} CompletionKey The per-handle user-defined completion key that is included in every I/O completion packet for the specified file handle. For more information, see the Remarks section.
     * @param {Integer} NumberOfConcurrentThreads The maximum number of threads that the operating system can allow to concurrently process I/O completion packets for the I/O completion port. This parameter is ignored if the <i>ExistingCompletionPort</i> parameter is not <b>NULL</b>.
     * 
     * If this parameter is zero, the system allows as many concurrently running threads as there are processors in the system.
     * @returns {HANDLE} If the function succeeds, the return value is the handle to an I/O completion port:
     * 
     * <ul>
     * <li>
     * If the <i>ExistingCompletionPort</i> parameter was <b>NULL</b>, the return value is a new handle.
     * 
     * </li>
     * <li>
     * If the <i>ExistingCompletionPort</i> parameter was a valid I/O completion port handle, the return value is that same handle.
     * 
     * </li>
     * <li>
     * If the <i>FileHandle</i> parameter was a valid handle, that file handle is now associated with the returned I/O completion port.
     * 
     * </li>
     * </ul>
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//ioapiset/nf-ioapiset-createiocompletionport
     * @since windows5.1.2600
     */
    static CreateIoCompletionPort(FileHandle, ExistingCompletionPort, CompletionKey, NumberOfConcurrentThreads) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle
        ExistingCompletionPort := ExistingCompletionPort is Win32Handle ? NumGet(ExistingCompletionPort, "ptr") : ExistingCompletionPort

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateIoCompletionPort", "ptr", FileHandle, "ptr", ExistingCompletionPort, "ptr", CompletionKey, "uint", NumberOfConcurrentThreads, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Attempts to dequeue an I/O completion packet from the specified I/O completion port.
     * @param {HANDLE} CompletionPort A handle to the completion port. To create a completion port, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/createiocompletionport">CreateIoCompletionPort</a> function.
     * @param {Pointer<Integer>} lpNumberOfBytesTransferred A pointer to a variable that receives the number of bytes transferred in a completed I/O operation.
     * @param {Pointer<Pointer>} lpCompletionKey A pointer to a variable that receives the completion key value associated with the file handle whose I/O operation has completed. A completion key is a per-file key that is specified in a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/createiocompletionport">CreateIoCompletionPort</a>.
     * @param {Pointer<Pointer<OVERLAPPED>>} lpOverlapped A pointer to a variable that receives the address of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure that was specified when the completed I/O operation was started. 
     * 
     * Even if you have passed the function a file handle associated with a completion port and a valid 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure, an application can prevent completion port notification. This is done by specifying a valid event handle for the <b>hEvent</b> member of the <b>OVERLAPPED</b> structure, and setting its low-order bit. A valid event handle whose low-order bit is set keeps I/O completion from being queued to the completion port.
     * @param {Integer} dwMilliseconds The number of milliseconds that the caller is willing to wait for a completion packet to appear at the completion port. If a completion packet does not appear within the specified time, the function times out, returns <b>FALSE</b>, and sets *<i>lpOverlapped</i> to <b>NULL</b>.
     * 
     * If <i>dwMilliseconds</i> is <b>INFINITE</b>, the function will never time out. If <i>dwMilliseconds</i> is zero and there is no I/O operation to dequeue, the function will time out immediately.
     * @returns {BOOL} Returns nonzero (<b>TRUE</b>) if successful or zero (<b>FALSE</b>) otherwise.
     * 
     * To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * For more information, see the Remarks section.
     * @see https://docs.microsoft.com/windows/win32/api//ioapiset/nf-ioapiset-getqueuedcompletionstatus
     * @since windows5.1.2600
     */
    static GetQueuedCompletionStatus(CompletionPort, lpNumberOfBytesTransferred, lpCompletionKey, lpOverlapped, dwMilliseconds) {
        CompletionPort := CompletionPort is Win32Handle ? NumGet(CompletionPort, "ptr") : CompletionPort

        lpNumberOfBytesTransferredMarshal := lpNumberOfBytesTransferred is VarRef ? "uint*" : "ptr"
        lpCompletionKeyMarshal := lpCompletionKey is VarRef ? "ptr*" : "ptr"
        lpOverlappedMarshal := lpOverlapped is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetQueuedCompletionStatus", "ptr", CompletionPort, lpNumberOfBytesTransferredMarshal, lpNumberOfBytesTransferred, lpCompletionKeyMarshal, lpCompletionKey, lpOverlappedMarshal, lpOverlapped, "uint", dwMilliseconds, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves multiple completion port entries simultaneously.
     * @param {HANDLE} CompletionPort A handle to the completion port. To create a completion port, use the 
     *        <a href="https://docs.microsoft.com/windows/desktop/FileIO/createiocompletionport">CreateIoCompletionPort</a> function.
     * @param {Pointer<OVERLAPPED_ENTRY>} lpCompletionPortEntries On input, points to a pre-allocated array of 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped_entry">OVERLAPPED_ENTRY</a> structures.
     * 
     * On output, receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped_entry">OVERLAPPED_ENTRY</a> 
     *        structures that hold the entries. The number of array elements is provided by 
     *        <i>ulNumEntriesRemoved</i>.
     * 
     * The number of bytes transferred during each I/O, the completion key that indicates on which file each I/O 
     *        occurred, and the overlapped structure address used in each original I/O are all returned in the 
     *        <i>lpCompletionPortEntries</i> array.
     * @param {Integer} ulCount The maximum number of entries to remove.
     * @param {Pointer<Integer>} ulNumEntriesRemoved A pointer to a variable that receives the number of entries actually removed.
     * @param {Integer} dwMilliseconds The number of milliseconds that the caller is willing to wait for a completion packet to appear at the 
     *        completion port. If a completion packet does not appear within the specified time, the function times out and 
     *        returns <b>FALSE</b>.
     * 
     * If <i>dwMilliseconds</i> is <b>INFINITE</b> (0xFFFFFFFF), the function 
     *        will never time out. If <i>dwMilliseconds</i> is zero and there is no I/O operation to 
     *        dequeue, the function will time out immediately.
     * @param {BOOL} fAlertable If this parameter is <b>FALSE</b>, the function does not return until the time-out period 
     *        has elapsed or an entry is retrieved.
     * 
     * If the parameter is <b>TRUE</b> and there are no available entries, the function performs 
     *        an alertable wait. The thread returns when the system queues an I/O completion routine or APC to the thread and 
     *        the thread executes the function.
     * 
     * A completion routine is queued when the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfileex">ReadFileEx</a> or 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefileex">WriteFileEx</a> function in which it was specified has 
     *        completed, and the calling thread is the thread that initiated the operation. An APC is queued when you call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-queueuserapc">QueueUserAPC</a>.
     * @returns {BOOL} Returns nonzero (<b>TRUE</b>) if successful or zero (<b>FALSE</b>) otherwise.
     * 
     * To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//ioapiset/nf-ioapiset-getqueuedcompletionstatusex
     * @since windows6.0.6000
     */
    static GetQueuedCompletionStatusEx(CompletionPort, lpCompletionPortEntries, ulCount, ulNumEntriesRemoved, dwMilliseconds, fAlertable) {
        CompletionPort := CompletionPort is Win32Handle ? NumGet(CompletionPort, "ptr") : CompletionPort

        ulNumEntriesRemovedMarshal := ulNumEntriesRemoved is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetQueuedCompletionStatusEx", "ptr", CompletionPort, "ptr", lpCompletionPortEntries, "uint", ulCount, ulNumEntriesRemovedMarshal, ulNumEntriesRemoved, "uint", dwMilliseconds, "int", fAlertable, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Posts an I/O completion packet to an I/O completion port.
     * @param {HANDLE} CompletionPort A handle to an I/O completion port to which the I/O completion packet is to be posted.
     * @param {Integer} dwNumberOfBytesTransferred The value to be returned through the <i>lpNumberOfBytesTransferred</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> function.
     * @param {Pointer} dwCompletionKey The value to be returned through the <i>lpCompletionKey</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> function.
     * @param {Pointer<OVERLAPPED>} lpOverlapped The value to be returned through the <i>lpOverlapped</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> .
     * @see https://docs.microsoft.com/windows/win32/api//ioapiset/nf-ioapiset-postqueuedcompletionstatus
     * @since windows5.1.2600
     */
    static PostQueuedCompletionStatus(CompletionPort, dwNumberOfBytesTransferred, dwCompletionKey, lpOverlapped) {
        CompletionPort := CompletionPort is Win32Handle ? NumGet(CompletionPort, "ptr") : CompletionPort

        A_LastError := 0

        result := DllCall("KERNEL32.dll\PostQueuedCompletionStatus", "ptr", CompletionPort, "uint", dwNumberOfBytesTransferred, "ptr", dwCompletionKey, "ptr", lpOverlapped, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sends a control code directly to a specified device driver, causing the corresponding device to perform the corresponding operation.
     * @param {HANDLE} hDevice A handle to the device on which the operation is to be performed. The device is typically a volume, 
     *       directory, file, or stream. To retrieve a device handle, use the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function. For more information, see 
     *       Remarks.
     * @param {Integer} dwIoControlCode The control code for the operation. This value identifies the specific operation to be performed and the 
     *        type of device on which to perform it.
     * 
     * For a list of the control codes, see Remarks. The documentation for each control code provides usage details 
     *        for the <i>lpInBuffer</i>, <i>nInBufferSize</i>, 
     *        <i>lpOutBuffer</i>, and <i>nOutBufferSize</i> parameters.
     * @param {Pointer} lpInBuffer A pointer to the input buffer that contains the data required to perform the operation. The format of this 
     *        data depends on the value of the <i>dwIoControlCode</i> parameter.
     * 
     * This parameter can be <b>NULL</b> if <i>dwIoControlCode</i> specifies 
     *        an operation that does not require input data.
     * @param {Integer} nInBufferSize The size of the input buffer, in bytes.
     * @param {Pointer} lpOutBuffer A pointer to the output buffer that is to receive the data returned by the operation. The format of this 
     *        data depends on the value of the <i>dwIoControlCode</i> parameter.
     * 
     * This parameter can be <b>NULL</b> if <i>dwIoControlCode</i> specifies 
     *        an operation that does not return data.
     * @param {Integer} nOutBufferSize The size of the output buffer, in bytes.
     * @param {Pointer<Integer>} lpBytesReturned A pointer to a variable that receives the size of the data stored in the output buffer, in bytes.
     * 
     * If the output buffer is too small to receive any data,  the call fails, 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
     *        <b>ERROR_INSUFFICIENT_BUFFER</b>, and <i>lpBytesReturned</i> is zero.
     * 
     * If the output buffer is too small to hold all of the data but can hold some entries, some drivers will return 
     *        as much data as fits. In this case, the call fails, 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
     *        <b>ERROR_MORE_DATA</b>, and <i>lpBytesReturned</i> indicates the amount 
     *        of data received. Your application should call 
     *        <b>DeviceIoControl</b> again with the same operation, 
     *        specifying a new starting point.
     * 
     * If <i>lpOverlapped</i> is <b>NULL</b>, 
     *        <i>lpBytesReturned</i> cannot be <b>NULL</b>. Even when an operation 
     *        returns no output data and <i>lpOutBuffer</i> is <b>NULL</b>, 
     *        <b>DeviceIoControl</b> makes use of 
     *        <i>lpBytesReturned</i>. After such an operation, the value of 
     *        <i>lpBytesReturned</i> is meaningless.
     * 
     * If <i>lpOverlapped</i> is not <b>NULL</b>, 
     *        <i>lpBytesReturned</i> can be <b>NULL</b>. If this parameter is not 
     *        <b>NULL</b> and the operation returns data, <i>lpBytesReturned</i> is 
     *        meaningless until the overlapped operation has completed. To retrieve the number of bytes returned, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a>. If 
     *        <i>hDevice</i> is associated with an I/O completion port, you can retrieve the number of 
     *        bytes returned by calling 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a>.
     * @param {Pointer<OVERLAPPED>} lpOverlapped A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure.
     * 
     * If <i>hDevice</i> was opened without specifying 
     *        <b>FILE_FLAG_OVERLAPPED</b>, <i>lpOverlapped</i> is ignored.
     * 
     * If <i>hDevice</i> was opened with the <b>FILE_FLAG_OVERLAPPED</b> flag, 
     *        the operation is performed as an overlapped (asynchronous) operation. In this case, 
     *        <i>lpOverlapped</i> must point to a valid 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure that contains a handle to an 
     *        event object. Otherwise, the function fails in unpredictable ways.
     * 
     * For overlapped operations, 
     *        <b>DeviceIoControl</b> returns immediately, and the event 
     *        object is signaled when the operation has been completed. Otherwise, the function does not return until the 
     *        operation has been completed or an error occurs.
     * @returns {BOOL} If the operation completes successfully, the return value is nonzero.
     * 
     * If the operation fails or is pending, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//ioapiset/nf-ioapiset-deviceiocontrol
     * @since windows5.1.2600
     */
    static DeviceIoControl(hDevice, dwIoControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned, lpOverlapped) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        lpBytesReturnedMarshal := lpBytesReturned is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\DeviceIoControl", "ptr", hDevice, "uint", dwIoControlCode, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, lpBytesReturnedMarshal, lpBytesReturned, "ptr", lpOverlapped, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the results of an overlapped operation on the specified file, named pipe, or communications device.
     * @param {HANDLE} hFile A handle to the file, named pipe, or communications device. This is the same handle that was specified when the overlapped operation was started by a call to any of the following functions: 
     * 
     * - [ReadFile](../fileapi/nf-fileapi-readfile.md)
     * - [WriteFile](../fileapi/nf-fileapi-writefile.md)
     * - [ConnectNamedPipe](../namedpipeapi/nf-namedpipeapi-connectnamedpipe.md)
     * - [TransactNamedPipe](../namedpipeapi/nf-namedpipeapi-transactnamedpipe.md)
     * - [DeviceIoControl](./nf-ioapiset-deviceiocontrol.md)
     * - [WaitCommEvent](../winbase/nf-winbase-waitcommevent.md)
     * - [ReadDirectoryChangesW](../winbase/nf-winbase-readdirectorychangesw.md)
     * - [LockFileEx](../fileapi/nf-fileapi-lockfileex.md)
     * - [ReadDirectoryChangesW](../winbase/nf-winbase-readdirectorychangesw.md)
     * @param {Pointer<OVERLAPPED>} lpOverlapped A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure that was specified when the overlapped operation was started.
     * @param {Pointer<Integer>} lpNumberOfBytesTransferred A pointer to a variable that receives the number of bytes that were actually transferred by a read or write operation. For a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-transactnamedpipe">TransactNamedPipe</a> operation, this is the number of bytes that were read from the pipe. For a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-deviceiocontrol">DeviceIoControl</a> operation, this is the number of bytes of output data returned by the device driver. For a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-connectnamedpipe">ConnectNamedPipe</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-waitcommevent">WaitCommEvent</a> operation, this value is undefined.
     * @param {BOOL} bWait If this parameter is <b>TRUE</b>, and the <b>Internal</b> member of the <i>lpOverlapped</i> structure is <b>STATUS_PENDING</b>, the function does not return until the operation has been completed. If this parameter is <b>FALSE</b> and the operation is still pending, the function returns <b>FALSE</b> and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_IO_INCOMPLETE</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//ioapiset/nf-ioapiset-getoverlappedresult
     * @since windows5.1.2600
     */
    static GetOverlappedResult(hFile, lpOverlapped, lpNumberOfBytesTransferred, bWait) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        lpNumberOfBytesTransferredMarshal := lpNumberOfBytesTransferred is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetOverlappedResult", "ptr", hFile, "ptr", lpOverlapped, lpNumberOfBytesTransferredMarshal, lpNumberOfBytesTransferred, "int", bWait, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Marks any outstanding I/O operations for the specified file handle. The function only cancels I/O operations in the current process, regardless of which thread created the I/O operation.
     * @param {HANDLE} hFile A handle to the file.
     * @param {Pointer<OVERLAPPED>} lpOverlapped A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> data structure that 
     *        contains the data used for asynchronous  I/O.
     * 
     * If this parameter is <b>NULL</b>, all I/O requests for the <i>hFile</i> 
     *        parameter are canceled.
     * 
     * If this parameter is not <b>NULL</b>, only those specific I/O requests that were issued 
     *        for the file with the specified <i>lpOverlapped</i> overlapped structure are marked as 
     *        canceled, meaning that you can cancel one or more requests, while the 
     *        <a href="https://docs.microsoft.com/windows/desktop/FileIO/cancelio">CancelIo</a> function cancels all outstanding requests on a file 
     *        handle.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. The cancel operation for all pending I/O operations 
     *        issued by the calling process for the specified file handle was successfully requested. The application must not 
     *        free or reuse the <a href="/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure associated with 
     *        the canceled I/O operations until they have completed. The thread can use the 
     *        <a href="/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> function to determine when 
     *        the I/O operations themselves have been completed.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call the 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * If this function cannot find a request to cancel, the return value is 0 (zero), and 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
     *        <b>ERROR_NOT_FOUND</b>.
     * @see https://docs.microsoft.com/windows/win32/api//ioapiset/nf-ioapiset-cancelioex
     * @since windows6.0.6000
     */
    static CancelIoEx(hFile, lpOverlapped) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CancelIoEx", "ptr", hFile, "ptr", lpOverlapped, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Cancels all pending input and output (I/O) operations that are issued by the calling thread for the specified file.
     * @param {HANDLE} hFile A handle to the file. 
     * 
     * The function cancels all pending I/O operations for this file handle.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. The cancel operation for all pending I/O operations issued by the calling thread for the specified file handle was successfully requested. The thread can use the <a href="/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> function to determine when the I/O operations themselves have been completed.
     * 
     * If the function fails, the return value is zero (0). To get extended error information, call 
     * the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//ioapiset/nf-ioapiset-cancelio
     * @since windows5.1.2600
     */
    static CancelIo(hFile) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CancelIo", "ptr", hFile, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the results of an overlapped operation on the specified file, named pipe, or communications device within the specified time-out interval. The calling thread can perform an alertable wait.
     * @param {HANDLE} hFile A handle to the file, named pipe, or communications device. This is the same handle that was specified when the overlapped operation was started by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefile">WriteFile</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-connectnamedpipe">ConnectNamedPipe</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-transactnamedpipe">TransactNamedPipe</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-deviceiocontrol">DeviceIoControl</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-waitcommevent">WaitCommEvent</a> function.
     * @param {Pointer<OVERLAPPED>} lpOverlapped A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure that was specified when the overlapped operation was started.
     * @param {Pointer<Integer>} lpNumberOfBytesTransferred A pointer to a variable that receives the number of bytes that were actually transferred by a read or write operation. For a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-transactnamedpipe">TransactNamedPipe</a> operation, this is the number of bytes that were read from the pipe. For a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-deviceiocontrol">DeviceIoControl</a> operation, this is the number of bytes of output data returned by the device driver. For a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-connectnamedpipe">ConnectNamedPipe</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-waitcommevent">WaitCommEvent</a> operation, this value is undefined.
     * @param {Integer} dwMilliseconds The time-out interval, in milliseconds. 
     * 
     * If <i>dwMilliseconds</i> is zero and the operation is still in progress, the function  returns immediately and the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_IO_INCOMPLETE</b>.
     * 
     * If <i>dwMilliseconds</i> is nonzero and the operation is still in progress, the function waits until the object is signaled, an I/O completion routine or APC is queued, or the interval elapses before returning. Use <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information.
     * 
     * If <i>dwMilliseconds</i> is <b>INFINITE</b>, the function returns only when the object is signaled or an I/O completion routine or APC is queued.
     * @param {BOOL} bAlertable If this parameter is <b>TRUE</b> and the calling thread is in the waiting state, the function returns when the system queues an I/O completion routine or APC. The calling thread then runs the routine or function. Otherwise, the function does not return, and the completion routine or APC function is not executed.
     * 
     * 
     * 
     * A completion routine is queued when the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfileex">ReadFileEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefileex">WriteFileEx</a> function in which it was specified has completed. The function returns and the completion routine is called only if <i>bAlertable</i> is <b>TRUE</b>, and the calling thread is the thread that initiated the read or write operation. An APC is queued when you call <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-queueuserapc">QueueUserAPC</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Common error codes include the following:
     * 
     * <ul>
     * <li>If <i>dwMilliseconds</i> is zero and the operation is still in progress,  <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_IO_INCOMPLETE</b>.</li>
     * <li>If <i>dwMilliseconds</i> is nonzero, and an I/O completion routine or APC is queued, <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>WAIT_IO_COMPLETION</b>. </li>
     * <li>If <i>dwMilliseconds</i> is nonzero and the specified timeout interval elapses, <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>WAIT_TIMEOUT</b>. </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ioapiset/nf-ioapiset-getoverlappedresultex
     * @since windows8.0
     */
    static GetOverlappedResultEx(hFile, lpOverlapped, lpNumberOfBytesTransferred, dwMilliseconds, bAlertable) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        lpNumberOfBytesTransferredMarshal := lpNumberOfBytesTransferred is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetOverlappedResultEx", "ptr", hFile, "ptr", lpOverlapped, lpNumberOfBytesTransferredMarshal, lpNumberOfBytesTransferred, "uint", dwMilliseconds, "int", bAlertable, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Marks pending synchronous I/O operations that are issued by the specified thread as canceled.
     * @param {HANDLE} hThread A handle to the thread.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call the 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * If this function cannot find a request to cancel, the return value is 0 (zero), and 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
     *        <b>ERROR_NOT_FOUND</b>.
     * @see https://docs.microsoft.com/windows/win32/api//ioapiset/nf-ioapiset-cancelsynchronousio
     * @since windows6.0.6000
     */
    static CancelSynchronousIo(hThread) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CancelSynchronousIo", "ptr", hThread, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Associates the I/O completion port owned by the thread pool with the specified file handle. On completion of an I/O request involving this file, a non-I/O worker thread will execute the specified callback function.
     * @param {HANDLE} FileHandle A handle to the file opened for overlapped I/O completion. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function, with the <b>FILE_FLAG_OVERLAPPED</b> flag.
     * @param {Pointer<LPOVERLAPPED_COMPLETION_ROUTINE>} Function A pointer to the callback function to be executed in a non-I/O worker thread when the I/O operation is complete. This callback function must not call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-terminatethread">TerminateThread</a> function.
     * 
     * For more information about the completion routine, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/nc-minwinbase-lpoverlapped_completion_routine">FileIOCompletionRoutine</a>.
     * @param {Integer} Flags This parameter must be zero.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. The value returned is an <b>NTSTATUS</b> error code. To retrieve the corresponding system error code, use the <a href="/windows/desktop/api/winternl/nf-winternl-rtlntstatustodoserror">RtlNtStatusToDosError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-bindiocompletioncallback
     * @since windows5.1.2600
     */
    static BindIoCompletionCallback(FileHandle, Function, Flags) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\BindIoCompletionCallback", "ptr", FileHandle, "ptr", Function, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}

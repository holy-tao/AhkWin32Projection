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
     * @remarks
     * The I/O system can be instructed to send I/O completion notification packets to I/O completion ports, where they are queued. The 
     * <b>CreateIoCompletionPort</b> function provides this functionality.
     * 
     * An I/O completion port and its handle are associated with the process that created it and is not sharable between processes. However, a single handle is sharable between threads in the same process.
     * 
     * <b>CreateIoCompletionPort</b> can be used in three distinct modes:
     * 
     * <ul>
     * <li>Create only an I/O completion port without associating it with a file handle. </li>
     * <li>Associate an existing I/O completion port with a file handle.</li>
     * <li>Perform both creation and association in a single call.</li>
     * </ul>
     * To create an I/O completion port without associating it, set the <i>FileHandle</i> parameter to <b>INVALID_HANDLE_VALUE</b>, the <i>ExistingCompletionPort</i> parameter to <b>NULL</b>, and the <i>CompletionKey</i> parameter to zero (which is ignored in this case). Set the <i>NumberOfConcurrentThreads</i> parameter to the desired concurrency value for the new I/O completion port, or zero for the default (the number of processors in the system).
     * 
     * The handle passed in the <i>FileHandle</i> parameter can be any handle that supports overlapped I/O. Most commonly, this is a handle opened by the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function using the <b>FILE_FLAG_OVERLAPPED</b> flag (for example, files, mail slots, and pipes). Objects created by other functions such as <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-socket">socket</a> can also be associated with an I/O completion port. For an example using sockets, see <a href="https://docs.microsoft.com/windows/desktop/api/mswsock/nf-mswsock-acceptex">AcceptEx</a>. A handle can be associated with only one I/O completion port, and after the association is made, the handle remains associated with that I/O completion port until it is closed.
     * 
     * For more information on I/O completion port theory, usage, and associated functions, see <a href="https://docs.microsoft.com/windows/desktop/FileIO/i-o-completion-ports">I/O Completion Ports</a>.
     * 
     * Multiple file handles can be associated with a single I/O completion port by calling <b>CreateIoCompletionPort</b> multiple times with the same I/O completion port handle in the <i>ExistingCompletionPort</i> parameter and a different file handle in the <i>FileHandle</i> parameter each time.
     * 
     * Use the <i>CompletionKey</i> parameter to help your application track which I/O operations have completed. This value is not used by <b>CreateIoCompletionPort</b> for functional control; rather, it is attached to the file handle specified in the <i>FileHandle</i> parameter at the time of association with an I/O completion port. This completion key should be unique for each file handle, and it accompanies the file handle throughout the internal completion queuing process. It is returned in the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> function call when a completion packet arrives. The <i>CompletionKey</i> parameter is also used by the <a href="https://docs.microsoft.com/windows/desktop/FileIO/postqueuedcompletionstatus">PostQueuedCompletionStatus</a> function to queue your own special-purpose completion packets.
     * 
     * After an instance of an open handle is associated with an I/O completion port, it cannot be used in the 
     *                 <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfileex">ReadFileEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefileex">WriteFileEx</a> function because these functions have their own asynchronous I/O mechanisms. 
     * 
     * It is best not to share a file handle associated with an I/O completion port by using either handle inheritance or a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-duplicatehandle">DuplicateHandle</a> function. Operations performed with such duplicate handles generate completion notifications. Careful consideration is advised.
     * 
     * The I/O completion port handle and every file handle associated with that particular I/O completion port are known as <i>references to the I/O completion port</i>. The I/O completion port is released when there are no more references to it. Therefore, all of these handles must be properly closed to release the I/O completion port and its associated system resources. After these conditions are satisfied, close the I/O completion port handle by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
     * 
     * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
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
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-createiocompletionport
     * @since windows5.1.2600
     */
    static CreateIoCompletionPort(FileHandle, ExistingCompletionPort, CompletionKey, NumberOfConcurrentThreads) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle
        ExistingCompletionPort := ExistingCompletionPort is Win32Handle ? NumGet(ExistingCompletionPort, "ptr") : ExistingCompletionPort

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateIoCompletionPort", "ptr", FileHandle, "ptr", ExistingCompletionPort, "ptr", CompletionKey, "uint", NumberOfConcurrentThreads, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * Attempts to dequeue an I/O completion packet from the specified I/O completion port.
     * @remarks
     * This function associates a thread with the specified completion port. A thread can be associated with at most one completion port.  
     * 
     * If a call to <b>GetQueuedCompletionStatus</b> fails because the completion port handle associated with it is closed while the call is outstanding, the function returns <b>FALSE</b>, <i>*lpOverlapped</i> will be <b>NULL</b>,  and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return <b>ERROR_ABANDONED_WAIT_0</b>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>Closing the completion port handle while a call is outstanding will not result in the previously stated behavior.  The function will continue to wait until an entry is removed from the port or until a time-out occurs, if specified as a value other than <b>INFINITE</b>.
     * 
     * If the <b>GetQueuedCompletionStatus</b> function succeeds, it dequeued a completion packet for a successful I/O operation from the completion port and has stored information in the variables pointed to by the
     * following parameters: <i>lpNumberOfBytes</i>, <i>lpCompletionKey</i>, and <i>lpOverlapped</i>. Upon failure (the return value is <b>FALSE</b>), those same parameters can contain particular value combinations as follows:
     * 
     * <ul>
     * <li>If *<i>lpOverlapped</i> is <b>NULL</b>, the function did not dequeue a completion packet from the completion port. In this case, the function does not store information in
     *  the variables pointed to by the <i>lpNumberOfBytes</i> and <i>lpCompletionKey</i> parameters, and their values are indeterminate.</li>
     * <li>If *<i>lpOverlapped</i> is not <b>NULL</b> and the function dequeues a completion packet for a failed I/O operation from the completion port, the function stores
     *  information about the failed operation in the variables pointed to by <i>lpNumberOfBytes</i>, <i>lpCompletionKey</i>, and <i>lpOverlapped</i>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.</li>
     * </ul>
     * For more information on I/O completion port theory, usage, and associated functions, see <a href="https://docs.microsoft.com/windows/desktop/FileIO/i-o-completion-ports">I/O Completion Ports</a>.
     * 
     * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
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
     * @param {HANDLE} CompletionPort A handle to the completion port. To create a completion port, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/createiocompletionport">CreateIoCompletionPort</a> function.
     * @param {Pointer<Integer>} lpNumberOfBytesTransferred A pointer to a variable that receives the number of bytes transferred in a completed I/O operation.
     * @param {Pointer<Pointer>} lpCompletionKey A pointer to a variable that receives the completion key value associated with the file handle whose I/O operation has completed. A completion key is a per-file key that is specified in a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/createiocompletionport">CreateIoCompletionPort</a>.
     * @param {Pointer<Pointer<OVERLAPPED>>} lpOverlapped A pointer to a variable that receives the address of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure that was specified when the completed I/O operation was started. 
     * 
     * Even if you have passed the function a file handle associated with a completion port and a valid 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure, an application can prevent completion port notification. This is done by specifying a valid event handle for the <b>hEvent</b> member of the <b>OVERLAPPED</b> structure, and setting its low-order bit. A valid event handle whose low-order bit is set prevents the completion of the overlapped I/O from enqueing a completion packet to the completion port.
     * @param {Integer} dwMilliseconds The number of milliseconds that the caller is willing to wait for a completion packet to appear at the completion port. If a completion packet does not appear within the specified time, the function times out, returns <b>FALSE</b>, and sets *<i>lpOverlapped</i> to <b>NULL</b>.
     * 
     * If <i>dwMilliseconds</i> is <b>INFINITE</b>, the function will never time out. If <i>dwMilliseconds</i> is zero and there is no I/O operation to dequeue, the function will time out immediately.
     * 
     * <b>Windows XP, Windows Server 2003, Windows Vista, Windows 7, Windows Server 2008 and Windows Server 2008 R2:  </b>The <i>dwMilliseconds</i> value includes time spent in low-power states. For example, the timeout continues counting down while the computer is asleep.
     * 
     * <b>Windows 8, Windows Server 2012, Windows 8.1, Windows Server 2012 R2, Windows 10 and Windows Server 2016:  </b>The <i>dwMilliseconds</i> value does not include time spent in low-power states. For example, the timeout does not continue counting down while the computer is asleep.
     * @returns {BOOL} Returns nonzero (<b>TRUE</b>) if successful or zero (<b>FALSE</b>) otherwise.
     * 
     * To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * For more information, see the Remarks section.
     * @see https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus
     * @since windows5.1.2600
     */
    static GetQueuedCompletionStatus(CompletionPort, lpNumberOfBytesTransferred, lpCompletionKey, lpOverlapped, dwMilliseconds) {
        CompletionPort := CompletionPort is Win32Handle ? NumGet(CompletionPort, "ptr") : CompletionPort

        lpNumberOfBytesTransferredMarshal := lpNumberOfBytesTransferred is VarRef ? "uint*" : "ptr"
        lpCompletionKeyMarshal := lpCompletionKey is VarRef ? "ptr*" : "ptr"
        lpOverlappedMarshal := lpOverlapped is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetQueuedCompletionStatus", "ptr", CompletionPort, lpNumberOfBytesTransferredMarshal, lpNumberOfBytesTransferred, lpCompletionKeyMarshal, lpCompletionKey, lpOverlappedMarshal, lpOverlapped, "uint", dwMilliseconds, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves multiple completion port entries simultaneously.
     * @remarks
     * This function associates a thread with the specified completion port. A thread can be associated with at most 
     *      one completion port.
     * 
     * This function returns <b>TRUE</b> when at least one pending I/O is completed, but it is 
     *      possible that one or more I/O operations failed. Note that it is up to the user of this function to check the 
     *      list of returned entries in the <i>lpCompletionPortEntries</i> parameter to determine which of 
     *      them correspond to any possible failed I/O operations by looking at the status contained in the 
     *      <b>lpOverlapped</b> member in each 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped_entry">OVERLAPPED_ENTRY</a>.
     * 
     * This function returns <b>FALSE</b> when no I/O operation was dequeued. This typically means 
     *      that an error occurred while processing the parameters to this call, or that the 
     *      <i>CompletionPort</i> handle was closed or is otherwise invalid. The 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function provides extended error 
     *      information.
     * 
     * If a call to <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatusEx</a> 
     *      fails because the handle associated with it is closed, the function returns <b>FALSE</b> and 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return 
     *      <b>ERROR_ABANDONED_WAIT_0</b>.
     * 
     * Server applications may have several threads calling the 
     *      <b>GetQueuedCompletionStatusEx</b> function 
     *      for the same completion port.  As I/O operations complete, they are queued to this port in first-in-first-out 
     *      order. If a thread is actively waiting on this call, one or more queued requests complete the call for that 
     *      thread only.
     * 
     * For more information on I/O completion port theory, usage, and associated functions, see 
     *      <a href="https://docs.microsoft.com/windows/desktop/FileIO/i-o-completion-ports">I/O Completion Ports</a>.
     * 
     * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
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
     *        
     * <b>Windows XP, Windows Server 2003, Windows Vista, Windows 7, Windows Server 2008 and Windows Server 2008 R2:  </b>The <i>dwMilliseconds</i> value includes time spent in low-power states. For example, the timeout continues counting down while the computer is asleep.
     * 
     * <b>Windows 8, Windows Server 2012, Windows 8.1, Windows Server 2012 R2, Windows 10 and Windows Server 2016:  </b>The <i>dwMilliseconds</i> value does not include time spent in low-power states. For example, the timeout does not continue counting down while the computer is asleep.
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
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getqueuedcompletionstatusex
     * @since windows6.0.6000
     */
    static GetQueuedCompletionStatusEx(CompletionPort, lpCompletionPortEntries, ulCount, ulNumEntriesRemoved, dwMilliseconds, fAlertable) {
        CompletionPort := CompletionPort is Win32Handle ? NumGet(CompletionPort, "ptr") : CompletionPort

        ulNumEntriesRemovedMarshal := ulNumEntriesRemoved is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetQueuedCompletionStatusEx", "ptr", CompletionPort, "ptr", lpCompletionPortEntries, "uint", ulCount, ulNumEntriesRemovedMarshal, ulNumEntriesRemoved, "uint", dwMilliseconds, "int", fAlertable, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Posts an I/O completion packet to an I/O completion port.
     * @remarks
     * The I/O completion packet will satisfy an outstanding call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> function. This function returns with the three values passed as the second, third, and fourth parameters of the call to 
     * <b>PostQueuedCompletionStatus</b>. The system does not use or validate these values. In particular, the <i>lpOverlapped</i> parameter need not point to an <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure.
     * 
     * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
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
     * CsvFs will do redirected IO for compressed files.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> .
     * @see https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-postqueuedcompletionstatus
     * @since windows5.1.2600
     */
    static PostQueuedCompletionStatus(CompletionPort, dwNumberOfBytesTransferred, dwCompletionKey, lpOverlapped) {
        CompletionPort := CompletionPort is Win32Handle ? NumGet(CompletionPort, "ptr") : CompletionPort

        A_LastError := 0

        result := DllCall("KERNEL32.dll\PostQueuedCompletionStatus", "ptr", CompletionPort, "uint", dwNumberOfBytesTransferred, "ptr", dwCompletionKey, "ptr", lpOverlapped, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sends a control code directly to a specified device driver, causing the corresponding device to perform the corresponding operation.
     * @remarks
     * To retrieve a handle to the device, you must call the 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function with either the name of a device or 
     *      the name of the driver associated with a device. To specify a device name, use the following format:
     * 
     * \\\\.&#92;<i>DeviceName</i>
     * 
     * <b>DeviceIoControl</b> can accept a handle to a specific 
     *      device. For example, to open a handle to the logical drive A: with 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a>, specify \\\\.\a:. Alternatively, you can use the 
     *      names \\\\.\PhysicalDrive0, \\\\.\PhysicalDrive1, and so on, to open handles to the physical drives on a system.
     * 
     * You should specify the <b>FILE_SHARE_READ</b> and 
     *     <b>FILE_SHARE_WRITE</b> access flags when calling 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> to open a handle to a device driver. However, 
     *     when you open a communications resource, such as a serial port, you must specify exclusive access. Use the other 
     *     <b>CreateFile</b> parameters as follows when opening a device 
     *     handle:
     * 
     * <ul>
     * <li>The <i>fdwCreate</i> parameter must specify 
     *       <b>OPEN_EXISTING</b>.</li>
     * <li>The <i>hTemplateFile</i> parameter must be <b>NULL</b>.</li>
     * <li>The <i>fdwAttrsAndFlags</i> parameter can specify 
     *       <b>FILE_FLAG_OVERLAPPED</b> to indicate that the returned handle can be used in overlapped 
     *       (asynchronous) I/O operations.</li>
     * </ul>
     * For lists of supported control codes, see the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows-hardware/drivers/storage/cd-rom-io-control-codes">CD-ROM Control Codes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/DevIO/communications-control-codes">Communications Control Codes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/DevIO/device-management-control-codes">Device Management Control Codes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/directory-management-control-codes">Directory Management Control Codes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/disk-management-control-codes">Disk Management Control Codes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-management-control-codes">File Management Control Codes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Power/power-management-control-codes">Power Management Control Codes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/volume-management-control-codes">Volume Management Control Codes</a>
     * </li>
     * </ul>
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
     * @returns {BOOL} If the operation completes successfully, the return value is nonzero (TRUE).
     * 
     * If the operation fails or is pending, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-deviceiocontrol
     * @since windows5.1.2600
     */
    static DeviceIoControl(hDevice, dwIoControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned, lpOverlapped) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        lpBytesReturnedMarshal := lpBytesReturned is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\DeviceIoControl", "ptr", hDevice, "uint", dwIoControlCode, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, lpBytesReturnedMarshal, lpBytesReturned, "ptr", lpOverlapped, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the results of an overlapped operation on the specified file, named pipe, or communications device.
     * @remarks
     * The results reported by the 
     * <b>GetOverlappedResult</b> function are those of the specified handle's last overlapped operation to which the specified 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure was provided, and for which the operation's results were pending. A pending operation is indicated when the function that started the operation returns <b>FALSE</b>, and the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_IO_PENDING</b>. When an I/O operation is pending, the function that started the operation resets the <b>hEvent</b> member of the 
     * <b>OVERLAPPED</b> structure to the nonsignaled state. Then when the pending operation has been completed, the system sets the event object to the signaled state.
     * 
     * If the <i>bWait</i> parameter is <b>TRUE</b>, 
     * <b>GetOverlappedResult</b> determines whether the pending operation has been completed by waiting for the event object to be in the signaled state.
     * 
     * If the <b>hEvent</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure is <b>NULL</b>, the system uses the state of the <i>hFile</i> handle to signal when the operation has been completed. Use of file, named pipe, or communications-device handles for this purpose is discouraged. It is safer to use an event object because of the confusion that can occur when multiple simultaneous overlapped operations are performed on the same file, named pipe, or communications device. In this situation, there is no way to know which operation caused the object's state to be signaled.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getoverlappedresult
     * @since windows5.1.2600
     */
    static GetOverlappedResult(hFile, lpOverlapped, lpNumberOfBytesTransferred, bWait) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        lpNumberOfBytesTransferredMarshal := lpNumberOfBytesTransferred is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetOverlappedResult", "ptr", hFile, "ptr", lpOverlapped, lpNumberOfBytesTransferredMarshal, lpNumberOfBytesTransferred, "int", bWait, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Marks any outstanding I/O operations for the specified file handle. The function only cancels I/O operations in the current process, regardless of which thread created the I/O operation.
     * @remarks
     * The <b>CancelIoEx</b> function allows you to cancel 
     *     requests in threads other than the calling thread. The 
     *     <a href="https://docs.microsoft.com/windows/desktop/FileIO/cancelio">CancelIo</a> function only cancels requests in the same thread that 
     *     called the <b>CancelIo</b> function. 
     *     <b>CancelIoEx</b> cancels only outstanding I/O on the handle, 
     *     it does not change the state of the handle; this means that you cannot rely on the state of the handle because you 
     *     cannot know whether the operation was completed successfully or canceled.
     * 
     * If there are any pending I/O operations in progress for the specified file handle, the 
     *     <b>CancelIoEx</b> function marks them for cancellation. Most 
     *     types of operations can be canceled immediately; other operations can continue toward completion before they are 
     *     actually canceled and the caller is notified. The 
     *     <b>CancelIoEx</b> function does not wait for all canceled 
     *     operations to complete.
     * 
     * If the file handle is associated with a completion port, an I/O completion packet is not queued to the port if 
     *     a synchronous operation is successfully canceled. For asynchronous operations still pending, the cancel operation 
     *     will queue an I/O completion packet.
     * 
     * The operation being canceled is completed with one of three statuses; you must check the completion status to 
     *     determine the completion state. The three statuses are:
     * 
     * <ul>
     * <li>The operation completed normally. This can occur even if the operation was canceled, because the cancel 
     *       request might not have been submitted in time to cancel the operation.</li>
     * <li>The operation was canceled. The <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> 
     *       function returns <b>ERROR_OPERATION_ABORTED</b>.</li>
     * <li>The operation failed with another error. The 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns the relevant error 
     *       code.</li>
     * </ul>
     * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
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
     *        free or reuse the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure associated with 
     *        the canceled I/O operations until they have completed. The thread can use the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> function to determine when 
     *        the I/O operations themselves have been completed.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * If this function cannot find a request to cancel, the return value is 0 (zero), and 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
     *        <b>ERROR_NOT_FOUND</b>.
     * @see https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-cancelioex
     * @since windows6.0.6000
     */
    static CancelIoEx(hFile, lpOverlapped) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CancelIoEx", "ptr", hFile, "ptr", lpOverlapped, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Cancels all pending input and output (I/O) operations that are issued by the calling thread for the specified file.
     * @remarks
     * If there are any pending I/O operations in progress for the specified file handle, and they are issued by the calling thread, the <b>CancelIo</b> function cancels them. <b>CancelIo</b> cancels only outstanding I/O on the handle, it does not change the state of the handle; this means that you cannot rely on the state of the handle because you cannot know whether the operation was completed successfully or canceled.
     * 
     * The I/O operations must be issued as overlapped I/O. If they are not, the I/O operations do not  return to allow the thread to call the 
     * <b>CancelIo</b> function. Calling the 
     * <b>CancelIo</b> function with a file handle that is not opened with <b>FILE_FLAG_OVERLAPPED</b> does nothing.
     * 
     * All I/O operations that are canceled complete with the error <b>ERROR_OPERATION_ABORTED</b>, and all completion notifications for the I/O operations occur normally.
     * 
     * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
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
     * @param {HANDLE} hFile A handle to the file. 
     * 
     * The function cancels all pending I/O operations for this file handle.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. The cancel operation for all pending I/O operations issued by the calling thread for the specified file handle was successfully requested. The thread can use the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> function to determine when the I/O operations themselves have been completed.
     * 
     * If the function fails, the return value is zero (0). To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-cancelio
     * @since windows5.1.2600
     */
    static CancelIo(hFile) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CancelIo", "ptr", hFile, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the results of an overlapped operation on the specified file, named pipe, or communications device within the specified time-out interval. The calling thread can perform an alertable wait.
     * @remarks
     * The <b>GetOverlappedResultEx</b> function differs from <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> in the following ways: The <i>dwMilliseconds</i> parameter can specify a timeout interval for the operation, and the <i>bAlertable</i> parameter can specify that the calling thread should perform an alertable wait. 
     * 
     * The results reported by the 
     * <b>GetOverlappedResultEx</b> function are those of the specified handle's last overlapped operation to which the specified 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure was provided, and for which the operation's results were pending. A pending operation is indicated when the function that started the operation returns FALSE, and the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_IO_PENDING</b>. When an I/O operation is pending, the function that started the operation resets the <b>hEvent</b> member of the 
     * <b>OVERLAPPED</b> structure to the nonsignaled state. Then when the pending operation has been completed, the system sets the event object to the signaled state.
     * 
     * Specify a manual-reset event object in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. If an auto-reset event object is used, the event handle must not be specified in any other wait operation in the interval between starting the overlapped operation and the call to 
     * <b>GetOverlappedResultEx</b>. For example, the event object is sometimes specified in one of the wait functions to wait for the operation's completion. When the wait function returns, the system sets an auto-reset event's state to nonsignaled, and a subsequent call to 
     * <b>GetOverlappedResultEx</b> with the <i>dwMilliseconds</i> parameter set to <b>INFINITE</b> causes the function to be blocked indefinitely.
     * 
     * If the <b>hEvent</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure is <b>NULL</b>, the system uses the state of the <i>hFile</i> handle to signal when the operation has been completed. Use of file, named pipe, or communications-device handles for this purpose is discouraged. It is safer to use an event object because of the confusion that can occur when multiple simultaneous overlapped operations are performed on the same file, named pipe, or communications device. In this situation, there is no way to know which operation caused the object's state to be signaled.
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
     * 
     * <b>Windows XP, Windows Server 2003, Windows Vista, Windows 7, Windows Server 2008 and Windows Server 2008 R2:  </b>The <i>dwMilliseconds</i> value includes time spent in low-power states. For example, the timeout continues counting down while the computer is asleep.
     * 
     * <b>Windows 8, Windows Server 2012, Windows 8.1, Windows Server 2012 R2, Windows 10 and Windows Server 2016:  </b>The <i>dwMilliseconds</i> value does not include time spent in low-power states. For example, the timeout does not continue counting down while the computer is asleep.
     * @param {BOOL} bAlertable If this parameter is <b>TRUE</b> and the calling thread is in the waiting state, the function returns when the system queues an I/O completion routine or APC. The calling thread then runs the routine or function. Otherwise, the function does not return, and the completion routine or APC function is not executed.
     * 
     * 
     * 
     * A completion routine is queued when the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfileex">ReadFileEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefileex">WriteFileEx</a> function in which it was specified has completed. The function returns and the completion routine is called only if <i>bAlertable</i> is <b>TRUE</b>, and the calling thread is the thread that initiated the read or write operation. An APC is queued when you call <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-queueuserapc">QueueUserAPC</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Common error codes include the following:
     * 
     * <ul>
     * <li>If <i>dwMilliseconds</i> is zero and the operation is still in progress,  <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_IO_INCOMPLETE</b>.</li>
     * <li>If <i>dwMilliseconds</i> is nonzero, and an I/O completion routine or APC is queued, <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>WAIT_IO_COMPLETION</b>. </li>
     * <li>If <i>dwMilliseconds</i> is nonzero and the specified timeout interval elapses, <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>WAIT_TIMEOUT</b>. </li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getoverlappedresultex
     * @since windows8.0
     */
    static GetOverlappedResultEx(hFile, lpOverlapped, lpNumberOfBytesTransferred, dwMilliseconds, bAlertable) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        lpNumberOfBytesTransferredMarshal := lpNumberOfBytesTransferred is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetOverlappedResultEx", "ptr", hFile, "ptr", lpOverlapped, lpNumberOfBytesTransferredMarshal, lpNumberOfBytesTransferred, "uint", dwMilliseconds, "int", bAlertable, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Marks pending synchronous I/O operations that are issued by the specified thread as canceled.
     * @remarks
     * The caller must have the 
     *     <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">THREAD_TERMINATE</a> access right.
     * 
     * If there are any pending I/O operations in progress for the specified thread, the 
     *     <b>CancelSynchronousIo</b> function marks them for 
     *     cancellation. Most types of operations can be canceled immediately; other operations can continue toward 
     *     completion before they are actually canceled and the caller is notified. The 
     *     <b>CancelSynchronousIo</b> function does not wait for 
     *     all canceled operations to complete. For more information, see 
     *     <a href="https://www.microsoft.com/whdc/driver/kernel/iocancel.mspx">I/O Completion/Cancellation Guidelines</a>.
     * 
     * The operation being canceled is completed with one of three statuses; you must check the completion status to 
     *     determine the completion state. The three statuses are:
     * 
     * <ul>
     * <li><b>The operation completed normally.</b> This can occur even if the operation was 
     *       canceled, because the cancel request might not have been submitted in time to cancel the operation.</li>
     * <li><b>The operation was canceled.</b> The 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns 
     *       <b>ERROR_OPERATION_ABORTED</b>.</li>
     * <li><b>The operation failed with another error.</b> The 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns the relevant error 
     *       code.</li>
     * </ul>
     * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
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
     * @param {HANDLE} hThread A handle to the thread.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * If this function cannot find a request to cancel, the return value is 0 (zero), and 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
     *        <b>ERROR_NOT_FOUND</b>.
     * @see https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-cancelsynchronousio
     * @since windows6.0.6000
     */
    static CancelSynchronousIo(hThread) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CancelSynchronousIo", "ptr", hThread, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Associates the I/O completion port owned by the thread pool with the specified file handle. On completion of an I/O request involving this file, a non-I/O worker thread will execute the specified callback function.
     * @remarks
     * The callback function might not be executed if the process issues an asynchronous request on the file specified by the <i>FileHandle</i> parameter but the request returns immediately with an error code other than ERROR_IO_PENDING.
     * 
     * Be sure that the thread that initiates the asynchronous I/O request does not terminate before the request is completed. Also, if a function in a DLL is queued to a worker thread, be sure that the function in the DLL has completed execution before the DLL is unloaded.
     * 
     * The thread pool maintains an I/O completion port. When you call <b>BindIoCompletionCallback</b>, it associates the specified file with the thread pool's I/O completion port. Asynchronous requests on that file object will complete by posting to the completion port, where they will be picked up by thread pool worker threads. For callbacks that must issue an I/O request that completes as an asynchronous procedure call, the thread pool provides an I/O worker pool. The I/O worker threads do not wait on the completion port; they sleep in an alertable wait state so that I/O request packets that complete can wake them up. Both types of worker threads check whether there is I/O pending on them and if there is, they do not exit. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/asynchronous-procedure-calls">Asynchronous Procedure Calls</a>.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0500 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
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
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-bindiocompletioncallback
     * @since windows5.1.2600
     */
    static BindIoCompletionCallback(FileHandle, Function, Flags) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\BindIoCompletionCallback", "ptr", FileHandle, "ptr", Function, "uint", Flags, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

;@endregion Methods
}

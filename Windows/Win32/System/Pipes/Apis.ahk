#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Pipes
 * @version v4.0.30319
 */
class Pipes {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_UNLIMITED_INSTANCES => 255

    /**
     * @type {Integer (UInt32)}
     */
    static NMPWAIT_WAIT_FOREVER => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static NMPWAIT_NOWAIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NMPWAIT_USE_DEFAULT_WAIT => 0
;@endregion Constants

;@region Methods
    /**
     * Creates an anonymous pipe, and returns handles to the read and write ends of the pipe.
     * @remarks
     * <b>CreatePipe</b> creates the pipe, assigning the specified pipe size to the storage buffer. 
     * <b>CreatePipe</b> also creates handles that the process uses to read from and write to the buffer in subsequent calls to the <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-readfile">ReadFile</a> and <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-writefile">WriteFile</a> functions.
     * 
     * To read from the pipe, a process uses the read handle in a call to the <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-readfile">ReadFile</a> function. <b>ReadFile</b> returns when one of the following is true: a write operation completes on the write end of the pipe, the number of bytes requested has been read, or an error occurs.
     * 
     * When a process uses <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-writefile">WriteFile</a> to write to an anonymous pipe, the write operation is not completed until all bytes are written. If the pipe buffer is full before all bytes are written, <b>WriteFile</b> does not return until another process or thread uses <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-readfile">ReadFile</a> to make more buffer space available.
     * 
     * Anonymous pipes are implemented using a named pipe with a unique name. Therefore, you can often pass a handle to an anonymous pipe to a function that requires a handle to a named pipe.
     * 
     * If <b>CreatePipe</b> fails, the contents of the output parameters are indeterminate. No assumptions should be made about their contents in this event.
     * 
     * To free resources used by a pipe, the application should always close handles when they are no longer needed, which is accomplished either by calling the <a href="https://docs.microsoft.com/windows/win32/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function or when the process associated with the instance handles ends. Note that an instance of a pipe may have more than one handle associated with it. An instance of a pipe is always deleted when the last handle to the instance of the named pipe is closed.
     * @param {Pointer<HANDLE>} hReadPipe A pointer to a variable that receives the read handle for the pipe.
     * @param {Pointer<HANDLE>} hWritePipe A pointer to a variable that receives the write handle for the pipe.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpPipeAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that determines whether the returned handle can be inherited by child processes. If <i>lpPipeAttributes</i> is <b>NULL</b>, the handle cannot be inherited. 
     * 
     * 
     * 
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new pipe. If <i>lpPipeAttributes</i> is <b>NULL</b>, the pipe gets a default security descriptor. The ACLs in the default security descriptor for a pipe come from the primary or impersonation token of the creator.
     * @param {Integer} nSize The size of the buffer for the pipe, in bytes. The size is only a suggestion; the system uses the value to calculate an appropriate buffering mechanism. If this parameter is zero, the system uses the default buffer size.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-createpipe
     * @since windows5.0
     */
    static CreatePipe(hReadPipe, hWritePipe, lpPipeAttributes, nSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreatePipe", "ptr", hReadPipe, "ptr", hWritePipe, "ptr", lpPipeAttributes, "uint", nSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enables a named pipe server process to wait for a client process to connect to an instance of a named pipe.
     * @remarks
     * A named pipe server process can use 
     * <b>ConnectNamedPipe</b> with a newly created pipe instance. It can also be used with an instance that was previously connected to another client process; in this case, the server process must first call the 
     * <a href="https://docs.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-disconnectnamedpipe">DisconnectNamedPipe</a> function to disconnect the handle from the previous client before the handle can be reconnected to a new client. Otherwise, 
     * <b>ConnectNamedPipe</b> returns zero, and <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_NO_DATA if the previous client has closed its handle or ERROR_PIPE_CONNECTED if it has not closed its handle.
     * 
     * The behavior of 
     * <b>ConnectNamedPipe</b> depends on two conditions: whether the pipe handle's wait mode is set to blocking or nonblocking and whether the function is set to execute synchronously or in overlapped mode. A server initially specifies a pipe handle's wait mode in the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> function, and it can be changed by using the 
     * <a href="https://docs.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-setnamedpipehandlestate">SetNamedPipeHandleState</a> function.
     * 
     * The server process can use any of the 
     * <a href="https://docs.microsoft.com/windows/win32/Sync/wait-functions">wait functions</a> or 
     * <a href="https://docs.microsoft.com/windows/win32/api/synchapi/nf-synchapi-sleepex">SleepEx</a>— to determine when the state of the event object is signaled, and it can then use the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-hasoverlappediocompleted">HasOverlappedIoCompleted</a> 
     * macro to determine when the 
     * <b>ConnectNamedPipe</b> operation completes.
     * 
     * If the specified pipe handle is in nonblocking mode, 
     * <b>ConnectNamedPipe</b> always returns immediately. In nonblocking mode, 
     * <b>ConnectNamedPipe</b> returns a nonzero value the first time it is called for a pipe instance that is disconnected from a previous client. This indicates that the pipe is now available to be connected to a new client process. In all other situations when the pipe handle is in nonblocking mode, 
     * <b>ConnectNamedPipe</b> returns zero. In these situations, <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_PIPE_LISTENING if no client is connected, ERROR_PIPE_CONNECTED if a client is connected, and ERROR_NO_DATA if a previous client has closed its pipe handle but the server has not disconnected. Note that a good connection between client and server exists only after the ERROR_PIPE_CONNECTED error is received.
     * 
     * <div class="alert"><b>Note</b>  Nonblocking mode is supported for compatibility with Microsoft LAN Manager version 2.0, and it should not be used to achieve asynchronous input and output (I/O) with named pipes.</div>
     * <div> </div>
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {Pointer<HANDLE>} hNamedPipe A handle to the server end of a named pipe instance. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> function.
     * @param {Pointer<OVERLAPPED>} lpOverlapped A pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. 
     * 
     * 
     * 
     * 
     * If <i>hNamedPipe</i> was opened with FILE_FLAG_OVERLAPPED, the <i>lpOverlapped</i> parameter must not be <b>NULL</b>. It must point to a valid <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. If <i>hNamedPipe</i> was opened with FILE_FLAG_OVERLAPPED and <i>lpOverlapped</i> is <b>NULL</b>, the function can incorrectly report that the connect operation is complete.
     * 
     * If <i>hNamedPipe</i> was created with FILE_FLAG_OVERLAPPED and <i>lpOverlapped</i> is not <b>NULL</b>, the <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure should  contain a handle to a manual-reset event object (which the server can create by using the 
     * <a href="https://docs.microsoft.com/windows/win32/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function).
     * 
     * If <i>hNamedPipe</i> was not opened with FILE_FLAG_OVERLAPPED, the function does not return until a client is connected or an error occurs. Successful synchronous operations result in the function returning a nonzero value if a client connects after the function is called.
     * @returns {Integer} If the operation is synchronous, <b>ConnectNamedPipe</b> does not return until the operation has completed. If the function succeeds, the return value is nonzero. If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the operation is asynchronous, <b>ConnectNamedPipe</b> returns immediately. If the operation is still pending, the return value is zero and <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_IO_PENDING. (You can use the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-hasoverlappediocompleted">HasOverlappedIoCompleted</a> macro to determine when the operation has finished.) If the function fails, the return value is zero and 
     * <b>GetLastError</b> returns a value other than ERROR_IO_PENDING or ERROR_PIPE_CONNECTED.
     * 
     * If a client connects before the function is called, the function returns zero and <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_PIPE_CONNECTED. This can happen if a client connects in the interval between the call to 
     * <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> and the call to 
     * <b>ConnectNamedPipe</b>. In this situation, there is a good connection between client and server, even though the function returns zero.
     * @see https://learn.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-connectnamedpipe
     * @since windows5.0
     */
    static ConnectNamedPipe(hNamedPipe, lpOverlapped) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ConnectNamedPipe", "ptr", hNamedPipe, "ptr", lpOverlapped, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Disconnects the server end of a named pipe instance from a client process.
     * @remarks
     * If the client end of the named pipe is open, the 
     * <b>DisconnectNamedPipe</b> function forces that end of the named pipe closed. The client receives an error the next time it attempts to access the pipe. A client that is forced off a pipe by 
     * <b>DisconnectNamedPipe</b> must still use the <a href="https://docs.microsoft.com/windows/win32/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function to close its end of the pipe.
     * 
     * The pipe exists as long as a server or client process has an open handle to the pipe.
     * 
     * When the server process disconnects a pipe instance, any unread data in the pipe is discarded. Before disconnecting, the server can make sure data is not lost by calling the <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-flushfilebuffers">FlushFileBuffers</a> function, which does not return until the client process has read all the data.
     * 
     * The server process must call 
     * <b>DisconnectNamedPipe</b> to disconnect a pipe handle from its previous client before the handle can be connected to another client by using the 
     * <a href="https://docs.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-connectnamedpipe">ConnectNamedPipe</a> function.
     * 
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {Pointer<HANDLE>} hNamedPipe A handle to an instance of a named pipe. This handle must be created by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> function.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-disconnectnamedpipe
     * @since windows5.0
     */
    static DisconnectNamedPipe(hNamedPipe) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\DisconnectNamedPipe", "ptr", hNamedPipe, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the read mode and the blocking mode of the specified named pipe. If the specified handle is to the client end of a named pipe and if the named pipe server process is on a remote computer, the function can also be used to control local buffering.
     * @remarks
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {Pointer<HANDLE>} hNamedPipe A handle to the named pipe instance. This parameter can be a handle to the server end of the pipe, as returned by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> function, or to the client end of the pipe, as returned by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-createfilew">CreateFile</a> function. The handle must have GENERIC_WRITE access to the named pipe for a write-only or read/write pipe, or it must have GENERIC_READ and FILE_WRITE_ATTRIBUTES access for a read-only pipe. 
     * 
     * 
     * 
     * 
     * This parameter can also be a handle to an anonymous pipe, as returned by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-createpipe">CreatePipe</a> function.
     * @param {Pointer<UInt32>} lpMode The new pipe mode. The mode is a combination of a read-mode flag and a wait-mode flag. This parameter can be <b>NULL</b> if the mode is not being set. Specify one of the following modes. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Mode</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_READMODE_BYTE"></a><a id="pipe_readmode_byte"></a><dl>
     * <dt><b>PIPE_READMODE_BYTE</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data is read from the pipe as a stream of bytes. This mode is the default if no read-mode flag is specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_READMODE_MESSAGE"></a><a id="pipe_readmode_message"></a><dl>
     * <dt><b>PIPE_READMODE_MESSAGE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data is read from the pipe as a stream of messages. The function fails if this flag is specified for a byte-type pipe.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * One of the following wait modes can be specified.
     * 
     * <table>
     * <tr>
     * <th>Mode</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_WAIT"></a><a id="pipe_wait"></a><dl>
     * <dt><b>PIPE_WAIT</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blocking mode is enabled. This mode is the default if no wait-mode flag is specified. When a blocking mode pipe handle is specified in the 
     * <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-readfile">ReadFile</a>, 
     * <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-writefile">WriteFile</a>, or 
     * <a href="https://docs.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-connectnamedpipe">ConnectNamedPipe</a> function, operations are not finished until there is data to read, all data is written, or a client is connected. Use of this mode can mean waiting indefinitely in some situations for a client process to perform an action.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_NOWAIT"></a><a id="pipe_nowait"></a><dl>
     * <dt><b>PIPE_NOWAIT</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Nonblocking mode is enabled. In this mode, <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-readfile">ReadFile</a>, <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-writefile">WriteFile</a>, and 
     * <a href="https://docs.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-connectnamedpipe">ConnectNamedPipe</a> always return immediately. Note that nonblocking mode is supported for compatibility with Microsoft LAN Manager version 2.0 and should not be used to achieve asynchronous input and output (I/O) with named pipes.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<UInt32>} lpMaxCollectionCount The maximum number of bytes collected on the client computer before transmission to the server. This parameter must be <b>NULL</b> if the specified pipe handle is to the server end of a named pipe or if client and server processes are on the same machine. This parameter is ignored if the client process specifies the FILE_FLAG_WRITE_THROUGH flag in the <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-createfilew">CreateFile</a> function when the handle was created. This parameter can be <b>NULL</b> if the collection count is not being set.
     * @param {Pointer<UInt32>} lpCollectDataTimeout The maximum time, in milliseconds, that can pass before a remote named pipe transfers information over the network. This parameter must be <b>NULL</b> if the specified pipe handle is to the server end of a named pipe or if client and server processes are on the same computer. This parameter is ignored if the client process specified the FILE_FLAG_WRITE_THROUGH flag in the 
     * <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-createfilew">CreateFile</a> function when the handle was created. This parameter can be <b>NULL</b> if the collection count is not being set.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-setnamedpipehandlestate
     * @since windows5.0
     */
    static SetNamedPipeHandleState(hNamedPipe, lpMode, lpMaxCollectionCount, lpCollectDataTimeout) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetNamedPipeHandleState", "ptr", hNamedPipe, "ptr", lpMode, "ptr", lpMaxCollectionCount, "ptr", lpCollectDataTimeout, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Copies data from a named or anonymous pipe into a buffer without removing it from the pipe.
     * @remarks
     * The 
     * <b>PeekNamedPipe</b> function is similar to the 
     * <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-readfile">ReadFile</a> function with the following exceptions:
     * 
     * <ul>
     * <li>The data is read in the mode specified with 
     * <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a>. For example, create a pipe with PIPE_TYPE_MESSAGE | PIPE_READMODE_MESSAGE. If you change the mode to PIPE_READMODE_BYTE with 
     * <a href="https://docs.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-setnamedpipehandlestate">SetNamedPipeHandleState</a>, <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-readfile">ReadFile</a> will read in byte mode, but 
     * <b>PeekNamedPipe</b> will continue to read in message mode.</li>
     * <li>The data read from the pipe is not removed from the pipe's buffer.</li>
     * <li>The function can return additional information about the contents of the pipe.</li>
     * <li>The function always returns immediately in a single-threaded application, even if there is no data in the pipe. The wait mode of a named pipe handle (blocking or nonblocking) has no effect on the function.</li>
     * </ul>
     * <div class="alert"><b>Note</b>  The <b>PeekNamedPipe</b> function can block thread execution the same way any I/O function can when called on a synchronous handle in a multi-threaded application. To avoid this condition, use a pipe handle created for <a href="https://docs.microsoft.com/windows/win32/FileIO/synchronous-and-asynchronous-i-o">asynchronous I/O</a>.</div>
     * <div> </div>
     * If the specified handle is a named pipe handle in byte-read mode, the function reads all available bytes up to the size specified in <i>nBufferSize</i>. For a named pipe handle in message-read mode, the function reads the next message in the pipe. If the message is larger than <i>nBufferSize</i>, the function returns <b>TRUE</b> after reading the specified number of bytes. In this situation, <i>lpBytesLeftThisMessage</i> will receive the number of bytes remaining in the message.
     * 
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {Pointer<HANDLE>} hNamedPipe A handle to the pipe. This parameter can be a handle to a named pipe instance, as returned by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> or 
     * <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-createfilew">CreateFile</a> function, or it can be a handle to the read end of an anonymous pipe, as returned by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-createpipe">CreatePipe</a> function. The handle must have GENERIC_READ access to the pipe.
     * @param {Pointer<Void>} lpBuffer A pointer to a buffer that receives data read from the pipe. This parameter can be <b>NULL</b> if no data is to be read.
     * @param {Integer} nBufferSize The size of the buffer specified by the <i>lpBuffer</i> parameter, in bytes. This parameter is ignored if <i>lpBuffer</i> is <b>NULL</b>.
     * @param {Pointer<UInt32>} lpBytesRead A pointer to a variable that receives the number of bytes read from the pipe. This parameter can be <b>NULL</b> if no data is to be read.
     * @param {Pointer<UInt32>} lpTotalBytesAvail A pointer to a variable that receives the total number of bytes available to be read from the pipe. This parameter can be <b>NULL</b> if no data is to be read.
     * @param {Pointer<UInt32>} lpBytesLeftThisMessage A pointer to a variable that receives the number of bytes remaining in this message. This parameter will be zero for byte-type named pipes or for anonymous pipes. This parameter can be <b>NULL</b> if no data is to be read.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-peeknamedpipe
     * @since windows5.0
     */
    static PeekNamedPipe(hNamedPipe, lpBuffer, nBufferSize, lpBytesRead, lpTotalBytesAvail, lpBytesLeftThisMessage) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\PeekNamedPipe", "ptr", hNamedPipe, "ptr", lpBuffer, "uint", nBufferSize, "ptr", lpBytesRead, "ptr", lpTotalBytesAvail, "ptr", lpBytesLeftThisMessage, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Combines the functions that write a message to and read a message from the specified named pipe into a single operation.
     * @remarks
     * <b>TransactNamedPipe</b> fails if the server did not create the pipe as a message-type pipe or if the pipe handle is not in message-read mode. For example, if a client is running on the same machine as the server and uses the \\.\pipe&#92;<i>pipename</i> format to open the pipe, the pipe is opened in byte mode by the named pipe file system (NPFS). If the client uses the form &#92;&#92;<i>server</i>\pipe&#92;<i>pipename</i>, the redirector opens the pipe in message mode. A byte mode pipe handle can be changed to message-read mode with the 
     * <a href="https://docs.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-setnamedpipehandlestate">SetNamedPipeHandleState</a> function.
     * 
     * The function cannot be completed successfully until data is written into the buffer specified by the <i>lpOutBuffer</i> parameter. The <i>lpOverlapped</i> parameter is available to enable the calling thread to perform other tasks while the operation is executing in the background.
     * 
     * The maximum guaranteed size of a named pipe transaction is 64 kilobytes. In some limited cases, transactions beyond 64 kilobytes are possible, depending on OS versions participating in the transaction and dynamic network conditions. However, there is no guarantee that transactions above 64 kilobytes will succeed. Therefore it's recommended that named pipe transactions be limited to 64 kilobytes of data.
     * 
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {Pointer<HANDLE>} hNamedPipe A handle to the named pipe returned by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> or 
     * <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-createfilew">CreateFile</a> function. 
     * 
     * 
     * 
     * 
     * This parameter can also be a handle to an anonymous pipe, as returned by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-createpipe">CreatePipe</a> function.
     * @param {Pointer<Void>} lpInBuffer A pointer to the buffer containing the data to be written to the pipe.
     * @param {Integer} nInBufferSize The size of the input buffer, in bytes.
     * @param {Pointer<Void>} lpOutBuffer A pointer to the buffer that receives the data read from the pipe.
     * @param {Integer} nOutBufferSize The size of the output buffer, in bytes.
     * @param {Pointer<UInt32>} lpBytesRead A pointer to the variable that receives the number of bytes read from the pipe. 
     * 
     * 
     * 
     * 
     * If <i>lpOverlapped</i> is <b>NULL</b>, <i>lpBytesRead</i> cannot be <b>NULL</b>.
     * 
     * If <i>lpOverlapped</i> is not <b>NULL</b>, <i>lpBytesRead</i> can be <b>NULL</b>. If this is an overlapped read operation, you can get the number of bytes read by calling 
     * <a href="https://docs.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a>. If <i>hNamedPipe</i> is associated with an I/O completion port, you can get the number of bytes read by calling 
     * <a href="https://docs.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a>.
     * @param {Pointer<OVERLAPPED>} lpOverlapped A pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. This structure is required if <i>hNamedPipe</i> was opened with FILE_FLAG_OVERLAPPED. 
     * 
     * 
     * 
     * 
     * If <i>hNamedPipe</i> was opened with FILE_FLAG_OVERLAPPED, the <i>lpOverlapped</i> parameter must not be <b>NULL</b>. It must point to a valid <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. If <i>hNamedPipe</i> was created with FILE_FLAG_OVERLAPPED and <i>lpOverlapped</i> is <b>NULL</b>, the function can incorrectly report that the operation is complete.
     * 
     * If <i>hNamedPipe</i> was opened with FILE_FLAG_OVERLAPPED and <i>lpOverlapped</i> is not <b>NULL</b>, 
     * <b>TransactNamedPipe</b> is executed as an overlapped operation. The <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure should contain a manual-reset event object (which can be created by using the 
     * <a href="https://docs.microsoft.com/windows/win32/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function). If the operation cannot be completed immediately, 
     * <b>TransactNamedPipe</b> returns <b>FALSE</b> and <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_IO_PENDING. In this situation, the event object is set to the nonsignaled state before 
     * <b>TransactNamedPipe</b> returns, and it is set to the signaled state when the transaction has finished. Also, you can  be notified when an overlapped operation completes by using the <a href="https://docs.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> or <a href="https://docs.microsoft.com/windows/win32/FileIO/getqueuedcompletionstatusex-func">GetQueuedCompletionStatusEx</a> functions.  In this case, you do not need to assign the manual-reset event in the <b>OVERLAPPED</b> structure, and the completion happens against <i>hNamedPipe</i> in the same way as an asynchronous read or write operation. For more information about overlapped operations, see 
     * <a href="https://docs.microsoft.com/windows/win32/ipc/pipes">Pipes</a>.
     * 
     * If <i>hNamedPipe</i> was not opened with FILE_FLAG_OVERLAPPED, 
     * <b>TransactNamedPipe</b> does not return until the operation is complete.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the message to be read is longer than the buffer specified by the <i>nOutBufferSize</i> parameter, 
     * <b>TransactNamedPipe</b> returns <b>FALSE</b> and the <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns ERROR_MORE_DATA. The remainder of the message can be read by a subsequent call to <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-readfile">ReadFile</a>, <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-readfileex">ReadFileEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-peeknamedpipe">PeekNamedPipe</a>.
     * @see https://learn.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-transactnamedpipe
     * @since windows5.0
     */
    static TransactNamedPipe(hNamedPipe, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesRead, lpOverlapped) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\TransactNamedPipe", "ptr", hNamedPipe, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, "ptr", lpBytesRead, "ptr", lpOverlapped, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The CreateNamedPipeW (Unicode) function (winbase.h) creates an instance of a named pipe and returns a handle for subsequent pipe operations.
     * @remarks
     * To create an instance of a named pipe by using <b>CreateNamedPipe</b>, the user must have <b>FILE_CREATE_PIPE_INSTANCE</b> access to the named pipe object. If a new named pipe is being created, the access control list (ACL) from the security attributes parameter defines the discretionary access control for the named pipe.
     * 
     * All instances of a named pipe must specify the same pipe type (byte-type or message-type), pipe access (duplex, inbound, or outbound), instance count, and time-out value. If different values are used, this function fails and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_ACCESS_DENIED</b>.
     * 
     *  A client process connects to a named pipe by using the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> or <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-callnamedpipew">CallNamedPipe</a> function. The client side of a named pipe starts out in byte mode, even if the server side is in message mode. To avoid problems receiving data, set the client side to message mode as well. To change the mode of the pipe, the pipe client must open a read-only pipe with <b>GENERIC_READ</b> and  <b>FILE_WRITE_ATTRIBUTES</b> access.
     * 
     * The pipe server should not perform a blocking read operation until the pipe client has started. Otherwise, a race condition can occur. This typically occurs when initialization code, such as the C run-time, needs to lock and examine inherited handles.
     * 
     * Every time a named pipe is created, the system creates the inbound and/or outbound buffers using nonpaged pool, which is the physical memory used by the kernel. The number of pipe instances (as well as objects such as threads and processes) that you can create is limited by the available nonpaged pool. Each read or write request requires space in the buffer for the read or write data, plus additional space for the internal data structures.
     * 
     * The input and output buffer sizes are advisory. The actual buffer size reserved for each end of the named pipe is either the system default, the system minimum or maximum, or the specified size rounded up to the next allocation boundary. The buffer size specified should be small enough that your process will not run out of nonpaged pool, but large enough to accommodate typical requests.
     * 
     * Whenever a pipe write operation occurs, the system first tries to charge the memory against the pipe write quota. If the remaining pipe write quota is enough to fulfill the request, the write operation completes immediately. If the remaining pipe write quota is too small to fulfill the request, the system will try to expand the buffers to accommodate the data using nonpaged pool reserved for the process. The write operation will block until the data is read from the pipe so that the additional buffer quota can be released. Therefore, if your specified buffer size is too small, the system will grow the buffer as needed, but the downside is that the operation will block. If the operation is overlapped, a system thread is blocked; otherwise, the application thread is blocked.
     * 
     * To free resources used by a named pipe, the application should always close handles when they are no longer needed, which is accomplished either by calling the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function or when the process associated with the instance handles ends. Note that an instance of a named pipe may have more than one handle associated with it. An instance of a named pipe is always deleted when the last handle to the instance of the named pipe is closed.
     * 
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {Pointer<PWSTR>} lpName The unique pipe name. This string must have the following form:
     * 
     * \\\\.\\pipe&#92;<i>pipename</i>
     * 
     * The pipename part of the name can include any character other than a backslash, including numbers and special characters. The entire pipe name string can be up to 256 characters long. Pipe names are not case sensitive.
     * @param {Integer} dwOpenMode The open mode.  
     * 
     * The function fails if <i>dwOpenMode</i> specifies anything other than 0 or the flags listed in the following tables.
     * 
     * This parameter must specify one of the following pipe access modes. The same mode must be specified for each instance of the pipe.
     * 
     * <table>
     * <tr>
     * <th>Mode</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_ACCESS_DUPLEX"></a><a id="pipe_access_duplex"></a><dl>
     * <dt><b>PIPE_ACCESS_DUPLEX</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pipe is bi-directional; both server and client processes can read from and write to the pipe. This mode gives the server the equivalent of <b>GENERIC_READ</b> and <b>GENERIC_WRITE</b> access to the pipe. The client can specify <b>GENERIC_READ</b> or <b>GENERIC_WRITE</b>, or both, when it connects to the pipe using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_ACCESS_INBOUND"></a><a id="pipe_access_inbound"></a><dl>
     * <dt><b>PIPE_ACCESS_INBOUND</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flow of data in the pipe goes from client to server only. This mode gives the server the equivalent of <b>GENERIC_READ</b> access to the pipe. The client must specify <b>GENERIC_WRITE</b> access when connecting to the pipe. If the client must read pipe settings by calling the <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-getnamedpipeinfo">GetNamedPipeInfo</a> or <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-getnamedpipehandlestatew">GetNamedPipeHandleState</a> functions, the client must specify <b>GENERIC_WRITE</b> and <b>FILE_READ_ATTRIBUTES</b> access when connecting to the pipe.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_ACCESS_OUTBOUND"></a><a id="pipe_access_outbound"></a><dl>
     * <dt><b>PIPE_ACCESS_OUTBOUND</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flow of data in the pipe goes from server to client only. This mode gives the server the equivalent of <b>GENERIC_WRITE</b> access to the pipe. The client must specify <b>GENERIC_READ</b> access when connecting to the pipe. If the client must change pipe settings by calling the <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-setnamedpipehandlestate">SetNamedPipeHandleState</a> function, the client must specify <b>GENERIC_READ</b> and <b>FILE_WRITE_ATTRIBUTES</b> access when connecting to the pipe.
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * This parameter can also include one or more of the following flags, which enable the write-through and overlapped modes. These modes can be different for different instances of the same pipe.
     * 
     * <table>
     * <tr>
     * <th>Mode</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_FLAG_FIRST_PIPE_INSTANCE"></a><a id="file_flag_first_pipe_instance"></a><dl>
     * <dt><b>FILE_FLAG_FIRST_PIPE_INSTANCE</b></dt>
     * <dt>0x00080000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If you attempt to create multiple instances of a pipe with this flag, creation of the first instance succeeds, but creation of the next instance fails with <b>ERROR_ACCESS_DENIED</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_FLAG_WRITE_THROUGH"></a><a id="file_flag_write_through"></a><dl>
     * <dt><b>FILE_FLAG_WRITE_THROUGH</b></dt>
     * <dt>0x80000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Write-through mode is enabled. This mode affects only write operations on byte-type pipes and, then, only when the client and server processes are on different computers. If this mode is enabled, functions writing to a named pipe do not return until the data written is transmitted across the network and is in the pipe's buffer on the remote computer. If this mode is not enabled, the system enhances the efficiency of network operations by buffering data until a minimum number of bytes accumulate or until a maximum time elapses.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_FLAG_OVERLAPPED"></a><a id="file_flag_overlapped"></a><dl>
     * <dt><b>FILE_FLAG_OVERLAPPED</b></dt>
     * <dt>0x40000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Overlapped mode is enabled. If this mode is enabled, functions performing read, write, and connect operations that may take a significant time to be completed can return immediately. This mode enables the thread that started the operation to perform other operations while the time-consuming operation executes in the background. For example, in overlapped mode, a thread can handle simultaneous input and output (I/O) operations on multiple instances of a pipe or perform simultaneous read and write operations on the same pipe handle. If overlapped mode is not enabled, functions performing read, write, and connect operations on the pipe handle do not return until the operation is finished. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfileex">ReadFileEx</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefileex">WriteFileEx</a> functions can only be used with a pipe handle in overlapped mode. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefile">WriteFile</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-connectnamedpipe">ConnectNamedPipe</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-transactnamedpipe">TransactNamedPipe</a> functions can execute either synchronously or as overlapped operations.
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * This parameter can include any combination of the following security access modes. These modes can be different for different instances of the same pipe.
     * 
     * <table>
     * <tr>
     * <th>Mode</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WRITE_DAC"></a><a id="write_dac"></a><dl>
     * <dt><b>WRITE_DAC</b></dt>
     * <dt>0x00040000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller will have write access to the named pipe's discretionary access control list (ACL).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WRITE_OWNER"></a><a id="write_owner"></a><dl>
     * <dt><b>WRITE_OWNER</b></dt>
     * <dt>0x00080000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller will have write access to the named pipe's owner.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACCESS_SYSTEM_SECURITY"></a><a id="access_system_security"></a><dl>
     * <dt><b>ACCESS_SYSTEM_SECURITY</b></dt>
     * <dt>0x01000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller will have write access to the named pipe's SACL. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-lists">Access-Control Lists (ACLs)</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/sacl-access-right">SACL Access Right</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwPipeMode The pipe mode.
     * 
     * The function fails if <i>dwPipeMode</i> specifies anything other than 0 or the flags listed in the following tables.
     * 
     * One of the following type modes can be specified. The same type mode must be specified for each instance of the pipe.
     * 
     * <table>
     * <tr>
     * <th>Mode</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_TYPE_BYTE"></a><a id="pipe_type_byte"></a><dl>
     * <dt><b>PIPE_TYPE_BYTE</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data is written to the pipe as a stream of bytes. This mode cannot be used with PIPE_READMODE_MESSAGE. The pipe does not distinguish bytes written during different write operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_TYPE_MESSAGE"></a><a id="pipe_type_message"></a><dl>
     * <dt><b>PIPE_TYPE_MESSAGE</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data is written to the pipe as a stream of messages. The pipe treats the bytes written during each write operation as a message unit. The <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_MORE_DATA</b> when a message is not read completely. This mode can be used with either <b>PIPE_READMODE_MESSAGE</b> or <b>PIPE_READMODE_BYTE</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * One of the following read modes can be specified. Different instances of the same pipe can specify different read modes.
     * 
     * <table>
     * <tr>
     * <th>Mode</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_READMODE_BYTE"></a><a id="pipe_readmode_byte"></a><dl>
     * <dt><b>PIPE_READMODE_BYTE</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data is read from the pipe as a stream of bytes. This mode can be used with either <b>PIPE_TYPE_MESSAGE</b> or <b>PIPE_TYPE_BYTE</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_READMODE_MESSAGE"></a><a id="pipe_readmode_message"></a><dl>
     * <dt><b>PIPE_READMODE_MESSAGE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data is read from the pipe as a stream of messages. This mode can be only used if <b>PIPE_TYPE_MESSAGE</b> is also specified.
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * One of the following wait modes can be specified. Different instances of the same pipe can specify different wait modes.
     * 
     * <table>
     * <tr>
     * <th>Mode</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_WAIT"></a><a id="pipe_wait"></a><dl>
     * <dt><b>PIPE_WAIT</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blocking mode is enabled. When the pipe handle is specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefile">WriteFile</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-connectnamedpipe">ConnectNamedPipe</a> function, the operations are not completed until there is data to read, all data is written, or a client is connected. Use of this mode can mean waiting indefinitely in some situations for a client process to perform an action.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_NOWAIT"></a><a id="pipe_nowait"></a><dl>
     * <dt><b>PIPE_NOWAIT</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Nonblocking mode is enabled. In this mode, <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a>, <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefile">WriteFile</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-connectnamedpipe">ConnectNamedPipe</a> always return immediately.
     * 
     * Note that nonblocking mode is supported for compatibility with Microsoft LAN Manager version 2.0 and should not be used to achieve asynchronous I/O with named pipes. For more information on asynchronous pipe I/O, see <a href="https://docs.microsoft.com/windows/desktop/ipc/synchronous-and-overlapped-input-and-output">Synchronous and Overlapped Input and Output</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * One of the following remote-client modes can be specified. Different instances of the same pipe can specify different remote-client modes.
     * 
     * <table>
     * <tr>
     * <th>Mode</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_ACCEPT_REMOTE_CLIENTS"></a><a id="pipe_accept_remote_clients"></a><dl>
     * <dt><b>PIPE_ACCEPT_REMOTE_CLIENTS</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Connections from remote clients can be accepted and checked against the security descriptor for the pipe.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_REJECT_REMOTE_CLIENTS"></a><a id="pipe_reject_remote_clients"></a><dl>
     * <dt><b>PIPE_REJECT_REMOTE_CLIENTS</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Connections from remote clients are automatically rejected.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} nMaxInstances The maximum number of instances that can be created for this pipe. The first instance of the pipe can specify this value; the same number must be specified for other instances of the pipe. Acceptable values are in the range 1 through <b>PIPE_UNLIMITED_INSTANCES</b> (255).
     * 
     * If this parameter is <b>PIPE_UNLIMITED_INSTANCES</b>, the number of pipe instances that can be created is limited only by the availability of system resources. If <i>nMaxInstances</i> is greater than <b>PIPE_UNLIMITED_INSTANCES</b>, the return value is <b>INVALID_HANDLE_VALUE</b> and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INVALID_PARAMETER</b>.
     * @param {Integer} nOutBufferSize The number of bytes to reserve for the output buffer. For a discussion on sizing named pipe buffers, see the following Remarks section.
     * @param {Integer} nInBufferSize The number of bytes to reserve for the input buffer. For a discussion on sizing named pipe buffers, see the following Remarks section.
     * @param {Integer} nDefaultTimeOut The default time-out value, in milliseconds, if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-waitnamedpipew">WaitNamedPipe</a> function specifies <b>NMPWAIT_USE_DEFAULT_WAIT</b>. Each instance of a named pipe must specify the same value.
     * 
     * A value of zero will result in a default time-out of 50 milliseconds.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies a security descriptor for the new named pipe and determines whether child processes can inherit the returned handle. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the named pipe gets a default security descriptor and the handle cannot be inherited. The ACLs in the default security descriptor for a named pipe grant full control to the LocalSystem account, administrators, and the creator owner. They also grant read access to members of the Everyone group and the anonymous account.
     * @returns {Pointer<HANDLE>} If the function succeeds, the return value is a handle to the server end of a named pipe instance.
     * 
     * If the function fails, the return value is <b>INVALID_HANDLE_VALUE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-createnamedpipew
     */
    static CreateNamedPipeW(lpName, dwOpenMode, dwPipeMode, nMaxInstances, nOutBufferSize, nInBufferSize, nDefaultTimeOut, lpSecurityAttributes) {
        lpName := lpName is String? StrPtr(lpName) : lpName

        result := DllCall("KERNEL32.dll\CreateNamedPipeW", "ptr", lpName, "uint", dwOpenMode, "uint", dwPipeMode, "uint", nMaxInstances, "uint", nOutBufferSize, "uint", nInBufferSize, "uint", nDefaultTimeOut, "ptr", lpSecurityAttributes, "ptr")
        return result
    }

    /**
     * The WaitNamedPipeW (Unicode) function (winbase.h) waits until either a time-out interval elapses or an instance of the specified named pipe is available for connection.
     * @remarks
     * If no instances of the specified named pipe exist, the 
     * <b>WaitNamedPipe</b> function returns immediately, regardless of the time-out value.
     * 
     * If the time-out interval expires, the <b>WaitNamedPipe</b> function will fail with the error <b>ERROR_SEM_TIMEOUT</b>.
     * 
     * If the function succeeds, the process should use the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function to open a handle to the named pipe. A return value of <b>TRUE</b> indicates that there is at least one instance of the pipe available. A subsequent <b>CreateFile</b> call to the pipe can fail, because the instance was closed by the server or opened by another client.
     * 
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {Pointer<PWSTR>} lpNamedPipeName The name of the named pipe. The string must include the name of the computer on which the server process is executing. A period may be used for the <i>servername</i> if the pipe is local. The following pipe name format is used: 
     * 
     * &#92;&#92;<i>servername</i>\pipe&#92;<i>pipename</i>
     * @param {Integer} nTimeOut 
     * @returns {Integer} If an instance of the pipe is available before the time-out interval elapses, the return value is nonzero.
     * 
     * If an instance of the pipe is not available before the time-out interval elapses, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-waitnamedpipew
     */
    static WaitNamedPipeW(lpNamedPipeName, nTimeOut) {
        lpNamedPipeName := lpNamedPipeName is String? StrPtr(lpNamedPipeName) : lpNamedPipeName

        result := DllCall("KERNEL32.dll\WaitNamedPipeW", "ptr", lpNamedPipeName, "uint", nTimeOut, "int")
        return result
    }

    /**
     * The GetNamedPipeClientComputerNameW (Unicode) function (winbase.h) retrieves the client computer name for the specified named pipe.
     * @remarks
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {Pointer<HANDLE>} Pipe A handle to an instance of a named pipe. This handle must be created by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-createnamedpipew">CreateNamedPipe</a> function.
     * @param {Pointer<PWSTR>} ClientComputerName The computer name.
     * @param {Integer} ClientComputerNameLength The size of the <i>ClientComputerName</i> buffer, in bytes.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-getnamedpipeclientcomputernamew
     */
    static GetNamedPipeClientComputerNameW(Pipe, ClientComputerName, ClientComputerNameLength) {
        ClientComputerName := ClientComputerName is String? StrPtr(ClientComputerName) : ClientComputerName

        result := DllCall("KERNEL32.dll\GetNamedPipeClientComputerNameW", "ptr", Pipe, "ptr", ClientComputerName, "uint", ClientComputerNameLength, "int")
        return result
    }

    /**
     * Impersonates a named-pipe client application.
     * @remarks
     * The <b>ImpersonateNamedPipeClient</b> function allows the server end of a named pipe to impersonate the client end. When this function is called, the named-pipe file system changes the thread of the calling <a href="https://docs.microsoft.com/windows/win32/SecGloss/p-gly">process</a> to start impersonating the <a href="https://docs.microsoft.com/windows/win32/SecGloss/s-gly">security context</a> of the last message read from the pipe. Only the server end of the pipe can call this function.
     * 
     * The server can call the 
     * <a href="https://docs.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-reverttoself">RevertToSelf</a> function when the impersonation is complete.
     * 
     * <div class="alert"><b>Important</b>  If the <b>ImpersonateNamedPipeClient</b> function fails, the client is not impersonated, and all subsequent client requests are made in the security context of the process that called the function. If the calling process is running as a privileged account, it can perform actions that the client would not be allowed to perform. To avoid security risks, the calling process should always check the return value. If the return value indicates that the function call failed, no client requests should be executed.</div>
     * <div> </div>
     * All impersonate functions, including <b>ImpersonateNamedPipeClient</b> allow the requested impersonation if one of the following is true: 
     * 
     * 
     * 
     * <ul>
     * <li>The requested impersonation level of the token is less than <b>SecurityImpersonation</b>, such as <b>SecurityIdentification</b> or <b>SecurityAnonymous</b>.</li>
     * <li>The caller has the <b>SeImpersonatePrivilege</b> privilege.</li>
     * <li>A process (or another process in the caller's logon session) created the token using explicit credentials through <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-logonusera">LogonUser</a> or <a href="https://docs.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a> function.</li>
     * <li>The authenticated identity is same as the caller.</li>
     * </ul>
     * <b>Windows XP with SP1 and earlier:  </b>The <b>SeImpersonatePrivilege</b> privilege is not supported.
     * @param {Pointer<HANDLE>} hNamedPipe A handle to a named pipe.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-impersonatenamedpipeclient
     * @since windows5.1.2600
     */
    static ImpersonateNamedPipeClient(hNamedPipe) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ImpersonateNamedPipeClient", "ptr", hNamedPipe, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the specified named pipe.
     * @remarks
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax "\\\\.\\pipe\\LOCAL\\" for the pipe name.
     * @param {Pointer<HANDLE>} hNamedPipe A handle to the named pipe instance. The handle must have GENERIC_READ access to the named pipe for a read-only or read/write pipe, or it must have GENERIC_WRITE and FILE_READ_ATTRIBUTES access for a write-only pipe. 
     * 
     * 
     * 
     * 
     * This parameter can also be a handle to an anonymous pipe, as returned by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-createpipe">CreatePipe</a> function.
     * @param {Pointer<UInt32>} lpFlags 
     * @param {Pointer<UInt32>} lpOutBufferSize A pointer to a variable that receives the size of the buffer for outgoing data, in bytes. If the buffer size is zero, the buffer is allocated as needed. This parameter can be <b>NULL</b> if this information is not required.
     * @param {Pointer<UInt32>} lpInBufferSize A pointer to a variable that receives the size of the buffer for incoming data, in bytes. If the buffer size is zero, the buffer is allocated as needed. This parameter can be <b>NULL</b> if this information is not required.
     * @param {Pointer<UInt32>} lpMaxInstances A pointer to a variable that receives the maximum number of pipe instances that can be created. If the variable is set to PIPE_UNLIMITED_INSTANCES (255), the number of pipe instances that can be created is limited only by the availability of system resources. This parameter can be <b>NULL</b> if this information is not required.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-getnamedpipeinfo
     * @since windows5.0
     */
    static GetNamedPipeInfo(hNamedPipe, lpFlags, lpOutBufferSize, lpInBufferSize, lpMaxInstances) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNamedPipeInfo", "ptr", hNamedPipe, "ptr", lpFlags, "ptr", lpOutBufferSize, "ptr", lpInBufferSize, "ptr", lpMaxInstances, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The GetNamedPipeHandleStateW (Unicode) function (winbase.h) retrieves information about a specified named pipe.
     * @remarks
     * The <b>GetNamedPipeHandleState</b> function returns successfully even if all of the pointers passed to it are <b>NULL</b>.
     * 
     * To set the pipe handle state, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-setnamedpipehandlestate">SetNamedPipeHandleState</a> function.
     * 
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {Pointer<HANDLE>} hNamedPipe A handle to the named pipe for which information is wanted. The handle must have GENERIC_READ access for a read-only or read/write pipe, or it must have GENERIC_WRITE and FILE_READ_ATTRIBUTES access for a write-only pipe.  
     * 
     * This parameter can also be a handle to an anonymous pipe, as returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-createpipe">CreatePipe</a> function.
     * @param {Pointer<UInt32>} lpState 
     * @param {Pointer<UInt32>} lpCurInstances A pointer to a variable that receives the number of current pipe instances. This parameter can be <b>NULL</b> if this information is not required.
     * @param {Pointer<UInt32>} lpMaxCollectionCount A pointer to a variable that receives the maximum number of bytes to be collected on the client's computer before transmission to the server. This parameter must be <b>NULL</b> if the specified pipe handle is to the server end of a named pipe or if client and server processes are on the same computer. This parameter can be <b>NULL</b> if this information is not required.
     * @param {Pointer<UInt32>} lpCollectDataTimeout A pointer to a variable that receives the maximum time, in milliseconds, that can pass before a remote named pipe transfers information over the network. This parameter must be <b>NULL</b> if the specified pipe handle is to the server end of a named pipe or if client and server processes are on the same computer. This parameter can be <b>NULL</b> if this information is not required.
     * @param {Pointer<PWSTR>} lpUserName A pointer to a buffer that receives the user name string associated with the client application. The server can only retrieve this information if the client opened the pipe with SECURITY_IMPERSONATION access.
     * 
     * This parameter must be <b>NULL</b> if the specified pipe handle is to the client end of a named pipe. This parameter can be <b>NULL</b> if this information is not required.
     * @param {Integer} nMaxUserNameSize The size of the buffer specified by the <i>lpUserName</i> parameter, in <b>TCHARs</b>. This parameter is ignored if <i>lpUserName</i> is <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-getnamedpipehandlestatew
     */
    static GetNamedPipeHandleStateW(hNamedPipe, lpState, lpCurInstances, lpMaxCollectionCount, lpCollectDataTimeout, lpUserName, nMaxUserNameSize) {
        lpUserName := lpUserName is String? StrPtr(lpUserName) : lpUserName

        result := DllCall("KERNEL32.dll\GetNamedPipeHandleStateW", "ptr", hNamedPipe, "ptr", lpState, "ptr", lpCurInstances, "ptr", lpMaxCollectionCount, "ptr", lpCollectDataTimeout, "ptr", lpUserName, "uint", nMaxUserNameSize, "int")
        return result
    }

    /**
     * Connects to a message-type pipe (and waits if an instance of the pipe is not available), writes to and reads from the pipe, and then closes the pipe. (CallNamedPipeW)
     * @remarks
     * Calling <b>CallNamedPipe</b> is equivalent to calling the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilew">CreateFile</a> (or <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-waitnamedpipew">WaitNamedPipe</a>, if <b>CreateFile</b> cannot open the pipe immediately), <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-transactnamedpipe">TransactNamedPipe</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> functions. <b>CreateFile</b> is called with an access flag of GENERIC_READ | GENERIC_WRITE, and an inherit handle flag of <b>FALSE</b>.
     * 
     * <b>CallNamedPipe</b> fails if the pipe is a byte-type pipe.
     * 
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {Pointer<PWSTR>} lpNamedPipeName The pipe name.
     * @param {Pointer<Void>} lpInBuffer The data to be written to the pipe.
     * @param {Integer} nInBufferSize The size of the write buffer, in bytes.
     * @param {Pointer<Void>} lpOutBuffer A pointer to the buffer that receives the data read from the pipe.
     * @param {Integer} nOutBufferSize The size of the read buffer, in bytes.
     * @param {Pointer<UInt32>} lpBytesRead A pointer to a variable that receives the number of bytes read from the pipe.
     * @param {Integer} nTimeOut The number of milliseconds to wait for the named pipe to be available. In addition to numeric values, the following special values can be specified.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NMPWAIT_NOWAIT"></a><a id="nmpwait_nowait"></a><dl>
     * <dt><b>NMPWAIT_NOWAIT</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Does not wait for the named pipe. If the named pipe is not available, the function returns an error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NMPWAIT_WAIT_FOREVER"></a><a id="nmpwait_wait_forever"></a><dl>
     * <dt><b>NMPWAIT_WAIT_FOREVER</b></dt>
     * <dt>0xffffffff</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Waits indefinitely.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NMPWAIT_USE_DEFAULT_WAIT"></a><a id="nmpwait_use_default_wait"></a><dl>
     * <dt><b>NMPWAIT_USE_DEFAULT_WAIT</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the default time-out specified in a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the message written to the pipe by the server process is longer than <i>nOutBufferSize</i>, <b>CallNamedPipe</b> returns <b>FALSE</b>, and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_MORE_DATA. The remainder of the message is discarded, because <b>CallNamedPipe</b> closes the handle to the pipe before returning.
     * @see https://learn.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-callnamedpipew
     */
    static CallNamedPipeW(lpNamedPipeName, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesRead, nTimeOut) {
        lpNamedPipeName := lpNamedPipeName is String? StrPtr(lpNamedPipeName) : lpNamedPipeName

        result := DllCall("KERNEL32.dll\CallNamedPipeW", "ptr", lpNamedPipeName, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, "ptr", lpBytesRead, "uint", nTimeOut, "int")
        return result
    }

    /**
     * The CreateNamedPipeA (ANSI) function (winbase.h) creates an instance of a named pipe and returns a handle for subsequent pipe operations.
     * @remarks
     * To create an instance of a named pipe by using 
     * <b>CreateNamedPipe</b>, the user must have <b>FILE_CREATE_PIPE_INSTANCE</b> access to the named pipe object. If a new named pipe is being created, the access control list (ACL) from the security attributes parameter defines the discretionary access control for the named pipe.
     * 
     * All instances of a named pipe must specify the same pipe type (byte-type or message-type), pipe access (duplex, inbound, or outbound), instance count, and time-out value. If different values are used, this function fails and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_ACCESS_DENIED</b>.
     * 
     *  A client process connects to a named pipe by using the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-callnamedpipea">CallNamedPipe</a> function. The client side of a named pipe starts out in byte mode, even if the server side is in message mode. To avoid problems receiving data, set the client side to message mode as well. To change the mode of the pipe, the pipe client must open a read-only pipe with <b>GENERIC_READ</b> and  <b>FILE_WRITE_ATTRIBUTES</b> access.
     * 
     * The pipe server should not perform a blocking read operation until the pipe client has started. Otherwise, a race condition can occur. This typically occurs when initialization code, such as the C run-time, needs to lock and examine inherited handles.
     * 
     * Every time a named pipe is created, the system creates the inbound and/or outbound buffers using nonpaged pool, which is the physical memory used by the kernel. The number of pipe instances (as well as objects such as threads and processes) that you can create is limited by the available nonpaged pool. Each read or write request requires space in the buffer for the read or write data, plus additional space for the internal data structures.
     * 
     * The input and output buffer sizes are advisory. The actual buffer size reserved for each end of the named pipe is either the system default, the system minimum or maximum, or the specified size rounded up to the next allocation boundary. The buffer size specified should be small enough that your process will not run out of nonpaged pool, but large enough to accommodate typical requests.
     * 
     * Whenever a pipe write operation occurs, the system first tries to charge the memory against the pipe write quota. If the remaining pipe write quota is enough to fulfill the request, the write operation completes immediately. If the remaining pipe write quota is too small to fulfill the request, the system will try to expand the buffers to accommodate the data using nonpaged pool reserved for the process. The write operation will block until the data is read from the pipe so that the additional buffer quota can be released. Therefore, if your specified buffer size is too small, the system will grow the buffer as needed, but the downside is that the operation will block. If the operation is overlapped, a system thread is blocked; otherwise, the application thread is blocked.
     * 
     * To free resources used by a named pipe, the application should always close handles when they are no longer needed, which is accomplished either by calling the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function or when the process associated with the instance handles ends. Note that an instance of a named pipe may have more than one handle associated with it. An instance of a named pipe is always deleted when the last handle to the instance of the named pipe is closed.
     * 
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {Pointer<PSTR>} lpName The unique pipe name. This string must have the following form:
     * 
     * \\\\.\\pipe&#92;<i>pipename</i>
     * 
     * The pipename part of the name can include any character other than a backslash, including numbers and special characters. The entire pipe name string can be up to 256 characters long. Pipe names are not case sensitive.
     * @param {Integer} dwOpenMode The open mode. 
     * 
     * 
     * The function fails if <i>dwOpenMode</i> specifies anything other than 0 or the flags listed in the following tables.
     * 
     * This parameter must specify one of the following pipe access modes. The same mode must be specified for each instance of the pipe.
     * 
     * <table>
     * <tr>
     * <th>Mode</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_ACCESS_DUPLEX"></a><a id="pipe_access_duplex"></a><dl>
     * <dt><b>PIPE_ACCESS_DUPLEX</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pipe is bi-directional; both server and client processes can read from and write to the pipe. This mode gives the server the equivalent of <b>GENERIC_READ</b> and <b>GENERIC_WRITE</b> access to the pipe. The client can specify <b>GENERIC_READ</b> or <b>GENERIC_WRITE</b>, or both, when it connects to the pipe using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_ACCESS_INBOUND"></a><a id="pipe_access_inbound"></a><dl>
     * <dt><b>PIPE_ACCESS_INBOUND</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flow of data in the pipe goes from client to server only. This mode gives the server the equivalent of <b>GENERIC_READ</b> access to the pipe. The client must specify <b>GENERIC_WRITE</b> access when connecting to the pipe. If the client must read pipe settings by calling the <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-getnamedpipeinfo">GetNamedPipeInfo</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getnamedpipehandlestatea">GetNamedPipeHandleState</a> functions, the client must specify <b>GENERIC_WRITE</b> and <b>FILE_READ_ATTRIBUTES</b> access when connecting to the pipe.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_ACCESS_OUTBOUND"></a><a id="pipe_access_outbound"></a><dl>
     * <dt><b>PIPE_ACCESS_OUTBOUND</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flow of data in the pipe goes from server to client only. This mode gives the server the equivalent of <b>GENERIC_WRITE</b> access to the pipe. The client must specify <b>GENERIC_READ</b> access when connecting to the pipe. If the client must change pipe settings by calling the <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-setnamedpipehandlestate">SetNamedPipeHandleState</a> function, the client must specify <b>GENERIC_READ</b> and <b>FILE_WRITE_ATTRIBUTES</b> access when connecting to the pipe.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This parameter can also include one or more of the following flags, which enable the write-through and overlapped modes. These modes can be different for different instances of the same pipe.
     * 
     * <table>
     * <tr>
     * <th>Mode</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_FLAG_FIRST_PIPE_INSTANCE"></a><a id="file_flag_first_pipe_instance"></a><dl>
     * <dt><b>FILE_FLAG_FIRST_PIPE_INSTANCE</b></dt>
     * <dt>0x00080000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If you attempt to create multiple instances of a pipe with this flag, creation of the first instance succeeds, but creation of the next instance fails with <b>ERROR_ACCESS_DENIED</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_FLAG_WRITE_THROUGH"></a><a id="file_flag_write_through"></a><dl>
     * <dt><b>FILE_FLAG_WRITE_THROUGH</b></dt>
     * <dt>0x80000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Write-through mode is enabled. This mode affects only write operations on byte-type pipes and, then, only when the client and server processes are on different computers. If this mode is enabled, functions writing to a named pipe do not return until the data written is transmitted across the network and is in the pipe's buffer on the remote computer. If this mode is not enabled, the system enhances the efficiency of network operations by buffering data until a minimum number of bytes accumulate or until a maximum time elapses.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_FLAG_OVERLAPPED"></a><a id="file_flag_overlapped"></a><dl>
     * <dt><b>FILE_FLAG_OVERLAPPED</b></dt>
     * <dt>0x40000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Overlapped mode is enabled. If this mode is enabled, functions performing read, write, and connect operations that may take a significant time to be completed can return immediately. This mode enables the thread that started the operation to perform other operations while the time-consuming operation executes in the background. For example, in overlapped mode, a thread can handle simultaneous input and output (I/O) operations on multiple instances of a pipe or perform simultaneous read and write operations on the same pipe handle. If overlapped mode is not enabled, functions performing read, write, and connect operations on the pipe handle do not return until the operation is finished. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfileex">ReadFileEx</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefileex">WriteFileEx</a> functions can only be used with a pipe handle in overlapped mode. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefile">WriteFile</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-connectnamedpipe">ConnectNamedPipe</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-transactnamedpipe">TransactNamedPipe</a> functions can execute either synchronously or as overlapped operations.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This parameter can include any combination of the following security access modes. These modes can be different for different instances of the same pipe.
     * 
     * <table>
     * <tr>
     * <th>Mode</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WRITE_DAC"></a><a id="write_dac"></a><dl>
     * <dt><b>WRITE_DAC</b></dt>
     * <dt>0x00040000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller will have write access to the named pipe's discretionary access control list (ACL).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WRITE_OWNER"></a><a id="write_owner"></a><dl>
     * <dt><b>WRITE_OWNER</b></dt>
     * <dt>0x00080000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller will have write access to the named pipe's owner.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACCESS_SYSTEM_SECURITY"></a><a id="access_system_security"></a><dl>
     * <dt><b>ACCESS_SYSTEM_SECURITY</b></dt>
     * <dt>0x01000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller will have write access to the named pipe's SACL. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-lists">Access-Control Lists (ACLs)</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/sacl-access-right">SACL Access Right</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwPipeMode The pipe mode. 
     * 
     * 
     * The function fails if <i>dwPipeMode</i> specifies anything other than 0 or the flags listed in the following tables.
     * 
     * One of the following type modes can be specified. The same type mode must be specified for each instance of the pipe.
     * 
     * <table>
     * <tr>
     * <th>Mode</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_TYPE_BYTE"></a><a id="pipe_type_byte"></a><dl>
     * <dt><b>PIPE_TYPE_BYTE</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data is written to the pipe as a stream of bytes. This mode cannot be used with PIPE_READMODE_MESSAGE. The pipe does not distinguish bytes written during different write operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_TYPE_MESSAGE"></a><a id="pipe_type_message"></a><dl>
     * <dt><b>PIPE_TYPE_MESSAGE</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data is written to the pipe as a stream of messages. The pipe treats the bytes written during each write operation as a message unit. The <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_MORE_DATA</b> when a message is not read completely. This mode can be used with either <b>PIPE_READMODE_MESSAGE</b> or <b>PIPE_READMODE_BYTE</b>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * One of the following read modes can be specified. Different instances of the same pipe can specify different read modes.
     * 
     * <table>
     * <tr>
     * <th>Mode</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_READMODE_BYTE"></a><a id="pipe_readmode_byte"></a><dl>
     * <dt><b>PIPE_READMODE_BYTE</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data is read from the pipe as a stream of bytes. This mode can be used with either <b>PIPE_TYPE_MESSAGE</b> or <b>PIPE_TYPE_BYTE</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_READMODE_MESSAGE"></a><a id="pipe_readmode_message"></a><dl>
     * <dt><b>PIPE_READMODE_MESSAGE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data is read from the pipe as a stream of messages. This mode can be only used if <b>PIPE_TYPE_MESSAGE</b> is also specified.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * One of the following wait modes can be specified. Different instances of the same pipe can specify different wait modes.
     * 
     * <table>
     * <tr>
     * <th>Mode</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_WAIT"></a><a id="pipe_wait"></a><dl>
     * <dt><b>PIPE_WAIT</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blocking mode is enabled. When the pipe handle is specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefile">WriteFile</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-connectnamedpipe">ConnectNamedPipe</a> function, the operations are not completed until there is data to read, all data is written, or a client is connected. Use of this mode can mean waiting indefinitely in some situations for a client process to perform an action.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_NOWAIT"></a><a id="pipe_nowait"></a><dl>
     * <dt><b>PIPE_NOWAIT</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Nonblocking mode is enabled. In this mode, <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a>, <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefile">WriteFile</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-connectnamedpipe">ConnectNamedPipe</a> always return immediately.
     * 
     * Note that nonblocking mode is supported for compatibility with Microsoft LAN Manager version 2.0 and should not be used to achieve asynchronous I/O with named pipes. For more information on asynchronous pipe I/O, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ipc/synchronous-and-overlapped-input-and-output">Synchronous and Overlapped Input and Output</a>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * One of the following remote-client modes can be specified. Different instances of the same pipe can specify different remote-client modes.
     * 
     * <table>
     * <tr>
     * <th>Mode</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_ACCEPT_REMOTE_CLIENTS"></a><a id="pipe_accept_remote_clients"></a><dl>
     * <dt><b>PIPE_ACCEPT_REMOTE_CLIENTS</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Connections from remote clients can be accepted and checked against the security descriptor for the pipe.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PIPE_REJECT_REMOTE_CLIENTS"></a><a id="pipe_reject_remote_clients"></a><dl>
     * <dt><b>PIPE_REJECT_REMOTE_CLIENTS</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Connections from remote clients are automatically rejected.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} nMaxInstances The maximum number of instances that can be created for this pipe. The first instance of the pipe can specify this value; the same number must be specified for other instances of the pipe. Acceptable values are in the range 1 through <b>PIPE_UNLIMITED_INSTANCES</b> (255).
     * 
     * If this parameter is <b>PIPE_UNLIMITED_INSTANCES</b>, the number of pipe instances that can be created is limited only by the availability of system resources. If <i>nMaxInstances</i> is greater than <b>PIPE_UNLIMITED_INSTANCES</b>, the return value is <b>INVALID_HANDLE_VALUE</b> and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INVALID_PARAMETER</b>.
     * @param {Integer} nOutBufferSize The number of bytes to reserve for the output buffer. For a discussion on sizing named pipe buffers, see the following Remarks section.
     * @param {Integer} nInBufferSize The number of bytes to reserve for the input buffer. For a discussion on sizing named pipe buffers, see the following Remarks section.
     * @param {Integer} nDefaultTimeOut The default time-out value, in milliseconds, if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-waitnamedpipea">WaitNamedPipe</a> function specifies <b>NMPWAIT_USE_DEFAULT_WAIT</b>. Each instance of a named pipe must specify the same value.
     * 
     * A value of zero will result in a default time-out of 50 milliseconds.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies a security descriptor for the new named pipe and determines whether child processes can inherit the returned handle. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the named pipe gets a default security descriptor and the handle cannot be inherited. The ACLs in the default security descriptor for a named pipe grant full control to the LocalSystem account, administrators, and the creator owner. They also grant read access to members of the Everyone group and the anonymous account.
     * @returns {Pointer<HANDLE>} If the function succeeds, the return value is a handle to the server end of a named pipe instance.
     * 
     * If the function fails, the return value is <b>INVALID_HANDLE_VALUE</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createnamedpipea
     * @since windows5.0
     */
    static CreateNamedPipeA(lpName, dwOpenMode, dwPipeMode, nMaxInstances, nOutBufferSize, nInBufferSize, nDefaultTimeOut, lpSecurityAttributes) {
        lpName := lpName is String? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateNamedPipeA", "ptr", lpName, "uint", dwOpenMode, "uint", dwPipeMode, "uint", nMaxInstances, "uint", nOutBufferSize, "uint", nInBufferSize, "uint", nDefaultTimeOut, "ptr", lpSecurityAttributes, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The GetNamedPipeHandleStateA (ANSI) function (winbase.h) retrieves information about a specified named pipe.
     * @remarks
     * The 
     * <b>GetNamedPipeHandleState</b> function returns successfully even if all of the pointers passed to it are <b>NULL</b>.
     * 
     * To set the pipe handle state, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-setnamedpipehandlestate">SetNamedPipeHandleState</a> function.
     * 
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {Pointer<HANDLE>} hNamedPipe A handle to the named pipe for which information is wanted. The handle must have GENERIC_READ access for a read-only or read/write pipe, or it must have GENERIC_WRITE and FILE_READ_ATTRIBUTES access for a write-only pipe. 
     * 
     * 
     * 
     * 
     * This parameter can also be a handle to an anonymous pipe, as returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-createpipe">CreatePipe</a> function.
     * @param {Pointer<UInt32>} lpState 
     * @param {Pointer<UInt32>} lpCurInstances A pointer to a variable that receives the number of current pipe instances. This parameter can be <b>NULL</b> if this information is not required.
     * @param {Pointer<UInt32>} lpMaxCollectionCount A pointer to a variable that receives the maximum number of bytes to be collected on the client's computer before transmission to the server. This parameter must be <b>NULL</b> if the specified pipe handle is to the server end of a named pipe or if client and server processes are on the same computer. This parameter can be <b>NULL</b> if this information is not required.
     * @param {Pointer<UInt32>} lpCollectDataTimeout A pointer to a variable that receives the maximum time, in milliseconds, that can pass before a remote named pipe transfers information over the network. This parameter must be <b>NULL</b> if the specified pipe handle is to the server end of a named pipe or if client and server processes are on the same computer. This parameter can be <b>NULL</b> if this information is not required.
     * @param {Pointer<PSTR>} lpUserName A pointer to a buffer that receives the user name string associated with the client application. The server can only retrieve this information if the client opened the pipe with SECURITY_IMPERSONATION access. 
     * 
     * 
     * 
     * 
     * This parameter must be <b>NULL</b> if the specified pipe handle is to the client end of a named pipe. This parameter can be <b>NULL</b> if this information is not required.
     * @param {Integer} nMaxUserNameSize The size of the buffer specified by the <i>lpUserName</i> parameter, in <b>TCHARs</b>. This parameter is ignored if <i>lpUserName</i> is <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getnamedpipehandlestatea
     * @since windows5.0
     */
    static GetNamedPipeHandleStateA(hNamedPipe, lpState, lpCurInstances, lpMaxCollectionCount, lpCollectDataTimeout, lpUserName, nMaxUserNameSize) {
        lpUserName := lpUserName is String? StrPtr(lpUserName) : lpUserName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNamedPipeHandleStateA", "ptr", hNamedPipe, "ptr", lpState, "ptr", lpCurInstances, "ptr", lpMaxCollectionCount, "ptr", lpCollectDataTimeout, "ptr", lpUserName, "uint", nMaxUserNameSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Connects to a message-type pipe (and waits if an instance of the pipe is not available), writes to and reads from the pipe, and then closes the pipe. (CallNamedPipeA)
     * @remarks
     * Calling <b>CallNamedPipe</b> is equivalent to calling the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> (or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-waitnamedpipea">WaitNamedPipe</a>, if <b>CreateFile</b> cannot open the pipe immediately), <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-transactnamedpipe">TransactNamedPipe</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> functions. <b>CreateFile</b> is called with an access flag of GENERIC_READ | GENERIC_WRITE, and an inherit handle flag of <b>FALSE</b>.
     * 
     * <b>CallNamedPipe</b> fails if the pipe is a byte-type pipe.
     * 
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {Pointer<PSTR>} lpNamedPipeName The pipe name.
     * @param {Pointer<Void>} lpInBuffer The data to be written to the pipe.
     * @param {Integer} nInBufferSize The size of the write buffer, in bytes.
     * @param {Pointer<Void>} lpOutBuffer A pointer to the buffer that receives the data read from the pipe.
     * @param {Integer} nOutBufferSize The size of the read buffer, in bytes.
     * @param {Pointer<UInt32>} lpBytesRead A pointer to a variable that receives the number of bytes read from the pipe.
     * @param {Integer} nTimeOut The number of milliseconds to wait for the named pipe to be available. In addition to numeric values, the following special values can be specified.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NMPWAIT_NOWAIT"></a><a id="nmpwait_nowait"></a><dl>
     * <dt><b>NMPWAIT_NOWAIT</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Does not wait for the named pipe. If the named pipe is not available, the function returns an error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NMPWAIT_WAIT_FOREVER"></a><a id="nmpwait_wait_forever"></a><dl>
     * <dt><b>NMPWAIT_WAIT_FOREVER</b></dt>
     * <dt>0xffffffff</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Waits indefinitely.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NMPWAIT_USE_DEFAULT_WAIT"></a><a id="nmpwait_use_default_wait"></a><dl>
     * <dt><b>NMPWAIT_USE_DEFAULT_WAIT</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the default time-out specified in a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the message written to the pipe by the server process is longer than <i>nOutBufferSize</i>, 
     * <b>CallNamedPipe</b> returns <b>FALSE</b>, and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_MORE_DATA. The remainder of the message is discarded, because 
     * <b>CallNamedPipe</b> closes the handle to the pipe before returning.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-callnamedpipea
     * @since windows5.0
     */
    static CallNamedPipeA(lpNamedPipeName, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesRead, nTimeOut) {
        lpNamedPipeName := lpNamedPipeName is String? StrPtr(lpNamedPipeName) : lpNamedPipeName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CallNamedPipeA", "ptr", lpNamedPipeName, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, "ptr", lpBytesRead, "uint", nTimeOut, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WaitNamedPipeA (ANSI) function (winbase.h) waits until either a time-out interval elapses or an instance of the specified named pipe is available for connection (that is, the pipe's server process has a pending ConnectNamedPipe operation on the pipe).
     * @remarks
     * If no instances of the specified named pipe exist, the 
     * <b>WaitNamedPipe</b> function returns immediately, regardless of the time-out value.
     * 
     * If the time-out interval expires, the <b>WaitNamedPipe</b> function will fail with the error <b>ERROR_SEM_TIMEOUT</b>.
     * 
     * If the function succeeds, the process should use the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function to open a handle to the named pipe. A return value of <b>TRUE</b> indicates that there is at least one instance of the pipe available. A subsequent <b>CreateFile</b> call to the pipe can fail, because the instance was closed by the server or opened by another client.
     * 
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {Pointer<PSTR>} lpNamedPipeName The name of the named pipe. The string must include the name of the computer on which the server process is executing. A period may be used for the <i>servername</i> if the pipe is local. The following pipe name format is used: 
     * 
     * 
     * 
     * 
     * &#92;&#92;<i>servername</i>\pipe&#92;<i>pipename</i>
     * @param {Integer} nTimeOut 
     * @returns {Integer} If an instance of the pipe is available before the time-out interval elapses, the return value is nonzero.
     * 
     * If an instance of the pipe is not available before the time-out interval elapses, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-waitnamedpipea
     * @since windows5.0
     */
    static WaitNamedPipeA(lpNamedPipeName, nTimeOut) {
        lpNamedPipeName := lpNamedPipeName is String? StrPtr(lpNamedPipeName) : lpNamedPipeName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\WaitNamedPipeA", "ptr", lpNamedPipeName, "uint", nTimeOut, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The GetNamedPipeClientComputerNameA (ANSI) function (winbase.h) retrieves the client computer name for the specified named pipe.
     * @remarks
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {Pointer<HANDLE>} Pipe A handle to an instance of a named pipe. This handle must be created by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> function.
     * @param {Pointer<PSTR>} ClientComputerName The computer name.
     * @param {Integer} ClientComputerNameLength The size of the <i>ClientComputerName</i> buffer, in bytes.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getnamedpipeclientcomputernamea
     * @since windows6.0.6000
     */
    static GetNamedPipeClientComputerNameA(Pipe, ClientComputerName, ClientComputerNameLength) {
        ClientComputerName := ClientComputerName is String? StrPtr(ClientComputerName) : ClientComputerName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNamedPipeClientComputerNameA", "ptr", Pipe, "ptr", ClientComputerName, "uint", ClientComputerNameLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the client process identifier for the specified named pipe.
     * @remarks
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {Pointer<HANDLE>} Pipe A handle to an instance of a named pipe. This handle must be created by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> function.
     * @param {Pointer<UInt32>} ClientProcessId The process identifier.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getnamedpipeclientprocessid
     * @since windows6.0.6000
     */
    static GetNamedPipeClientProcessId(Pipe, ClientProcessId) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNamedPipeClientProcessId", "ptr", Pipe, "ptr", ClientProcessId, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the client session identifier for the specified named pipe.
     * @remarks
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {Pointer<HANDLE>} Pipe A handle to an instance of a named pipe. This handle must be created by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> function.
     * @param {Pointer<UInt32>} ClientSessionId The session identifier.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getnamedpipeclientsessionid
     * @since windows6.0.6000
     */
    static GetNamedPipeClientSessionId(Pipe, ClientSessionId) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNamedPipeClientSessionId", "ptr", Pipe, "ptr", ClientSessionId, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the server process identifier for the specified named pipe.
     * @remarks
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {Pointer<HANDLE>} Pipe A handle to an instance of a named pipe. This handle must be created by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> function.
     * @param {Pointer<UInt32>} ServerProcessId The process identifier.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getnamedpipeserverprocessid
     * @since windows6.0.6000
     */
    static GetNamedPipeServerProcessId(Pipe, ServerProcessId) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNamedPipeServerProcessId", "ptr", Pipe, "ptr", ServerProcessId, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the server session identifier for the specified named pipe.
     * @remarks
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {Pointer<HANDLE>} Pipe A handle to an instance of a named pipe. This handle must be created by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> function.
     * @param {Pointer<UInt32>} ServerSessionId The session identifier.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getnamedpipeserversessionid
     * @since windows6.0.6000
     */
    static GetNamedPipeServerSessionId(Pipe, ServerSessionId) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNamedPipeServerSessionId", "ptr", Pipe, "ptr", ServerSessionId, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}

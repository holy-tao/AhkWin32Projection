#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HANDLE.ahk

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
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//namedpipeapi/nf-namedpipeapi-createpipe
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
     * @param {HANDLE} hNamedPipe A handle to the server end of a named pipe instance. This handle is returned by the 
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
     * @returns {BOOL} If the operation is synchronous, <b>ConnectNamedPipe</b> does not return until the operation has completed. If the function succeeds, the return value is nonzero. If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the operation is asynchronous, <b>ConnectNamedPipe</b> returns immediately. If the operation is still pending, the return value is zero and <a href="/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_IO_PENDING. (You can use the <a href="/windows/win32/api/winbase/nf-winbase-hasoverlappediocompleted">HasOverlappedIoCompleted</a> macro to determine when the operation has finished.) If the function fails, the return value is zero and 
     * <b>GetLastError</b> returns a value other than ERROR_IO_PENDING or ERROR_PIPE_CONNECTED.
     * 
     * If a client connects before the function is called, the function returns zero and <a href="/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_PIPE_CONNECTED. This can happen if a client connects in the interval between the call to 
     * <a href="/windows/win32/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> and the call to 
     * <b>ConnectNamedPipe</b>. In this situation, there is a good connection between client and server, even though the function returns zero.
     * @see https://docs.microsoft.com/windows/win32/api//namedpipeapi/nf-namedpipeapi-connectnamedpipe
     * @since windows5.0
     */
    static ConnectNamedPipe(hNamedPipe, lpOverlapped) {
        hNamedPipe := hNamedPipe is Win32Handle ? NumGet(hNamedPipe, "ptr") : hNamedPipe

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ConnectNamedPipe", "ptr", hNamedPipe, "ptr", lpOverlapped, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Disconnects the server end of a named pipe instance from a client process.
     * @param {HANDLE} hNamedPipe A handle to an instance of a named pipe. This handle must be created by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//namedpipeapi/nf-namedpipeapi-disconnectnamedpipe
     * @since windows5.0
     */
    static DisconnectNamedPipe(hNamedPipe) {
        hNamedPipe := hNamedPipe is Win32Handle ? NumGet(hNamedPipe, "ptr") : hNamedPipe

        A_LastError := 0

        result := DllCall("KERNEL32.dll\DisconnectNamedPipe", "ptr", hNamedPipe, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the read mode and the blocking mode of the specified named pipe. If the specified handle is to the client end of a named pipe and if the named pipe server process is on a remote computer, the function can also be used to control local buffering.
     * @param {HANDLE} hNamedPipe A handle to the named pipe instance. This parameter can be a handle to the server end of the pipe, as returned by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> function, or to the client end of the pipe, as returned by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-createfilew">CreateFile</a> function. The handle must have GENERIC_WRITE access to the named pipe for a write-only or read/write pipe, or it must have GENERIC_READ and FILE_WRITE_ATTRIBUTES access for a read-only pipe. 
     * 
     * 
     * 
     * 
     * This parameter can also be a handle to an anonymous pipe, as returned by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-createpipe">CreatePipe</a> function.
     * @param {Pointer<Integer>} lpMode The new pipe mode. The mode is a combination of a read-mode flag and a wait-mode flag. This parameter can be <b>NULL</b> if the mode is not being set. Specify one of the following modes. 
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
     * @param {Pointer<Integer>} lpMaxCollectionCount The maximum number of bytes collected on the client computer before transmission to the server. This parameter must be <b>NULL</b> if the specified pipe handle is to the server end of a named pipe or if client and server processes are on the same machine. This parameter is ignored if the client process specifies the FILE_FLAG_WRITE_THROUGH flag in the <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-createfilew">CreateFile</a> function when the handle was created. This parameter can be <b>NULL</b> if the collection count is not being set.
     * @param {Pointer<Integer>} lpCollectDataTimeout The maximum time, in milliseconds, that can pass before a remote named pipe transfers information over the network. This parameter must be <b>NULL</b> if the specified pipe handle is to the server end of a named pipe or if client and server processes are on the same computer. This parameter is ignored if the client process specified the FILE_FLAG_WRITE_THROUGH flag in the 
     * <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-createfilew">CreateFile</a> function when the handle was created. This parameter can be <b>NULL</b> if the collection count is not being set.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//namedpipeapi/nf-namedpipeapi-setnamedpipehandlestate
     * @since windows5.0
     */
    static SetNamedPipeHandleState(hNamedPipe, lpMode, lpMaxCollectionCount, lpCollectDataTimeout) {
        hNamedPipe := hNamedPipe is Win32Handle ? NumGet(hNamedPipe, "ptr") : hNamedPipe

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetNamedPipeHandleState", "ptr", hNamedPipe, "uint*", lpMode, "uint*", lpMaxCollectionCount, "uint*", lpCollectDataTimeout, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Copies data from a named or anonymous pipe into a buffer without removing it from the pipe.
     * @param {HANDLE} hNamedPipe A handle to the pipe. This parameter can be a handle to a named pipe instance, as returned by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> or 
     * <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-createfilew">CreateFile</a> function, or it can be a handle to the read end of an anonymous pipe, as returned by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-createpipe">CreatePipe</a> function. The handle must have GENERIC_READ access to the pipe.
     * @param {Pointer} lpBuffer A pointer to a buffer that receives data read from the pipe. This parameter can be <b>NULL</b> if no data is to be read.
     * @param {Integer} nBufferSize The size of the buffer specified by the <i>lpBuffer</i> parameter, in bytes. This parameter is ignored if <i>lpBuffer</i> is <b>NULL</b>.
     * @param {Pointer<Integer>} lpBytesRead A pointer to a variable that receives the number of bytes read from the pipe. This parameter can be <b>NULL</b> if no data is to be read.
     * @param {Pointer<Integer>} lpTotalBytesAvail A pointer to a variable that receives the total number of bytes available to be read from the pipe. This parameter can be <b>NULL</b> if no data is to be read.
     * @param {Pointer<Integer>} lpBytesLeftThisMessage A pointer to a variable that receives the number of bytes remaining in this message. This parameter will be zero for byte-type named pipes or for anonymous pipes. This parameter can be <b>NULL</b> if no data is to be read.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//namedpipeapi/nf-namedpipeapi-peeknamedpipe
     * @since windows5.0
     */
    static PeekNamedPipe(hNamedPipe, lpBuffer, nBufferSize, lpBytesRead, lpTotalBytesAvail, lpBytesLeftThisMessage) {
        hNamedPipe := hNamedPipe is Win32Handle ? NumGet(hNamedPipe, "ptr") : hNamedPipe

        A_LastError := 0

        result := DllCall("KERNEL32.dll\PeekNamedPipe", "ptr", hNamedPipe, "ptr", lpBuffer, "uint", nBufferSize, "uint*", lpBytesRead, "uint*", lpTotalBytesAvail, "uint*", lpBytesLeftThisMessage, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Combines the functions that write a message to and read a message from the specified named pipe into a single network operation.
     * @param {HANDLE} hNamedPipe A handle to the named pipe returned by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> or 
     * <a href="https://docs.microsoft.com/windows/win32/api/fileapi/nf-fileapi-createfilew">CreateFile</a> function. 
     * 
     * 
     * 
     * 
     * This parameter can also be a handle to an anonymous pipe, as returned by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-createpipe">CreatePipe</a> function.
     * @param {Pointer} lpInBuffer A pointer to the buffer containing the data to be written to the pipe.
     * @param {Integer} nInBufferSize The size of the input buffer, in bytes.
     * @param {Pointer} lpOutBuffer A pointer to the buffer that receives the data read from the pipe.
     * @param {Integer} nOutBufferSize The size of the output buffer, in bytes.
     * @param {Pointer<Integer>} lpBytesRead A pointer to the variable that receives the number of bytes read from the pipe. 
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
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the message to be read is longer than the buffer specified by the <i>nOutBufferSize</i> parameter, 
     * <b>TransactNamedPipe</b> returns <b>FALSE</b> and the <a href="/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns ERROR_MORE_DATA. The remainder of the message can be read by a subsequent call to <a href="/windows/win32/api/fileapi/nf-fileapi-readfile">ReadFile</a>, <a href="/windows/win32/api/fileapi/nf-fileapi-readfileex">ReadFileEx</a>, or 
     * <a href="/windows/win32/api/namedpipeapi/nf-namedpipeapi-peeknamedpipe">PeekNamedPipe</a>.
     * @see https://docs.microsoft.com/windows/win32/api//namedpipeapi/nf-namedpipeapi-transactnamedpipe
     * @since windows5.0
     */
    static TransactNamedPipe(hNamedPipe, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesRead, lpOverlapped) {
        hNamedPipe := hNamedPipe is Win32Handle ? NumGet(hNamedPipe, "ptr") : hNamedPipe

        A_LastError := 0

        result := DllCall("KERNEL32.dll\TransactNamedPipe", "ptr", hNamedPipe, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, "uint*", lpBytesRead, "ptr", lpOverlapped, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates an instance of a named pipe and returns a handle for subsequent pipe operations.
     * @param {PWSTR} lpName The unique pipe name. This string must have the following form:
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
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the server end of a named pipe instance.
     * 
     * If the function fails, the return value is <b>INVALID_HANDLE_VALUE</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//namedpipeapi/nf-namedpipeapi-createnamedpipew
     */
    static CreateNamedPipeW(lpName, dwOpenMode, dwPipeMode, nMaxInstances, nOutBufferSize, nInBufferSize, nDefaultTimeOut, lpSecurityAttributes) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := DllCall("KERNEL32.dll\CreateNamedPipeW", "ptr", lpName, "uint", dwOpenMode, "uint", dwPipeMode, "uint", nMaxInstances, "uint", nOutBufferSize, "uint", nInBufferSize, "uint", nDefaultTimeOut, "ptr", lpSecurityAttributes, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * Waits until either a time-out interval elapses or an instance of the specified named pipe is available for connection (that is, the pipe's server process has a pending ConnectNamedPipe operation on the pipe).
     * @param {PWSTR} lpNamedPipeName The name of the named pipe. The string must include the name of the computer on which the server process is executing. A period may be used for the <i>servername</i> if the pipe is local. The following pipe name format is used: 
     * 
     * &#92;&#92;<i>servername</i>\pipe&#92;<i>pipename</i>
     * @param {Integer} nTimeOut 
     * @returns {BOOL} If an instance of the pipe is available before the time-out interval elapses, the return value is nonzero.
     * 
     * If an instance of the pipe is not available before the time-out interval elapses, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//namedpipeapi/nf-namedpipeapi-waitnamedpipew
     */
    static WaitNamedPipeW(lpNamedPipeName, nTimeOut) {
        lpNamedPipeName := lpNamedPipeName is String ? StrPtr(lpNamedPipeName) : lpNamedPipeName

        result := DllCall("KERNEL32.dll\WaitNamedPipeW", "ptr", lpNamedPipeName, "uint", nTimeOut, "int")
        return result
    }

    /**
     * Retrieves the client computer name for the specified named pipe.
     * @param {HANDLE} Pipe A handle to an instance of a named pipe. This handle must be created by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-createnamedpipew">CreateNamedPipe</a> function.
     * @param {Pointer} ClientComputerName The computer name.
     * @param {Integer} ClientComputerNameLength The size of the <i>ClientComputerName</i> buffer, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//namedpipeapi/nf-namedpipeapi-getnamedpipeclientcomputernamew
     */
    static GetNamedPipeClientComputerNameW(Pipe, ClientComputerName, ClientComputerNameLength) {
        Pipe := Pipe is Win32Handle ? NumGet(Pipe, "ptr") : Pipe

        result := DllCall("KERNEL32.dll\GetNamedPipeClientComputerNameW", "ptr", Pipe, "ptr", ClientComputerName, "uint", ClientComputerNameLength, "int")
        return result
    }

    /**
     * Impersonates a named-pipe client application.
     * @param {HANDLE} hNamedPipe A handle to a named pipe.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//namedpipeapi/nf-namedpipeapi-impersonatenamedpipeclient
     * @since windows5.1.2600
     */
    static ImpersonateNamedPipeClient(hNamedPipe) {
        hNamedPipe := hNamedPipe is Win32Handle ? NumGet(hNamedPipe, "ptr") : hNamedPipe

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ImpersonateNamedPipeClient", "ptr", hNamedPipe, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the specified named pipe.
     * @param {HANDLE} hNamedPipe A handle to the named pipe instance. The handle must have GENERIC_READ access to the named pipe for a read-only or read/write pipe, or it must have GENERIC_WRITE and FILE_READ_ATTRIBUTES access for a write-only pipe. 
     * 
     * 
     * 
     * 
     * This parameter can also be a handle to an anonymous pipe, as returned by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-createpipe">CreatePipe</a> function.
     * @param {Pointer<Integer>} lpFlags 
     * @param {Pointer<Integer>} lpOutBufferSize A pointer to a variable that receives the size of the buffer for outgoing data, in bytes. If the buffer size is zero, the buffer is allocated as needed. This parameter can be <b>NULL</b> if this information is not required.
     * @param {Pointer<Integer>} lpInBufferSize A pointer to a variable that receives the size of the buffer for incoming data, in bytes. If the buffer size is zero, the buffer is allocated as needed. This parameter can be <b>NULL</b> if this information is not required.
     * @param {Pointer<Integer>} lpMaxInstances A pointer to a variable that receives the maximum number of pipe instances that can be created. If the variable is set to PIPE_UNLIMITED_INSTANCES (255), the number of pipe instances that can be created is limited only by the availability of system resources. This parameter can be <b>NULL</b> if this information is not required.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//namedpipeapi/nf-namedpipeapi-getnamedpipeinfo
     * @since windows5.0
     */
    static GetNamedPipeInfo(hNamedPipe, lpFlags, lpOutBufferSize, lpInBufferSize, lpMaxInstances) {
        hNamedPipe := hNamedPipe is Win32Handle ? NumGet(hNamedPipe, "ptr") : hNamedPipe

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNamedPipeInfo", "ptr", hNamedPipe, "uint*", lpFlags, "uint*", lpOutBufferSize, "uint*", lpInBufferSize, "uint*", lpMaxInstances, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about a specified named pipe.
     * @param {HANDLE} hNamedPipe A handle to the named pipe for which information is wanted. The handle must have GENERIC_READ access for a read-only or read/write pipe, or it must have GENERIC_WRITE and FILE_READ_ATTRIBUTES access for a write-only pipe.  
     * 
     * This parameter can also be a handle to an anonymous pipe, as returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-createpipe">CreatePipe</a> function.
     * @param {Pointer<Integer>} lpState 
     * @param {Pointer<Integer>} lpCurInstances A pointer to a variable that receives the number of current pipe instances. This parameter can be <b>NULL</b> if this information is not required.
     * @param {Pointer<Integer>} lpMaxCollectionCount A pointer to a variable that receives the maximum number of bytes to be collected on the client's computer before transmission to the server. This parameter must be <b>NULL</b> if the specified pipe handle is to the server end of a named pipe or if client and server processes are on the same computer. This parameter can be <b>NULL</b> if this information is not required.
     * @param {Pointer<Integer>} lpCollectDataTimeout A pointer to a variable that receives the maximum time, in milliseconds, that can pass before a remote named pipe transfers information over the network. This parameter must be <b>NULL</b> if the specified pipe handle is to the server end of a named pipe or if client and server processes are on the same computer. This parameter can be <b>NULL</b> if this information is not required.
     * @param {PWSTR} lpUserName A pointer to a buffer that receives the user name string associated with the client application. The server can only retrieve this information if the client opened the pipe with SECURITY_IMPERSONATION access.
     * 
     * This parameter must be <b>NULL</b> if the specified pipe handle is to the client end of a named pipe. This parameter can be <b>NULL</b> if this information is not required.
     * @param {Integer} nMaxUserNameSize The size of the buffer specified by the <i>lpUserName</i> parameter, in <b>TCHARs</b>. This parameter is ignored if <i>lpUserName</i> is <b>NULL</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//namedpipeapi/nf-namedpipeapi-getnamedpipehandlestatew
     */
    static GetNamedPipeHandleStateW(hNamedPipe, lpState, lpCurInstances, lpMaxCollectionCount, lpCollectDataTimeout, lpUserName, nMaxUserNameSize) {
        lpUserName := lpUserName is String ? StrPtr(lpUserName) : lpUserName
        hNamedPipe := hNamedPipe is Win32Handle ? NumGet(hNamedPipe, "ptr") : hNamedPipe

        result := DllCall("KERNEL32.dll\GetNamedPipeHandleStateW", "ptr", hNamedPipe, "uint*", lpState, "uint*", lpCurInstances, "uint*", lpMaxCollectionCount, "uint*", lpCollectDataTimeout, "ptr", lpUserName, "uint", nMaxUserNameSize, "int")
        return result
    }

    /**
     * Connects to a message-type pipe (and waits if an instance of the pipe is not available), writes to and reads from the pipe, and then closes the pipe.
     * @param {PWSTR} lpNamedPipeName The pipe name.
     * @param {Pointer} lpInBuffer The data to be written to the pipe.
     * @param {Integer} nInBufferSize The size of the write buffer, in bytes.
     * @param {Pointer} lpOutBuffer A pointer to the buffer that receives the data read from the pipe.
     * @param {Integer} nOutBufferSize The size of the read buffer, in bytes.
     * @param {Pointer<Integer>} lpBytesRead A pointer to a variable that receives the number of bytes read from the pipe.
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
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the message written to the pipe by the server process is longer than <i>nOutBufferSize</i>, <b>CallNamedPipe</b> returns <b>FALSE</b>, and <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_MORE_DATA. The remainder of the message is discarded, because <b>CallNamedPipe</b> closes the handle to the pipe before returning.
     * @see https://docs.microsoft.com/windows/win32/api//namedpipeapi/nf-namedpipeapi-callnamedpipew
     */
    static CallNamedPipeW(lpNamedPipeName, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesRead, nTimeOut) {
        lpNamedPipeName := lpNamedPipeName is String ? StrPtr(lpNamedPipeName) : lpNamedPipeName

        result := DllCall("KERNEL32.dll\CallNamedPipeW", "ptr", lpNamedPipeName, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, "uint*", lpBytesRead, "uint", nTimeOut, "int")
        return result
    }

    /**
     * Creates an instance of a named pipe and returns a handle for subsequent pipe operations.
     * @param {PSTR} lpName The unique pipe name. This string must have the following form:
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
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the server end of a named pipe instance.
     * 
     * If the function fails, the return value is <b>INVALID_HANDLE_VALUE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-createnamedpipea
     * @since windows5.0
     */
    static CreateNamedPipeA(lpName, dwOpenMode, dwPipeMode, nMaxInstances, nOutBufferSize, nInBufferSize, nDefaultTimeOut, lpSecurityAttributes) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateNamedPipeA", "ptr", lpName, "uint", dwOpenMode, "uint", dwPipeMode, "uint", nMaxInstances, "uint", nOutBufferSize, "uint", nInBufferSize, "uint", nDefaultTimeOut, "ptr", lpSecurityAttributes, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Retrieves information about a specified named pipe.
     * @param {HANDLE} hNamedPipe A handle to the named pipe for which information is wanted. The handle must have GENERIC_READ access for a read-only or read/write pipe, or it must have GENERIC_WRITE and FILE_READ_ATTRIBUTES access for a write-only pipe. 
     * 
     * 
     * 
     * 
     * This parameter can also be a handle to an anonymous pipe, as returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-createpipe">CreatePipe</a> function.
     * @param {Pointer<Integer>} lpState 
     * @param {Pointer<Integer>} lpCurInstances A pointer to a variable that receives the number of current pipe instances. This parameter can be <b>NULL</b> if this information is not required.
     * @param {Pointer<Integer>} lpMaxCollectionCount A pointer to a variable that receives the maximum number of bytes to be collected on the client's computer before transmission to the server. This parameter must be <b>NULL</b> if the specified pipe handle is to the server end of a named pipe or if client and server processes are on the same computer. This parameter can be <b>NULL</b> if this information is not required.
     * @param {Pointer<Integer>} lpCollectDataTimeout A pointer to a variable that receives the maximum time, in milliseconds, that can pass before a remote named pipe transfers information over the network. This parameter must be <b>NULL</b> if the specified pipe handle is to the server end of a named pipe or if client and server processes are on the same computer. This parameter can be <b>NULL</b> if this information is not required.
     * @param {PSTR} lpUserName A pointer to a buffer that receives the user name string associated with the client application. The server can only retrieve this information if the client opened the pipe with SECURITY_IMPERSONATION access. 
     * 
     * 
     * 
     * 
     * This parameter must be <b>NULL</b> if the specified pipe handle is to the client end of a named pipe. This parameter can be <b>NULL</b> if this information is not required.
     * @param {Integer} nMaxUserNameSize The size of the buffer specified by the <i>lpUserName</i> parameter, in <b>TCHARs</b>. This parameter is ignored if <i>lpUserName</i> is <b>NULL</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getnamedpipehandlestatea
     * @since windows5.0
     */
    static GetNamedPipeHandleStateA(hNamedPipe, lpState, lpCurInstances, lpMaxCollectionCount, lpCollectDataTimeout, lpUserName, nMaxUserNameSize) {
        lpUserName := lpUserName is String ? StrPtr(lpUserName) : lpUserName
        hNamedPipe := hNamedPipe is Win32Handle ? NumGet(hNamedPipe, "ptr") : hNamedPipe

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNamedPipeHandleStateA", "ptr", hNamedPipe, "uint*", lpState, "uint*", lpCurInstances, "uint*", lpMaxCollectionCount, "uint*", lpCollectDataTimeout, "ptr", lpUserName, "uint", nMaxUserNameSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Connects to a message-type pipe (and waits if an instance of the pipe is not available), writes to and reads from the pipe, and then closes the pipe.
     * @param {PSTR} lpNamedPipeName The pipe name.
     * @param {Pointer} lpInBuffer The data to be written to the pipe.
     * @param {Integer} nInBufferSize The size of the write buffer, in bytes.
     * @param {Pointer} lpOutBuffer A pointer to the buffer that receives the data read from the pipe.
     * @param {Integer} nOutBufferSize The size of the read buffer, in bytes.
     * @param {Pointer<Integer>} lpBytesRead A pointer to a variable that receives the number of bytes read from the pipe.
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
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the message written to the pipe by the server process is longer than <i>nOutBufferSize</i>, 
     * <b>CallNamedPipe</b> returns <b>FALSE</b>, and <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_MORE_DATA. The remainder of the message is discarded, because 
     * <b>CallNamedPipe</b> closes the handle to the pipe before returning.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-callnamedpipea
     * @since windows5.0
     */
    static CallNamedPipeA(lpNamedPipeName, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesRead, nTimeOut) {
        lpNamedPipeName := lpNamedPipeName is String ? StrPtr(lpNamedPipeName) : lpNamedPipeName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CallNamedPipeA", "ptr", lpNamedPipeName, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, "uint*", lpBytesRead, "uint", nTimeOut, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Waits until either a time-out interval elapses or an instance of the specified named pipe is available for connection (that is, the pipe's server process has a pending ConnectNamedPipe operation on the pipe).
     * @param {PSTR} lpNamedPipeName The name of the named pipe. The string must include the name of the computer on which the server process is executing. A period may be used for the <i>servername</i> if the pipe is local. The following pipe name format is used: 
     * 
     * 
     * 
     * 
     * &#92;&#92;<i>servername</i>\pipe&#92;<i>pipename</i>
     * @param {Integer} nTimeOut 
     * @returns {BOOL} If an instance of the pipe is available before the time-out interval elapses, the return value is nonzero.
     * 
     * If an instance of the pipe is not available before the time-out interval elapses, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-waitnamedpipea
     * @since windows5.0
     */
    static WaitNamedPipeA(lpNamedPipeName, nTimeOut) {
        lpNamedPipeName := lpNamedPipeName is String ? StrPtr(lpNamedPipeName) : lpNamedPipeName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\WaitNamedPipeA", "ptr", lpNamedPipeName, "uint", nTimeOut, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the client computer name for the specified named pipe.
     * @param {HANDLE} Pipe A handle to an instance of a named pipe. This handle must be created by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> function.
     * @param {Pointer} ClientComputerName The computer name.
     * @param {Integer} ClientComputerNameLength The size of the <i>ClientComputerName</i> buffer, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getnamedpipeclientcomputernamea
     * @since windows6.0.6000
     */
    static GetNamedPipeClientComputerNameA(Pipe, ClientComputerName, ClientComputerNameLength) {
        Pipe := Pipe is Win32Handle ? NumGet(Pipe, "ptr") : Pipe

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNamedPipeClientComputerNameA", "ptr", Pipe, "ptr", ClientComputerName, "uint", ClientComputerNameLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the client process identifier for the specified named pipe.
     * @param {HANDLE} Pipe A handle to an instance of a named pipe. This handle must be created by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> function.
     * @param {Pointer<Integer>} ClientProcessId The process identifier.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getnamedpipeclientprocessid
     * @since windows6.0.6000
     */
    static GetNamedPipeClientProcessId(Pipe, ClientProcessId) {
        Pipe := Pipe is Win32Handle ? NumGet(Pipe, "ptr") : Pipe

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNamedPipeClientProcessId", "ptr", Pipe, "uint*", ClientProcessId, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the client session identifier for the specified named pipe.
     * @param {HANDLE} Pipe A handle to an instance of a named pipe. This handle must be created by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> function.
     * @param {Pointer<Integer>} ClientSessionId The session identifier.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getnamedpipeclientsessionid
     * @since windows6.0.6000
     */
    static GetNamedPipeClientSessionId(Pipe, ClientSessionId) {
        Pipe := Pipe is Win32Handle ? NumGet(Pipe, "ptr") : Pipe

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNamedPipeClientSessionId", "ptr", Pipe, "uint*", ClientSessionId, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the server process identifier for the specified named pipe.
     * @param {HANDLE} Pipe A handle to an instance of a named pipe. This handle must be created by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> function.
     * @param {Pointer<Integer>} ServerProcessId The process identifier.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getnamedpipeserverprocessid
     * @since windows6.0.6000
     */
    static GetNamedPipeServerProcessId(Pipe, ServerProcessId) {
        Pipe := Pipe is Win32Handle ? NumGet(Pipe, "ptr") : Pipe

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNamedPipeServerProcessId", "ptr", Pipe, "uint*", ServerProcessId, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the server session identifier for the specified named pipe.
     * @param {HANDLE} Pipe A handle to an instance of a named pipe. This handle must be created by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> function.
     * @param {Pointer<Integer>} ServerSessionId The session identifier.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getnamedpipeserversessionid
     * @since windows6.0.6000
     */
    static GetNamedPipeServerSessionId(Pipe, ServerSessionId) {
        Pipe := Pipe is Win32Handle ? NumGet(Pipe, "ptr") : Pipe

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNamedPipeServerSessionId", "ptr", Pipe, "uint*", ServerSessionId, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}

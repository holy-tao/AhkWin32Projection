#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SOCKET.ahk" { SOCKET }
#Import "..\..\System\IO\OVERLAPPED.ahk" { OVERLAPPED }

/**
 * The LPWSPGetOverlappedResult function returns the results of an overlapped operation on the specified socket.
 * @remarks
 * The results reported by the **LPWSPGetOverlappedResult** function are those of the specified socket's last overlapped operation to which the specified <b><a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaoverlapped">WSAOverlapped</a></b> structure was provided, and for which the operation's results were pending. A pending operation is indicated when the function that started the operation returns SOCKET_ERROR, and the <i>lpErrno</i> is WSA_IO_PENDING. When an I/O operation is pending, the function that started the operation resets the **hEvent** member of the **WSAOVERLAPPED** structure to the nonsignaled state. Then, when the pending operation has been completed, the system sets the event object to the signaled state.
 * 
 * If the <i>fWait</i> parameter is **TRUE**, **LPWSPGetOverlappedResult** determines whether the pending operation has been completed by blocking and waiting for the event object to be in the signaled state. A client may set the <i>fWait</i> parameter to **TRUE** only if it selected event-based completion notification when the I/O operation was requested. If another form of notification was selected, the usage of the **hEvent** member of the <b><a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaoverlapped">WSAOverlapped</a></b> structure is different, and setting <i>fWait</i> to **TRUE** causes unpredictable results.
 * 
 * > [!Note]  
 * > All I/O initiated by a given thread is canceled when that thread exits. For overlapped sockets, pending asynchronous operations can fail if the thread is closed before the operations complete. See <b><a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-exitthread">ExitThread</a></b> for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspgetoverlappedresult
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSPGETOVERLAPPEDRESULT {
    value : IntPtr

    __value {
        set {
            if (value is LPWSPGETOVERLAPPEDRESULT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {SOCKET} s Identifies the socket. This is the same socket that was specified when the overlapped operation was started by a call to <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecv">LPWSPRecv</a></b>, <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecvfrom">LPWSPRecvFrom</a></b>, <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsend">LPWSPSend</a></b>, <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsendto">LPWSPSendTo</a></b>, or <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspioctl">LPWSPIoctl</a></b>.
     * @param {Pointer<OVERLAPPED>} lpOverlapped Pointer to a <b><a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaoverlapped">WSAOverlapped</a></b> structure that was specified when the overlapped operation was started.
     * @param {Pointer<Integer>} lpcbTransfer Pointer to a 32-bit variable that receives the number of bytes that were actually transferred by a send or receive operation, or by <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspioctl">LPWSPIoctl</a></b>.
     * @param {BOOL} fWait Specifies whether the function should wait for the pending overlapped operation to complete. If **TRUE**, the function does not return until the operation has been completed. If **FALSE** and the operation is still pending, the function returns **FALSE** and <i>lpErrno</i> is WSA_IO_INCOMPLETE. The <i>fWait</i> parameter may be set to **TRUE** only if the overlapped operation selected event-based completion notification.
     * @param {Pointer<Integer>} lpdwFlags Pointer to a 32-bit variable that will receive one or more flags that supplement the completion status. If the overlapped operation was initiated through <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecv">LPWSPRecv</a></b> or <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecvfrom">LPWSPRecvFrom</a></b>, this parameter will contain the results value for <i>lpFlags</i> parameter.
     * @param {Pointer<Integer>} lpErrno Pointer to the error code.
     * @returns {BOOL} If **LPWSPGetOverlappedResult** succeeds, the return value is **TRUE**. This means the overlapped operation has completed successfully and the value pointed to by <i>lpcbTransfer</i> has been updated. If **LPWSPGetOverlappedResult** returns **FALSE**, this means that the overlapped operation has not completed or the overlapped operation completed but with errors, or completion status could not be determined due to errors in one or more parameters to **LPWSPGetOverlappedResult**. On failure, the value pointed to by <i>lpcbTransfer</i> will not be updated. The <i>lpErrno</i> parameter indicates the cause of the failure (either of **LPWSPGetOverlappedResult** or of the associated overlapped operation).
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Meaning</th>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAENETDOWN">WSAENETDOWN</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network subsystem has failed.  
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAENOTSOCK">WSAENOTSOCK</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The descriptor is not a socket.  
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSA_INVALID_HANDLE">WSA_INVALID_HANDLE</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The **hEvent** member of the <b><a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaoverlapped">WSAOverlapped</a></b> structure does not contain a valid event object handle.  
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEINVAL">WSAEINVAL</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is unacceptable.  
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSA_IO_INCOMPLETE">WSA_IO_INCOMPLETE</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>fWait</i> parameter is **FALSE** and the I/O operation has not yet completed.  
     * </td>
     * </tr>
     * </table>
     */
    Call(s, lpOverlapped, lpcbTransfer, fWait, lpdwFlags, lpErrno) {
        lpcbTransferMarshal := lpcbTransfer is VarRef ? "uint*" : "ptr"
        lpdwFlagsMarshal := lpdwFlags is VarRef ? "uint*" : "ptr"
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, SOCKET, s, OVERLAPPED.Ptr, lpOverlapped, lpcbTransferMarshal, lpcbTransfer, BOOL, fWait, lpdwFlagsMarshal, lpdwFlags, lpErrnoMarshal, lpErrno, BOOL)
        return result
    }

    /**
     * A LPWSPGETOVERLAPPEDRESULT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSPGETOVERLAPPEDRESULT {
        /**
         * Creates a LPWSPGETOVERLAPPEDRESULT pointer that invokes the given AHK function when called.
         * @param {Func(SOCKET, OVERLAPPED, "uint*", BOOL, "uint*", "int*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SOCKET, OVERLAPPED.Ptr, "uint*", BOOL, "uint*", "int*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}

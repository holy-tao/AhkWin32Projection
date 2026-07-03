#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKET.ahk" { SOCKET }
#Import ".\WSABUF.ahk" { WSABUF }

/**
 * The LPWSPSendDisconnect function initiates termination of the connection for the socket and sends disconnect data.
 * @remarks
 * The **LPWSPSendDisconnect** function is used on connection-oriented sockets to disable transmission, and to initiate termination of the connection along with the transmission of disconnect data, if any.
 * 
 * After this function has been successfully issued, subsequent sends are disallowed.
 * 
 * The <i>lpOutboundDisconnectData</i> parameter, if not null, points to a buffer containing the outgoing disconnect data to be sent to the remote party.
 * 
 * Note that **LPWSPSendDisconnect** does not close the socket, and that resources attached to the socket will not be freed until <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspclosesocket">LPWSPCloseSocket</a></b> is invoked.
 * 
 * > [!Note]  
 * > The **LPWSPSendDisconnect** function does not block regardless of the SO_LINGER setting on the socket. A Windows Sockets SPI client should not rely on being able to reuse a socket after it has been disconnected. In particular, a Windows Sockets provider is not required to support the use of <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspconnect">LPWSPConnect</a></b> on such a socket.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsenddisconnect
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSPSENDDISCONNECT {
    value : IntPtr

    __value {
        set {
            if (value is LPWSPSENDDISCONNECT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {SOCKET} s Descriptor identifying a socket.
     * @param {Pointer<WSABUF>} lpOutboundDisconnectData Pointer to the outgoing disconnect data.
     * @param {Pointer<Integer>} lpErrno Pointer to the error code.
     * @returns {Integer} If no error occurs, **LPWSPSendDisconnect** returns zero. Otherwise, a value of SOCKET_ERROR is returned, and a specific error code is available in <i>lpErrno</i>.
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
     * <dt><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAENOPROTOOPT">WSAENOPROTOOPT</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>lpOutboundDisconnectData</i> is not null, and the disconnect data is not supported by the service provider.  
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEINPROGRESS">WSAEINPROGRESS</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blocking Windows Sockets call is in progress, or the service provider is still processing a callback function.  
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAENOTCONN">WSAENOTCONN</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Socket is not connected (connection-oriented sockets only).
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
     * <dt><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEFAULT">WSAEFAULT</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpOutboundDisconnectData</i> parameter is not totally contained in a valid part of the user address space.
     * </td>
     * </tr>
     * </table>
     */
    Call(s, lpOutboundDisconnectData, lpErrno) {
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, SOCKET, s, WSABUF.Ptr, lpOutboundDisconnectData, lpErrnoMarshal, lpErrno, Int32)
        return result
    }

    /**
     * A LPWSPSENDDISCONNECT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSPSENDDISCONNECT {
        /**
         * Creates a LPWSPSENDDISCONNECT pointer that invokes the given AHK function when called.
         * @param {Func(SOCKET, WSABUF, "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SOCKET, WSABUF.Ptr, "int*", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}

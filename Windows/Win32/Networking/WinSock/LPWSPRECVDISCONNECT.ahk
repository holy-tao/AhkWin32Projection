#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKET.ahk" { SOCKET }
#Import ".\WSABUF.ahk" { WSABUF }

/**
 * The LPWSPRecvDisconnect function terminates reception on a socket and retrieves the disconnect data, if the socket is connection oriented.
 * @remarks
 * **LPWSPRecvDisconnect** is used on connection-oriented sockets to disable reception, and retrieve any incoming disconnect data from the remote party.
 * 
 * After this function has been successfully issued, subsequent receives on the socket will be disallowed. This has no effect on the lower protocol layers. For TCP, the TCP window is not changed and incoming data will be accepted (but not acknowledged) until the window is exhausted. For UDP, incoming datagrams are accepted and queued. In no case will an ICMP error packet be generated.
 * 
 * To successfully receive incoming disconnect data, a Windows Sockets SPI client must use other mechanisms to determine that the circuit has been closed. For example, a client needs to receive an FD_CLOSE notification, or get a zero return value, or a <b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEDISCON">WSAEDISCON</a></b> error code from <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecv">LPWSPRecv</a></b>.
 * 
 * Note that **LPWSPRecvDisconnect** does not close the socket, and resources attached to the socket will not be freed until <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspclosesocket">LPWSPCloseSocket</a></b> is invoked.
 * 
 * > [!Note]  
 * > **LPWSPRecvDisconnect** does not block regardless of the SO_LINGER setting on the socket. A Windows Sockets SPI client should not rely on being able to reuse a socket after it has been **LPWSPRecvDisconnect**ed. In particular, a Windows Sockets provider is not required to support the use of <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspconnect">LPWSPConnect</a></b> on such a socket.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecvdisconnect
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSPRECVDISCONNECT {
    value : IntPtr

    __value {
        set {
            if (value is LPWSPRECVDISCONNECT) {
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
     * @param {Pointer<WSABUF>} lpInboundDisconnectData Pointer to a buffer into which disconnect data is to be copied.
     * @param {Pointer<Integer>} lpErrno Pointer to the error code.
     * @returns {Integer} If no error occurs, **LPWSPRecvDisconnect** returns zero. Otherwise, a value of SOCKET_ERROR is returned, and a specific error code is available in <i>lpErrno</i>.
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
     * <dt><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEFAULT">WSAEFAULT</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Buffer referenced by the parameter <i>lpInboundDisconnectData</i> is too small.  
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
     * Disconnect data is not supported by the indicated protocol family.  
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
     * </table>
     */
    Call(s, lpInboundDisconnectData, lpErrno) {
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, SOCKET, s, WSABUF.Ptr, lpInboundDisconnectData, lpErrnoMarshal, lpErrno, Int32)
        return result
    }

    /**
     * A LPWSPRECVDISCONNECT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSPRECVDISCONNECT {
        /**
         * Creates a LPWSPRECVDISCONNECT pointer that invokes the given AHK function when called.
         * @param {Func(SOCKET, WSABUF, "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SOCKET, WSABUF.Ptr, "int*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

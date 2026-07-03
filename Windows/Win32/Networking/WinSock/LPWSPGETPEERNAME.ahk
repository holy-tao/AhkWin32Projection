#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKET.ahk" { SOCKET }

/**
 * The LPWSPGetPeerName function gets the address of the peer to which a socket is connected.
 * @remarks
 * The **LPWSPGetPeerName** function supplies the name of the peer connected to the socket <i>s</i> and stores it in the structure <b><a href="https://docs.microsoft.com/windows/win32/winsock/sockaddr-2">sockaddr</a></b> referenced by <i>name</i>. It can be used only on a connected socket. For datagram sockets, only the name of a peer specified in a previous <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspconnect">LPWSPConnect</a></b> call will be returned and any name specified by a previous <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsendto">LPWSPSendTo</a></b> call will not be returned by **LPWSPGetPeerName**.
 * 
 * On return, the <i>namelen</i> parameter contains the actual size of the name returned in bytes.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspgetpeername
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSPGETPEERNAME {
    value : IntPtr

    __value {
        set {
            if (value is LPWSPGETPEERNAME) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {SOCKET} s Descriptor identifying a connected socket.
     * @param {Integer} name Pointer to the <b><a href="https://docs.microsoft.com/windows/win32/winsock/sockaddr-2">sockaddr</a></b> structure to receive the name of the peer.
     * @param {Pointer<Integer>} namelen On input, pointer to an integer that indicates the size of the structure pointed to by <i>name</i>, in bytes. On output, indicates the size of the returned name, in bytes.
     * @param {Pointer<Integer>} lpErrno Pointer to the error code.
     * @returns {Integer} If no error occurs, **LPWSPGetPeerName** returns zero. Otherwise, a value of SOCKET_ERROR is returned, and a specific error code is available in <i>lpErrno</i>.
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
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAENETDOWN">WSAENETDOWN</a></b></dl>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEFAULT">WSAEFAULT</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>name</i> or the <i>namelen</i> parameter is not a valid part of the user address space, or the <i>namelen</i> parameter is too small.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEINPROGRESS">WSAEINPROGRESS</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * Function is invoked when a callback is in progress.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAENOTSOCK">WSAENOTSOCK</a></b></dl>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAENOTCONN">WSAENOTCONN</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * Socket is not connected.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAENOTSOCK">WSAENOTSOCK</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The descriptor is not a socket.
     * </td>
     * </tr>
     * </table>
     */
    Call(s, name, namelen, lpErrno) {
        namelenMarshal := namelen is VarRef ? "int*" : "ptr"
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, SOCKET, s, IntPtr, name, namelenMarshal, namelen, lpErrnoMarshal, lpErrno, Int32)
        return result
    }

    /**
     * A LPWSPGETPEERNAME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSPGETPEERNAME {
        /**
         * Creates a LPWSPGETPEERNAME pointer that invokes the given AHK function when called.
         * @param {Func(SOCKET, IntPtr, "int*", "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SOCKET, IntPtr, "int*", "int*", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
